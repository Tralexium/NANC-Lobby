// Only to be used within "objAlexFinalBoss2"!!

if(t mod 25 == 0)
    scrAlexFB2P3DImpactOrb(random_range(0, room_width), random_range(0, room_height), irandom_range(-10, -15), 11);
    
if(shield_hp == 0) {
    with(objAlexFB2P3DImpactOrb)
        fade_out = true;
        
    with(objAlexFBPOrb)
        fade_out = true;

    event_user(0);  // End star phase
}

