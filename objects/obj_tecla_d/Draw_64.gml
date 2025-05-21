if(_right && !_left && !_jump && !_enter){
draw_text(50, 150, "Andar para Direita")
draw_sprite(spr_tecla_d_pressed, 0, camera_get_view_width(0)/6 + 70, camera_get_view_height(0)-100)
}
else
draw_sprite(spr_tecla_d, 0, camera_get_view_width(0)/6 + 70, camera_get_view_height(0)-100)