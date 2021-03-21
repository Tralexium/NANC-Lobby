///scrAlexFPMakeBullet(damage, travel_dur, speed, direction)

var _dmg = argument[0];
var _travel_dur = argument[1];
var _spd = argument[2];
var _dir = argument[3];

var _inst = instance_create(x, y, objAlexFlyingPlayerBullet);
    _inst.damage = _dmg;
    _inst.travel_dur = _travel_dur;
    _inst.actual_spd = _spd;
    _inst.direction = _dir;
    
// return obj
return _inst;
