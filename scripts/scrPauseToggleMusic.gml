///toggles the music on and off within the pause menu

global.muteMusic = !global.muteMusic;

if(!global.muteMusic) {
    with (objPlayMusic)
    {
        if (BGM != -2)
            scrPlayMusic(BGM,true);
    }
} else  //mute music
{
    scrStopMusic();
    audio_stop_sound(global.gameOverMusic);
}
