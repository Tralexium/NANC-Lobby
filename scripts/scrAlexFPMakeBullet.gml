///scrAlexFPMakeBullet(damage, zspeed, speed, direction)

var _dmg = argument[0];
var _zspd = argument[1];
var _spd = argument[2];
var _dir = argument[3];

var _inst = instance_create(x, y, objAlexFlyingPlayerBullet);
    _inst.damage = _dmg;
    _inst.zspeed = _zspd;
    _inst.actual_spd = _spd;
    _inst.direction = _dir;
    
// return obj
return _inst;
