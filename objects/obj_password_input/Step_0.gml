if (input_active) {
    cursor_timer++;
    if (cursor_timer >= 30) {
        show_cursor = !show_cursor;
        cursor_timer = 0;
    }
    
    var key_pressed = "";
    
    if (keyboard_check_pressed(ord("0"))) key_pressed = "0";
    if (keyboard_check_pressed(ord("1"))) key_pressed = "1";
    if (keyboard_check_pressed(ord("2"))) key_pressed = "2";
    if (keyboard_check_pressed(ord("3"))) key_pressed = "3";
    if (keyboard_check_pressed(ord("4"))) key_pressed = "4";
    if (keyboard_check_pressed(ord("5"))) key_pressed = "5";
    if (keyboard_check_pressed(ord("6"))) key_pressed = "6";
    if (keyboard_check_pressed(ord("7"))) key_pressed = "7";
    if (keyboard_check_pressed(ord("8"))) key_pressed = "8";
    if (keyboard_check_pressed(ord("9"))) key_pressed = "9";
    
    if (key_pressed != "" && string_length(password_input) < 3) {
        password_input += key_pressed;
    }
    
    if (keyboard_check_pressed(vk_backspace) && string_length(password_input) > 0) {
        password_input = string_delete(password_input, string_length(password_input), 1);
    }
    
    if (keyboard_check_pressed(vk_enter) && string_length(password_input) > 0) {
        if (password_input == password_correct) {
            feedback_message = "ACESSO LIBERADO!";
            feedback_timer = 60;
            input_active = false;
            
            alarm[0] = 90;
        } else {
            feedback_message = "SENHA INCORRETA!";
            feedback_timer = 120;
            password_input = "";
        }
    }
    
    if (keyboard_check_pressed(vk_escape)) {
        input_active = false;
        password_visible = false;
        password_input = "";
        feedback_message = "";
        feedback_timer = 0;
    }
}

if (feedback_timer > 0) {
    feedback_timer--;
    if (feedback_timer <= 0) {
        feedback_message = "";
    }
}
