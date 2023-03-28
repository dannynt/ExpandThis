local GameRunningState = {}

function GameRunningState.new(displayManager, game)
    local self = setmetatable({}, {__index = GameRunningState})
    self._displayManager = displayManager
    self._game = game
    return self
end

function GameRunningState:Enter()
end

function GameRunningState:Exit()
end

function GameRunningState:Update()
end

return GameRunningState