///scrFBAtkBeamCage(current_boss_level)

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
        if(t == 20) {
            scrFBPBeam(objPlayer.x - 100, objPlayer.y, 64, -90, 0, 70, 250);
            scrFBPBeam(objPlayer.x + 100, objPlayer.y, 64, -90, 0, 70, 250);
        }
    
        if(t < 330) {
            x = lerp(x, objPlayer.x, 0.05);
            
            if(t < 90) {
                with(objAlexFBPBeam) {
                    if(x < objPlayer.x)
                        x = objPlayer.x - 128;
                    else
                        x = objPlayer.x + 128;
                }
            } else if(t == 90) {
                with(objAlexFBPBeam) {
                    if(objPlayer.x < room_width/2)
                        hspeed = 1;
                    else
                        hspeed = -1;
                }
            }
            
            if(t > 100 && t < 300 && t mod 20 == 0) {
                var _spawn_x = x + choose(-280, 280);
                var _spawn_y = ground_level - choose(16, 16+32, 16+64, 16+96);
                var _spd = 1;
                var _accel = 0.1;
                
                if(_spawn_x > objPlayer.x) {
                    _spd *= -1;
                    _accel *= -1;
                }
                
                scrFBPFadeOrb(_spawn_x, _spawn_y, 32, 0, 0, _spd, _accel);
            }
        }
        
        if(t == 330) {
            look_at_player = true;
            var _tp_x = scrFBGetNextTeleportXPos();
            scrFinalBossTP(_tp_x, ground_level - 32, sprAlexFinalBossIdle);
        }
        
        if(t == 440)
            event_user(1);
}
