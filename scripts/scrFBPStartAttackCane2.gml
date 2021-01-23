/// scrFBPStartAttackCane2(x, y, target_x, target_y, spin_dur, attack_type);

var _x = argument[0];
var _y = argument[1];
var _target_x = argument[2];
var _target_y = argument[3];
var _spin_dur = argument[4];
var _attack_type = argument[5];

var _obj = instance_create(_x, _y, objAlexFBPStartAttackCane2);
    _obj.attack_type = _attack_type;
    _obj.spin_dur = _spin_dur;
    _obj.target_x = _target_x;
    _obj.target_y = _target_y;
    

return _obj;
