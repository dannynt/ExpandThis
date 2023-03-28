local ClientGUI = {}

local TextLabel = game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui"):WaitForChild("ScreenGui").StatusText

game.ReplicatedStorage.NotificationHandler.OnClientEvent:Connect((function(text)
    local Clone = TextLabel:Clone()
    Clone.Text = text
    Clone.Parent = TextLabel.Parent
    wait(5)
    Clone:Destroy()
end))

return ClientGUI