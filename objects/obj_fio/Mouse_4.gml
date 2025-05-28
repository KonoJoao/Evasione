if (!cortado) {
    cortado = true;
    
    // Efeito visual
    effect_create_above(ef_spark, x, y, 1, c_white);
    audio_play_sound(snd_corte, 0, false);
    
    // Verifica se era o fio correto
    if (corretor) {
        instance_create_layer(x, y, "Effects", obj_puzzle_completo);
    } else {
        instance_create_layer(x, y, "Effects", obj_erro);
    }
}