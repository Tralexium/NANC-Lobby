///scrPauseExitHubDraw(text_col, outline_col)
// This script is an extension of the GUI section 
// from the pause code block in objWorld

var _text_col = argument0;
var _outline_col = argument1;

if(pause_exit_hub_alpha > 0) {
    draw_set_font(fMenuLobby12)
    draw_set_alpha(pause_exit_hub_alpha)
    
    var _exit_y;
    
    scrDrawTextSquareOutline(pause_exit_hub_title_x, pause_exit_hub_title_y, pause_exit_hub_title, _text_col, _outline_col, 2, fa_center, fa_bottom);
    
    for(var i=0; i<pause_exit_hub_max_index; i++) {
        _exit_y = pause_exit_hub_y + (i * pause_options_seperation);
        
        scrDrawTextSquareOutline(pause_exit_hub_x, _exit_y, pause_exit_hub_text[i], _text_col, _outline_col, 2, fa_left, fa_middle);
    }
    
    draw_sprite(sprAlexPauseContentArrow, 0, pause_exit_hub_cursor_x, pause_exit_hub_cursor_y);
    
    draw_set_alpha(1)
} else if(pause_exit_hub_index != 0) {
    pause_exit_hub_index = 0;
}
