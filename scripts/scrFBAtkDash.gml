///scrFBAtkDash(current_boss_level)

var _lvl = argument[0];
var _dash_distance = 500;

// Teleport onto position
if(t == 1) {
    var _tp_x = scrFBGetNextTeleportXPos();
    scrFinalBossTP(_tp_x, ground_level - 32, sprAlexFinalBossPreDash);
    
    fallback_image_speed = 0.3;
}

// Execute the correct attack based on the current boss level
var _dash_x_pos = clamp(x + _dash_distance*image_xscale, dist_from_room_edges, room_width - dist_from_room_edges);
switch(_lvl) {
    default:
    case 0:
        if(t == 60) {
            look_at_player = false;
        
            var _slash_mark = scrAlexMakeParticleExt(mean(x, _dash_x_pos), ground_level - 32, 14, sprAlexFinalBossDashMark, 0, 0, 0, 0, 0, 0, -1, -1, bm_add, true, false, 0, depth-1, false);
                _slash_mark.hspeed = 7 * image_xscale;
            
            if(image_xscale > 0) {
                if(objPlayer.x > x && objPlayer.x < _dash_x_pos && objPlayer.y > ground_level - 64)
                    scrKillPlayer();
            } else {
                if(objPlayer.x < x && objPlayer.x > _dash_x_pos && objPlayer.y > ground_level - 64)
                    scrKillPlayer();
            }
                
            scrFinalBossTP(_dash_x_pos, y, sprAlexFinalBossDash);
            scrFBSetAttackSprite(sprAlexFinalBossDash, 0.3);
            audio_play_sound(sndAlexFBDash, 0, false);
        }
        if(t == 90) {
            image_xscale *= -1;
            scrFBJump(6 * image_xscale, 12);
            sprite_index = sprAlexFinalBossJumpFront
            audio_play_sound(sndAlexFBCaneThrow, 0, false);
            fallback_sprite = sprAlexFinalBossJumpFront;
        }
        
        if(t == 120) {
            scrFBSetAttackSprite(sprAlexFinalBossJumpFrontAtk, 0.3);
            scrFBPCane(x, y, true, false, 30, 30, 50, 5, random_range(-60, -120));
        }
        
        if(t == 140) {
            scrFBSetAttackSprite(sprAlexFinalBossJumpFrontAtk, 0.3);
            scrFBPCane(x, y, true, false, 30, 30, 50, 5, random_range(-60, -120));
        }
        
        if(t == 160) {
            scrFBSetAttackSprite(sprAlexFinalBossJumpFrontAtk, 0.3);
            scrFBPCane(x, y, true, false, 30, 30, 50, 5, random_range(-60, -120));
        }
        
        if(t > 160 && on_ground) {
            fallback_sprite = noone;
            look_at_player = true;
            sprite_index = sprAlexFinalBossIdle;
        }
        
        if(t == 290) {
            event_user(1);
        }
}
