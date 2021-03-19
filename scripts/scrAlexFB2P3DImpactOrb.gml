///scrAlexFB2P3DImpactOrb(x, y, travel_dur, projectile_count)

var _x = argument[0];
var _y = argument[1];
var _travel_dur = argument[2];
var _projectile_count = argument[3];


var _inst = instance_create(_x, _y, objAlexFB2P3DImpactOrb);
    _inst.travel_dur = _travel_dur;
    _inst.projectile_count = _projectile_count;
    

// Return projectile for further modification
return _inst;
