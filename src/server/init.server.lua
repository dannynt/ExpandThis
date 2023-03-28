local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Players = game:GetService("Players")

local myGame = require(ReplicatedStorage:WaitForChild("Game")).new()
local displayManager = require(ReplicatedStorage:WaitForChild("DisplayManager")).new()
local gameState = require(ReplicatedStorage:WaitForChild("StateManager")).new("GameLobbyState", myGame, displayManager)

Players.CharacterAutoLoads = false

local function onPlayerAdded(player)
    print(player.Name .. " connected")
    
    local function onCharacterAdded(character)
        print(player.Name .. " spawned")
        myGame.PlayersAlive = myGame.PlayersAlive + 1
        local humanoid = character:WaitForChild("Humanoid")
        wait(4)
        if (myGame.PlayersAlive >= 2) then
            gameState:EnterState("GameRunningState") 
        end

        local function onDied()
            player.RespawnLocation = nil
            myGame.PlayersAlive = myGame.PlayersAlive - 1
            if myGame.PlayersAlive == 0 then
                gameState:EnterState("GameEndedState")
            end
            print(player.Name, "has died")
        end

        humanoid.Died:Connect(onDied)
    end

    player.CharacterAdded:Connect(onCharacterAdded)
end

Players.PlayerAdded:Connect(onPlayerAdded)

while true do
    gameState._state:Update()
    wait(1)
end