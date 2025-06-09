if (connected_tunnel == noone) {
    with (obj_esgoto_quebrado) {
        if (id != other.id) {
            other.connected_tunnel = id;
            break;
        }
    }
}

if (teleport_cooldown > 0) {
    teleport_cooldown--;
}

if (instance_exists(obj_player)) {
    var player = instance_find(obj_player, 0);
    
    if (place_meeting(x, y, obj_player) && teleport_cooldown <= 0) {
        
        if (keyboard_check_pressed(player.inputs.enter) && !instance_place(player.x, player.y, obj_portao)) {
            
            if (connected_tunnel != noone && instance_exists(connected_tunnel)) {
                
                player.x = connected_tunnel.x;
                player.y = connected_tunnel.y - 10;
                
                teleport_cooldown = 60;
                connected_tunnel.teleport_cooldown = 60;
            }
        }
    }
}
