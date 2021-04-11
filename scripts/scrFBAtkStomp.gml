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
    case 1:
        if(t < 200) {
            x = lerp(x, objPlayer.x, 0.05);
            
            if((t+1) mod 20 == 0) {
                var _spawn_x = objPlayer.x + random_range(-400, 400);
                
                while(_spawn_x < 0 || _spawn_x > room_width) {
                    _spawn_x = objPlayer.x + random_range(-400, 400);
                }
                
                scrFBPFadeBeamOrb(_spawn_x, y + 50, 64, -90, 0, 0, .15);
            }
        }
        
        if(t == 260) {
            scrFBPBeam(x, y, 64, -90, 0, 60);
            indicator_ground_stomp_alpha_target = 0.7;
        }
        
        if(t == 320) {
            look_at_player = true;
            scrFinalBossTP(x, ground_level, sprAlexFinalBossGroundStomp);
            scrFBPShockwave(x, y, 400, 12, 2);
            scrFBShakeCam(35, 0, 12, 0, 3);
            fallback_sprite = sprAlexFinalBossIdle;
            fallback_image_speed = 0.3;
            
            indicator_ground_stomp_alpha = 1;
            indicator_ground_stomp_alpha_target = 0;
            
            instance_create(0, 0, objAlexScreenPulseEffect);
            audio_play_sound(sndAlexFBGroundStomp, 0, false);
            
            repeat(12) {
                var _orb = scrFBPOrb(x, y, 32, random_range(70, 110), 0, random_range(9, 15), 0, -0.1);
                    _orb.gravity = 0.25;
            }
        }
    
        if(t == 450) {
            event_user(1);
        }
        break;
        
        
    case 2:
        if(t < 200) {
            x = lerp(x, objPlayer.x, 0.05);
            
            if((t+1) mod 20 == 0) {
                var _spawn_x = objPlayer.x + random_range(-400, 400);
                
                while(_spawn_x < 0 || _spawn_x > room_width) {
                    _spawn_x = objPlayer.x + random_range(-400, 400);
                }
                
                scrFBPFadeBeamOrb(_spawn_x, y + 50, 64, -90, 0, 0, .15, 0, .025, 3);
            }
        }
        
        if(t == 260) {
            scrFBPBeam(x, y, 64, -90, 0, 60);
            indicator_ground_stomp_alpha_target = 0.7;
        }
        
        if(t == 320) {
            look_at_player = true;
            scrFinalBossTP(x, ground_level, sprAlexFinalBossGroundStomp);
            scrFBPShockwave(x, y, 400, 12, 2);
            scrFBShakeCam(35, 0, 12, 0, 3);
            fallback_sprite = sprAlexFinalBossIdle;
            fallback_image_speed = 0.3;
            
            indicator_ground_stomp_alpha = 1;
            indicator_ground_stomp_alpha_target = 0;
            
            instance_create(0, 0, objAlexScreenPulseEffect);
            audio_play_sound(sndAlexFBGroundStomp, 0, false);
            
            repeat(8) {
                var _orb = scrFBPOrbBounce(x, y, 32, random_range(70, 110), 0, random_range(9, 15), 0, -0.1, 0.2, 1);
                    _orb.gravity = 0.25;
            }
        }
    
        if(t == 460) {
            with(objAlexFBPOrbBounce)
                instance_destroy();
                
            event_user(1);
        }
        break;
        
        
    case 3:
        if(t <= 251) {
            x = lerp(x, objPlayer.x, 0.05);
            
            if((t+1) mod 50 == 0) {
                var _spawn_x = clamp(objPlayer.x + choose(-270, -190, -120, 120, 190, 270), 96, room_width - 96);
                
                var _bubble = scrFBPBubble(_spawn_x, y + 50, 0, .6, -90, 0);
                    _bubble.gravity = .2;
            }
        }
        
        with(objAlexFBPBubble) {
            decrease_per_split = 0.3;
            bounce_multi = 1.5;
            shockwave_dist = 100;
        }
        
        if(t == 340) {
            scrFBPBeam(x, y, 64, -90, 0, 60);
            indicator_ground_stomp_alpha_target = 0.7;
        }
        
        if(t == 400) {
            look_at_player = true;
            scrFinalBossTP(x, ground_level, sprAlexFinalBossGroundStomp);
            scrFBPShockwave(x, y, 400, 12, 2);
            scrFBShakeCam(35, 0, 12, 0, 3);
            fallback_sprite = sprAlexFinalBossIdle;
            fallback_image_speed = 0.3;
            
            indicator_ground_stomp_alpha = 1;
            indicator_ground_stomp_alpha_target = 0;
            
            instance_create(0, 0, objAlexScreenPulseEffect);
            audio_play_sound(sndAlexFBGroundStomp, 0, false);
            
            scrFBPSquishOrbCircle(x, y, 0, 12, 32, -0.5, 0, .1, 0);
            scrFBPSquishOrbCircle(x, y, 0, 12, 32, 0.5, 0, .1, 0);
        }
        
        with(objAlexFBPSquishOrb)
            squish_multi = 0.02;
    
        if(t == 550) {
            with(objAlexFBPOrbBounce)
                instance_destroy();
                
            event_user(1);
        }
        break;
}
