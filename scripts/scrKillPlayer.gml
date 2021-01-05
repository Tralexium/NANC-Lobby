//kills the player

if (instance_exists(objPlayer) && (!global.noDeath && !global.debugNoDeath))
{
    if (global.gameStarted) //normal death
    {
        if(global.originalDeathSound) {
            global.deathSound = audio_play_sound(sndOriginalDeath,0,false);
        } else {
            global.deathSound = audio_play_sound(sndDeath,0,false);
        }
        
        if (!global.muteMusic)  //play death music
        {
            if (global.deathMusicMode == 1) //instantly pause the current music
            {
                audio_pause_sound(global.currentMusic);
                
                global.gameOverMusic = audio_play_sound(musOnDeath,1,false);
            }
            else if (global.deathMusicMode == 2)    //fade out the current music
            {                
                with (objWorld)
                    event_user(0);  //fades out and stops the current music
                
                global.gameOverMusic = audio_play_sound(musOnDeath,1,false);
            }
        }
        
        // Alex modified
        with (objPlayer)
        {
            var part = scrAlexMakeParticle(x, y, 100, sprAlexPlayerBloodSplatter, .4, 0, 0, false, false, false);
                part.end_on_last_frame = true;
                part.depth = -999;
                
            if(!instance_exists(objAlexLobbyPlayer)) {
                part.image_xscale = 2;
                part.image_yscale = 2;
            }
                
            instance_destroy();
        }
        
        instance_create(0,0,objAlexGameOver);
        
        global.death += 1; //increment deaths
        
        // New for stages
        if(global.stagePresent)
            global.stageDeaths += 1;
            
        scrSaveGame(false); //save death/time
    }
    else    //death in the difficulty select room, restart the room
    {
        with(objPlayer)
            instance_destroy();
            
        room_restart();
    }
}
