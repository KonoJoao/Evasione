if (!collected) {
    // Efeito flutuante
    float_timer += 0.08;
    y = original_y + sin(float_timer) * 1.5;
    
    // Efeito de brilho
    shine_timer += 0.2;
}