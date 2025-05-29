draw_self(); // Desenha o sprite normal
 

// Mostra porcentagem se estiver quebrando
if (jogador_colidindo && keyboard_check(vk_enter)) {
    draw_set_color(c_white);
    draw_set_halign(fa_center);
    draw_set_font(ft_timer);
    draw_text(x, y - 30, string(vida_atual) + "%");
}

// Mostra instrução quando estiver sobre o bloco
if (jogador_colidindo && !keyboard_check(vk_enter)) {
    draw_set_color(c_yellow);
    draw_set_halign(fa_center);
    draw_set_font(ft_timer); // Usa a mesma fonte para consistência
    draw_text(x, y - 30, "ENTER");
	

}

// Restaura configurações padrão (opcional)
draw_set_font(-1);