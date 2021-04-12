// Only to be used within "objAlexFinalBoss2"!!

// Spawn the screen wrapping projectiles
if(t == 10) {
    repeat(25) {
        instance_create(random_range(0, room_width), random_range(0, room_height), objAlexFB2PScreenWrapSquishOrb);
    }
}

if(t mod 100 == 0)
    scrAlexFB2P3DCurveOrb(x, y, z+1, objAlexFlyingPlayer.x, objAlexFlyingPlayer.y);
    
if(shield_hp == 0) {
    with(objAlexFB2PScreenWrapSquishOrb)
        fade_out = true;
        
    with(objAlexFB2P3DCurveOrb)
        fade_out = true;

    event_user(0);  // End star phase
}
