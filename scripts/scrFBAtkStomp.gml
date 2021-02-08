///scrFBAtkStomp(current_boss_level)

var _lvl = argument[0];

// Teleport onto position
if(t == 1) {
    scrFinalBossTP(objPlayer.x, 180, sprAlexFinalBossFloat);
    
    look_at_player = false;
    image_xscale = 1;
    image_speed = 0.3;
}

// Execute the correct attack based on the current boss level
switch(_lvl) {
    default:
    case 0:
        if(t < 200) {
            x = lerp(x, objPlayer.x, 0.05);
            
            if((t+1) mod 20 == 0) {
                var _spawn_x = x + random_range(-400, 400);
                
                while(_spawn_x < 0 || _spawn_x > room_width) {
                    _spawn_x = x + random_range(-400, 400);
                }
                
                scrFBPFadeBeamOrb(_spawn_x, y + 50, 64, -90, 0, 0, .15);
            }
        }
        
        if(t == 260) {
            scrFBPBeam(x, y, 64, -90, 0, 60);
        }
        
        if(t == 320) {
            look_at_player = true;
            scrFinalBossTP(x, ground_level, sprAlexFinalBossGroundStomp);
            scrFBPShockwave(x, y, 400, 12, 2);
            scrFBShakeCam(35, 0, 12, 0, 3);
            fallback_sprite = sprAlexFinalBossIdle;
            fallback_image_speed = 0.3;
            
            audio_play_sound(sndAlexFBGroundStomp, 0, false);
            
            repeat(15) {
                var _orb = scrFBPOrb(x, y, 32, random_range(70, 110), 0, random_range(9, 15), 0, -0.1);
                    _orb.gravity = 0.25;
            }
        }
    
        if(t == 450) {
            event_user(1);
        }
}
