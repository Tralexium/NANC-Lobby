// Only to be used within "objAlexFinalBoss2"!!

if((t-10) mod 300 == 0) {
    repeat(1) {
        var _inst = instance_create(random_range(0, room_width), -100, objAlexFB2PGreenStar);
            _inst.direction = -90;
    }
}

if((t-20) mod 300 == 0) {
    repeat(1) {
        var _inst = instance_create(random_range(0, room_width), room_height+100, objAlexFB2PGreenStar);
            _inst.direction = 90;
    }
}

if((t-30) mod 300 == 0) {
    repeat(1) {
        var _inst = instance_create(-100, random_range(0, room_height), objAlexFB2PGreenStar);
            _inst.direction = 0;
    }
}

if((t-40) mod 300 == 0) {
    repeat(1) {
        var _inst = instance_create(room_width+100, random_range(0, room_height), objAlexFB2PGreenStar);
            _inst.direction = 180;
    }
}

if(shield_hp == 0) {
    with(objAlexFB2PGreenStar)
        fade_out = true;
        
    with(objAlexFBPOrb)
        fade_out = true;

    event_user(0);  // End star phase
}
