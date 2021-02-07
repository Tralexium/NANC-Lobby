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
    case 0:
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
        
        if(t == 460)
            event_user(1);
}
