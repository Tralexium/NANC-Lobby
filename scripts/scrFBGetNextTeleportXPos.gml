///scrFBGetNextTeleportXPos()
// Only use within the final boss object!

var _next_x_pos = clamp(objPlayer.x + (dist_from_player * side_from_player), dist_from_room_edges, room_width - dist_from_room_edges);
return _next_x_pos;
