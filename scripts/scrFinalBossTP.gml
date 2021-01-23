/// scrFinalBossTP(tele_x, tele_y, new_sprite_index)
// Only used in the final boss!

var _tele_x = argument[0];
var _tele_y = argument[1];
var _sprite = argument[2];

var _travel_dist = distance_to_point(_tele_x, _tele_y);
var _trail_gap_dist = 32;
var _part_amnt = floor(_travel_dist / _trail_gap_dist);
var _trail_x_gap = (_tele_x - x) / _part_amnt;
var _trail_y_gap = (_tele_y - y) / _part_amnt;
var _trail_x = x;
var _trail_y = y;
var _trail_life = 10;
var _trail_start_col = $7752ff;
var _trail_fin_col = $8e2e73;

for(var i=0; i < _part_amnt; i++) {
    scrAlexMakeParticleExt(_trail_x, _trail_y, _trail_life, _sprite, 0, 0, image_angle, 0, 0, 0, _trail_start_col, _trail_fin_col, bm_add, false, true, 0, depth+1, false);
    _trail_x += _trail_x_gap;
    _trail_y += _trail_y_gap;
}

x = _tele_x;
y = _tele_y;
sprite_index = _sprite;
image_index = 0;
