///scrAlexFB2P3DCurveOrb(x, y, z, target_x, target_y)

var _x = argument[0];
var _y = argument[1];
var _z = argument[2];
var _target_x = argument[3];
var _target_y = argument[4];


var _inst = instance_create(_x, _y, objAlexFB2P3DCurveOrb);
    _inst.z = _z;
    _inst.z_previous = _z;
    _inst.target_pos_x = _target_x;
    _inst.target_pos_y = _target_y;
    

// Return projectile for further modification
return _inst;
