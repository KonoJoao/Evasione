// Verifica colisão com jogador
jogador_colidindo = instance_exists(obj_player) && place_meeting(x, y, obj_player);

// Quebra apenas enquanto Enter estiver pressionado
if (jogador_colidindo && keyboard_check(vk_enter)) {
    vida_atual = max(0, vida_atual - 2); // Reduz 2% por frame
    
    // Atualiza sprite conforme dano
    if (vida_atual < 30) {
        sprite_index = spr_bloco_quase_quebrado;
    } else if (vida_atual < 70) {
        sprite_index = spr_bloco_danificado;
    }
    
    // Destrói quando vida chegar a zero
    if (vida_atual <= 0) {
        instance_destroy();
    }
}