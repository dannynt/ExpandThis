local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Players = game:GetService("Players")

local myGame = require(ReplicatedStorage:WaitForChild("Game")).new()
local displayManager = require(ReplicatedStorage:WaitForChild("DisplayManager")).new()
local gameState = require(ReplicatedStorage:WaitForChild("StateManager")).new("GameLobbyState", myGame, displayManager)

local function onPlayerAdded(player)
    local function onCharacterAdded(character)
        print(player.Name .. " spawned")
        local humanoid = character:WaitForChild("Humanoid")

        local function onDied()
            print(player.Name, "has died")
        end

        humanoid.Died:Connect(onDied)
    end

    player.CharacterAdded:Connect(onCharacterAdded)
end

Players.PlayerAdded:Connect(onPlayerAdded)
gameState._state:Enter("GameLobbyState")


while true do
    gameState._state:Update()
    wait(1)
end