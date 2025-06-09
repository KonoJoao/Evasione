if (!variable_global_exists("flag_timer_ativo")) {
    global.flag_timer_ativo = true;
}

var password_input_active = false;
if (instance_exists(obj_password_input)) {
    var password_obj = instance_find(obj_password_input, 0);
    if (password_obj != noone && password_obj.input_active) {
        password_input_active = true;
    }
}

if (global.flag_timer_ativo && !password_input_active) {
    if (keyboard_check_pressed(ord("I"))) {
        inventory_visible = !inventory_visible;
    }

    if (inventory_visible) {
        if (keyboard_check_pressed(vk_left)) {
            selected_slot = max(0, selected_slot - 1);
        }
        if (keyboard_check_pressed(vk_right)) {
            selected_slot = min(max_slots - 1, selected_slot + 1);
        }
        if (keyboard_check_pressed(vk_up)) {
            selected_slot = max(0, selected_slot - slots_per_row);
        }
        if (keyboard_check_pressed(vk_down)) {
            selected_slot = min(max_slots - 1, selected_slot + slots_per_row);
        }
    } else {
        if (keyboard_check_pressed(vk_left)) {
            selected_slot = max(0, selected_slot - 1);
        }
        if (keyboard_check_pressed(vk_right)) {
            selected_slot = min(4, selected_slot + 1);
        }
    }
    
    if (keyboard_check_pressed(vk_enter)) {
        var selected_item = inventory_items[selected_slot];
        if (selected_item.item_type != "empty") {
            show_debug_message("Usando item: " + selected_item.item_type);
            
            if (selected_item.item_type == "pergaminho" && inventory_visible) {
                show_password = !show_password;
            }
        }
    }
    
    if (inventory_visible) {
        var selected_item = inventory_items[selected_slot];
        if (selected_item.item_type == "pergaminho") {
        } else {
            show_password = false;
        }
    } else {
        show_password = false;
    }
}
