///scrFBAtkStar(current_boss_level)

var _lvl = argument[0];

// Teleport onto position
if(t == 1) {
    var _tp_x = scrFBGetNextTeleportXPos();
    scrFinalBossTP(_tp_x, ground_level - 350, sprAlexFinalBossJump);
    
    fallback_sprite = sprAlexFinalBossJump;
    fallback_image_speed = 0.3;
    floating = true;
}

if(on_ground) {
    sprite_index = sprAlexFinalBossIdle;
}

// Execute the correct attack based on the current boss level
switch(_lvl) {
    default:
    case 1:
        var _dir_to_player = point_direction(x, y, objPlayer.x, objPlayer.y);
        if(t == 50) {
            scrFBPOrbStar(x, y, _dir_to_player, 5, 21, 32, 0, 7, .1, 0);
            scrFBSetAttackSprite(sprAlexFinalBossJumpAtk, 0.3);
            audio_play_sound(sndAlexFBCaneThrow, 0, false);
            audio_play_sound(sndAlexFBOrbExplosion, 0, false);
        }
        if(t == 90) {
            scrFBPOrbStar(x, y, -_dir_to_player, 3, 13, 32, 0, 3.5, .1, .4);
            scrFBSetAttackSprite(sprAlexFinalBossJumpAtk, 0.3);
            audio_play_sound(sndAlexFBCaneThrow, 0, false);
            audio_play_sound(sndAlexFBOrbExplosion, 0, false);
        }
        
        if(t == 100) {
            floating = false;
            gravity = default_gravity;
        }
        
        if(t == 230) {
            event_user(1);
        }
        break;
        
    case 2:
        var _dir_to_player = point_direction(x, y, objPlayer.x, objPlayer.y);
        if(t == 50) {
            scrFBPOrbStar(x, y, -_dir_to_player, 5, 20, 32, 1, 5, .1, 0);
            scrFBSetAttackSprite(sprAlexFinalBossJumpAtk, 0.3);
            audio_play_sound(sndAlexFBCaneThrow, 0, false);
            audio_play_sound(sndAlexFBOrbExplosion, 0, false);
        }
        if(t == 90) {
            scrFBPOrbStar(x, y, _dir_to_player, 4, 12, 32, -1, 2, .1, .4);
            scrFBSetAttackSprite(sprAlexFinalBossJumpAtk, 0.3);
            audio_play_sound(sndAlexFBCaneThrow, 0, false);
            audio_play_sound(sndAlexFBOrbExplosion, 0, false);
        }
        if(t == 130) {
            scrFBPOrbStar(x, y, _dir_to_player, 3, 10, 32, 0, 2, .1, 1);
            scrFBSetAttackSprite(sprAlexFinalBossJumpAtk, 0.3);
            audio_play_sound(sndAlexFBCaneThrow, 0, false);
            audio_play_sound(sndAlexFBOrbExplosion, 0, false);
        }
        
        
        if(t == 140) {
            floating = false;
            gravity = default_gravity;
        }
        
        if(t == 270) {
            event_user(1);
        }
        break;
        
        
    case 3:
        var _dir_to_player = point_direction(x, y, objPlayer.x, objPlayer.y);
        if(t == 50) {
            scrFBPOrbStar(x, y, _dir_to_player, 3, 20, 32, 1, 5, .1, 0);
            scrFBSetAttackSprite(sprAlexFinalBossJumpAtk, 0.3);
            audio_play_sound(sndAlexFBCaneThrow, 0, false);
            audio_play_sound(sndAlexFBOrbExplosion, 0, false);
        }
        if(t == 90) {
            scrFBPOrbStar(x, y, -_dir_to_player, 4, 10, 32, -1, 2, .1, .4);
            scrFBSetAttackSprite(sprAlexFinalBossJumpAtk, 0.3);
            audio_play_sound(sndAlexFBCaneThrow, 0, false);
            audio_play_sound(sndAlexFBOrbExplosion, 0, false);
        }
        
        if(t == 130) {
            side_from_player *= -1;
            var _tp_x = scrFBGetNextTeleportXPos();
            scrFinalBossTP(_tp_x, ground_level - 350, sprAlexFinalBossJump);
        }
        
        if(t == 150) {
            scrFBPOrbStar(x, y, _dir_to_player, 5, 20, 32, 1, 5, .1, 0);
            scrFBSetAttackSprite(sprAlexFinalBossJumpAtk, 0.3);
            audio_play_sound(sndAlexFBCaneThrow, 0, false);
            audio_play_sound(sndAlexFBOrbExplosion, 0, false);
        }
        if(t == 190) {
            scrFBPOrbStar(x, y, -_dir_to_player, 3, 10, 32, -1, 2, .1, .4);
            scrFBSetAttackSprite(sprAlexFinalBossJumpAtk, 0.3);
            audio_play_sound(sndAlexFBCaneThrow, 0, false);
            audio_play_sound(sndAlexFBOrbExplosion, 0, false);
        }
        
        if(t == 230) {
            var _tp_x = scrFBGetNextTeleportXPos();
            scrFinalBossTP(objPlayer.x, ground_level - 350, sprAlexFinalBossFloat);
        }
        
        if(t == 260) {
            scrFBPOrbStar(x, y, _dir_to_player, 3, 20, 32, 0, 4, .1, 0);
            scrFBSetAttackSprite(sprAlexFinalBossJumpAtk, 0.3);
            audio_play_sound(sndAlexFBCaneThrow, 0, false);
            audio_play_sound(sndAlexFBOrbExplosion, 0, false);
        }
        if(t == 280) {
            scrFBPOrbStar(x, y, random(360), 4, 20, 32, 0, 4, .1, 0);
            scrFBSetAttackSprite(sprAlexFinalBossJumpAtk, 0.3);
            audio_play_sound(sndAlexFBCaneThrow, 0, false);
            audio_play_sound(sndAlexFBOrbExplosion, 0, false);
        }
        if(t == 300) {
            scrFBPOrbStar(x, y, _dir_to_player, 5, 20, 32, 0, 4, .1, 0);
            scrFBSetAttackSprite(sprAlexFinalBossJumpAtk, 0.3);
            audio_play_sound(sndAlexFBCaneThrow, 0, false);
            audio_play_sound(sndAlexFBOrbExplosion, 0, false);
        }
        if(t == 320) {
            scrFBPOrbStar(x, y, random(360), 6, 20, 32, 0, 4, .1, 0);
            scrFBSetAttackSprite(sprAlexFinalBossJumpAtk, 0.3);
            audio_play_sound(sndAlexFBCaneThrow, 0, false);
            audio_play_sound(sndAlexFBOrbExplosion, 0, false);
        }
        
        if(t == 330) {
            floating = false;
            gravity = default_gravity;
        }
        
        if(t == 460) {
            event_user(1);
        }
        break;
}
