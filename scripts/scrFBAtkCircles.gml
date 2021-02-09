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
    case 0:
        if(t < 120) {
            if(t == 20) {
                scrFBPOrbShrinkingCircle(x, y, 6, 32, 128, 100, 100, -10, 0);
                scrFBSetAttackSprite(sprAlexFinalBossJumpAtk, 0.3);
            }
            if(t == 50) {
                scrFBPOrbShrinkingCircle(x, y, 9, 32, 128 * 2, 100, 100, 10, 0);
                scrFBSetAttackSprite(sprAlexFinalBossJumpAtk, 0.3);
            }
            if(t == 80) {
                scrFBPOrbShrinkingCircle(x, y, 13, 32, 128 * 3, 100, 100, -10, 0);
                scrFBSetAttackSprite(sprAlexFinalBossJumpAtk, 0.3);
            }
            
            with(objAlexFBOrbShrinkingCircle) {
                x = objPlayer.x;
                y = objPlayer.y;
            }
            
            x = clamp(objPlayer.x + (dist_from_player * side_from_player), dist_from_room_edges, room_width - dist_from_room_edges);
        }
        
        if(t >= 200) {
            if(t == 200) {
                gravity = default_gravity;
                fallback_sprite = noone;
            }
            
            if(on_ground) {
                sprite_index = sprAlexFinalBossIdle;
            }
        }
        
        if(t == 340)
            event_user(1);
}
