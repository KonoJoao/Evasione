// Velocidades
velh = 0;
velv = 0;
vel = 5;
vel_jump = 8;
grav = 0.25;
grav_original = grav;

// Estados
has_key = false;
has_scroll = false;
is_dead = false;
death_timer = 0;

// Posição inicial para respawn
start_x = x;
start_y = y;

// Controles
inputs = {
	top: ord("W"),
	left: ord("A"),
	right: ord("D"),
	bottom: ord("S"),
	jump: vk_space,
	enter: vk_enter
}

// Câmera
if (view_enabled) {
    view_set_camera(0, camera_create_view(0, 0, 1920, 1080));
    camera_set_view_size(view_camera[0], 1920, 1080);
}
