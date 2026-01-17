-- 🧠 BRAINROT AUTO TP - DELTA PC SIMPLE 🧠
local Players = game:GetService("Players")
local player = Players.LocalPlayer
local basePosition = Vector3.new(0, 10, 0)

-- Supprime ancien GUI
pcall(function()
    player.PlayerGui:FindFirstChild("SimpleAutoTP"):Destroy()
end)

-- GUI Ultra Simple pour Delta PC
local gui = Instance.new("ScreenGui")
gui.Name = "SimpleAutoTP"
gui.Parent = player.PlayerGui

local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 150, 0, 50)
frame.Position = UDim2.new(0, 50, 0, 50)
frame.BackgroundColor3 = Color3.new(0.2, 0.2, 0.3)
frame.BorderColor3 = Color3.new(1, 1, 1)
frame.BorderSizePixel = 2
frame.Active = true
frame.Draggable = true
frame.Parent = gui

-- Titre simple
local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, 0, 0, 20)
title.Position = UDim2.new(0, 0, 0, 0)
title.BackgroundColor3 = Color3.new(1, 0.4, 1)
title.Text = "BRAINROT AUTO TP"
title.TextColor3 = Color3.new(1, 1, 1)
title.TextSize = 12
title.Font = Enum.Font.SourceSansBold
title.Parent = frame

-- Bouton Save simple
local saveBtn = Instance.new("TextButton")
saveBtn.Size = UDim2.new(0.6, 0, 0, 25)
saveBtn.Position = UDim2.new(0.02, 0, 0, 22)
saveBtn.BackgroundColor3 = Color3.new(0, 0.8, 0)
saveBtn.Text = "SAVE BASE"
saveBtn.TextColor3 = Color3.new(1, 1, 1)
saveBtn.TextSize = 10
saveBtn.Font = Enum.Font.SourceSans
saveBtn.Parent = frame

-- Status simple
local status = Instance.new("TextLabel")
status.Size = UDim2.new(0.35, 0, 0, 25)
status.Position = UDim2.new(0.63, 0, 0, 22)
status.BackgroundColor3 = Color3.new(0, 0.6, 0)
status.Text = "READY"
status.TextColor3 = Color3.new(1, 1, 1)
status.TextSize = 10
status.Font = Enum.Font.SourceSans
status.Parent = frame

-- Fonction TP
local function autoTP()
    local char = player.Character
    if char and char:FindFirstChild("HumanoidRootPart") then
        char.HumanoidRootPart.CFrame = CFrame.new(basePosition)
        status.Text = "TP!"
        status.BackgroundColor3 = Color3.new(1, 0, 1)
        wait(1)
        status.Text = "READY"
        status.BackgroundColor3 = Color3.new(0, 0.6, 0)
    end
end

-- Save position
saveBtn.MouseButton1Click:Connect(function()
    local char = player.Character
    if char and char:FindFirstChild("HumanoidRootPart") then
        basePosition = char.HumanoidRootPart.Position
        saveBtn.Text = "SAVED!"
        saveBtn.BackgroundColor3 = Color3.new(0, 1, 0)
        wait(1)
        saveBtn.Text = "SAVE BASE"
        saveBtn.BackgroundColor3 = Color3.new(0, 0.8, 0)
        print("Base position saved: " .. tostring(basePosition))
    end
end)

-- Auto TP quand tu ramasses
player.Backpack.ChildAdded:Connect(function(child)
    if child:IsA("Tool") then
        autoTP()
    end
end)

if player.Character then
    player.Character.ChildAdded:Connect(function(child)
        if child:IsA("Tool") then
            autoTP()
        end
    end)
end

player.CharacterAdded:Connect(function(char)
    char.ChildAdded:Connect(function(child)
        if child:IsA("Tool") then
            autoTP()
        end
    end)
end)

print("BRAINROT AUTO TP LOADED!")
