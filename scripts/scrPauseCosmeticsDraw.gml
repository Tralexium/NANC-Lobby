///scrPauseCosmeticsDraw(text_col, outline_col)
// This script is an extension of the GUI section 
// from the pause code block in objWorld

var _text_col = argument0;
var _outline_col = argument1;
var _cursor_scale = pause_cosmetic_slot_cursor_scale;
var _alpha = pause_cosmetics_alpha;

if(pause_cosmetics_alpha > 0) {
    pause_cosmetic_slot_cursor_index += pause_cosmetic_slot_cursor_index_spd;
    pause_cosmetic_image_index += pause_cosmetic_image_index_spd;
    
    draw_set_alpha(pause_cosmetics_alpha);
    draw_set_font(fMenuLobby12);
    
    // Draw the hats
    var _hat_sprite = -1;
    var _hat_x = pause_cosmetic_x;
    var _hat_y = pause_cosmetic_hat_y;
    var _hat_y_offset = 12;
    for(i = 0; i <= global.totalNumberOfHats; i++) {
        _hat_x = pause_cosmetic_x + ((i mod pause_cosmetic_tiles_per_line) * pause_cosmetic_slot_sep);
        _hat_y = pause_cosmetic_hat_y + (floor(i / pause_cosmetic_tiles_per_line) * pause_cosmetic_slot_sep);
    
        if(i == 0) {
            scrDrawTextSquareOutline(_hat_x, _hat_y - 32, "Hat Collection", _text_col, _outline_col, 2, fa_left, fa_bottom);
        }
        
        if(i == global.currentPlayerHat) {
            draw_sprite(sprAlexPauseCosmeticSlot, 2, _hat_x, _hat_y);
        } else {
            draw_sprite(sprAlexPauseCosmeticSlot, 0, _hat_x, _hat_y);
        }
        
        if(i < global.totalNumberOfHats) {
            if(global.playerHat[i]) {
                _hat_sprite = scrGetCosmeticHatSprite(i);
                draw_sprite_ext(_hat_sprite, pause_cosmetic_image_index, _hat_x, _hat_y + _hat_y_offset, 2, 2, 0, -1, _alpha);
            } else {
                draw_sprite(sprAlexPauseCosmeticSlot, 3, _hat_x, _hat_y);
            }
        } else {
            if(global.currentPlayerHat == -1)
                draw_sprite(sprAlexPauseCosmeticSlot, 2, _hat_x, _hat_y);
            draw_sprite(sprAlexPauseCosmeticSlot, 4, _hat_x, _hat_y);
        }
        
        if(i == pause_cosmetic_index) {
            draw_sprite_ext(sprAlexPauseCosmeticSlotCursor, pause_cosmetic_slot_cursor_index, _hat_x, _hat_y, _cursor_scale, _cursor_scale, 0, -1, _alpha);
        }
    }
    
    // Draw the pets
    var _pet_sprite = -1;
    var _pet_x = pause_cosmetic_x;
    var _pet_y = pause_cosmetic_pet_y;
    for(i = 0; i <= global.totalNumberOfPets; i++) {
        _pet_x = pause_cosmetic_x + ((i mod pause_cosmetic_tiles_per_line) * pause_cosmetic_slot_sep);
        _pet_y = pause_cosmetic_pet_y + (floor(i / pause_cosmetic_tiles_per_line) * pause_cosmetic_slot_sep);
    
        if(i == 0) {
            scrDrawTextSquareOutline(_pet_x, _pet_y - 32, "Pet Collection", _text_col, _outline_col, 2, fa_left, fa_bottom);
        }
        
        if(i == global.currentPlayerPet) {
            draw_sprite(sprAlexPauseCosmeticSlot, 2, _pet_x, _pet_y);
        } else {
            draw_sprite(sprAlexPauseCosmeticSlot, 1, _pet_x, _pet_y);
        }
        
        if(i < global.totalNumberOfPets) {
            if(global.playerPet[i]) {
                _pet_sprite = scrGetCosmeticPetSprite(i);
                draw_sprite_ext(_pet_sprite, pause_cosmetic_image_index, _pet_x, _pet_y, 2, 2, 0, -1, _alpha);
            } else {
                draw_sprite(sprAlexPauseCosmeticSlot, 3, _pet_x, _pet_y);
            }
        } else {
            if(global.currentPlayerPet == -1)
                draw_sprite(sprAlexPauseCosmeticSlot, 2, _pet_x, _pet_y);
            draw_sprite(sprAlexPauseCosmeticSlot, 4, _pet_x, _pet_y);
        }
        
        if(i + (global.totalNumberOfHats + 1) == pause_cosmetic_index) {
            draw_sprite_ext(sprAlexPauseCosmeticSlotCursor, pause_cosmetic_slot_cursor_index, _pet_x, _pet_y, _cursor_scale, _cursor_scale, 0, -1, _alpha);
        }
    }
    
    // Draw player
    var _kid_x = pause_cosmetic_kid_x;
    var _kid_y = pause_cosmetic_kid_y;
    var _kid_index = pause_cosmetic_image_index mod 4;
    var _kid_scale = 6;
    var _cosmetic_index = pause_cosmetic_image_index;
    var _hat_x = _kid_x;
    var _hat_y = _kid_y;
    if(floor(_kid_index) == 1) _hat_y += _kid_scale;
    var _hat_sprite = scrGetCosmeticHatSprite(global.currentPlayerHat);
    var _pet_x = _kid_x + (16*_kid_scale)
    var _pet_y = (_kid_y-(12*_kid_scale)) + dsin(pause_cosmetic_image_index*10)*(4*_kid_scale);
    var _pet_sprite = scrGetCosmeticPetSprite(global.currentPlayerPet);
    
    if(_pet_sprite != -1)
        draw_sprite_ext(_pet_sprite, _cosmetic_index, _pet_x, _pet_y, -_kid_scale, _kid_scale, 0, -1, _alpha);
    draw_sprite_ext(sprPlayerIdle, _kid_index, _kid_x, _kid_y, -_kid_scale, _kid_scale, 0, -1, _alpha);
    if(_hat_sprite != -1)
        draw_sprite_ext(_hat_sprite, _cosmetic_index, _hat_x, _hat_y, -_kid_scale, _kid_scale, 0, -1, _alpha);
    
    draw_set_alpha(1);
}
