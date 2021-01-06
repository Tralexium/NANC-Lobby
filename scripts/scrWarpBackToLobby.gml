///scrWarpBackToLobby

// TP to the last location in the lobby
if(!instance_exists(objPlayer) && (global.lobbyLastX != -1 && global.lobbyLastY != -1))
    instance_create(0, 0, objPlayer)
    
with(objPlayer) {
    x = global.lobbyLastX;
    y = global.lobbyLastY;
}

if(global.lobbyLastFloor != -1)
    room_goto(global.lobbyLastFloor);
else
    room_goto(rLobbyReception);
