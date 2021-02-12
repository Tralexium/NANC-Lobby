//scrFBLevelUp()

if(t == 1) {
    scrFinalBossTP(clamp(objPlayer.x, 300, room_width - 300), 300, sprAlexFinalBossFloatUp);
        
    look_at_player = false;
    
    with(objPlayerKiller) {
        if(object_index != other.object_index)
            instance_destroy();
    }
    
    with(objPlayer)
        frozen = true;
}

if(t == 30) {
    with(objAlexFBCam)
        zoom_on_boss = true;
        
    audio_sound_gain(musFinalBoss, 0.5, 1000);
}

if(t > 30 && t <= 80) {
    var _anim_val = clamp(t, 0, 40);
    y = scrAlexEaseInOutSine(_anim_val, 300, 260, 40);
}

if(t == 80) {
    sprite_index = sprAlexFinalBossPowerUp;
    image_index = 0;
    audio_play_sound(sndAlexFBLevelUp, 0, false);
}

if(round(image_index) == 10 && exp_ready_to_level_up && sprite_index == sprAlexFinalBossPowerUp) {
    exp_ready_to_level_up = false;

    exp_level++;
    if(exp_level < exp_max_level)
        exp_amnt = 0;
        
    with(objAlexFBCam)
        zoom_on_boss = false;
        
    with(objPlayer)
        frozen = false;
        
    audio_sound_gain(musFinalBoss, 1, 1500);
}

if(round(image_index) == image_number - 1 && sprite_index == sprAlexFinalBossPowerUp) {
    event_user(1);
}
