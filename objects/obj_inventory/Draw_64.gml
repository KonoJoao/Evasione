draw_set_font(-1);
draw_set_halign(fa_left);
draw_set_valign(fa_top);


var slot_width = 25;
var slot_height = 25;
var slots_to_show = 5; 
var bar_x = (display_get_gui_width() - (slots_to_show * slot_width + (slots_to_show - 1) * 12)) / 2;
var bar_y = display_get_gui_height() - slot_height - 7;


draw_set_colour(c_black);
draw_set_alpha(0.7);
draw_rectangle(bar_x - 5, bar_y - 5, bar_x + (slots_to_show * slot_width) + ((slots_to_show - 1) * 12) + 5, bar_y + slot_height + 5, false);
draw_set_alpha(1);


for (var i = 0; i < slots_to_show; i++) {
    var slot_x = bar_x + i * (slot_width + 12);
    var slot_y = bar_y;
    
    // Cor do slot
    if (i == selected_slot) {
        draw_set_colour(c_yellow);
    } else {
        draw_set_colour(c_gray);
    }
    
    // Borda do slot
    draw_rectangle(slot_x, slot_y, slot_x + slot_width, slot_y + slot_height, true);
    
    // Fundo do slot
    draw_set_colour(c_dkgray);
    draw_set_alpha(0.3);
    draw_rectangle(slot_x + 1, slot_y + 1, slot_x + slot_width - 1, slot_y + slot_height - 1, false);
    draw_set_alpha(1);
    
    // Item no slot
    if (i < max_slots) {
        var item = inventory_items[i];
        if (item.item_type != "empty" && item.sprite != noone) {

            var sprite_w = sprite_get_width(item.sprite);
            var sprite_h = sprite_get_height(item.sprite);
            var scale = min((slot_width - 8) / sprite_w, (slot_height - 8) / sprite_h);
            

            var sprite_x = slot_x + slot_width / 2 - (sprite_w * scale) / 2 + sprite_get_xoffset(item.sprite) * scale;
            var sprite_y = slot_y + slot_height / 2 - (sprite_h * scale) / 2 + sprite_get_yoffset(item.sprite) * scale;
            

            draw_sprite_ext(item.sprite, 0, sprite_x, sprite_y, scale, scale, 0, c_white, 1);
            

            if (item.quantity > 1) {
                draw_set_colour(c_white);
                draw_text_transformed(slot_x + slot_width - 10, slot_y + slot_height - 10, string(item.quantity), 0.8, 0.8, 0);
            }
        }
    }
}


draw_set_colour(c_white);
draw_set_halign(fa_center);
draw_text_transformed(display_get_gui_width() / 2, bar_y - 20, "INVENTARIO (I para abrir)", 0.7, 0.7, 0);
draw_set_halign(fa_left);


if (inventory_visible) {

    var inv_width = 280;
    var inv_height = 300;
    var inv_x = (display_get_gui_width() - inv_width) / 2;
    var inv_y = (display_get_gui_height() - inv_height) / 2 - 40;
    
    // Fundo do inventário
    draw_set_colour(c_black);
    draw_set_alpha(0.8);
    draw_rectangle(inv_x - 10, inv_y - 30, inv_x + inv_width + 10, inv_y + inv_height, false);
    draw_set_alpha(1);
    
    // Título 
    draw_set_colour(c_white);
    draw_set_halign(fa_center);
    draw_text_transformed(inv_x + inv_width / 2, inv_y - 25, "INVENTARIO (I para fechar)", 1.3, 1.3, 0);
    draw_set_halign(fa_left);
    
    // Desenhar slots em grid 3x3
    var slot_size = 75;
    var slot_spacing = 85;
    var grid_start_x = inv_x + (inv_width - (3 * slot_spacing - 10)) / 2;
    var grid_start_y = inv_y + 20;
    
    for (var i = 0; i < max_slots; i++) {
        var slot_x = grid_start_x + (i % slots_per_row) * slot_spacing;
        var slot_y = grid_start_y + floor(i / slots_per_row) * slot_spacing;
        
        // Cor do slot
        if (i == selected_slot) {
            draw_set_colour(c_yellow);
        } else {
            draw_set_colour(c_gray);
        }
        
        // Borda do slot
        draw_rectangle(slot_x, slot_y, slot_x + slot_size, slot_y + slot_size, true);
        
        // Fundo do slot
        draw_set_colour(c_dkgray);
        draw_set_alpha(0.3);
        draw_rectangle(slot_x + 1, slot_y + 1, slot_x + slot_size - 1, slot_y + slot_size - 1, false);
        draw_set_alpha(1);
        
        // Item no slot
        var item = inventory_items[i];
        if (item.item_type != "empty" && item.sprite != noone) {

            var sprite_w = sprite_get_width(item.sprite);
            var sprite_h = sprite_get_height(item.sprite);
            var scale = min((slot_size - 12) / sprite_w, (slot_size - 12) / sprite_h);
            

            var sprite_x = slot_x + slot_size / 2 - (sprite_w * scale) / 2 + sprite_get_xoffset(item.sprite) * scale;
            var sprite_y = slot_y + slot_size / 2 - (sprite_h * scale) / 2 + sprite_get_yoffset(item.sprite) * scale;
            

            draw_sprite_ext(item.sprite, 0, sprite_x, sprite_y, scale, scale, 0, c_white, 1);
            

            if (item.quantity > 1) {
                draw_set_colour(c_white);
                draw_text_transformed(slot_x + slot_size - 20, slot_y + slot_size - 20, string(item.quantity), 1.2, 1.2, 0);
            }
        }
    }
    
    // Controles
    draw_set_colour(c_white);
    draw_set_halign(fa_center);
    draw_text_transformed(inv_x + inv_width / 2, inv_y + inv_height - 20, "Setas/Enter para navegar", 1.1, 1.1, 0);
    draw_set_halign(fa_left);
}

// Desenhar senha quando pergaminho estiver selecionado
if (show_password && inventory_visible) {
    // Fundo para a senha
    var password_x = display_get_gui_width() / 2;
    var password_y = display_get_gui_height() / 2 - 80;
    
    draw_set_colour(c_black);
    draw_set_alpha(0.9);
    draw_rectangle(password_x - 100, password_y - 50, password_x + 100, password_y + 50, false);
    draw_set_alpha(1);
    
    // Borda da caixa da senha
    draw_set_colour(c_yellow);
    draw_rectangle(password_x - 100, password_y - 50, password_x + 100, password_y + 50, true);
    
    // Texto da senha
    draw_set_colour(c_white);
    draw_set_halign(fa_center);
    draw_set_valign(fa_middle);
    draw_text_transformed(password_x, password_y - 20, "SENHA:", 1.2, 1.2, 0);
    draw_text_transformed(password_x, password_y + 5, "754", 2.2, 2.2, 0);
    draw_text_transformed(password_x, password_y + 35, "Enter para fechar", 0.9, 0.9, 0);
    
    // Resetar alinhamento
    draw_set_halign(fa_left);
    draw_set_valign(fa_top);
}