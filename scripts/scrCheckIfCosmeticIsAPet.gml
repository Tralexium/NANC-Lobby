///scrCheckIfCosmeticIsAPet(num)

var cosmetic_id = argument0;
var cosmetic_sprite = scrGetCosmeticSprite(cosmetic_id);

if(sprite_get_height(cosmetic_sprite) >= 32) {
    return false;
}

return true;
