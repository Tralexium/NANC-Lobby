///scrGetCosmeticPetSprite(num)

var cosmetic_id = argument0;
var spr = -1;

switch(cosmetic_id) {
    case 0: spr = sprAlexPetGhosty; break;
    case 1: spr = sprAlexPetPatsBall; break;
    case 2: spr = sprAlexPetTrollBuddy; break;
    case 3: spr = sprAlexPetRNG; break;
}

return spr;
