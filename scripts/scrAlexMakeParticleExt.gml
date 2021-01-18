///scrAlexMakeParticleExt(x, y, life, sprite, image_index, image_spd, image_angle, direction, speed, speed_shift[float], start_col, end_col, blend_mode, shrink[bool], fade[bool], random_wiggle[float], depth[int], depth_check[bool])

var xx = argument[0];
var yy = argument[1];
var life = argument[2];
var spr = argument[3];
var img_index = argument[4];
var img_spd = argument[5];
var img_angle = argument[6];
var dir = argument[7];
var spd = argument[8];
var spd_shift = argument[9];
var start_col = argument[10];
var end_col = argument[11];
var blend_mode = argument[12];
var shrink = argument[13];
var fade = argument[14];
var random_wiggle = argument[15];
var d = argument[16];
var depth_check = argument[17];


var p = instance_create(xx, yy, objAlexParticle);
    p.life = life;
    p.sprite_index = spr;
    p.image_index = img_index;
    p.image_speed = img_spd;
    p.image_angle = img_angle;
    p.direction = dir;
    p.speed = spd;
    p.spd_shift = spd_shift;
    p.start_col = start_col;
    p.end_col = end_col;
    p.blend_mode = blend_mode;
    p.shrink = shrink;
    p.fade = fade;
    p.random_wiggle = random_wiggle;
    p.depth = d;
    p.depth_check = depth_check;
    
return p;
