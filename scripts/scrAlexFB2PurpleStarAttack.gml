// Only to be used within "objAlexFinalBoss2"!!

if(t mod 160 == 0) {
    scrAlexFB2PSpeedRing(room_width/2, room_height/2, 12, 260, speed_ring_dir, 12);
    speed_ring_dir *= -1;
}

if(shield_hp == 0) {
    with(objAlexFB2PSpeedRing)
        fade_out = true;
        
    with(objAlexFBPSquishOrb)
        fade_out = true;

    event_user(0);  // End star phase
}
