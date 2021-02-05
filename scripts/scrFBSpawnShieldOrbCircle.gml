///scrFBSpawnShieldOrbCircle(x, y, orb_amnt, radius, initial_spd, target_spd)

var _x = argument[0];
var _y = argument[1];
var _orb_amnt = argument[2];
var _radius = argument[3];
var _initial_spd = argument[4];
var _target_spd = argument[5];

var _obj = instance_create(_x, _y, objAlexFinalBossShieldOrbCircle);
    _obj.shield_orb_amnt = _orb_amnt;
    _obj.rad_target = _radius;
    _obj.initial_spd = _initial_spd;
    _obj.target_spd = _target_spd;


// Return for further modification
return _obj;
