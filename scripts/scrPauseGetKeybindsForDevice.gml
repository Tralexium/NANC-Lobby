///scrPauseGetKeybindsForDevice(is_controller)

var _is_controller = argument0;

if(!_is_controller) {
    pause_keybind_key[0] = scrGetKeybind(global.leftButton[0]);
    pause_keybind_key[1] = scrGetKeybind(global.rightButton[0]);
    pause_keybind_key[2] = scrGetKeybind(global.upButton[0]);
    pause_keybind_key[3] = scrGetKeybind(global.downButton[0]);
    pause_keybind_key[4] = scrGetKeybind(global.jumpButton[0]);
    pause_keybind_key[5] = scrGetKeybind(global.shootButton[0]);
    pause_keybind_key[6] = scrGetKeybind(global.restartButton[0]);
    pause_keybind_key[7] = scrGetKeybind(global.skipButton[0]);
    pause_keybind_key[8] = scrGetKeybind(global.suicideButton[0]);
    pause_keybind_key[9] = scrGetKeybind(global.pauseButton[0]);
} else {
    pause_keybind_key[0] = scrGetControllerBind(global.leftButton[1]);
    pause_keybind_key[1] = scrGetControllerBind(global.rightButton[1]);
    pause_keybind_key[2] = scrGetControllerBind(global.upButton[1]);
    pause_keybind_key[3] = scrGetControllerBind(global.downButton[1]);
    pause_keybind_key[4] = scrGetControllerBind(global.jumpButton[1]);
    pause_keybind_key[5] = scrGetControllerBind(global.shootButton[1]);
    pause_keybind_key[6] = scrGetControllerBind(global.restartButton[1]);
    pause_keybind_key[7] = scrGetControllerBind(global.skipButton[1]);
    pause_keybind_key[8] = scrGetControllerBind(global.suicideButton[1]);
    pause_keybind_key[9] = scrGetControllerBind(global.pauseButton[1]);
}

pause_keybind_key[10] = "";
