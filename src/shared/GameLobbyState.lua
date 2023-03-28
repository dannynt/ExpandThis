local GameLobbyState = {}

function GameLobbyState.new(displayManager, match)
    local self = setmetatable({}, {__index = GameLobbyState})
    self._displayManager = displayManager
    self._match = match
    return self
end

function GameLobbyState:Enter()

end

function GameLobbyState:Exit()
end

function GameLobbyState:Update()
end

return GameLobbyState