activate = function() {
    if (obj_porta_2.sprite_index == spr_porta_aberta) {
        // Porta fechada: muda sprite e desativa física dinâmica (fica estática)
        obj_porta_2.sprite_index = spr_porta_fechada;
        sprite_index = spr_alavanca_inicial;

        obj_porta.physics_dynamic = false;  // desativa movimento físico
    } else {
        // Porta aberta: muda sprite e ativa física dinâmica
        audio_play_sound(snd_porta_abrindo, 0, false);
        obj_porta_2.sprite_index = spr_porta_aberta;
        sprite_index = spr_alavanca_final;

        obj_porta_2.physics_dynamic = true;   // ativa física dinâmica, pode ser movida
    }
}
