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

local function expand()
    size += growthRate;
    local tweenInfo = TweenInfo.new(growTime, Enum.EasingStyle.Quad)
    local sizeTween = TweenService:Create(expander, tweenInfo, {Size = Vector3.new(size, size, size)})
    sizeTween:Play()
end

while expanding do
    expand()
    wait(growTime * growWaitTimeFactor)
end