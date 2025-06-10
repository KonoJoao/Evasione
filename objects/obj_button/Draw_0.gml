// 1. Desenha a sprite do botão (se tiver)
draw_self();

// 2. Configurações do texto
draw_set_color(c_black); // Cor do texto
draw_set_font(ft_timer); // Fonte padrão
draw_set_halign(fa_center); // Alinhamento horizontal CENTRO
draw_set_valign(fa_middle); // Alinhamento vertical MEIO
draw_set_font(ft_timer_18)
// 3. Desenha o texto CENTRALIZADO
draw_text(x+100, y+20, texto); // (x,y) é o centro do botão