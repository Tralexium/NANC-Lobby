///scrStageClear(stage_num[int], secret_id[int/optional]...)

// Only works within 'objStageClearUI' //

var _stage_num = argument[0];

// Mark the stage as cleared
if(_stage_num != -1)
    global.saveStageCleared[_stage_num] = true;

// Assign the stage time and deaths
stage_time = global.stageTime;
stage_deaths = global.stageDeaths;

// Reset the stage time and deaths
global.stagePresent = false;
global.stageDeaths = 0;
global.stageTime = 0;
scrSaveGame(false);

// Check how many secrets have been discovered
if(argument_count > 1) {
    for(var i=1; i<=argument_count; i++) {
        if(argument[i] != -1) {
            stage_total_secrets++;    
            if(global.secretItem[argument[i]])
                stage_secrets_found++;
        }
    }
}
