///scrPauseOptionsInput(index, accept_button, back_button, h_input)
// This script is an extension of the Input section 
// from the pause code block in objWorld

var _index = argument0;
var _accept_button = argument1;
var _back_button = argument2;
var _h_input = argument3;

if(_accept_button) {
    if(_index != 1)
        audio_play_sound(sndAlexMenuConfirm, 0, false);

    switch(_index) {
         case 0:
            scrPauseToggleMusic();
            break;
            
         case 2:
            global.fullscreenMode = !global.fullscreenMode;
            window_set_fullscreen(global.fullscreenMode);
            break;
            
         case 3:
            global.smoothingMode = !global.smoothingMode;
            break;
            
         case 4:
            global.vsyncMode = !global.vsyncMode;
            scrSetVsync();
            break;
            
         case 5:
            global.originalDeathSound = !global.originalDeathSound;
            break;
            
         case 6:
            scrSaveConfig();
            scrPauseGetKeybindsForDevice(false);
            pause_options_keybind_menu = 1;
            pause_input_delay = 1;
            break;
            
         case 7:
            scrSaveConfig();
            scrPauseGetKeybindsForDevice(true);
            pause_options_keybind_menu = 2;
            pause_input_delay = 1;
            break;
    }
}

if(_index == 1) {
    var _vol_change = _h_input * pause_options_volume_bars;
    global.volumeLevel = clamp(global.volumeLevel + _vol_change, 0, 100);
    audio_master_gain(global.volumeLevel/100);
    
    if(_h_input != 0)
        audio_play_sound(sndAlexMenuAwaitKeybind, 0, false);
}

if(_back_button) {
    scrSaveConfig();
    audio_play_sound(sndAlexMenuGoBack, 0, false);
    audio_sound_gain(global.currentMusic, pause_music_volume, pause_music_fade_time);
    pause_top_option_selected = false;
}
