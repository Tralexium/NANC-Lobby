///scrPauseCosmeticsInput(index, accept_button, back_button)

var _index = argument0;
var _accept_button = argument1;
var _back_button = argument2;

if(_accept_button) {
    pause_cosmetic_slot_cursor_scale = 1.4;
    pause_cosmetic_slot_cursor_index = 0;
    audio_play_sound(sndAlexMenuConfirm, 0, false);

    if(_index < global.totalNumberOfHats) {
        if(global.playerHat[_index])
            global.currentPlayerHat = _index;
    } else if (_index == global.totalNumberOfHats) {
        global.currentPlayerHat = -1;
    }
    
    var _pet_index = _index - (global.totalNumberOfHats + 1);  // +1 because of the "no hat option at the end"
    if(_index > global.totalNumberOfHats && _index < global.totalNumberOfPets + global.totalNumberOfHats + 1) {
        if(global.playerPet[_pet_index])
            global.currentPlayerPet = _pet_index;
    } else if(_index == global.totalNumberOfPets + global.totalNumberOfHats + 1) {
        global.currentPlayerPet = -1;
    }
}

if(_back_button) {
    scrSaveGame(false);
    audio_play_sound(sndAlexMenuGoBack, 0, false);
    pause_top_option_selected = false;
}
