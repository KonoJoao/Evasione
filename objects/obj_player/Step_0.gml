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
var _chao = place_meeting(x, y+1, obj_chao);

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
    velh = (_right - _left) * vel;
    
    // Sistema de escadas
    var on_ladder = false;
    
    if (place_meeting(x, y, obj_escada)) {
        on_ladder = true;
        grav = 0;
        
        if (_top) {
            velv = -vel;
        } else if (_bottom) {
            velv = vel;
        } else {
            velv = 0;
        }
    }
    else if (place_meeting(x, y, obj_escada_pedra) || place_meeting(x + velh, y, obj_escada_pedra)) {
        on_ladder = true;
        grav = 0;
        
        if (velh != 0 || _top) {
            velv = -vel;
        } else if (_bottom) {
            velv = vel;
        } else {
            velv = 0;
        }
    }
    
    // Gravidade
    if (!on_ladder) {
        grav = grav_original;
        velv += grav;
    }

    // Pulo
    if(is_on_ground() && _jump){
        velv = -vel_jump;
    }

    // Sprites
    if(velh != 0){
        sprite_index = spr_player_running;
        image_xscale = sign(velh);
    } else if(velh == 0 && !_left && !_right){
        sprite_index = spr_player_idle;
    }
    
    // Coletar pergaminho
    var pergaminho = instance_place(x, y, obj_pergaminho);
    if (pergaminho != noone && !pergaminho.collected) {
        // Adicionar ao inventário
        var inv = instance_find(obj_inventory, 0);
        if (inv != noone) {
            inv.add_item("pergaminho", spr_pergaminho, 1);
        }
        has_scroll = true;
        pergaminho.collected = true;
    }

    // Coletar chave
    var chave = instance_place(x, y, obj_chave);
    if (chave != noone && !chave.collected) {
        // Adicionar ao inventário
        var inv = instance_find(obj_inventory, 0);
        if (inv != noone) {
            inv.add_item("chave", spr_chave, 1);
        }
        has_key = true;
        chave.collected = true;
    }

if (keyboard_check_pressed(inputs.enter)) {
    var porta = instance_place(x, y, obj_portao);

    if (porta != noone) {
        if (has_key) {
            // Garantir que o objeto de input de senha existe
            if (!instance_exists(obj_password_input)) {
                instance_create_layer(0, 0, "Player", obj_password_input);
            }
            
            // Ativar o sistema de input de senha
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
        
        with (obj_chave) {
            collected = false;
        }
        
        with (obj_pergaminho) {
            collected = false;
        }
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

if((_left || _right) && _chao){
    if (!audio_is_playing(snd_passo))
        audio_play_sound(snd_passo, 0, false, 1, 0, random_range(0.8, 1.2));
}
