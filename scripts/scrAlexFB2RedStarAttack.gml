// Only to be used within "objAlexFinalBoss2"!!

if(t mod 220 == 0) {
    scrAlexFB2P3DWaveOrbLine(-400, room_height/2, 0, 3, 20, 64, 10);
    scrAlexFB2P3DWaveOrbLine(room_width/2, -400, -90, 3, 40, 64, 10);
}

if((t-30) mod 150 == 0) {
    scrAlexFB2PCollapseRing(objAlexFlyingPlayer.x, objAlexFlyingPlayer.y, 3, collapse_ring_spin_dir);
    collapse_ring_spin_dir *= -1;
}

if(shield_hp == 0) {        
    with(objAlexFB2P3DWaveOrb)
        fade_out = true;
        
    with(objAlexFBPOrb)
        fade_out = true;
        
    with(objAlexFBPSquishOrb)
        fade_out = true;

    event_user(0);  // End star phase
}
