///scrAlexFB2P3DCurveOrb(x, y, z, dir, spd, target_x, target_y, travel_dur, scale)

var _x = argument[0];
var _y = argument[1];
var _z = argument[2];
var _dir = argument[3];
var _spd = argument[4];
var _target_x = argument[5];
var _target_y = argument[6];
var _travel_dur = argument[7];
var _scale = argument[8];


var _inst = instance_create(_x, _y, objAlexFB2P3DCurveOrb);
    _inst.z = _z;
    _inst.initial_z_pos = _z;
    _inst.xscale = _scale;
    _inst.yscale = _scale;
    _inst.target_pos_x = _target_x;
    _inst.target_pos_y = _target_y;
    _inst.direction = _dir;
    _inst.speed = _spd;
    

// Return projectile for further modification
return _inst;
