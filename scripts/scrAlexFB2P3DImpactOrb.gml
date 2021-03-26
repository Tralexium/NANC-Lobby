///scrAlexFB2P3DImpactOrb(x, y, zspeed, projectile_count)

var _x = argument[0];
var _y = argument[1];
var _zspeed = argument[2];
var _projectile_count = argument[3];


var _inst = instance_create(_x, _y, objAlexFB2P3DImpactOrb);
    _inst.zspeed = _zspeed;
    _inst.projectile_count = _projectile_count;
    

// Return projectile for further modification
return _inst;
