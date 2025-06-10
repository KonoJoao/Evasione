var player = instance_nearest(x, y, obj_player); // substitua "obj_player" pelo nome real
var dist_max = 96;

if (instance_exists(player)) {
    var dist = point_distance(x, y, player.x, player.y);

    if (dist <= dist_max) {
        if (keyboard_check(vk_enter)) {
            progress += 1.5; // ajustável

            if (progress >= progress_max) {
                instance_destroy();
                effect_create_above(ef_explosion, x, y, 1, c_white);
            }
        }
    }
}
