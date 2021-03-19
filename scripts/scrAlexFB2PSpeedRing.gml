///scrAlexFB2PSpeedRing(x, y, orb_amnt, shrink_length, spin_dir, projectile_amnt)

var _x = argument[0];
var _y = argument[1];
var _orb_amnt = argument[2];
var _shrink_length = argument[3];
var _spin_dir = argument[4];
var _projectile_amnt = argument[5];


var _inst = instance_create(_x, _y, objAlexFB2PSpeedRing);
    _inst.orb_amnt = _orb_amnt;
    _inst.shrink_length = _shrink_length;
    _inst.spin_dir = _spin_dir;
    _inst.projectile_count = _projectile_amnt;
    

// Return projectile for further modification
return _inst;
