if(_jump && !_right && !_left && !_enter){
draw_text(50, 150, "Pular")
draw_sprite(spr_tecla_space_pressed, 0, camera_get_view_width(0)/6 + 35, camera_get_view_height(0)-40)
}
else
draw_sprite(spr_tecla_space, 0, camera_get_view_width(0)/6 + 35, camera_get_view_height(0)-40)