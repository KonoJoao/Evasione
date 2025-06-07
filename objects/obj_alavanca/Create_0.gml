event_inherited()

activate = function(){
	if(obj_porta.sprite_index == spr_porta_aberta){
		obj_porta.sprite_index = spr_porta_fechada
		sprite_index = spr_alavanca_inicial

	} else{
		audio_play_sound(snd_porta_abrindo, 0, false)
		obj_porta.sprite_index = spr_porta_aberta
		sprite_index = spr_alavanca_final
	}
}