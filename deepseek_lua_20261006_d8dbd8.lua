--[[
    KuzaXY👑 Island Loader
    Load model beneran dari Asset ID
]]

local Players = game:GetService("Players")
local UIS = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local InsertService = game:GetService("InsertService")

local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

-- ===== DATA PULAU =====
local ISLANDS = {
    {
        assetId = 124432784834277,
        name = "Pulau Apung",
        creator = "prasetiyo",
        emoji = "🏝️",
    },
}

-- Hapus GUI lama
local old = playerGui:FindFirstChild("KuzaXY_Toolbox")
if old then old:Destroy() end

-- ===== SCREEN GUI =====
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "KuzaXY_Toolbox"
screenGui.ResetOnSpawn = false
screenGui.IgnoreGuiInset = true
screenGui.Parent = playerGui

-- ===== TOMBOL 👑 =====
local btn = Instance.new("TextButton")
btn.Size = UDim2.new(0, 42, 0, 42)
btn.Position = UDim2.new(0, 60, 0, 60)
btn.BackgroundColor3 = Color3.fromRGB(12, 12, 12)
btn.BorderSizePixel = 0
btn.Text = "👑"
btn.TextSize = 20
btn.Font = Enum.Font.GothamBold
btn.TextColor3 = Color3.fromRGB(201, 169, 97)
btn.AutoButtonColor = false
btn.Parent = screenGui

local bc = Instance.new("UICorner")
bc.CornerRadius = UDim.new(0, 10)
bc.Parent = btn

local bs = Instance.new("UIStroke")
bs.Color = Color3.fromRGB(201, 169, 97)
bs.Thickness = 1
bs.Transparency = 0.45
bs.Parent = btn

-- Hover
btn.MouseEnter:Connect(function()
    btn.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
    bs.Transparency = 0.1
end)
btn.MouseLeave:Connect(function()
    btn.BackgroundColor3 = Color3.fromRGB(12, 12, 12)
    bs.Transparency = 0.45
end)

-- ===== PANEL =====
local panel = Instance.new("Frame")
panel.Size = UDim2.new(0, 300, 0, 160)
panel.Position = UDim2.new(0, 115, 0, 60)
panel.BackgroundColor3 = Color3.fromRGB(10, 10, 10)
panel.BorderSizePixel = 0
panel.Visible = false
panel.Parent = screenGui

local pc = Instance.new("UICorner")
pc.CornerRadius = UDim.new(0, 10)
pc.Parent = panel

local ps = Instance.new("UIStroke")
ps.Color = Color3.fromRGB(38, 38, 38)
ps.Thickness = 1
ps.Parent = panel

-- Header
local hdr = Instance.new("Frame")
hdr.Size = UDim2.new(1, 0, 0, 34)
hdr.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
hdr.BorderSizePixel = 0
hdr.Parent = panel

local hc = Instance.new("UICorner")
hc.CornerRadius = UDim.new(0, 10)
hc.Parent = hdr

-- Garis emas
local hLine = Instance.new("Frame")
hLine.Size = UDim2.new(1, -24, 0, 1)
hLine.Position = UDim2.new(0, 12, 1, -1)
hLine.BackgroundColor3 = Color3.fromRGB(201, 169, 97)
hLine.BackgroundTransparency = 0.6
hLine.BorderSizePixel = 0
hLine.Parent = hdr

local ht = Instance.new("TextLabel")
ht.Size = UDim2.new(1, -50, 1, 0)
ht.Position = UDim2.new(0, 32, 0, 0)
ht.BackgroundTransparency = 1
ht.Text = "KuzaXY ISLANDS"
ht.TextColor3 = Color3.fromRGB(201, 169, 97)
ht.TextSize = 11
ht.Font = Enum.Font.GothamBold
ht.TextXAlignment = Enum.TextXAlignment.Left
ht.Parent = hdr

local hIcon = Instance.new("TextLabel")
hIcon.Size = UDim2.new(0, 20, 1, 0)
hIcon.Position = UDim2.new(0, 10, 0, 0)
hIcon.BackgroundTransparency = 1
hIcon.Text = "🛠️"
hIcon.TextSize = 12
hIcon.Parent = hdr

local hClose = Instance.new("TextButton")
hClose.Size = UDim2.new(0, 22, 0, 22)
hClose.Position = UDim2.new(1, -30, 0.5, -11)
hClose.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
hClose.BorderSizePixel = 0
hClose.Text = "✕"
hClose.TextColor3 = Color3.fromRGB(168, 162, 154)
hClose.TextSize = 10
hClose.Font = Enum.Font.GothamBold
hClose.AutoButtonColor = false
hClose.Parent = hdr

local hcc = Instance.new("UICorner")
hcc.CornerRadius = UDim.new(0, 6)
hcc.Parent = hClose

-- Card
local card = Instance.new("TextButton")
card.Size = UDim2.new(1, -20, 0, 60)
card.Position = UDim2.new(0, 10, 0, 46)
card.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
card.BorderSizePixel = 0
card.Text = ""
card.AutoButtonColor = false
card.Parent = panel

local cc = Instance.new("UICorner")
cc.CornerRadius = UDim.new(0, 8)
cc.Parent = card

local cs = Instance.new("UIStroke")
cs.Color = Color3.fromRGB(31, 31, 31)
cs.Thickness = 1
cs.Parent = card

-- Icon
local iconBox = Instance.new("Frame")
iconBox.Size = UDim2.new(0, 44, 0, 44)
iconBox.Position = UDim2.new(0, 8, 0.5, -22)
iconBox.BackgroundColor3 = Color3.fromRGB(10, 10, 10)
iconBox.BorderSizePixel = 0
iconBox.Parent = card

local ibc = Instance.new("UICorner")
ibc.CornerRadius = UDim.new(0, 8)
ibc.Parent = iconBox

local ibs = Instance.new("UIStroke")
ibs.Color = Color3.fromRGB(38, 38, 38)
ibs.Thickness = 1
ibs.Parent = iconBox

local ibg = Instance.new("UIGradient")
ibg.Rotation = 90
ibg.Color = ColorSequence.new({
    ColorSequenceKeypoint.new(0, Color3.fromRGB(80, 160, 220)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(40, 100, 60)),
})
ibg.Parent = iconBox

local ibe = Instance.new("TextLabel")
ibe.Size = UDim2.new(1, 0, 1, 0)
ibe.BackgroundTransparency = 1
ibe.Text = "🏝️"
ibe.TextSize = 22
ibe.Parent = iconBox

-- Nama
local nLbl = Instance.new("TextLabel")
nLbl.Size = UDim2.new(1, -130, 0, 16)
nLbl.Position = UDim2.new(0, 60, 0, 12)
nLbl.BackgroundTransparency = 1
nLbl.Text = "Pulau Apung"
nLbl.TextColor3 = Color3.fromRGB(232, 228, 220)
nLbl.TextSize = 11
nLbl.Font = Enum.Font.GothamBold
nLbl.TextXAlignment = Enum.TextXAlignment.Left
nLbl.Parent = card

local byLbl = Instance.new("TextLabel")
byLbl.Size = UDim2.new(1, -130, 0, 12)
byLbl.Position = UDim2.new(0, 60, 0, 30)
byLbl.BackgroundTransparency = 1
byLbl.Text = "by: prasetiyo"
byLbl.TextColor3 = Color3.fromRGB(106, 101, 93)
byLbl.TextSize = 9
byLbl.Font = Enum.Font.Gotham
byLbl.TextXAlignment = Enum.TextXAlignment.Left
byLbl.Parent = card

local idLbl = Instance.new("TextLabel")
idLbl.Size = UDim2.new(1, -130, 0, 12)
idLbl.Position = UDim2.new(0, 60, 0, 42)
idLbl.BackgroundTransparency = 1
idLbl.Text = "ID: 124432784834277"
idLbl.TextColor3 = Color3.fromRGB(201, 169, 97)
idLbl.TextSize = 9
idLbl.Font = Enum.Font.Code
idLbl.TextXAlignment = Enum.TextXAlignment.Left
idLbl.Parent = card

-- Insert button
local insBtn = Instance.new("TextButton")
insBtn.Size = UDim2.new(0, 60, 0, 30)
insBtn.Position = UDim2.new(1, -68, 0.5, -15)
insBtn.BackgroundColor3 = Color3.fromRGB(10, 10, 10)
insBtn.BorderSizePixel = 0
insBtn.Text = "INSERT"
insBtn.TextColor3 = Color3.fromRGB(201, 169, 97)
insBtn.TextSize = 9
insBtn.Font = Enum.Font.GothamBold
insBtn.AutoButtonColor = false
insBtn.Parent = card

local ibc2 = Instance.new("UICorner")
ibc2.CornerRadius = UDim.new(0, 7)
ibc2.Parent = insBtn

local ibs2 = Instance.new("UIStroke")
ibs2.Color = Color3.fromRGB(201, 169, 97)
ibs2.Thickness = 1
ibs2.Transparency = 0.6
ibs2.Parent = insBtn

-- Output
local outLbl = Instance.new("TextLabel")
outLbl.Size = UDim2.new(1, -20, 0, 40)
outLbl.Position = UDim2.new(0, 10, 1, -50)
outLbl.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
outLbl.BorderSizePixel = 0
outLbl.Text = "✓ Status : Siap"
outLbl.TextColor3 = Color3.fromRGB(184, 150, 90)
outLbl.TextSize = 9
outLbl.Font = Enum.Font.Code
outLbl.TextXAlignment = Enum.TextXAlignment.Left
outLbl.TextYAlignment = Enum.TextYAlignment.Top
outLbl.Parent = panel

local olc = Instance.new("UICorner")
olc.CornerRadius = UDim.new(0, 6)
olc.Parent = outLbl

local olp = Instance.new("UIPadding")
olp.PaddingLeft = UDim.new(0, 8)
olp.PaddingTop = UDim.new(0, 4)
olp.Parent = outLbl

-- ===== FUNGSI LOAD =====
local function loadIsland(data)
    outLbl.Text = "⏳ Loading..."
    print("[KuzaXY👑] Loading asset:", data.assetId)

    local success, result = pcall(function()
        return InsertService:LoadAsset(data.assetId)
    end)

    if not success or not result then
        outLbl.Text = "❌ Gagal load\n" .. tostring(result)
        warn("[KuzaXY👑] Gagal:", result)
        return
    end

    -- Ambil model dari result
    local model = result
    local children = result:GetChildren()
    if #children > 0 then
        model = children[1]
    end

    -- Pindah ke Workspace
    model.Parent = workspace
    model.Name = data.name

    -- Posisi
    local char = player.Character
    local basePos = Vector3.new(0, 50, 0)
    if char and char:FindFirstChild("HumanoidRootPart") then
        basePos = char.HumanoidRootPart.Position
            + char.HumanoidRootPart.CFrame.LookVector * 40
            + Vector3.new(0, 15, 0)
    end

    -- Pindah model
    if model:IsA("Model") then
        if model.PrimaryPart then
            model:PivotTo(CFrame.new(basePos))
        else
            model:MoveTo(basePos)
        end
    elseif model:IsA("BasePart") then
        model.Position = basePos
    end

    outLbl.Text = "✓ " .. data.name .. " spawned!"
    print("[KuzaXY👑] Berhasil load:", data.name)

    task.wait(1.5)
    panel.Visible = false
end

-- Klik insert
insBtn.MouseButton1Click:Connect(function()
    loadIsland(ISLANDS[1])
end)

-- Hover insert
insBtn.MouseEnter:Connect(function()
    insBtn.BackgroundColor3 = Color3.fromRGB(30, 28, 20)
    ibs2.Transparency = 0.1
end)
insBtn.MouseLeave:Connect(function()
    insBtn.BackgroundColor3 = Color3.fromRGB(10, 10, 10)
    ibs2.Transparency = 0.6
end)

-- Hover card
card.MouseEnter:Connect(function()
    card.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
    cs.Color = Color3.fromRGB(201, 169, 97)
end)
card.MouseLeave:Connect(function()
    card.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
    cs.Color = Color3.fromRGB(31, 31, 31)
end)

-- ===== TOGGLE PANEL =====
local isOpen = false
btn.MouseButton1Click:Connect(function()
    isOpen = not isOpen
    panel.Visible = isOpen
end)

hClose.MouseButton1Click:Connect(function()
    isOpen = false
    panel.Visible = false
end)

print("[KuzaXY👑] Ready. Klik 👑 buat buka panel.")