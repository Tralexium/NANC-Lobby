///scrFBPOrbShrinkingCircle(x, y, orb_amnt, orb_size, radius, time_before_shrink, shrink_length, initial_spd, target_spd)

var _x = argument[0];
var _y = argument[1];
var _orb_amnt = argument[2];
var _orb_size = argument[3];
var _radius = argument[4];
var _time_before_shrink = argument[5];
var _shrink_length = argument[6];
var _initial_spd = argument[7];
var _target_spd = argument[8];

var _obj = instance_create(_x, _y, objAlexFBOrbShrinkingCircle);
    _obj.orb_amnt = _orb_amnt;
    _obj.orb_size = _orb_size;
    _obj.start_rad = _radius;
    _obj.time_before_shrink = _time_before_shrink;
    _obj.shrink_length = _shrink_length;
    _obj.initial_spd = _initial_spd;
    _obj.target_spd = _target_spd;


// Return for further modification
return _obj;
