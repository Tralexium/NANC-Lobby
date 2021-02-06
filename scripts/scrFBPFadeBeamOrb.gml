/// scrFBPFadeBeamOrb(x, y, size[optional], dir[optional], dir_incr[optional], speed[optional], spd_incr[optional], size_incr[optional], fade_in_speed[optional], projectile_count[optional])

var _x = argument[0];
var _y = argument[1];
var _size = -1;
var _dir = -1;
var _dir_incr = -1;
var _spd = -1;
var _spd_incr = -1;
var _size_incr = -1;
var _fade_in_speed = -1;
var _projectile_count = -1;

var _obj = instance_create(_x, _y, objAlexFBPFadeBeamOrb);

if(argument_count > 2) {
    _size = argument[2];
    _obj.size = _size;
    
    _obj.image_xscale = _size / sprite_get_height(sprAlexFBPOrbHitbox);
    _obj.image_yscale = _size / sprite_get_height(sprAlexFBPOrbHitbox);
}
if(argument_count > 3) {
    _dir = argument[3];
    _obj.direction = _dir;
}
if(argument_count > 4) {
    _dir_incr = argument[4];
    _obj.dir_incr = _dir_incr;
}
if(argument_count > 5) {
    _spd = argument[5];
    _obj.speed = _spd;
}
if(argument_count > 6) {
    _spd_incr = argument[6];
    _obj.spd_incr = _spd_incr;
}
if(argument_count > 7) {
    _size_incr = argument[7];
    _obj.size_incr = _size_incr;
}
if(argument_count > 8) {
    _fade_in_speed = argument[8];
    _obj.fade_spd = _fade_in_speed;
}
if(argument_count > 9) {
    _projectile_count = argument[9];
    _obj.projectile_count = _projectile_count;
}

// In case you want to further modify it
return _obj;
