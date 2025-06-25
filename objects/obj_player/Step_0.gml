// Função para detectar se está no chão
function is_on_ground() {
    if (place_meeting(x, y+1, obj_chao)) return true;
    if (place_meeting(x, y+1, obj_escada_pedra)) return true;
    if (place_meeting(x, y+1, obj_plataforma)) return true;
    if (place_meeting(x, y+1, obj_plataforma2)) return true;
    return false;
}

// Input
var _left = keyboard_check(inputs.left);
var _right = keyboard_check(inputs.right);
var _top = keyboard_check(inputs.top);
var _bottom = keyboard_check(inputs.bottom);
var _jump = keyboard_check_pressed(inputs.jump);
var _jumping = keyboard_check(inputs.jump);
var _chao = place_meeting(x, y+1, obj_chao);

// Variáveis para controle de pulo
var can_jump = is_on_ground();
var jump_direction = 0; // 0 = neutro, -1 = esquerda, 1 = direita
var can_change_direction = true; // Permite mudar de direção UMA VEZ no ar
var air_jumps = 0; // Controle de mudanças no ar

// Verificar se o input de senha está ativo
var password_input_active = false;
if (instance_exists(obj_password_input)) {
    var password_obj = instance_find(obj_password_input, 0);
    if (password_obj != noone && password_obj.input_active) {
        password_input_active = true;
    }
}

if (!is_dead && !password_input_active) {
    // Movimento horizontal
    if (is_on_ground()) {
        velh = (_right - _left) * vel;
        can_change_direction = true; // Resetar ao tocar no chão
        air_jumps = 0; // Resetar contador
    } else {
        // Permite UMA mudança de direção no ar
        if (can_change_direction && (_left || _right)) {
            jump_direction = (_right - _left);
            can_change_direction = false; // Bloqueia novas mudanças
            air_jumps = 1; // Registra que já mudou
        }
        velh = jump_direction * vel; // Mantém a última direção válida
    }
    
    // Sistema de escadas
    var on_ladder = false;
    if (place_meeting(x, y, obj_escada)) {
        on_ladder = true;
        grav = 0;
        if (_top) velv = -vel;
        else if (_bottom) velv = vel;
        else velv = 0;
    }
    else if (place_meeting(x, y, obj_escada_pedra) || place_meeting(x + velh, y, obj_escada_pedra)) {
        on_ladder = true;
        grav = 0;
        if (velh != 0 || _top) velv = -vel;
        else if (_bottom) velv = vel;
        else velv = 0;
    }
    
    // Gravidade
    if (!on_ladder) {
        grav = grav_original;
        velv += grav;
    }

    // Pulo
    if (can_jump && _jump) {
        velv = -vel_jump;
        sprite_index = spr_player_jumping;
        can_jump = false;
        // Define direção inicial
        if (_right) jump_direction = 1;
        else if (_left) jump_direction = -1;
        else jump_direction = image_xscale;
    }

    // Resetar ao tocar no chão
    if (is_on_ground()) {
        can_jump = true;
        jump_direction = 0;
    }

    // Sprites
    if (velh != 0 && is_on_ground()) {
        sprite_index = spr_player_running;
        image_xscale = sign(velh);
    } 
    else if (velh == 0 && is_on_ground()) {
        sprite_index = spr_player_idle;
    } 
    else if (!is_on_ground()) {
        sprite_index = spr_player_jumping;
        if (jump_direction != 0) image_xscale = sign(jump_direction);
    }
    
    // Coletar pergaminho
    var pergaminho = instance_place(x, y, obj_pergaminho);
    if (pergaminho != noone && !pergaminho.collected) {
        var inv = instance_find(obj_inventory, 0);
        if (inv != noone) inv.add_item("pergaminho", spr_pergaminho, 1);
        has_scroll = true;
        pergaminho.collected = true;
    }

    // Coletar chave
    var chave = instance_place(x, y, obj_chave);
    if (chave != noone && !chave.collected) {
        var inv = instance_find(obj_inventory, 0);
        if (inv != noone) inv.add_item("chave", spr_chave, 1);
        has_key = true;
        chave.collected = true;
    }

    // Interação com portão
    if (keyboard_check_pressed(inputs.enter)) {
        var porta = instance_place(x, y, obj_portao);
        if (porta != noone && has_key) {
            if (!instance_exists(obj_password_input)) {
                instance_create_layer(0, 0, "Player", obj_password_input);
            }
            var password_obj = instance_find(obj_password_input, 0);
            if (password_obj != noone) {
                password_obj.input_active = true;
                password_obj.password_visible = true;
                password_obj.password_input = "";
                password_obj.feedback_message = "";
                password_obj.feedback_timer = 0;
            }
        }
    }
}

// Morte por espinhos
if ((place_meeting(x, y, obj_espinho_ar) || place_meeting(x, y, obj_espinho_teto)) && !is_dead) {
    is_dead = true;
    death_timer = 60;
    velh = 0;
    velv = 0;
    repeat(8) {
        if (instance_exists(obj_particula)) {
            with (instance_create_layer(x, y, "Instances", obj_particula)) {
                hspeed = random_range(-3, 3);
                vspeed = random_range(-4, -1);
            }
        }
    }
}

// Respawn
if (is_dead) {
    death_timer--;
    velh = 0;
    velv = 0;
    if (death_timer <= 0) {
        x = start_x;
        y = start_y;
        is_dead = false;
        velh = 0;
        velv = 0;
        sprite_index = spr_player_idle;
        has_key = false;
        has_scroll = false;
        // Limpar inventário
        if (instance_exists(obj_inventory)) {
            var inv = instance_find(obj_inventory, 0);
            if (inv != noone) {
                for (var i = 0; i < inv.max_slots; i++) {
                    inv.inventory_items[i].item_type = "empty";
                    inv.inventory_items[i].sprite = noone;
                    inv.inventory_items[i].quantity = 0;
                    global.global_inventory[i] = inv.inventory_items[i];
                }
            }
        }
        // Resetar itens coletáveis
        with (obj_chave) collected = false;
        with (obj_pergaminho) collected = false;
    }
}

// Câmera
if (view_enabled && view_visible[0]) {
    var cam = view_camera[0];
    var cam_width = camera_get_view_width(cam);
    var cam_height = camera_get_view_height(cam);
    var target_x = x - cam_width / 2;
    var target_y = y - cam_height / 2;
    var cam_x = camera_get_view_x(cam);
    var cam_y = camera_get_view_y(cam);
    var smooth = 0.1;
    cam_x += (target_x - cam_x) * smooth;
    cam_y += (target_y - cam_y) * smooth;
    cam_x = clamp(cam_x, 0, max(0, room_width - cam_width));
    cam_y = clamp(cam_y, 0, max(0, room_height - cam_height));
    camera_set_view_pos(cam, cam_x, cam_y);
}

// Som de passos
if ((_left || _right) && _chao) {
    if (!audio_is_playing(snd_passo))
        audio_play_sound(snd_passo, 0, false, 1, 0, random_range(0.8, 1.2));
}