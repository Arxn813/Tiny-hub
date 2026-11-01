
-- TINY HUB
-- Roblox Lua GUI
-- Interface starter

local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")

local player = Players.LocalPlayer

local gui = Instance.new("ScreenGui")
gui.Name = "TinyHub"
gui.ResetOnSpawn = false
gui.Parent = player:WaitForChild("PlayerGui")

local main = Instance.new("Frame")
main.Size = UDim2.fromOffset(440, 340)
main.Position = UDim2.new(0.5, -220, 0.5, -170)
main.BackgroundColor3 = Color3.fromRGB(18, 18, 28)
main.BorderSizePixel = 0
main.Active = true
main.Draggable = true
main.Parent = gui

local corner = Instance.new("UICorner")
corner.CornerRadius = UDim.new(0, 12)
corner.Parent = main

local stroke = Instance.new("UIStroke")
stroke.Color = Color3.fromRGB(125, 75, 255)
stroke.Thickness = 2
stroke.Parent = main

local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, 0, 0, 48)
title.BackgroundColor3 = Color3.fromRGB(30, 22, 48)
title.Text = "TINY HUB  |  TNB"
title.TextColor3 = Color3.fromRGB(190, 150, 255)
title.TextSize = 22
title.Font = Enum.Font.GothamBold
title.Parent = main

local function createButton(name, y, callback)
    local button = Instance.new("TextButton")
    button.Size = UDim2.fromOffset(390, 36)
    button.Position = UDim2.fromOffset(25, y)
    button.BackgroundColor3 = Color3.fromRGB(42, 32, 65)
    button.TextColor3 = Color3.fromRGB(255, 255, 255)
    button.TextSize = 14
    button.Font = Enum.Font.GothamSemibold
    button.Text = name .. ": OFF"
    button.Parent = main

    local c = Instance.new("UICorner")
    c.CornerRadius = UDim.new(0, 7)
    c.Parent = button

    local enabled = false

    button.MouseButton1Click:Connect(function()
        enabled = not enabled
        button.Text = name .. (enabled and ": ON" or ": OFF")
        button.BackgroundColor3 = enabled
            and Color3.fromRGB(105, 65, 190)
            or Color3.fromRGB(42, 32, 65)

        callback(enabled)
    end)
end

createButton("Fly", 65, function(state) end)
createButton("Vehicle Fly", 110, function(state) end)
createButton("Instant Prompt", 155, function(state) end)
createButton("ESP", 200, function(state) end)
createButton("Invisibility", 245, function(state) end)

local close = Instance.new("TextButton")
close.Size = UDim2.fromOffset(30, 30)
close.Position = UDim2.new(1, -38, 0, 9)
close.BackgroundColor3 = Color3.fromRGB(170, 55, 75)
close.Text = "X"
close.TextColor3 = Color3.new(1, 1, 1)
close.Font = Enum.Font.GothamBold
close.Parent = main

close.MouseButton1Click:Connect(function()
    gui:Destroy()
end)
