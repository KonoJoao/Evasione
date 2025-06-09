max_slots = 9;
inventory_visible = false;
inventory_items = [];
selected_slot = 0;
slot_size = 64;
slots_per_row = 3;
inventory_x = 50;
inventory_y = 50;
show_password = false;

if (!variable_global_exists("global_inventory")) {
    global.global_inventory = [];
    for (var i = 0; i < max_slots; i++) {
        global.global_inventory[i] = {
            item_type: "empty",
            sprite: noone,
            quantity: 0
        };
    }
}

for (var i = 0; i < max_slots; i++) {
    inventory_items[i] = global.global_inventory[i];
}

function add_item(item_type, item_sprite, quantity = 1) {
    for (var i = 0; i < max_slots; i++) {
        if (inventory_items[i].item_type == "empty") {
            inventory_items[i].item_type = item_type;
            inventory_items[i].sprite = item_sprite;
            inventory_items[i].quantity = quantity;
            global.global_inventory[i] = inventory_items[i];
            return true;
        }
        else if (inventory_items[i].item_type == item_type) {
            inventory_items[i].quantity += quantity;
            global.global_inventory[i] = inventory_items[i];
            return true;
        }
    }
    return false;
}

function remove_item(item_type, quantity = 1) {
    for (var i = 0; i < max_slots; i++) {
        if (inventory_items[i].item_type == item_type) {
            inventory_items[i].quantity -= quantity;
            if (inventory_items[i].quantity <= 0) {
                inventory_items[i].item_type = "empty";
                inventory_items[i].sprite = noone;
                inventory_items[i].quantity = 0;
            }
            global.global_inventory[i] = inventory_items[i];
            return true;
        }
    }
    return false;
}

function has_item(item_type) {
    for (var i = 0; i < max_slots; i++) {
        if (inventory_items[i].item_type == item_type && inventory_items[i].quantity > 0) {
            return true;
        }
    }
    return false;
}
