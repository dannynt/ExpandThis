local GameLobbyState = {}

function GameLobbyState.new(displayManager)
    local self = setmetatable({}, {__index = GameLobbyState})
    self._displayManager = displayManager;
    return self
end


function GameLobbyState:Enter()
end

function GameLobbyState:Exit()
end

function GameLobbyState:Update()
end

return GameLobbyState