x += move_speed * move_direction;

if (abs(x - start_x) >= move_distance) {
    move_direction *= -1;
}