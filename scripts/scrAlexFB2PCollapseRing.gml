///scrAlexFB2PCollapseRing(x, y, orb_amnt, spin_dir)

var _x = argument[0];
var _y = argument[1];
var _orb_amnt = argument[2];
var _spin_dir = argument[3];


var _inst = instance_create(_x, _y, objAlexFB2PCollapseRing);
    _inst.orb_amnt = _orb_amnt;
    _inst.spin_dir = _spin_dir;
    

// Return projectile for further modification
return _inst;
