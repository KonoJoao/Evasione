minutos = 3
segundos = 0
milisegundos = 0

if (!variable_global_exists("dificuldade")) {
    global.dificuldade = "medio";
}

switch(global.dificuldade) {
    case "facil":
        minutos = 3;
        break;
    case "medio":
        minutos = 2;
        break;
    case "dificil":
        minutos = 1;
        break;
}

alarm[0] = 6;
