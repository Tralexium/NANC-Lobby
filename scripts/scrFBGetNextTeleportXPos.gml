///scrFBGetNextTeleportXPos()
// Only use within the final boss object!

var _next_x_pos = clamp(objPlayer.x + (dist_from_player * side_from_player), dist_from_room_edges, room_width - dist_from_room_edges);
if(abs(_next_x_pos - x) < 128 || 
   (objPlayer.x < dist_from_player && _next_x_pos < dist_from_player) || 
   (objPlayer.x > room_width - dist_from_player && _next_x_pos > room_width - dist_from_player)) {
        side_from_player *= -1;
        _next_x_pos = clamp(objPlayer.x + (dist_from_player * side_from_player), dist_from_room_edges, room_width - dist_from_room_edges);
}
return _next_x_pos;
