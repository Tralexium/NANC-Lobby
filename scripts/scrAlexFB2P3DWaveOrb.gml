///scrAlexFB2P3DWaveOrb(x, y, dir, spd)

var _x = argument[0];
var _y = argument[1];
var _dir = argument[3];
var _spd = argument[4];


var _inst = instance_create(_x, _y, objAlexFB2P3DWaveOrb);
    _inst.direction = _dir;
    _inst.speed = _spd;
    

// Return projectile for further modification
return _inst;
