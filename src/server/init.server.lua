print("Starting server")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Expander = require(ReplicatedStorage:WaitForChild("Expander")).new(15, 15, 5, 1.5)
local Spawner = require(ReplicatedStorage:WaitForChild("Spawner")).new(2)

local spawnerCoroutine = coroutine.create(function()
    Spawner:Start()
end)

local expanderCoroutine = coroutine.create(function()
    Expander:StartExpandLoop()
end)

coroutine.resume(spawnerCoroutine)
coroutine.resume(expanderCoroutine)