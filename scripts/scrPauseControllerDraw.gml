///scrPauseControllerDraw(text_col, outline_col)
// This script is an extension of the GUI section 
// from the pause code block in objWorld

var _text_col = argument0;
var _outline_col = argument1;

if(pause_options_controller_alpha > 0) {
    draw_set_font(fMenuLobby12)
    var _option_y;
    var _upper_threshold_alpha;
    var _bottom_threshold_alpha;
    var _option_alpha;
    for(var i=0; i<pause_options_controller_max_index; i++) {
        // Draw the left side
        _option_y = pause_options_controller_target_y + (i * pause_options_seperation);
        _upper_threshold_alpha = clamp(((_option_y + pause_options_threshold_space) - pause_options_upper_threshold)/pause_options_threshold_space, 0, 1)
        _bottom_threshold_alpha = clamp(((pause_options_bottom_threshold + pause_options_threshold_space) - _option_y)/pause_options_threshold_space, 0, 1)
        _option_alpha = _upper_threshold_alpha * _bottom_threshold_alpha;
        draw_set_alpha(_option_alpha * pause_options_controller_alpha);
        if(i == pause_options_controller_max_index - 1)
            scrDrawTextSquareOutline(pause_options_x, _option_y, pause_keybind[i], pause_options_reset_col, _outline_col, 2, fa_left, fa_middle);
        else
            scrDrawTextSquareOutline(pause_options_x, _option_y, pause_keybind[i], _text_col, _outline_col, 2, fa_left, fa_middle);
        
        // Draw the right side
        if(pause_setting_key && i == pause_options_controller_index)
            scrDrawTextSquareOutline(pause_options_w, _option_y, "waiting for input", _text_col, _outline_col, 2, fa_right, fa_middle);
        else
            scrDrawTextSquareOutline(pause_options_w, _option_y, pause_keybind_key[i], _text_col, _outline_col, 2, fa_right, fa_middle);
    }
    draw_set_alpha(pause_options_controller_alpha);
    draw_sprite(sprAlexPauseContentArrow, 0, pause_options_x - 32, pause_options_y);
    draw_set_alpha(1);
} else if(pause_options_controller_index != 0){
    pause_options_controller_index = 0;
}
