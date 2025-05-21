inputs = {
	left: ord("A"),
	right: ord("D"),
	jump: vk_space,
}

_left = keyboard_check(inputs.left);
_right = keyboard_check(inputs.right);
_jump = keyboard_check_pressed(inputs.jump);

if(_right)
draw_sprite(spr_tecla_d_pressed, 0, camera_get_view_width(0)/6 + 70, camera_get_view_height(0)-100)
else
draw_sprite(spr_tecla_d, 0, camera_get_view_width(0)/6 + 70, camera_get_view_height(0)-100)