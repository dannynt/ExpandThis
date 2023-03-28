local GameRunningState = {}

function GameRunningState.new(displayManager, game)
    local self = setmetatable({}, {__index = GameRunningState})
    self._displayManager = displayManager
    self._game = game
    return self
end

function GameRunningState:Enter()
    self._game.Time = 0
    self._game:Start()
end

function GameRunningState:Exit()
    self._game:End()
end

function GameRunningState:Update()
    self._game.Time = self._game.Time + 1
    self._displayManager:NotifyAllClients("Time survived: " .. self._secondsToMinutesAndSeconds(self._game.Time), "")
end

function GameRunningState._secondsToMinutesAndSeconds(seconds)
    local minutes = math.floor(seconds / 60)
    local secondsRemainder = seconds % 60
    return string.format("%02d:%02d", minutes, secondsRemainder)
  end

return GameRunningState