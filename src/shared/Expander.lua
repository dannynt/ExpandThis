local Expander = {}

local _tweenService = game:GetService("TweenService")

function Expander.new(growthStrenght, decreaseStrength, sizeChangeTime, sizeChangeTimeFactor)
    local self = setmetatable({}, {__index = Expander})
    self._expander = game.Workspace.Expander
    self._growthStrength = growthStrenght
    self._decreaseStrength = decreaseStrength
    self._sizeChangeTime = sizeChangeTime
    self._sizeChangeTimeFactor = sizeChangeTimeFactor
    self._targetSize = 0
    self._expander.Size = Vector3.new(0, 0, 0)
    self._active = true
    self._tweenInfo = nil
    self._sizeTween = nil

    self._expander.Touched:Connect(function(other)
        if other.Parent:FindFirstChild("Humanoid") then
            self:_killPlayer(other.Parent:FindFirstChild("Humanoid"))
            self:Reset()
        end
        if other.Name == "Bullet" then
            local explosion = Instance.new("Explosion")
            explosion.Position = other.Position
            explosion.Parent = game.Workspace
            other:Destroy()
            self:Decrease(self._decreaseStrength)
        end
    end)

    return self
end

function Expander:UpdateSize()
    if self._sizeTween ~= nil then
        self._sizeTween:Cancel()
    end
    self._tweenInfo = TweenInfo.new(self._sizeChangeTime, Enum.EasingStyle.Quad)
    self._sizeTween = _tweenService:Create(self._expander, self._tweenInfo, {Size = Vector3.new(self._targetSize, self._targetSize, self._targetSize)})
    self._sizeTween:Play()
end

function Expander:Expand(sizeChange)
    -- print("Expand")
    self._targetSize = self._targetSize + sizeChange
    self:UpdateSize()
end

function Expander:Decrease(sizeChange)
    -- print("Decrease")
    self._active = false
    self._targetSize = self._targetSize - sizeChange
    self:UpdateSize()
    wait(self._sizeChangeTime * self._sizeChangeTimeFactor)
    self._active = true
    self:StartExpandLoop()
end

function Expander:Reset()
    self._targetSize = 0
    self._expander.Size = Vector3.new(0, 0, 0)
    if self._sizeTween ~= nil then
        self._sizeTween:Cancel()
    end
end

function Expander:_killPlayer(player)
    local humanoid = player.Parent:FindFirstChild("Humanoid")
    humanoid.Health = 0
    print(humanoid.Parent.Name .. " killed")
end

function Expander:StartExpandLoop()
    -- print("Start expand loop")
    while self._active do
        self:Expand(self._growthStrength)
        wait(self._sizeChangeTime * self._sizeChangeTimeFactor)
    end
end

return Expander