// Verifica se está parado
if (estado == "parado") {
    tempo_parado -= 1;
	sprite_index = spr_guard_idle
    if (tempo_parado <= 0) {
        estado = "andar";
    }
} 
else if (estado == "andar") {
    // Movimento
    x += velocidade * direcao;
	sprite_index = spr_guard_running

    // Verifica colisão com parede
    if (place_meeting(x + direcao * 4, y, obj_chao)) {
        direcao *= -1; // Inverte direção
    }

    // Chance aleatória de parar
    if (irandom(100) == 0) { // ~1% chance por step
        estado = "parado";
        tempo_parado = irandom_range(30, 90); // Fica parado entre 0.5s e 1.5s
    }
	
    if (!audio_is_playing(snd_passo_guard))
        audio_play_sound(snd_passo_guard, 0, false, 1, 0, random_range(0.8, 1.2));

}
