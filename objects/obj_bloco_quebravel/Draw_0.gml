// Desenha o sprite normal
draw_self();

// Desenha barra de progresso em cima do bloco
var bar_width = sprite_width * 0.8;
var bar_height = 6;
var bar_x = x + sprite_xoffset + (sprite_width - bar_width) / 2;
var bar_y = y - 10; // um pouco acima do bloco

// Fundo da barra
draw_set_color(c_black);
draw_rectangle(bar_x, bar_y, bar_x + bar_width, bar_y + bar_height, false);

// Progresso preenchido
draw_set_color(c_yellow);
var filled = bar_width * (progress / progress_max);
draw_rectangle(bar_x, bar_y, bar_x + filled, bar_y + bar_height, false);
