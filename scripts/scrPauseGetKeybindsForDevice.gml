///scrPauseGetKeybindsForDevice(is_controller)

var _is_controller = argument0;

pause_keybind_key[0] = scrGetKeybind(global.leftButton[_is_controller]);
pause_keybind_key[1] = scrGetKeybind(global.rightButton[_is_controller]);
pause_keybind_key[2] = scrGetKeybind(global.upButton[_is_controller]);
pause_keybind_key[3] = scrGetKeybind(global.downButton[_is_controller]);
pause_keybind_key[4] = scrGetKeybind(global.jumpButton[_is_controller]);
pause_keybind_key[5] = scrGetKeybind(global.shootButton[_is_controller]);
pause_keybind_key[6] = scrGetKeybind(global.restartButton[_is_controller]);
pause_keybind_key[7] = scrGetKeybind(global.skipButton[_is_controller]);
pause_keybind_key[8] = scrGetKeybind(global.suicideButton[_is_controller]);
pause_keybind_key[9] = scrGetKeybind(global.pauseButton[_is_controller]);
pause_keybind_key[10] = "";
