// Troca para a sala do jogo (substitua "rm_game" pelo nome da sua sala de jogo)
//room_goto(rm_game);

//if(layer_exists(layer_get_id("Buttons")))
	layer_destroy(layer_get_id("Buttons"))
//else
	layer_set_visible(layer_get_id("Buttons_dificuldade"), true)