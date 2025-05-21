inputs = {
	left: ord("A"),
	right: ord("D"),
	jump: vk_space,
}

_left = keyboard_check(inputs.left);
_right = keyboard_check(inputs.right);
_jump = keyboard_check(inputs.jump);

if(_jump)
draw_sprite(spr_tecla_space_pressed, 0, camera_get_view_width(0)/6 + 35, camera_get_view_height(0)-40)
else
draw_sprite(spr_tecla_space, 0, camera_get_view_width(0)/6 + 35, camera_get_view_height(0)-40)