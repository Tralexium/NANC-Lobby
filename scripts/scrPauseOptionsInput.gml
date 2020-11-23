///scrPauseOptionsInput(index, accept_button, h_input)
// This script is an extension of the Input section 
// from the pause code block in objWorld

var _index = argument0;
var _accept_button = argument1;
var _h_input = argument2;

if(_accept_button) {
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
            scrSaveConfig();
            pause_options_keybind_menu = 1;
            pause_input_delay = 1;
            break;
            
         case 6:
            scrSaveConfig();
            pause_options_keybind_menu = 2;
            pause_input_delay = 1;
            break;
    }
}

if(_index == 1) {
    var _vol_change = _h_input * pause_options_volume_bars;
    global.volumeLevel = clamp(global.volumeLevel + _vol_change, 0, 100);
    audio_master_gain(global.volumeLevel/100);
}
