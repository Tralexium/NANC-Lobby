/// scrFBPBubble(x, y, start_scale, target_scale, dir, speed)

var _x = argument[0];
var _y = argument[1];
var _start_scale = argument[2];
var _target_scale = argument[3];
var _dir = argument[4];
var _spd = argument[5];

var _obj = instance_create(_x, _y, objAlexFBPBubble);
    _obj.start_scale = _start_scale;
    _obj.target_scale = _target_scale;
    _obj.direction = _dir;
    _obj.speed = _spd;
    _obj.image_xscale = _start_scale;
    _obj.image_yscale = _start_scale;


// In case you want to further modify it
return _obj;
