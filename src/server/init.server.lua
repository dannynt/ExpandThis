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
    local connection = displayManager:ObserveClientGUI(playerGui)

    if player.Character and player.Character:FindFirstChild("Humanoid") then
        local humanoid = player.Character.Humanoid

        humanoid.Died:Connect(function()
            print(player.Name .. " has died!")
            connection:Disconnect()
        end)
    end
end)

-- Handle when players respwan events

while true do
    gameState._state:Update()
    wait(1)
end