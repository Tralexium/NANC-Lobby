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
    case 1:
        if(t == 20) {
            look_at_player = false;
            
            
            var _hspeed = 6 * image_xscale;
            if((x < 500 && _hspeed < 0) || (x > room_width - 500 && _hspeed > 0))
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
            if(on_ground) {
                sprite_index = sprAlexFinalBossIdle;
            }
        }
    
        if(t == 230) {
            event_user(1);
        }
        break;
        
        
    case 2:
        if(t == 20) {
            look_at_player = false;
            
            
            var _hspeed = 6 * image_xscale;
            if((x < 500 && _hspeed < 0) || (x > room_width - 500 && _hspeed > 0))
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
        
        if(t > 50 && t < 200) {
            if(on_ground) {
                if(sprite_index == sprAlexFinalBossJumpFront)
                    image_xscale *= -1;
                else {
                    sprite_index = sprAlexFinalBossJumpFront;
                    fallback_sprite = sprAlexFinalBossJumpFront;
                }
                    
                var _hspeed = 6 * image_xscale;
                scrFBJump(_hspeed, 12);
            }
        }
        
        if(t == 170) {
            scrFBPSquishOrbCircle(x, y, random(360), 12, 32, 1, 2, .1, -0.01);
            audio_play_sound(sndAlexFBCaneThrow, 0, false);
            audio_play_sound(sndAlexFBSquishOrbPulse, 0, false);
            
            if(sprite_index == sprAlexFinalBossJumpBack)
                scrFBSetAttackSprite(sprAlexFinalBossJumpBackAtk, 0.3);
            else
                scrFBSetAttackSprite(sprAlexFinalBossJumpFrontAtk, 0.3);
        }
        
        if(t == 210) {
            scrFBPSquishOrbCircle(x, y, random(360), 12, 32, -1, 2, .1, -0.01);
            audio_play_sound(sndAlexFBCaneThrow, 0, false);
            audio_play_sound(sndAlexFBSquishOrbPulse, 0, false);
            
            if(sprite_index == sprAlexFinalBossJumpBack)
                scrFBSetAttackSprite(sprAlexFinalBossJumpBackAtk, 0.3);
            else
                scrFBSetAttackSprite(sprAlexFinalBossJumpFrontAtk, 0.3);
        }
        
        with(objAlexFBPSquishOrb)
            squish_multi = 0.02;
    
        if(t > 200) {
            if(on_ground) {
                sprite_index = sprAlexFinalBossIdle;
            }
        }
        
        if(t == 350) {
            event_user(1);
        }
        break;
        
        
    case 3:
        if(t == 20) {
            look_at_player = false;
            
            
            var _hspeed = 6 * image_xscale;
            if((x < 500 && _hspeed < 0) || (x > room_width - 500 && _hspeed > 0))
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
        
        if(t == 40) {
            scrFBPStartAttackCane2(x, y, objPlayer.x - 200, objPlayer.y - 150, 30, 1)
            fallback_sprite = sprite_index;
            
            if(sprite_index == sprAlexFinalBossJumpBack)
                scrFBSetAttackSprite(sprAlexFinalBossJumpBackAtk, 0.3);
            else
                scrFBSetAttackSprite(sprAlexFinalBossJumpFrontAtk, 0.3);
        }
        
        if(t == 60) {
            scrFBPStartAttackCane2(x, y, objPlayer.x - 100, objPlayer.y - 150, 30, 1)
            
            if(sprite_index == sprAlexFinalBossJumpBack)
                scrFBSetAttackSprite(sprAlexFinalBossJumpBackAtk, 0.3);
            else
                scrFBSetAttackSprite(sprAlexFinalBossJumpFrontAtk, 0.3);
        }
        
        if(t == 80) {
            scrFBPStartAttackCane2(x, y, objPlayer.x + 100, objPlayer.y - 150, 30, 1)
            
            if(sprite_index == sprAlexFinalBossJumpBack)
                scrFBSetAttackSprite(sprAlexFinalBossJumpBackAtk, 0.3);
            else
                scrFBSetAttackSprite(sprAlexFinalBossJumpFrontAtk, 0.3);
        }
        
        if(t == 100) {
            scrFBPStartAttackCane2(x, y, objPlayer.x - 200, objPlayer.y - 150, 30, 1)
            
            if(sprite_index == sprAlexFinalBossJumpBack)
                scrFBSetAttackSprite(sprAlexFinalBossJumpBackAtk, 0.3);
            else
                scrFBSetAttackSprite(sprAlexFinalBossJumpFrontAtk, 0.3);
        }
        
        if(t > 50 && t < 200) {
            if(on_ground) {
                if(sprite_index == sprAlexFinalBossJumpFront)
                    image_xscale *= -1;
                else {
                    sprite_index = sprAlexFinalBossJumpFront;
                    fallback_sprite = sprAlexFinalBossJumpFront;
                }
                
                var _hspeed = 6 * image_xscale;
                scrFBJump(_hspeed, 12);
            }
        }
        
        if(t == 170) {
            scrFBPSquishOrbCircle(x, y, random(360), 14, 32, 1, 2, .1, -0.01);
            audio_play_sound(sndAlexFBCaneThrow, 0, false);
            audio_play_sound(sndAlexFBSquishOrbPulse, 0, false);
            
            if(sprite_index == sprAlexFinalBossJumpBack)
                scrFBSetAttackSprite(sprAlexFinalBossJumpBackAtk, 0.3);
            else
                scrFBSetAttackSprite(sprAlexFinalBossJumpFrontAtk, 0.3);
        }
        
        if(t == 210) {
            scrFBPSquishOrbCircle(x, y, random(360), 14, 32, -1, 2, .1, -0.01);
            audio_play_sound(sndAlexFBCaneThrow, 0, false);
            audio_play_sound(sndAlexFBSquishOrbPulse, 0, false);
            
            if(sprite_index == sprAlexFinalBossJumpBack)
                scrFBSetAttackSprite(sprAlexFinalBossJumpBackAtk, 0.3);
            else
                scrFBSetAttackSprite(sprAlexFinalBossJumpFrontAtk, 0.3);
        }
        
        with(objAlexFBPSquishOrb)
            squish_multi = 0.02;
    
        if(t > 240 && t < 270) {
            if(on_ground) {
                look_at_player = true;
                sprite_index = sprAlexFinalBossIdle;
                fallback_sprite = noone;
            }
        }
        
        if(t == 270) {
            sprite_index = sprAlexFinalBossJump;
            scrFBJump(0, 5);
        }
        
        if(t == 290) {
            var _helix = instance_create(x + (40*image_xscale), y, objAlexFBHelixOrbs);
                _helix.spd *= image_xscale;
                _helix.acceleration *= image_xscale;
            scrFBSetAttackSprite(sprAlexFinalBossJumpAtk, 0.3, sprAlexFinalBossJump);
        }
        
        if(t == 310) {
            side_from_player *= -1;
            var _tp_x = scrFBGetNextTeleportXPos();
            scrFinalBossTP(_tp_x, ground_level - 32, sprAlexFinalBossIdle);
        }
        
        if(t == 330) {
            sprite_index = sprAlexFinalBossJump;
            scrFBJump(0, 5);
        }
        
        if(t == 350) {
            var _helix = instance_create(x + (40*image_xscale), y, objAlexFBHelixOrbs);
                _helix.spd *= image_xscale;
                _helix.acceleration *= image_xscale;
            scrFBSetAttackSprite(sprAlexFinalBossJumpAtk, 0.3, sprAlexFinalBossJump);
        }
        
        if(t > 350 && on_ground) {
            sprite_index = sprAlexFinalBossIdle;
        }
        
        if(t == 450) {
            event_user(1);
        }
        break;
}
