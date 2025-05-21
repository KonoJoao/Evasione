if(_left && !_right && !_jump && !_enter){
draw_text(50, 150, "Andar para Esquerda")
draw_sprite(spr_tecla_a_pressed, 0, camera_get_view_width(0)/6, camera_get_view_height(0)-100)}
else{
draw_sprite(spr_tecla_a, 0, camera_get_view_width(0)/6, camera_get_view_height(0)-100)}