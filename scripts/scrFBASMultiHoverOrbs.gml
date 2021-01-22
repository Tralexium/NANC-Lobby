/// scrFBASMultiHoverOrbs(x, y, amount, pad, strip_amnt, min_hover_time, time_increment)

var _x = argument[0];
var _y = argument[1];
var _amount = argument[2];
var _pad = argument[3]
var _strip_amnt = argument[4]
var _min_hover_time = argument[5];
var _time_increment = argument[6];

var _hover_time = _min_hover_time;
var _start_x = _x - ((_amount - 1) * _pad) / 2;
var _strip_x_sep = 0;
var _strip_pad = _pad * _strip_amnt;

for(var i=0; i<_strip_amnt; i++) {
    for(var j=0; j<floor(_amount / _strip_amnt); j++) {
        var _obj = instance_create(x, y, objAlexFBPHoverBeamOrb);
            _obj.target_x = _start_x + (j * _strip_pad);
            _obj.time_until_fall = _hover_time;
            
        _hover_time += _time_increment;
    }
    
    _strip_x_sep += _pad
    _start_x = (_x - ((_amount - 1) * _pad) / 2) + _strip_x_sep;
}
