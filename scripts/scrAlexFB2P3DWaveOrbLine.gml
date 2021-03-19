///scrAlexFB2P3DWaveOrbLine(x, y, dir, spd, amnt, sep, t_sep)

var _x = argument[0];
var _y = argument[1];
var _dir = argument[2];
var _spd = argument[3];
var _amnt = argument[4];
var _sep = argument[5];
var _t_sep = argument[6];


var _xx, _yy, _len;
for(var i=0; i<_amnt; i++) {
    _len = (i - (_amnt/2)) * _sep + _sep/2;
    _xx = _x + lengthdir_x(_len, _dir+90);
    _yy = _y + lengthdir_y(_len, _dir+90);

    var _inst = instance_create(_xx, _yy, objAlexFB2P3DWaveOrb);
        _inst.direction = _dir;
        _inst.speed = _spd;
        _inst.t = _t_sep * i;
    
}
    

// Return projectile for further modification
return _inst;
