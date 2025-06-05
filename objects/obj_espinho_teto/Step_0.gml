x += move_speed * move_direction;

if (abs(x - start_x) >= move_distance) {
    move_direction *= -1;
}

with (obj_estatuas_dragoes) {
    x += other.move_speed * other.move_direction;
}
