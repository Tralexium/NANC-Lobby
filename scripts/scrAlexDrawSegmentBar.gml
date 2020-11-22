///scrAlexDrawSegmentBar(x, y, sep, total_segment_amnt, active_segment_amnt, active_segment_sprite, inactive_segment_sprite)

var _x = argument[0];
var _y = argument[1];
var _sep = argument[2];
var _total = argument[3];
var _active = argument[4];
var _active_sprite = argument[5];
var _inactive_sprite = argument[6];

for(var i=0; i<_total; i++) {
    var _draw_x = _x + (i * _sep);
    
    if(_active > 0) {
        draw_sprite(_active_sprite, 0, _draw_x, _y);
        _active--;
    } else {
        draw_sprite(_inactive_sprite, 0, _draw_x, _y);
    }
}
