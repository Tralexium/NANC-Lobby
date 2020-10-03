///scrAlexMakeParticleExt(x, y, life, sprite, image_spd, direction, speed, speed_shift[float], start_col, end_col, blend_mode, shrink[bool], fade[bool], random_wiggle[float], depth[int], depth_check[bool])

var xx = argument0;
var yy = argument1;
var life = argument2;
var spr = argument3;
var image_spd = argument4;
var dir = argument5;
var spd = argument6;
var spd_shift = argument7;
var start_col = argument8;
var end_col = argument9;
var blend_mode = argument10;
var shrink = argument11;
var fade = argument12;
var random_wiggle = argument13;
var d = argument14;
var depth_check = argument15;


var p = instance_create(xx, yy, objAlexParticle);
    p.life = life;
    p.sprite_index = spr;
    p.image_speed = image_spd;
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
