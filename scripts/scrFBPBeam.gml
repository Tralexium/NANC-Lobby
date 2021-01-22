/// scrFBPBeam(x, y, size[optional], angle[optional], angle_incr[optional], tell_dur[optional], fire_dur[optional], travel_dist_x[optional], travel_dist_y[optional)

var _x = argument[0];
var _y = argument[1];
var _size = -1;
var _angle = -1;
var _angle_incr = -1;
var _tell_dur = -1;
var _fire_dur = -1;
var _travel_dist_x = -1;
var _travel_dist_y = -1;

var _obj = instance_create(_x, _y, objAlexFBPBeam);

if(argument_count > 2) {
    _size = argument[2];
    _obj.size = _size;
}
if(argument_count > 3) {
    _angle = argument[3];
    _obj.image_angle = _angle;
}
if(argument_count > 4) {
    _angle_incr = argument[4];
    _obj.angle_incr = _angle_incr;
}
if(argument_count > 5) {
    _tell_dur = argument[5];
    _obj.tell_dur = _tell_dur;
}
if(argument_count > 6) {
    _fire_dur = argument[6];
    _obj.fire_dur = _fire_dur;
}
if(argument_count > 7) {
    _travel_dist_x = argument[7];
    _obj.travel_dist_x = _travel_dist_x;
}
if(argument_count > 8) {
    _travel_dist_y = argument[8];
    _obj.travel_dist_y = _travel_dist_y;
}

// In case you want to further modify it
return _obj;
