if (input_active) {
    var screen_w = display_get_gui_width();
    var screen_h = display_get_gui_height();
    var box_w = 1000;
    var box_h = 350;
    var box_x = (screen_w - box_w) / 2;
    var box_y = (screen_h - box_h) / 2;
    
    draw_set_colour(c_black);
    draw_set_alpha(0.8);
    draw_rectangle(0, 0, screen_w, screen_h, false);
    draw_set_alpha(1);
    
    draw_set_colour(c_black);
    draw_rectangle(box_x, box_y, box_x + box_w, box_y + box_h, false);
    
    draw_set_colour(c_yellow);
    draw_rectangle(box_x, box_y, box_x + box_w, box_y + box_h, true);
    
    draw_set_colour(c_white);
    draw_set_halign(fa_center);
    draw_set_valign(fa_middle);
    draw_text_transformed(box_x + box_w/2, box_y + 60, "DIGITE A SENHA", 1.3, 1.3, 0);
    
    var input_x = box_x + box_w/2;
    var input_y = box_y + 140;
    
    draw_set_colour(c_dkgray);
    draw_rectangle(input_x - 120, input_y - 30, input_x + 120, input_y + 30, false);
    
    draw_set_colour(c_white);
    draw_rectangle(input_x - 120, input_y - 30, input_x + 120, input_y + 30, true);
    
    var display_text = "";
    for (var i = 0; i < string_length(password_input); i++) {
        display_text += "*";
    }
    
    if (show_cursor) {
        display_text += "|";
    }
    
    draw_set_colour(c_white);
    draw_text_transformed(input_x, input_y, display_text, 1.5, 1.5, 0);
    
    draw_set_colour(c_ltgray);
    draw_text_transformed(input_x, input_y + 70, "Digite 3 numeros", 0.9, 0.9, 0);
    draw_text_transformed(input_x, input_y + 100, "Enter: Confirmar | Esc: Cancelar", 0.8, 0.8, 0);
    
    if (feedback_message != "") {
        if (feedback_message == "ACESSO LIBERADO!") {
            draw_set_colour(c_lime);
        } else {
            draw_set_colour(c_red);
        }
        draw_text_transformed(input_x, box_y + box_h - 20, feedback_message, 1.1, 1.1, 0);
    }
    
    draw_set_halign(fa_left);
    draw_set_valign(fa_top);
}
