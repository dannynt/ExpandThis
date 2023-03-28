print("Starting server")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Match = require(ReplicatedStorage:WaitForChild("Match")).new()

Match:Start()