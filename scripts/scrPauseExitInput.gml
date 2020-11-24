///scrPauseExitInput(index, accept_button, back_button)
// This script is an extension of the Input section 
// from the pause code block in objWorld

var _index = argument0;
var _accept_button = argument1;
var _back_button = argument2;

if(pause_exit_protocol == -1) {
    if(_accept_button) {
        audio_sound_gain(global.currentMusic, 0, 1000);
        audio_play_sound(sndAlexExitGame, 0, false);
    
        switch(_index) {
            case 0:
                pause_exit_protocol = 0;  // Exit back to menu
                break;
            case 1:
                pause_exit_protocol = 1;  // Exit game
                break;
        }
    }
        
    if(_back_button) {
        audio_play_sound(sndAlexMenuGoBack, 0, false);
        pause_top_option_selected = false;
    }
} else {
    pause_black_overlay_alpha += .025;
    
    if(pause_black_overlay_alpha > 1.8) {
        switch(pause_exit_protocol) {
            case 0:
                scrRestartGame();
                exit;
                
            case 1:
                game_end();
        }
    }
}
