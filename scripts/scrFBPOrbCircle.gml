///scrFBPOrbCircle(x, y, circle_angle, amount, size[optional], dir_incr[optional], speed[optional], spd_incr[optional], size_incr[optional])

var _x = argument[0];
var _y = argument[1];
var _circle_angle = argument[2];
var _amount = argument[3];
var _size = -1;
var _dir_incr = -1;
var _spd = -1;
var _spd_incr = -1;
var _size_incr = -1;


for (var i = 0; i < _amount; i += 1)
{
    var _obj = instance_create(_x, _y, objAlexFBPOrb);
        _obj.direction = _circle_angle + i * (360 / _amount);
    
    if(argument_count > 4) {
        _size = argument[4];
        _obj.size = _size;
    }
    if(argument_count > 5) {
        _dir_incr = argument[5];
        _obj.dir_incr = _dir_incr;
    }
    if(argument_count > 6) {
        _spd = argument[6];
        _obj.speed = _spd;
    }
    if(argument_count > 7) {
        _spd_incr = argument[7];
        _obj.spd_incr = _spd_incr;
    }
    if(argument_count > 8) {
        _size_incr = argument[8];
        _obj.size_incr = _size_incr;
    }
}
