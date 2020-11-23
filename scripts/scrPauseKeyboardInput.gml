///scrPauseKeyboardInput(index, accept_button, back_button)
// This script is an extension of the Input section 
// from the pause code block in objWorld

var _index = argument0;
var _accept_button = argument1;
var _back_button = argument2;

if(!pause_setting_key) {
    if(_accept_button) {
        if (_index != 10)
        {
            pause_setting_key = true;
        }
        else
        {
            //default controls
            global.leftButton[0] = vk_left;
            global.rightButton[0] = vk_right;
            global.upButton[0] = vk_up;
            global.downButton[0] = vk_down;
            global.jumpButton[0] = vk_shift;
            global.shootButton[0] = ord("Z");
            global.restartButton[0] = ord("R");
            global.skipButton[0] = ord("S");
            global.suicideButton[0] = ord("Q");
            global.pauseButton[0] = vk_escape;
            
            scrPauseGetKeybindsForDevice(false);
        }
    }
    
    if(_back_button) {
        scrSaveConfig();
        pause_options_keybind_menu = 0;
    }
}
else
{
    if (keyboard_check_pressed(vk_anykey))  //check if a key is being pressed and if it is, store that key
    {
        var keyChange;
        
        keyChange = keyboard_key;
        
        if (keyChange == 160 || keyChange == 161)   //check if current key pressed is either shift key
            keyChange = 16; //set it to work for both shift keys
        
        if (_index == 0) {global.leftButton[0] = keyChange;}
        else if (_index == 1) {global.rightButton[0] = keyChange;}
        else if (_index == 2) {global.upButton[0] = keyChange;}
        else if (_index == 3) {global.downButton[0] = keyChange;}
        else if (_index == 4) {global.jumpButton[0] = keyChange;}
        else if (_index == 5) {global.shootButton[0] = keyChange;}
        else if (_index == 6) {global.restartButton[0] = keyChange;}
        else if (_index == 7) {global.skipButton[0] = keyChange;}
        else if (_index == 8) {global.suicideButton[0] = keyChange;}
        else if (_index == 9) {global.pauseButton[0] = keyChange;}
        
        pause_setting_key = false;
        scrPauseGetKeybindsForDevice(false);
    }
    else if (scrAnyControllerButton() != -1)    //check if a controller button was pressed, exit prompt
    {
        pause_setting_key = false;
    }
}
