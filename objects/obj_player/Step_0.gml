
//mexendo player

var _left, _right, _jump, _top, _bottom;
var _chao = place_meeting(x, y+1, obj_chao);
_left = keyboard_check(inputs.left);
_right = keyboard_check(inputs.right);
_top = keyboard_check(inputs.top);
_bottom = keyboard_check(inputs.bottom);
_jump = keyboard_check_pressed(inputs.jump);

step_sound_delay = 0;
step_sound_interval = 3 * 60;

velh = (_right - _left) * vel;
velv += grav;

if(_chao && _jump){
	velv = -vel_jump;
	audio_play_sound(snd_pulo, 0, false);
}

if(velh != 0){
		sprite_index = spr_player_running;
		image_xscale = sign(velh);

} else if(velh == 0 && !_left && !_right){
			sprite_index = spr_player_idle;
}

if((_left || _right) && _chao){
    if (!audio_is_playing(snd_passo))
        audio_play_sound(snd_passo, 0, false, 1, 0, random_range(0.8, 1.2));
}