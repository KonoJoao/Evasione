draw_self();

if (instance_exists(obj_player)) {
    var player = instance_find(obj_player, 0);
    
    if (place_meeting(x, y, obj_player) && teleport_cooldown <= 0 && !instance_place(player.x, player.y, obj_portao)) {
        
        draw_set_colour(c_white);
        draw_set_halign(fa_center);
        draw_set_valign(fa_middle);
        
        var alpha_value = 0.5 + 0.5 * sin(current_time * 0.01);
        draw_set_alpha(alpha_value);
        
        draw_text(x, y - 30, "Pressione Enter");
        draw_text(x, y - 15, "para usar tunel");
        
        draw_set_alpha(1);
        draw_set_halign(fa_left);
        draw_set_valign(fa_top);
    }
}
