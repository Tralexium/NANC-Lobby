/// BktGlitch_set_line_drift(drift)
/*
    Sets added scanline-y drift to horizontal lines.
    Range based around 0-1, no upper limit.
    
    ONLY RUN WHILE THE SHADER IS ACTIVE!
*/

shader_set_uniform_f(global.bktGlitchUniform[bktGlitch.lineDrift], abs(argument0));
