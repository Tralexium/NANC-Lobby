///scrPauseExitHubInput(index, accept_button, back_button)
// This script is an extension of the Input section 
// from the pause code block in objWorld

var _index = argument0;
var _accept_button = argument1;
var _back_button = argument2;

if(pause_exit_hub_protocol == -1) {
    if(_accept_button) {    
        switch(_index) {
            case 0:
                _back_button = true;  // Cancel
                break;
            case 1:
                audio_sound_gain(global.currentMusic, 0, 1000);
                audio_play_sound(sndAlexExitGame, 0, false);
                pause_exit_hub_protocol = 0;  // Exit back to hub
                break;
        }
    }
        
    if(_back_button) {
        audio_play_sound(sndAlexMenuGoBack, 0, false);
        pause_exit_menu = 0;
    }
} else {
    pause_black_overlay_alpha += .025;
    
    if(pause_black_overlay_alpha > 1.8) {
        switch(pause_exit_hub_protocol) {
            case 0:
                // Unpause the game (we're avoiding the user event to avoid any delays and sfx)
                global.gamePaused = false;  //set the game to unpaused
                global.pauseDelay = global.pauseDelayLength;  //set pause delay
                audio_sound_gain(global.currentMusic, 1, pause_music_fade_time);
                scrSaveConfig();    //save config in case volume levels were changed
                io_clear(); //clear input states to prevent possible pause strats/exploits
                
                pause_exit_menu = 0;
                pause_exit_hub_alpha = 0;
                pause_black_overlay_alpha = 0;
                pause_exit_hub_protocol = -1;
                pause_anim_timer = 1;  // This allows us to skip any animations when unpausing
                pause_top_option_selected = false;
                
                scrResetStageStats();
                scrWarpBackToLobby();
                pause_autosave_for_hub = true;
                
                exit;
        }
    }
}
