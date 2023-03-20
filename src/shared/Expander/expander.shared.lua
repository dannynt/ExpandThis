local TweenService = game:GetService("TweenService")
local expander = game.Workspace.Expander
-- local tweenInfo = TweenInfo.new(50, Enum.EasingStyle.Linear)
--local sizeTween = TweenService:Create(expander, tweenInfo, {Size = Vector3.new(100, 100, 100)})
--sizeTween:Play()

expander.Size = Vector3.zero
 
local growthRate = 15
local growTime = 5
local growWaitTimeFactor = 1.5
local size = 0
local expanding = true
local tweenInfo
local sizeTween

local function expand()
    size += growthRate;
    tweenInfo = TweenInfo.new(growTime, Enum.EasingStyle.Quad)
    sizeTween = TweenService:Create(expander, tweenInfo, {Size = Vector3.new(size, size, size)})
    sizeTween:Play()
end

local function reset()
    size = 0
    expander.Size = Vector3.zero
    sizeTween:Cancel()
end

local function killPlayer(player)
    local humanoid = player.Parent:FindFirstChild("Humanoid")
    humanoid.Health = 0
    print(humanoid.Parent.Name .. " killed by expander")
end

expander.Touched:Connect(function(other)
    print(other.Name .. " touched me.")
    if other.Parent:FindFirstChild("Humanoid") then
        killPlayer(other.Parent:FindFirstChild("Humanoid"))
        reset()
    end
    if other.Name == "Bullet" then
        size = size - 5
        sizeTween.Cancel()
        sizeTween = TweenService:Create(expander, tweenInfo, {Size = Vector3.new(size, size, size)})
        sizeTween:Play()
        expanding = false
        wait(growTime * growWaitTimeFactor)
        expanding = true
    end
end)

while expanding do
    expand()
    wait(growTime * growWaitTimeFactor)
end