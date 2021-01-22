/// scrFBPOrb(x, y, size[optional], dir[optional], dir_incr[optional], speed[optional], spd_incr[optional], size_incr[optional])

var _x = argument[0];
var _y = argument[1];
var _size = -1;
var _dir = -1;
var _dir_incr = -1;
var _spd = -1;
var _spd_incr = -1;
var _size_incr = -1;

var _obj = instance_create(_x, _y, objAlexFBPOrb);

if(argument_count > 2) {
    _size = argument[2];
    _obj.size = _size;
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

// In case you want to further modify it
return _obj;
