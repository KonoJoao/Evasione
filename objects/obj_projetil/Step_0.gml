// Verifica colisão com o player
if (instance_exists(obj_player)) {
    if (collision_line(x, y, x + lengthdir_x(speed, direction), y + lengthdir_y(speed, direction), obj_player, false, true)) {
        game_end(); // Fecha o jogo
    }
}

// Move o projétil
x += lengthdir_x(speed, direction);
y += lengthdir_y(speed, direction);

// Destroi o projétil se sair da room
if (x < 0 || x > room_width || y < 0 || y > room_height) {
    instance_destroy();
}
