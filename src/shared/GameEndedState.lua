local GameEndedState = {}

function GameEndedState.new(displayManager, game)
    local self = setmetatable({}, {__index = GameEndedState})
    self._displayManager = displayManager
    self._game = game
    return self
end

function GameEndedState:Enter()
    -- TODO: Save player's score.
end

function GameEndedState:Exit()
end

function GameEndedState:Update()
end

return GameEndedState