// Desenha o fio
draw_set_color(cortado ? cor_cortado : cor_normal);
draw_set_line_width(3);
draw_line(x1, y1, x2, y2); // Coordenadas dos pontos do fio

// Destaca se o mouse estiver sobre
if (position_meeting(mouse_x, mouse_y, id)) {
    draw_set_alpha(0.5);
    draw_line(x1, y1, x2, y2);
    draw_set_alpha(1);
}