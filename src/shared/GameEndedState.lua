local GameEndedState = {}

function GameEndedState.new(displayManager)
    local self = setmetatable({}, {__index = GameEndedState})
    self._displayManager = displayManager;
    return self
end

function GameEndedState:Enter()
end

function GameEndedState:Exit()
end

function GameEndedState:Update()
end

return GameEndedState