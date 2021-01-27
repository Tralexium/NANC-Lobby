///scrFBPExplosionParticles(explosion_spr, explosion_life, explosion_scale, explosion_add_scale, explosion_fade, exlosion_blend_mode, spark_amnt, spark_life, spark_scale, spark_add_scale, spark_spd)

var _part = scrAlexMakeParticle(x, y, argument[1], argument[0], 0, 0, 0, false, argument[4], false);
    _part.image_xscale = argument[2];
    _part.image_yscale = argument[2];
    _part.blend_mode = argument[5];
    _part.add_scale = argument[3];
    
var _spark_dir; 
repeat(argument[6]) {
    _spark_dir = random(360);
    _part = scrAlexMakeParticle(x, y, argument[7], sprAlexFBParticleSpark, 0, _spark_dir, argument[10], false, false, false);
    _part.image_xscale = argument[8];
    _part.image_yscale = argument[8];
    _part.image_angle = _spark_dir;
    _part.blend_mode = bm_add;
    _part.add_scale = argument[9];
}
