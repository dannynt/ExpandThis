local GameLobbyState = {}

function GameLobbyState.new(displayManager, game)
    local self = setmetatable({}, {__index = GameLobbyState})
    self._displayManager = displayManager
    self._game = game
    return self
end

function GameLobbyState:Enter()
    print("Entered GameLobbyState")
end

function GameLobbyState:Exit()
end

function GameLobbyState:Update()
end



return GameLobbyState