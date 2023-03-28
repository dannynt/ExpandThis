local DisplayManager = {}

local RemoteEvent = game.ReplicatedStorage:WaitForChild("NotificationHandler")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

function DisplayManager.new()
    local self = setmetatable({}, {__index = DisplayManager})
    self._status = ReplicatedStorage:WaitForChild("DisplayValues"):WaitForChild("Status")
    self._connections = {}
    return self
end

function DisplayManager:Notify(player, permanentText, notificationText)
    RemoteEvent:FireClient(player, permanentText, notificationText)
end

function DisplayManager:NotifyAllClients(permanentText, notificationText)
    RemoteEvent:FireAllClients(permanentText, notificationText)
end

return DisplayManager