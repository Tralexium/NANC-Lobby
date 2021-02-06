///scrFBAtkJump(current_boss_level)

var _lvl = argument[0];

// Teleport onto position
if(t == 1) {
    var _tp_x = scrFBGetNextTeleportXPos();
    scrFinalBossTP(_tp_x, ground_level - 32, sprAlexFinalBossIdle);
    
    
}

// Execute the correct attack based on the current boss level
switch(_lvl) {
    default:
    case 0:
        if(t == 20) {
            look_at_player = false;
            
            var _hspeed = 6 * image_xscale;
            if((x < 600 && _hspeed < 0) || (x > room_width - 600 && _hspeed > 0))
                _hspeed *= -1;
            
            scrFBJump(_hspeed, 12);
            
            if(image_xscale > 0) {
                if(hspeed > 0)
                    sprite_index = sprAlexFinalBossJumpFront;
                else
                    sprite_index = sprAlexFinalBossJumpBack;
            } else {
                if(hspeed < 0)
                    sprite_index = sprAlexFinalBossJumpFront;
                else
                    sprite_index = sprAlexFinalBossJumpBack;
            }
        }
        
        if(t == 50) {
            scrFBPStartAttackCane2(x, y, objPlayer.x, objPlayer.y - 150, 30, 1)
            fallback_sprite = sprite_index;
            
            if(sprite_index == sprAlexFinalBossJumpBack)
                scrFBSetAttackSprite(sprAlexFinalBossJumpBackAtk, 0.3);
            else
                scrFBSetAttackSprite(sprAlexFinalBossJumpFrontAtk, 0.3);
        }
        
        if(t == 80) {
            scrFBPStartAttackCane2(x, y, objPlayer.x + 150, objPlayer.y - 150, 30, 1)
            
            if(sprite_index == sprAlexFinalBossJumpBack)
                scrFBSetAttackSprite(sprAlexFinalBossJumpBackAtk, 0.3);
            else
                scrFBSetAttackSprite(sprAlexFinalBossJumpFrontAtk, 0.3);
        }
        
        if(t == 100) {
            scrFBPStartAttackCane2(x, y, objPlayer.x - 150, objPlayer.y - 150, 30, 1)
            
            if(sprite_index == sprAlexFinalBossJumpBack)
                scrFBSetAttackSprite(sprAlexFinalBossJumpBackAtk, 0.3);
            else
                scrFBSetAttackSprite(sprAlexFinalBossJumpFrontAtk, 0.3);
        }
        
        if(t > 50) {
            if(on_ground)
                sprite_index = sprAlexFinalBossIdle;
        }
    
        if(t == 210) {
            event_user(1);
        }
}
