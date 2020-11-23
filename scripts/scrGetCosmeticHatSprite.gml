///scrGetCosmeticHatSprite(num)

var cosmetic_id = argument0;
var spr = -1;

switch(cosmetic_id) {
    case 0: spr = sprAlexHatSombrero; break;
    case 1: spr = sprAlexHatMotherClucker; break;
    case 2: spr = sprAlexHatOldPC; break;
    case 3: spr = sprAlexHatOongaBoonga; break;
    case 4: spr = sprAlexHatDuality; break;
    case 5: spr = sprAlexHatPropellerHat; break;
    case 6: spr = sprAlexHatClownFace; break;
    case 7: spr = sprAlexHatBlorb; break;
    case 8: spr = sprAlexHatCyberHead; break;
    case 9: spr = sprAlexHatGhoul; break;
}

return spr;
