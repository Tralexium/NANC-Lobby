///scrFBAtkCircles(current_boss_level)

var _lvl = argument[0];

// Teleport onto position
if(t == 1) {
    var _tp_x = scrFBGetNextTeleportXPos();
    scrFinalBossTP(_tp_x, ground_level - 200, sprAlexFinalBossJump);
    fallback_sprite = sprAlexFinalBossJump;
    fallback_image_speed = 0.3;
}

// Execute the correct attack based on the current boss level
switch(_lvl) {
    default:
    case 1:
        if(t < 120) {
            if(t == 20) {
                scrFBPOrbShrinkingCircle(x, y, 6, 32, 128, 100, 100, -10, 0);
                scrFBSetAttackSprite(sprAlexFinalBossJumpAtk, 0.3);
            }
            if(t == 60) {
                scrFBPOrbShrinkingCircle(x, y, 9, 32, 128 * 2, 100, 100, 10, 0);
                scrFBSetAttackSprite(sprAlexFinalBossJumpAtk, 0.3);
            }
            if(t == 100) {
                scrFBPOrbShrinkingCircle(x, y, 13, 32, 128 * 3, 100, 100, -10, 0);
                scrFBSetAttackSprite(sprAlexFinalBossJumpAtk, 0.3);
            }
            
            with(objAlexFBOrbShrinkingCircle) {
                x = objPlayer.x;
                y = objPlayer.y;
            }
            
            x = clamp(objPlayer.x + (dist_from_player * side_from_player), dist_from_room_edges, room_width - dist_from_room_edges);
        }
        
        if(t >= 230) {
            if(t == 230) {
                gravity = default_gravity;
                fallback_sprite = noone;
            }
            
            if(on_ground) {
                sprite_index = sprAlexFinalBossIdle;
            }
        }
        
        if(t == 350)
            event_user(1);
        break;
    
             
    case 2:
        if(t < 120) {
            if(t == 20) {
                scrFBPOrbShrinkingCircle(x, y, 5, 32, 128, 100, 100, -10, -0.5);
                scrFBSetAttackSprite(sprAlexFinalBossJumpAtk, 0.3);
            }
            if(t == 60) {
                scrFBPOrbShrinkingCircle(x, y, 10, 32, 128 * 2, 100, 100, 10, 0.5);
                scrFBSetAttackSprite(sprAlexFinalBossJumpAtk, 0.3);
            }
            if(t == 100) {
                scrFBPOrbShrinkingCircle(x, y, 14, 32, 128 * 3, 100, 100, -10, -0.5);
                scrFBSetAttackSprite(sprAlexFinalBossJumpAtk, 0.3);
            }
            
            with(objAlexFBOrbShrinkingCircle) {
                x = objPlayer.x;
                y = objPlayer.y;
            }
            
            x = clamp(objPlayer.x + (dist_from_player * side_from_player), dist_from_room_edges, room_width - dist_from_room_edges);
        }
        
        if(t >= 230) {
            if(t == 230) {
                gravity = default_gravity;
                fallback_sprite = noone;
            }
            
            if(on_ground) {
                sprite_index = sprAlexFinalBossIdle;
            }
        }
        
        if(t == 350)
            event_user(1);
        break;
        
        
    case 3:
        if(t == 20) {
            scrFBPOrbShrinkingCircle(x, y, 7, 32, 170, 40, 80, -10, -1);
            scrFBSetAttackSprite(sprAlexFinalBossJumpAtk, 0.3);
        }
        if(t == 160) {
            scrFBPOrbShrinkingCircle(x, y, 6, 32, 128, 60, 80, 10, 0.75);
            scrFBPOrbShrinkingCircle(x, y, 10, 32, 128 * 2.25, 60, 120, -10, -0.5);
            scrFBSetAttackSprite(sprAlexFinalBossJumpAtk, 0.3);
        }
        if(t == 360) {
            scrFBPOrbShrinkingCircle(x, y, 5, 32, 128, 60, 100, -10, -0.5);
            scrFBPOrbShrinkingCircle(x, y, 9, 32, 128 * 2, 90, 100, 10, 0.5);
            scrFBPOrbShrinkingCircle(x, y, 13, 32, 128 * 3, 120, 100, -10, -0.5);
            scrFBSetAttackSprite(sprAlexFinalBossJumpAtk, 0.3);
        }
        
        if(t < 420) {
            with(objAlexFBOrbShrinkingCircle) {
                if(t < time_before_shrink) {
                    x = objPlayer.x;
                    y = objPlayer.y;
                }
                
                projectile_count = 5;
            }
                
            x = clamp(objPlayer.x + (dist_from_player * side_from_player), dist_from_room_edges, room_width - dist_from_room_edges);
        }
        
        if(t >= 520) {
            if(t == 520) {
                gravity = default_gravity;
                fallback_sprite = noone;
            }
            
            if(on_ground) {
                sprite_index = sprAlexFinalBossIdle;
            }
        }
        
        if(t == 650) {
            with(objAlexFBPOrb)
                instance_destroy();
        
            event_user(1);
        }
        break;
}
