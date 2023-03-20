local TweenService = game:GetService("TweenService")

local grounds = game.Workspace.Grounds:GetChildren()

local function BulletCloning()
    local randomGroundIdx = math.random(1, #grounds)
    local bullet = game.Workspace.Bullets.Bullet
    
    local clone = bullet:Clone()
    clone.Parent = game.Workspace
    clone.Position = grounds[randomGroundIdx].Position
end

while true do
    BulletCloning()
    wait(8)
end