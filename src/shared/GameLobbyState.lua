local GameLobbyState = {}

function GameLobbyState.new(displayManager, game)
    local self = setmetatable({}, {__index = GameLobbyState})
    self._displayManager = displayManager
    self._game = game
    return self
end

function GameLobbyState:Enter()
    self._game.Time = 0
end

function GameLobbyState:Exit()
end

function GameLobbyState:Update()
    self._game.Time = self._game.Time + 1
    self._displayManager:UpdateStatus("Time survived: " .. self._game.Time)
end

return GameLobbyState