///scrLoadGame(loadfile)
///loads the game
///argument0 - sets whether or not to read the save file when loading the game

var loadFile = argument0;

//only load save data from the save file if the script is currently set to (we should only need to load these on first load because the game stores them afterwards)
if (loadFile)
{
    //load the save map
    var saveMap;
    
    if (global.extraSaveProtection) //use ds_map_secure function
    {
        saveMap = ds_map_secure_load("Data\save"+string(global.savenum));
    }
    else    //use text file
    {
        var f = file_text_open_read("Data\save"+string(global.savenum));
        
        saveMap = ds_map_create();
        ds_map_read(saveMap,base64_decode(file_text_read_string(f)));
        
        file_text_close(f);
    }
    
    var saveValid = true;   //keeps track of whether or not the save being loaded is valid
    
    if (saveMap != -1)  //check if the save map loaded correctly
    {
        global.death = ds_map_find_value(saveMap,"death");
        global.time = ds_map_find_value(saveMap,"time");
        global.timeMicro = ds_map_find_value(saveMap,"timeMicro");
        
        global.difficulty = ds_map_find_value(saveMap,"difficulty");
        global.saveRoom = ds_map_find_value(saveMap,"saveRoom");
        global.savePlayerX = ds_map_find_value(saveMap,"savePlayerX");
        global.savePlayerY = ds_map_find_value(saveMap,"savePlayerY");
        global.saveGrav = ds_map_find_value(saveMap,"saveGrav");
        
        global.currentPlayerHat = ds_map_find_value(saveMap,"currentPlayerHat");
        global.currentPlayerPet = ds_map_find_value(saveMap,"currentPlayerPet");
        
        // Totals
        global.saveTotalSecretsFound = ds_map_find_value(saveMap,"saveTotalSecretsFound");
        global.saveTotalStagesCleared = ds_map_find_value(saveMap,"saveTotalStagesCleared");
        global.saveTotalCrystalStarsFound = ds_map_find_value(saveMap,"saveTotalCrystalStarsFound");
        
        // Lobby related
        global.lobbyPlayerSpeedUp = ds_map_find_value(saveMap,"lobbyPlayerSpeedUp");
        global.lobbyLastFloor = ds_map_find_value(saveMap,"lobbyLastFloor");
        global.lobbyLastX = ds_map_find_value(saveMap,"lobbyLastX");
        global.lobbyLastY = ds_map_find_value(saveMap,"lobbyLastY");
        global.lobbyMinigameHighScore = ds_map_find_value(saveMap,"lobbyMinigameHighScore");
        
        // Stage related
        global.stagePresent = ds_map_find_value(saveMap,"stagePresent");
        global.stageDeaths = ds_map_find_value(saveMap,"stageDeaths");
        global.stageTime = ds_map_find_value(saveMap,"stageTime");
        
        // Final Boss
        global.skipFBIntro = ds_map_find_value(saveMap,"skipFBIntro");
        
        if (is_string(global.saveRoom))   //check if the saved room loaded properly
        {
            if (!room_exists(asset_get_index(global.saveRoom)))  //check if the room index in the save is valid
                saveValid = false;
        }
        else
        {
            saveValid = false;
        }
        
        for (var i = 0; i <= global.totalNumberOfStages; i++)
        {
            global.saveStageCleared[i] = ds_map_find_value(saveMap,"saveStageClear["+string(i)+"]");
        }
        
        for (var i = 0; i < global.totalNumberOfCrystalStars; i++)
        {
            global.saveCrystalStar[i] = ds_map_find_value(saveMap,"saveCrystalStar["+string(i)+"]");
        }
        
        for (var i = 0; i < global.totalNumberOfHats; i++)
        {
            global.savePlayerHat[i] = ds_map_find_value(saveMap,"savePlayerHat["+string(i)+"]");
        }
        
        for (var i = 0; i < global.totalNumberOfPets; i++)
        {
            global.savePlayerPet[i] = ds_map_find_value(saveMap,"savePlayerPet["+string(i)+"]");
        }
        
        for (var i = 0; i < global.secretItemTotal; i++)
        {
            global.saveSecretItem[i] = ds_map_find_value(saveMap,"saveSecretItem["+string(i)+"]");
        }
        
        for (var i = 0; i < global.bossItemTotal; i++)
        {
            global.saveBossItem[i] = ds_map_find_value(saveMap,"saveBossItem["+string(i)+"]");
        }
        
        global.saveGameClear = ds_map_find_value(saveMap,"saveGameClear");
        
        //load md5 string from the save map
        var mapMd5 = ds_map_find_value(saveMap,"mapMd5");
        
        //check if md5 is not a string in case the save was messed with or got corrupted
        if (!is_string(mapMd5))
            mapMd5 = "";   //make it a string for the md5 comparison
        
        //generate md5 string to compare with
        ds_map_delete(saveMap,"mapMd5");
        var genMd5 = md5_string_unicode(ds_map_write(saveMap)+global.md5StrAdd);
        
        if (mapMd5 != genMd5)   //check if md5 hash is invalid
            saveValid = false;
        
        //destroy the map
        ds_map_destroy(saveMap);
    }
    else
    {
        //save map didn't load correctly, set the save to invalid
        saveValid = false;
    }
    
    if (!saveValid) //check if the save is invalid
    {
        //save is invalid, restart the game
        
        show_message("Save invalid!");
        
        scrRestartGame();
        
        exit;
    }
}

//set game variables and set the player's position

with (objPlayer) //destroy player if it exists
    instance_destroy();

global.gameStarted = true;  //sets game in progress (enables saving, restarting, etc.)
global.noPause = false;     //disable no pause mode
global.autosave = false;    //disable autosaving since we're loading the game

global.grav = global.saveGrav;

// Totals
global.totalSecretsFound = global.saveTotalSecretsFound;
global.totalStagesCleared = global.saveTotalStagesCleared;
global.totalCrystalStarsFound = global.saveTotalCrystalStarsFound;

for (var i = 0; i <= global.totalNumberOfStages; i++)
{
    global.stageCleared[i] = global.saveStageCleared[i];
}

for (var i = 0; i < global.totalNumberOfCrystalStars; i++)
{
    global.crystalStar[i] = global.saveCrystalStar[i];
}

for (var i = 0; i < global.totalNumberOfHats; i++)
{
    global.playerHat[i] = global.savePlayerHat[i];
}

for (var i = 0; i < global.totalNumberOfPets; i++)
{
    global.playerPet[i] = global.savePlayerPet[i];
}

for (var i = 0; i < global.secretItemTotal; i++)
{
    global.secretItem[i] = global.saveSecretItem[i];
}

for (var i = 0; i < global.bossItemTotal; i++)
{
    global.bossItem[i] = global.saveBossItem[i];
}

global.gameClear = global.saveGameClear;

instance_create(global.savePlayerX,global.savePlayerY,objPlayer);

room_goto(asset_get_index(global.saveRoom));
