local StateManager = {}
local ReplicatedStorage = game:GetService("ReplicatedStorage")

function StateManager.new(state, newGame, displayManager)
    local self = setmetatable({}, {__index = StateManager})
    self._state = require(ReplicatedStorage:WaitForChild(state)).new(displayManager, newGame)
    self._game = newGame
    self._displayManager = displayManager
    return self
end

function StateManager:EnterState(state)
    if (self.state ~= nil) then self._state:Exit() end
    self._state = require(ReplicatedStorage:WaitForChild(state)).new(self._displayManager, self._game)
    self._state:Enter()
end

return StateManager