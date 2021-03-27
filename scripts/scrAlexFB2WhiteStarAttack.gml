// Only to be used within "objAlexFinalBoss2"!!

if(t == 20) {
    instance_create(room_width/2, room_height/2, objAlexFB2PPullVoid);
}

if(t > 50 && t mod 10 == 0) {
    instance_create(room_width/2, room_height/2, objAlexFB2PCirclingOrb);
}

if(shield_hp == 0) {
    with(objAlexFB2PPullVoid)
        fade_out = true;
        
    with(objAlexFB2PCirclingOrb)
        fade_out = true;

    event_user(0);  // End star phase
}
