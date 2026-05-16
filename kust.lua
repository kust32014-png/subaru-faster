local Player = game:GetService("Players").LocalPlayer
local RunService = game:GetService("RunService")

workspace.FallenPartsDestroyHeight = -math.huge
workspace.Gravity = 196.2

RunService.Heartbeat:Connect(function()
    local char = Player.Character
    if not char then return end

    local humanoid = char:FindFirstChildOfClass("Humanoid")
    if not humanoid then return end

    humanoid:SetStateEnabled(Enum.HumanoidStateType.Dead, false)
    humanoid:SetStateEnabled(Enum.HumanoidStateType.FallingDown, false)
    humanoid.BreakJointsOnDeath = false
end)

local originalY
RunService.Heartbeat:Connect(function()
    local char = Player.Character
    if not char then
        originalY = nil
        return
    end
    local root = char:FindFirstChild("HumanoidRootPart")
    if not root then return end

    if not originalY then
        originalY = root.Position.Y
    elseif root.Position.Y < originalY - 50000 then
        root.CFrame = CFrame.new(root.Position.X, originalY, root.Position.Z)
    end
end)

game:GetService("StarterGui"):SetCore("SendNotification", {
    Title = "Вторая жизнь",
    Text = "Продал Душу",
    Duration = 5
})
