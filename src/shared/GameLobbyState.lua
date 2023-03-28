local GameLobbyState = {}

function GameLobbyState.new(displayManager, game)
    local self = setmetatable({}, {__index = GameLobbyState})
    self._displayManager = displayManager
    self._game = game
    self._points = ""
    return self
end

function GameLobbyState:Enter()
end

function GameLobbyState:Exit()
end

function GameLobbyState:Update()
    self._displayManager:NotifyAllClients("Waiting for players" .. self._points)
    self._points = self._points .. "."
    if self._points == "...." then
        self._points = ""
    end
end

return GameLobbyState