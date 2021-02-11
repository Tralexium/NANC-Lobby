///scrFBAtkBeams(current_boss_level)

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
        if(t < 350) {
            x = lerp(x, objPlayer.x, 0.05);
            
            if((t+1) mod 20 == 0) {
                var _spawn_x = x + random_range(-400, 400);
                
                while(_spawn_x < 0 || _spawn_x > room_width) {
                    _spawn_x = x + random_range(-400, 400);
                }
                
                scrFBPFadeOrb(_spawn_x, y, 32, random_range(-70, -110), 0, 0, 0.1);
            }
            
            if(t == 50) {
                scrFBPBeam(objPlayer.x, objPlayer.y, 42, -90, 0, 40);
            }
            
            if(t == 50 * 2) {
                scrFBPBeam(objPlayer.x, clamp(objPlayer.y, 0, ground_level - 21), 42, 0, 0, 40);
            }
            
            if(t == 50 * 3) {
                scrFBPBeam(objPlayer.x, objPlayer.y, 42, -90, 0, 40);
            }
            
            if(t == 50 * 4) {
                scrFBPBeam(objPlayer.x, clamp(objPlayer.y, 0, ground_level - 21), 42, 0, 0, 40);
            }
            
            if(t == 50 * 5) {
                scrFBPBeam(objPlayer.x, clamp(objPlayer.y, 0, ground_level - 21), 42, 45, 0, 40);
                scrFBPBeam(objPlayer.x, clamp(objPlayer.y, 0, ground_level - 21), 42, -45, 0, 40);
            }
            
            if(t > 280) {
                if(t mod 15 == 0) {
                    scrFBPBeam(objPlayer.x, objPlayer.y, 42, -90, 0, 40);
                }
            }
        }
        
        if(t == 350) {
            look_at_player = true;
            var _tp_x = scrFBGetNextTeleportXPos();
            scrFinalBossTP(_tp_x, ground_level - 32, sprAlexFinalBossIdle);
        }
        
        if(t == 470)
            event_user(1);
        break;
            
            
    case 2:
        if(t < 350) {
            x = lerp(x, objPlayer.x, 0.05);
            
            if((t+1) mod 20 == 0) {
                var _spawn_x = x + random_range(-400, 400);
                
                while(_spawn_x < 0 || _spawn_x > room_width) {
                    _spawn_x = x + random_range(-400, 400);
                }
                
                scrFBPFadeOrb(_spawn_x, y, 32, random_range(-80, -100), random_range(-0.25, 0.25), 0, 0.1);
            }
            
            if(t == 50) {
                scrFBPBeam(objPlayer.x, objPlayer.y, 42, -90, 0, 40);
            }
            
            if(t == 50 * 2) {
                scrFBPBeam(objPlayer.x - 100, objPlayer.y, 64, -90, 0, 40);
                scrFBPBeam(objPlayer.x + 100, objPlayer.y, 64, -90, 0, 40);
            }
            
            if(t == 50 * 3) {
                scrFBPBeam(objPlayer.x, ground_level - 21, 42, 0, 0, 40);
                scrFBPBeam(objPlayer.x, ground_level - 128, 42, 0, 0, 40);
            }
            
            if(t == 50 * 4) {
                scrFBPBeam(objPlayer.x - 64, objPlayer.y, 42, -90, 0, 40);
                scrFBPBeam(objPlayer.x, clamp(objPlayer.y, 0, ground_level - 21), 42, 0, 0, 40);
            }
            
            if(t == 50 * 5) {
                scrFBPBeam(objPlayer.x, clamp(objPlayer.y, 0, ground_level - 21), 42, 0, 0, 40);
                scrFBPBeam(objPlayer.x, clamp(objPlayer.y, 0, ground_level - 21), 42, 45, 0, 40);
                scrFBPBeam(objPlayer.x, clamp(objPlayer.y, 0, ground_level - 21), 42, -45, 0, 40);
            }
            
            if(t > 280) {
                if(t mod 15 == 0) {
                    scrFBPBeam(objPlayer.x, objPlayer.y, 42, -90, 0, 40);
                }
            }
            
            if(t == 300) {
                scrFBPBeam(objPlayer.x, ground_level - 32, 64, 0, 0, 100);
            }
        }
        
        if(t == 350) {
            look_at_player = true;
            var _tp_x = scrFBGetNextTeleportXPos();
            scrFinalBossTP(_tp_x, ground_level - 32, sprAlexFinalBossIdle);
        }
        
        if(t == 470)
            event_user(1);
        break;
        
        
    case 3:
        if(t <= 350) {
            x = lerp(x, objPlayer.x, 0.05);
            
            if((t+1) mod 20 == 0) {
                var _spawn_x = x + random_range(-400, 400);
                
                while(_spawn_x < 0 || _spawn_x > room_width) {
                    _spawn_x = x + random_range(-400, 400);
                }
                
                scrFBPFadeOrb(_spawn_x, y, 32, random_range(-80, -100), random_range(-0.25, 0.25), 0, 0.1);
            }
            
            if(t == 50) {
                scrFBPBeam(objPlayer.x - 64, objPlayer.y - 100, 42, -70, 1.5, 40);
                scrFBPBeam(objPlayer.x + 64, objPlayer.y - 100, 42, -110, -1.5, 40);
            }
            
            if(t == 50 * 2) {
                scrFBPBeam(objPlayer.x - 110, objPlayer.y, 42, -90, 0, 40);
                scrFBPBeam(objPlayer.x + 110, objPlayer.y, 42, -90, 0, 40);
                scrFBPBeam(objPlayer.x, objPlayer.y - 128, 42, 0, 0, 40);
                scrFBPBeam(objPlayer.x, ground_level - 21, 42, 0, 0, 40);
            }
            
            if(t == 50 * 3) {
                scrFBPBeam(objPlayer.x - 100, objPlayer.y, 64, -90, 0, 40, 7, 200);
                scrFBPBeam(objPlayer.x + 100, objPlayer.y, 64, -90, 0, 40, 7, -200);
                scrFBPBeam(objPlayer.x, clamp(objPlayer.y, 0, ground_level - 21), 64, 0, 0, 40, 7, 0, -64);
            }
            
            if(t == 50 * 4) {
                scrFBPBeam(objPlayer.x, objPlayer.y, 42, -90, 1.5, 40);
                scrFBPBeam(objPlayer.x, clamp(objPlayer.y, 0, ground_level - 21), 42, 0, 1.5, 40);
            }
            
            if(t == 50 * 5) {
                scrFBPBeam(objPlayer.x, objPlayer.y, 42, -45, -1.5, 40);
                scrFBPBeam(objPlayer.x, clamp(objPlayer.y, 45, ground_level - 21), 42, 45, -1.5, 40);
            }
            
            if(t == 50 * 6) {
                scrFBASMultiBeam(objPlayer.x + random(64), objPlayer.y, 10, 128, false, 42, -90, 0, 40, 7, 64);
            }
            
            if(t == 50 * 7) {
                scrFBASMultiBeam(objPlayer.x, objPlayer.y + random(64), 10, 128, true, 42, 0, 0, 40, 7, 0, -64);
            }
        }
        
        if(t == 370) {
            look_at_player = true;
            var _tp_x = scrFBGetNextTeleportXPos();
            scrFinalBossTP(_tp_x, ground_level - 32, sprAlexFinalBossIdle);
        }
        
        if(t == 470)
            event_user(1);
        break;
}
