local DisplayManager = {}

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local displayValues = ReplicatedStorage:WaitForChild("DisplayValues")

function DisplayManager.new()
    local self = setmetatable({}, {__index = DisplayManager})
    self._status = displayValues:WaitForChild("Status")
    return self
end

function DisplayManager:UpdateStatus(newStatus)
    self._status.Value = newStatus
 end

function DisplayManager:ObserveClientGUI(playerGui)
    local function updateText()
        playerGui.StatusText.Text = self._status.Value
    end

    self._status.Changed:Connect(updateText)
end


return DisplayManager