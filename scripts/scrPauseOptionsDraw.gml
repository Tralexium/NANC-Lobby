///scrPauseOptionsDraw(text_col, outline_col)
// This script is an extension of the GUI section 
// from the pause code block in objWorld

var _text_col = argument0;
var _outline_col = argument1;

if(pause_options_alpha > 0) {
    draw_set_font(fMenuLobby12)
    var _option_y;
    var _option_alpha;
    for(var i=0; i<pause_options_max_index; i++) {
        // Draw the left side
        _option_y = pause_options_target_y + (i * pause_options_seperation);
        _option_alpha = clamp(((_option_y + pause_options_threshold_space) - pause_options_upper_threshold)/pause_options_threshold_space, 0, 1);
        draw_set_alpha(_option_alpha * pause_options_alpha);
        scrDrawTextSquareOutline(pause_options_x, _option_y, pause_options[i], _text_col, _outline_col, 2, fa_left, fa_middle);
        
        // Draw the right side
        switch(i) {
            case 0:
                var _string = "On";
                if(global.muteMusic) _string = "Off";
                scrDrawTextSquareOutline(pause_options_w, _option_y, _string, _text_col, _outline_col, 2, fa_right, fa_middle);
                break;
            case 1:
                var _bar_amnt = pause_options_volume_bars;
                var _sep = pause_options_volume_bar_sep;
                var _active_bars = round(global.volumeLevel / 10);
                scrAlexDrawSegmentBar(pause_options_w - (_sep * _bar_amnt), _option_y, _sep, _bar_amnt, _active_bars, sprAlexPauseActiveVolumeBar, sprAlexPauseInactiveVolumeBar);
                break;
            case 2:
                var _string = "Windowed";
                if(global.fullscreenMode) _string = "Fullscreen";
                scrDrawTextSquareOutline(pause_options_w, _option_y, _string, _text_col, _outline_col, 2, fa_right, fa_middle);
                break;
            case 3:
                var _string = "Off";
                if(global.smoothingMode) _string = "On";
                scrDrawTextSquareOutline(pause_options_w, _option_y, _string, _text_col, _outline_col, 2, fa_right, fa_middle);
                break;
            case 4:
                var _string = "Off";
                if(global.vsyncMode) _string = "On";
                scrDrawTextSquareOutline(pause_options_w, _option_y, _string, _text_col, _outline_col, 2, fa_right, fa_middle);
                break;
        }
    }
    draw_sprite(sprAlexPetTrollBuddy, 0, pause_options_x - 32, pause_options_y)
    draw_set_alpha(1)
}
