/// scrFBPCane(x, y, target_player, fade_in, shot_spd[optional], spin_length[optional], stuck_length[optional], spawn_spd[optional], spawn_dir[optional], lock_in_place[optional])

var _x = argument[0];
var _y = argument[1];
var _target_player = argument[2];
var _fade_in = argument[3];
var _shot_spd = -1;
var _spin_length = -1;
var _stuck_length = -1;
var _spawn_spd = -1;
var _spawn_dir = -1;
var _lock_in_place = -1;

var _obj = instance_create(_x, _y, objAlexFBPOrb);
    _obj.target_player = _target_player;
    _obj.fade_in = _fade_in;

if(argument_count > 4) {
    _shot_spd = argument[4];
    _obj.shot_spd = _shot_spd;
}
if(argument_count > 5) {
    _spin_length = argument[5];
    _obj.spin_length = _spin_length;
}
if(argument_count > 6) {
    _stuck_length = argument[6];
    _obj.stuck_length = _stuck_length;
}
if(argument_count > 7) {
    _spawn_spd = argument[7];
    _obj.spawn_spd = _spawn_spd;
}
if(argument_count > 8) {
    _spawn_dir = argument[8];
    _obj.spawn_dir = _spawn_dir;
}
if(argument_count > 9) {
    _lock_in_place = argument[9];
    _obj.lock_in_place = _lock_in_place;
}

// In case you want to further modify it
return _obj;
