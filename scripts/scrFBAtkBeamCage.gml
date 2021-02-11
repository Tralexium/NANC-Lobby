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
    case 1:
        if(t == 20) {
            scrFBPBeam(objPlayer.x - 128, objPlayer.y, 64, -90, 0, 70, 250);
            scrFBPBeam(objPlayer.x + 128, objPlayer.y, 64, -90, 0, 70, 250);
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
        break;
            
            
    case 2:
        if(t == 20) {
            scrFBPBeam(objPlayer.x - 96, objPlayer.y, 64, -90, 0, 70, 250);
            scrFBPBeam(objPlayer.x + 96, objPlayer.y, 64, -90, 0, 70, 250);
        }
    
        if(t < 330) {
            x = lerp(x, objPlayer.x, 0.05);
            
            if(t < 90) {
                with(objAlexFBPBeam) {
                    if(x < objPlayer.x)
                        x = objPlayer.x - 96;
                    else
                        x = objPlayer.x + 96;
                }
            } else if(t == 90) {
                with(objAlexFBPBeam) {
                    if(objPlayer.x < room_width/2)
                        hspeed = 1;
                    else
                        hspeed = -1;
                }
            }
            
            if(t > 100 && t < 300 && t mod 30 == 0) {
                var _spawn_side = 1;
                with(objAlexFBPBeam) {
                    if(hspeed < 0)
                        _spawn_side = -1;
                }
            
                var _spawn_x = x + (440 * _spawn_side);
                var _spawn_y = ground_level - choose(16+64, 16+96, 16+150);
                var _spd = random_range(2, 5) * -_spawn_side;
                
                scrFBPOrbBounce(_spawn_x, _spawn_y, 32, 0, 0, _spd, 0, 0, 0.2, 4);
            }
        }
        
        if(t == 330) {
            look_at_player = true;
            var _tp_x = scrFBGetNextTeleportXPos();
            scrFinalBossTP(_tp_x, ground_level - 32, sprAlexFinalBossIdle);
        }
        
        if(t == 355) {
            with(objAlexFBPOrbBounce) {
                if(y < 520) {
                    repeat(3) {
                    var _orb = scrFBPOrb(x, y, 32, random_range(80, 100), 0, random_range(11, 13), 0, -.2);
                        _orb.gravity = .25;
                    }
                }
                
                instance_destroy();
            }
        }
        
        if(t == 440)
            event_user(1);
        break;
        
        
    case 3:
        if(t == 20) {
            scrFBPBeam(objPlayer.x - 250, objPlayer.y, 64, -90, 0, 70, 250);
            scrFBPBeam(objPlayer.x + 250, objPlayer.y, 64, -90, 0, 70, 250);
        }
    
        if(t < 330) {
            x = lerp(x, objPlayer.x, 0.05);
            
            if(t < 90) {
                with(objAlexFBPBeam) {
                    if(x < objPlayer.x)
                        x = objPlayer.x - 250;
                    else
                        x = objPlayer.x + 250;
                }
            } else if(t == 90) {
                with(objAlexFBPBeam) {
                    if(objPlayer.x < x)
                        hspeed = -0.7;
                    else
                        hspeed = 0.7;
                }
            }
            
            if(t > 100 && t < 300 && t mod 25 == 0) {  
                var _spawn_side = choose(-1, 1);
                var _spawn_x = objPlayer.x + (450*_spawn_side); 
                var _spawn_y = ground_level - choose(16+64, 16+96, 16+150);
                
                if(view_xview[0] < 100) {
                    _spawn_x = 850;
                    _spawn_side = 1;
                }
                if(view_xview[0] > 700) {
                    _spawn_x = 750;
                    _spawn_side = -1;
                }
                
                show_debug_message(view_xview[0])
                
                var _spd = random_range(3.5, 6) * -_spawn_side;
                
                scrFBPOrbBounce(_spawn_x, _spawn_y, 32, 0, 0, _spd, 0, 0, 0.2, 4);
            }
        }
        
        if(t >= 360 && t <= 650) {
            x = lerp(x, objPlayer.x, 0.05);
        
            if(t == 360) {
                with(objAlexFBPOrbBounce) {
                    if(y < 520) {
                        repeat(3) {
                        var _orb = scrFBPOrb(x, y, 32, random_range(80, 100), 0, random_range(11, 13), 0, -.2);
                            _orb.gravity = .25;
                        }
                    }
                    
                    instance_destroy();
                }
                scrFBPBeam(objPlayer.x - 96, objPlayer.y, 64, -90, 0, 70, 250);
                scrFBPBeam(objPlayer.x + 96, objPlayer.y, 64, -90, 0, 70, 250);
            }
            if(t < 430) {
                with(objAlexFBPBeam) {
                    if(x < objPlayer.x)
                        x = objPlayer.x - 96;
                    else
                        x = objPlayer.x + 96;
                }
            } 
            else if(t == 430) {
                with(objAlexFBPBeam) {
                    if(objPlayer.x < room_width/2)
                        hspeed = 1.5;
                    else
                        hspeed = -1.5;
                }
            }
            
            if(t > 440 && t < 630 && t mod 20 == 0) {
                var _spawn_side = 1;
                with(objAlexFBPBeam) {
                    if(hspeed < 0)
                        _spawn_side = -1;
                }
            
                var _spawn_x = x + (420 * _spawn_side);
                var _spawn_y = clamp(objPlayer.y, 0, ground_level - 16);
                var _spd = random_range(3, 6) * -_spawn_side;
                var _spd_incr = 0.1 * -_spawn_side;
                var _dir = 0;
            
                var _squish_orb = scrFBPSquishOrb(_spawn_x, _spawn_y, 32, _dir, 0, _spd, _spd_incr);
                    _squish_orb.squish_multi = 0.02;
            } 
        }
        
        if(t == 650) {
            look_at_player = true;
            var _tp_x = scrFBGetNextTeleportXPos();
            scrFinalBossTP(_tp_x, ground_level - 32, sprAlexFinalBossIdle);
        }
        
        if(t == 760)
            event_user(1);
        break;
}
