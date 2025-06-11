if(flag_timer_ativo){
	
milisegundos -= 1
if (milisegundos = -1) {
milisegundos = 9
segundos -= 1
}

if (segundos = -1) {
show_debug_message(segundos, minutos)
segundos = 59
minutos = minutos -1
}

if!(segundos == 0 && minutos == 0 && milisegundos == 0){
	alarm[0] = 6
} else {
	room_goto(rm_game_over)
}
}