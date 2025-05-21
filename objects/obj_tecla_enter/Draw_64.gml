if(_enter && !_right && !_left && !_jump){
draw_text(50, 150, "Interagir")
draw_sprite(spr_tecla_enter_pressed, 0, camera_get_view_width(0)/6 + 140, camera_get_view_height(0)-70)
}
else
draw_sprite(spr_tecla_enter, 0, camera_get_view_width(0)/6 + 140, camera_get_view_height(0)-70)