inputs = {
	left: ord("A"),
	right: ord("D"),
	jump: vk_space,
	enter: vk_enter
}

enter = keyboard_check(inputs.enter);

if(_jump)
draw_sprite(spr_tecla_enter_pressed, 0, camera_get_view_width(0)/6, camera_get_view_height(0)-50)
else
draw_sprite(spr_tecla_enter, 0, camera_get_view_width(0)/6, camera_get_view_height(0)-50)