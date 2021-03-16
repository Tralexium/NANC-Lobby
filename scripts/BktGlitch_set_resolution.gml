/// BktGlitch_set_resolution(width, height)
/*
    Passes resolution to the shader.
    
    ONLY RUN WHILE THE SHADER IS ACTIVE!
*/

shader_set_uniform_f(global.bktGlitchUniform[bktGlitch.resolution], abs(argument0), abs(argument1));
