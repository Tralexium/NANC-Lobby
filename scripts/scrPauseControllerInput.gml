///scrPauseControllerInput(index, accept_button, back_button)
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
            global.leftButton[1] = gp_padl;
            global.rightButton[1] = gp_padr;
            global.upButton[1] = gp_padu;
            global.downButton[1] = gp_padd;
            global.jumpButton[1] = gp_face1;
            global.shootButton[1] = gp_face3;
            global.restartButton[1] = gp_face4;
            global.skipButton[1] = gp_face2;
            global.suicideButton[1] = gp_select;
            global.pauseButton[1] = gp_start;
            
            scrPauseGetKeybindsForDevice(true);
        }
    }
    
    if(_back_button) {
        scrSaveConfig();
        pause_options_keybind_menu = 0;
    }
}
else
{
    var keyChange = scrAnyControllerButton();
    if (keyChange != -1)  //check if a key is being pressed and if it is, store that key
    {
        if (_index == 0) {global.leftButton[1] = keyChange;}
        else if (_index == 1) {global.rightButton[1] = keyChange;}
        else if (_index == 2) {global.upButton[1] = keyChange;}
        else if (_index == 3) {global.downButton[1] = keyChange;}
        else if (_index == 4) {global.jumpButton[1] = keyChange;}
        else if (_index == 5) {global.shootButton[1] = keyChange;}
        else if (_index == 6) {global.restartButton[1] = keyChange;}
        else if (_index == 7) {global.skipButton[1] = keyChange;}
        else if (_index == 8) {global.suicideButton[1] = keyChange;}
        else if (_index == 9) {global.pauseButton[1] = keyChange;}
        
        pause_setting_key = false;
        scrPauseGetKeybindsForDevice(true);
    }
    else if (keyboard_check_pressed(vk_anykey))    //check if a controller button was pressed, exit prompt
    {
        pause_setting_key = false;
    }
}
