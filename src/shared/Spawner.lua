local Spawner = {}

function Spawner.new(coolDownTime)
    local self = setmetatable({}, {__index = Spawner})
    self._coolDownTime = coolDownTime
    self._active = false
    self._spawnPoints = game.Workspace.SpawnPoints:GetChildren()
    return self
end

function Spawner:Clone()
    local randomGroundIdx = math.random(1, #self._spawnPoints)
    local bullet = game.ReplicatedStorage.Assets.Bullet
    local clone = bullet:Clone()
    clone.Parent = game.Workspace
    clone.Position = self._spawnPoints[randomGroundIdx].Position
end

function Spawner:Start()
    self._active = true
    while self._active do
        self:Clone()
        wait(self._coolDownTime)
    end
end

function Spawner:Stop()
    self._active = false
end

return Spawner