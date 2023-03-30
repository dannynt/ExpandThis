local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Players = game:GetService("Players")

local myGame = require(ReplicatedStorage:WaitForChild("Game")).new()
local displayManager = require(ReplicatedStorage:WaitForChild("DisplayManager")).new()
local gameState = require(ReplicatedStorage:WaitForChild("StateManager")).new("GameLobbyState", myGame, displayManager)

--local DataStoreService = game:GetService("DataStoreService")
--local pointsStore = DataStoreService:GetOrderedDataStore("Points")

local function onPlayerAdded(player)
    print(player.Name .. " connected")

    local function onCharacterAdded(character)
        print(player.Name .. " spawned")
        myGame.PlayersAlive = myGame.PlayersAlive + 1
        local humanoid = character:WaitForChild("Humanoid")
        wait(10)
        if (myGame.PlayersAlive >= 2) then
            gameState:EnterState("GameRunningState")
        end

        local function onDied()
            myGame.PlayersAlive = myGame.PlayersAlive - 1
            --pointsStore:SetAsync(player.Name, myGame.Time)
            -- if all players are dead then the game ends
            if myGame.PlayersAlive == 0 then
                gameState:EnterState("GameEndedState")
            end

            print(player.Name, "has died")
            player:LoadCharacter()
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