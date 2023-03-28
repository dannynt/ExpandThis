local DisplayManager = {}

local RemoteEvent = game.ReplicatedStorage:WaitForChild("NotificationHandler")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

function DisplayManager.new()
    local self = setmetatable({}, {__index = DisplayManager})
    self._status = ReplicatedStorage:WaitForChild("DisplayValues"):WaitForChild("Status")
    self._connections = {}
    return self
end

function DisplayManager:Notify(player, newStatus)
    RemoteEvent:FireClient(player, newStatus)
end

function DisplayManager:NotifyAllClients(newStatus)
    RemoteEvent:FireAllClients(newStatus)
end

return DisplayManager