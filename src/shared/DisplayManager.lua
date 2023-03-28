local DisplayManager = {}

function DisplayManager.new()
    local self = setmetatable({}, {__index = DisplayManager})
    self._remoteEvent = game.ReplicatedStorage:WaitForChild("NotificationHandler")
    return self
end

function DisplayManager:Notify(player, permanentText, notificationText)
    self._remoteEvent:FireClient(player, permanentText, notificationText)
end

function DisplayManager:NotifyAllClients(permanentText, notificationText)
    self._remoteEvent:FireAllClients(permanentText, notificationText)
end

return DisplayManager