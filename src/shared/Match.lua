local Match = {}

local ReplicatedStorage = game:GetService("ReplicatedStorage")

function Match.new()
    local self = setmetatable({}, {__index = Match})
    self._active = false
    self._time = 0
    self._expander = require(ReplicatedStorage:WaitForChild("Expander")).new(15, 15, 5, 1.5)
    self._spawner = require(ReplicatedStorage:WaitForChild("Spawner")).new(2)
    self._spawnerCoroutine = coroutine.create(function()
        self._spawner:Start()
    end)
    self._expanderCoroutine = coroutine.create(function()
        self._expander:StartExpandLoop()
    end)

    return self
end

function Match:Start()
    self._active = true
    self._time = 0
    coroutine.resume(self._spawnerCoroutine)
    coroutine.resume(self._expanderCoroutine)
end

function Match:End()
    self._active = false
    coroutine.yield(self._spawnerCoroutine)
    coroutine.yield(self._expanderCoroutine)
    self._expander:Reset()
    self._spawner:Stop()
end

return Match