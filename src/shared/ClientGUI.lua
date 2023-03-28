local ClientGUI = {}
local _targetRotation = -2

game.ReplicatedStorage.NotificationHandler.OnClientEvent:Connect((function(text, text2)
    local _textLabel = game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui"):WaitForChild("ScreenGui").StatusText
    --local Clone = _textLabel:Clone()
    --Clone.Text = text
    --Clone.Parent = _textLabel.Parent
    --wait(5)
    --Clone:Destroy()
    _textLabel.Text = text;

    local tweenInfo = TweenInfo.new(2)
    local tween = game:GetService("TweenService"):Create(_textLabel, tweenInfo, {Rotation = _targetRotation})
    _targetRotation = _targetRotation * -1

    tween:Play()
    
    if (text2 == "") then return end
    game:GetService("StarterGui"):SetCore("SendNotification", 
    { 
        Title = "[!]";
        Text = text2;
        Icon = "",
        Duration = 4
    }) 
end))

return ClientGUI