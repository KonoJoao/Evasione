if (message_timer > 0) {
    draw_set_font(-1);
    draw_set_halign(fa_center);
    draw_set_valign(fa_middle);
    draw_set_color(c_red);
    draw_text(display_get_gui_width() / 2, display_get_gui_height() / 2 - 50, message_text);
    draw_set_halign(fa_left);
    draw_set_valign(fa_top);
}
