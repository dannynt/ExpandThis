local ReplicatedStorage = game:GetService("ReplicatedStorage")
local ServerStorage = game:GetService("ServerStorage")
local Players = game:GetService("Players")

local myGame = require(ReplicatedStorage:WaitForChild("Game")).new()
-- local roundManager = require(moduleScripts:WaitForChild("RoundManager"))
-- local gameSettings = require(moduleScripts:WaitForChild("GameSettings"))
local displayManager = require(ReplicatedStorage:WaitForChild("DisplayManager")).new()
local gameState = require(ReplicatedStorage:WaitForChild("StateManager")).new("GameLobbyState", myGame, displayManager)

Players.PlayerAdded:Connect(function(player)
    print("Player " .. player.Name .. " has joined the game!")
    local playerGui = player:WaitForChild("PlayerGui"):WaitForChild("ScreenGui")
    displayManager:ObserveClientGUI(playerGui)
end)

while true do
    gameState._state:Update()
    wait(1)
end