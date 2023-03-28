local GameEndedState = {}

function GameEndedState.new(displayManager, game)
    local self = setmetatable({}, {__index = GameEndedState})
    self._displayManager = displayManager
    self._game = game
    return self
end

function GameEndedState:Enter()
    self._displayManager:NotifyAllClients("Game over!", "It is over")
    self._game:End()
end

function GameEndedState:Exit()
end

function GameEndedState:Update()
    self._displayManager:NotifyAllClients("Game over!", "")
end


return GameEndedState