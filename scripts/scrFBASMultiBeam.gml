/// scrFBASMultiBeam(x, y, beam_amnt, beam_pad, is_vertical, size[optional], angle[optional], angle_incr[optional], tell_dur[optional], fire_dur[optional], travel_dist_x[optional], travel_dist_y[optional)

var _x = argument[0];
var _y = argument[1];
var _beam_amnt = argument[2];
var _beam_pad = argument[3];
var _is_vertical = argument[4];
var _size = -1;
var _angle = -1;
var _angle_incr = -1;
var _tell_dur = -1;
var _fire_dur = -1;
var _travel_dist_x = -1;
var _travel_dist_y = -1;


var _loop_x = _x;
var _loop_y = _y;

if(_beam_amnt > 1) {
    if(_is_vertical)
        _loop_y -= (_beam_amnt / 2) * _beam_pad;
    else
        _loop_x -= (_beam_amnt / 2) * _beam_pad;
}

for(var i = 0; i < _beam_amnt; i++) {

    var _obj = instance_create(_loop_x, _loop_y, objAlexFBPBeam);
    
    if(_is_vertical)
        _loop_y += _beam_pad;
    else
        _loop_x += _beam_pad;
    
    if(argument_count > 5) {
        _size = argument[5];
        _obj.size = _size;
        
        _obj.image_yscale = _size / sprite_get_height(sprAlexFBPBeamHitbox);
    }
    if(argument_count > 6) {
        _angle = argument[6];
        _obj.image_angle = _angle;
    }
    if(argument_count > 7) {
        _angle_incr = argument[7];
        _obj.angle_incr = _angle_incr;
    }
    if(argument_count > 8) {
        _tell_dur = argument[8];
        _obj.tell_dur = _tell_dur;
    }
    if(argument_count > 9) {
        _fire_dur = argument[9];
        _obj.fire_dur = _fire_dur;
    }
    if(argument_count > 10) {
        _travel_dist_x = argument[10];
        _obj.travel_dist_x = _travel_dist_x;
    }
    if(argument_count > 11) {
        _travel_dist_y = argument[11];
        _obj.travel_dist_y = _travel_dist_y;
    }
}
