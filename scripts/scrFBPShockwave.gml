/// scrFBPShockwave(x, y, travel_dist[optional], travel_dur[optional])

var _x = argument[0];
var _y = argument[1];
var _travel_dist = -1;
var _travel_dur = -1;

for(var i=-1; i<2; i += 2) {
    var _obj = instance_create(_x, _y, objAlexFBPShockwave);
    
    if(argument_count > 2) {
        _travel_dist = argument[2];
        _obj.travel_dist = _travel_dist;
    }
    if(argument_count > 3) {
        _travel_dur = argument[3];
        _obj.travel_dur = _travel_dur;
    }
    
    _obj.travel_dist *= i;
    _obj.image_xscale *= i;
}
