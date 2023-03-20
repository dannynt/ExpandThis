local TweenService = game:GetService("TweenService")
local expander = game.Workspace.Expander
local growthStrength = 15
local decreaseStrength = 15
local sizeChangeTime = 5
local sizeChangeTimeFactor = 1.5
local targetSize = 0
local tweenInfo
local sizeTween
local active

local function initialize()
    expander.Size = Vector3.zero
    active = true
end

local function updateSize()
    if sizeTween ~= nil 
    then 
        sizeTween:Cancel() 
    end
    tweenInfo = TweenInfo.new(sizeChangeTime, Enum.EasingStyle.Quad)
    sizeTween = TweenService:Create(expander, tweenInfo, {Size = Vector3.new(targetSize, targetSize, targetSize)})
    sizeTween:Play()
end

local function expand(sizeChange)
    print("Expand")
    targetSize += sizeChange;
    updateSize()
end

local function startExpandLoop()
    while active do
        expand(growthStrength)
        wait(sizeChangeTime * sizeChangeTimeFactor) 
    end
end

local function decrease(sizeChange)
    print("Decrease")
    active = false
    targetSize -= sizeChange
    updateSize();
    wait(sizeChangeTime * sizeChangeTimeFactor)
    active = true
    startExpandLoop()
end

local function reset()
    targetSize = 0
    expander.Size = Vector3.zero
    sizeTween:Cancel()
end

local function killPlayer(player)
    local humanoid = player.Parent:FindFirstChild("Humanoid")
    humanoid.Health = 0
    print(humanoid.Parent.Name .. " killed")
end

expander.Touched:Connect(function(other)
    if other.Parent:FindFirstChild("Humanoid") then
        killPlayer(other.Parent:FindFirstChild("Humanoid"))
        reset()
    end

    if other.Name == "Bullet" then
        other:Destroy()
        decrease(decreaseStrength)
    end
end)

initialize()
startExpandLoop()