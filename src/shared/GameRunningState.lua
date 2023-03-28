local GameRunningState = {}

function GameRunningState.new(displayManager)
    local self = setmetatable({}, {__index = GameRunningState})
    self._displayManager = displayManager;
    return self
end

function GameRunningState:Enter()
end

function GameRunningState:Exit()
end

function GameRunningState:Update()
end

return GameRunningState