life_timer -= 1;
image_alpha = (life_timer / 60) * start_alpha;

if (life_timer <= 0) {
    instance_destroy();
}