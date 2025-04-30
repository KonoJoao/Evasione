

//mexendo player

var _left, _right, _jump, _top, _bottom;
var _chao = place_meeting(x, y+1, obj_chao);
_left = keyboard_check(inputs.left);
_right = keyboard_check(inputs.right);
_top = keyboard_check(inputs.top);
_bottom = keyboard_check(inputs.bottom);
_jump = keyboard_check_pressed(inputs.jump);

velh = (_right - _left) * vel;
velv += grav;

if(_chao && _jump){
	velv = -vel_jump;

}

if(velh != 0){
		sprite_index = spr_player_running;
		image_xscale = sign(velh);
} else {
			sprite_index = spr_player_idle;
		//image_xscale = sign(velh);
}