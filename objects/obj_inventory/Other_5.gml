// Limpar inventario ao sair da sala
for (var i = 0; i < max_slots; i++) {
    inventory_items[i].item_type = "empty";
    inventory_items[i].sprite = noone;
    inventory_items[i].quantity = 0;
    global.global_inventory[i] = inventory_items[i];
}
