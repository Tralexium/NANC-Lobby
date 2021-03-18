///scrAlexFB2POrb(x, y, z, zspeed, dir, spd, base_scale)

var _x = argument[0];
var _y = argument[1];
var _z = argument[2];
var _zspeed = argument[3];
var _dir = argument[4];
var _spd = argument[5];
var _base_scale = argument[6];


var _inst = instance_create(_x, _y, objAlexPseudo3DOrb);
    _inst.z = _z;
    _inst.zspeed = abs(_zspeed);
    _inst.base_scale = _base_scale;
    _inst.direction = _dir;
    _inst.speed = _spd;
    

// Return projectile for further modification
return _inst;
