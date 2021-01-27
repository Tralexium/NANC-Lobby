/// scrFBPOrbWithObj(x, y, obj, death_sfx[optional], size[optional], dir[optional], dir_incr[optional], speed[optional], spd_incr[optional], size_incr[optional])

var _x = argument[0];
var _y = argument[1];
var _obj = argument[2];
var _death_sfx = -1;
var _size = -1;
var _dir = -1;
var _dir_incr = -1;
var _spd = -1;
var _spd_incr = -1;
var _size_incr = -1;

var _obj = instance_create(_x, _y, objAlexFBPOrbWithObj);
    _obj.obj_on_col = _obj;

if(argument_count > 3) {
    _death_sfx = argument[3];
    _obj.death_sfx = _death_sfx;
}
if(argument_count > 4) {
    _size = argument[4];
    _obj.size = _size;
    
    _obj.image_xscale = _size / sprite_get_height(sprAlexFBPOrbHitbox);
    _obj.image_yscale = _size / sprite_get_height(sprAlexFBPOrbHitbox);
}
if(argument_count > 5) {
    _angle = argument[5];
    _obj.image_angle = _angle;
}
if(argument_count > 6) {
    _dir_incr = argument[6];
    _obj.dir_incr = _dir_incr;
}
if(argument_count > 7) {
    _spd = argument[7];
    _obj.speed = _spd;
}
if(argument_count > 8) {
    _spd_incr = argument[8];
    _obj.spd_incr = _spd_incr;
}
if(argument_count > 9) {
    _size_incr = argument[9];
    _obj.size_incr = _size_incr;
}

// In case you want to further modify it
return _obj;
