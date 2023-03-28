local ReplicatedStorage = game:GetService("ReplicatedStorage")
local ServerStorage = game:GetService("ServerStorage")
local Players = game:GetService("Players")

local Match = require(ReplicatedStorage:WaitForChild("Match")).new()
-- local roundManager = require(moduleScripts:WaitForChild("RoundManager"))
-- local gameSettings = require(moduleScripts:WaitForChild("GameSettings"))
local displayManager = require(ReplicatedStorage:WaitForChild("DisplayManager")).new()

local gameState = require(ReplicatedStorage:WaitForChild("GameLobbyState")).new(displayManager)

Players.PlayerAdded:Connect(function(player)
    print("Player " .. player.Name .. " has joined the game!")
    local playerGui = player:WaitForChild("PlayerGui"):WaitForChild("ScreenGui")
    displayManager:ObserveClientGUI(playerGui)
    print(Players)
end)

while true do
    gameState:Update()
    displayManager:UpdateStatus("Time: " .. seconds)
    wait(1)
end

-- Match:Start()