///scrFBPOrbStar(x, y, circle_angle, point_amount, orb_amount, size[optional], dir_incr[optional], speed[optional], spd_incr[optional], size_incr[optional])

var _x = argument[0];
var _y = argument[1];
var _circle_angle = argument[2];
var _point_amount = argument[3];
var _orb_amount = argument[4];
var _size = -1;
var _dir_incr = -1;
var _spd = -1;
var _spd_incr = -1;
var _size_incr = -1;


for (var i = 0; i < _orb_amount; i += 1)
{
    var _orb_dir = _circle_angle + i * (360 / _orb_amount);
    var _obj = instance_create(_x, _y, objAlexFBPOrb);
        _obj.direction = _orb_dir;
    
    if(argument_count > 5) {
        _size = argument[5];
        _obj.size = _size;
        
        _obj.image_xscale = _size / sprite_get_height(sprAlexFBPOrbHitbox);
        _obj.image_yscale = _size / sprite_get_height(sprAlexFBPOrbHitbox);
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
    
    var _petal_based_spd = 1 - abs(dsin((_orb_dir/2) * _point_amount)) * .6;
        _obj.speed *= _petal_based_spd;
}
