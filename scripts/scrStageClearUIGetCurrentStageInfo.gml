///scrStageClearUIGetCurrentStageInfo(stage_num[int], secret_id[int/optional]...)

// Only works within 'objStageClearUI'! //



// Assign the stage number
stage_num = argument[0];

// Assign the stage time and deaths
stage_time = global.stageTime;
stage_deaths = global.stageDeaths;

// Check how many secrets have been discovered
if(argument_count > 1) {
    for(var i=1; i<argument_count; i++) {
        if(argument[i] != -1) {
            stage_total_secrets++;    
            if(global.secretItem[argument[i]])
                stage_secrets_found++;
        }
    }
}
