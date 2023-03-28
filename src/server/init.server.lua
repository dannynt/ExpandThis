-- 15 15 5 1.5
print("Starting server")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Expander = require(ReplicatedStorage:WaitForChild("Expander")).new()
print(Expander)
Expander:StartExpandLoop()