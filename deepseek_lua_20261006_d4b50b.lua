--[[
    KuzaXY👑 Toolbox PC
    Delta Executor Script
    Tombol 👑 + Toolbox PC → Insert pulau ke Workspace
]]

local Players = game:GetService("Players")
local UIS = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")

local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

-- ===== DATA PULAU =====
local ISLANDS = {
    {
        id = "124432784834277",
        name = "Pulau",
        creator = "prasetiyo",
        emoji = "🏝️",
        size = Vector3.new(120, 12, 120),
        color = BrickColor.new("Bright green"),
        material = Enum.Material.Grass,
    },
}

-- ===== FOLDER UTAMA =====
local mainFolder = workspace:FindFirstChild("KuzaXY_Islands")
if not mainFolder then
    mainFolder = Instance.new("Folder")
    mainFolder.Name = "KuzaXY_Islands"
    mainFolder.Parent = workspace
end

-- Hapus GUI lama
local old = playerGui:FindFirstChild("KuzaXY_Toolbox")
if old then old:Destroy() end

-- ===== SCREEN GUI =====
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "KuzaXY_Toolbox"
screenGui.ResetOnSpawn = false
screenGui.IgnoreGuiInset = true
screenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
screenGui.Parent = playerGui

-- ===== TOMBOL 👑 =====
local btn = Instance.new("TextButton")
btn.Name = "KuzaBtn"
btn.Size = UDim2.new(0, 42, 0, 42)
btn.Position = UDim2.new(0, 60, 0, 60)
btn.BackgroundColor3 = Color3.fromRGB(12, 12, 12)
btn.BackgroundTransparency = 0.05
btn.BorderSizePixel = 0
btn.Text = "👑"
btn.TextSize = 20
btn.Font = Enum.Font.GothamBold
btn.TextColor3 = Color3.fromRGB(201, 169, 97)
btn.AutoButtonColor = false
btn.Parent = screenGui

local btnCorner = Instance.new("UICorner")
btnCorner.CornerRadius = UDim.new(0, 10)
btnCorner.Parent = btn

local btnStroke = Instance.new("UIStroke")
btnStroke.Color = Color3.fromRGB(201, 169, 97)
btnStroke.Thickness = 1
btnStroke.Transparency = 0.45
btnStroke.Parent = btn

btn.MouseEnter:Connect(function()
    btn.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
    btnStroke.Transparency = 0.1
end)
btn.MouseLeave:Connect(function()
    btn.BackgroundColor3 = Color3.fromRGB(12, 12, 12)
    btnStroke.Transparency = 0.45
end)

-- ===== TOOLBOX PANEL =====
local toolbox = Instance.new("Frame")
toolbox.Name = "Toolbox"
toolbox.Size = UDim2.new(0, 340, 0, 500)
toolbox.Position = UDim2.new(0, 115, 0, 60)
toolbox.BackgroundColor3 = Color3.fromRGB(10, 10, 10)
toolbox.BackgroundTransparency = 0.02
toolbox.BorderSizePixel = 0
toolbox.Visible = false
toolbox.Parent = screenGui

local tbCorner = Instance.new("UICorner")
tbCorner.CornerRadius = UDim.new(0, 10)
tbCorner.Parent = toolbox

local tbStroke = Instance.new("UIStroke")
tbStroke.Color = Color3.fromRGB(38, 38, 38)
tbStroke.Thickness = 1
tbStroke.Parent = toolbox

-- Header
local header = Instance.new("Frame")
header.Name = "Header"
header.Size = UDim2.new(1, 0, 0, 34)
header.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
header.BorderSizePixel = 0
header.Parent = toolbox

local hCorner = Instance.new("UICorner")
hCorner.CornerRadius = UDim.new(0, 10)
hCorner.Parent = header

local hFix = Instance.new("Frame")
hFix.Size = UDim2.new(1, 0, 0, 10)
hFix.Position = UDim2.new(0, 0, 1, -10)
hFix.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
hFix.BorderSizePixel = 0
hFix.Parent = header

-- Garis emas di bawah header
local hLine = Instance.new("Frame")
hLine.Size = UDim2.new(1, -24, 0, 1)
hLine.Position = UDim2.new(0, 12, 1, -1)
hLine.BackgroundColor3 = Color3.fromRGB(201, 169, 97)
hLine.BackgroundTransparency = 0.6
hLine.BorderSizePixel = 0
hLine.Parent = header

local hIcon = Instance.new("TextLabel")
hIcon.Size = UDim2.new(0, 20, 1, 0)
hIcon.Position = UDim2.new(0, 10, 0, 0)
hIcon.BackgroundTransparency = 1
hIcon.Text = "🛠️"
hIcon.TextSize = 13
hIcon.Parent = header

local hTitle = Instance.new("TextLabel")
hTitle.Size = UDim2.new(1, -80, 1, 0)
hTitle.Position = UDim2.new(0, 32, 0, 0)
hTitle.BackgroundTransparency = 1
hTitle.Text = "KuzaXY TOOLBOX"
hTitle.TextColor3 = Color3.fromRGB(232, 228, 220)
hTitle.TextSize = 11
hTitle.Font = Enum.Font.GothamBold
hTitle.TextXAlignment = Enum.TextXAlignment.Left
hTitle.Parent = header

local hClose = Instance.new("TextButton")
hClose.Size = UDim2.new(0, 22, 0, 22)
hClose.Position = UDim2.new(1, -32, 0.5, -11)
hClose.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
hClose.BorderSizePixel = 0
hClose.Text = "✕"
hClose.TextColor3 = Color3.fromRGB(168, 162, 154)
hClose.TextSize = 10
hClose.Font = Enum.Font.GothamBold
hClose.AutoButtonColor = false
hClose.Parent = header

local hcCorner = Instance.new("UICorner")
hcCorner.CornerRadius = UDim.new(0, 6)
hcCorner.Parent = hClose

-- Search bar
local searchFrame = Instance.new("Frame")
searchFrame.Size = UDim2.new(1, -24, 0, 32)
searchFrame.Position = UDim2.new(0, 12, 0, 44)
searchFrame.BackgroundColor3 = Color3.fromRGB(10, 10, 10)
searchFrame.BorderSizePixel = 0
searchFrame.Parent = toolbox

local sfCorner = Instance.new("UICorner")
sfCorner.CornerRadius = UDim.new(0, 7)
sfCorner.Parent = searchFrame

local sfStroke = Instance.new("UIStroke")
sfStroke.Color = Color3.fromRGB(38, 38, 38)
sfStroke.Thickness = 1
sfStroke.Parent = searchFrame

local searchBox = Instance.new("TextBox")
searchBox.Size = UDim2.new(1, -70, 1, 0)
searchBox.Position = UDim2.new(0, 12, 0, 0)
searchBox.BackgroundTransparency = 1
searchBox.Text = ""
searchBox.PlaceholderText = "Cari pulau..."
searchBox.PlaceholderColor3 = Color3.fromRGB(106, 101, 93)
searchBox.TextColor3 = Color3.fromRGB(232, 228, 220)
searchBox.TextSize = 12
searchBox.Font = Enum.Font.Gotham
searchBox.TextXAlignment = Enum.TextXAlignment.Left
searchBox.ClearTextOnFocus = false
searchBox.Parent = searchFrame

local goBtn = Instance.new("TextButton")
goBtn.Size = UDim2.new(0, 50, 1, -8)
goBtn.Position = UDim2.new(1, -56, 0, 4)
goBtn.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
goBtn.BorderSizePixel = 0
goBtn.Text = "GO"
goBtn.TextColor3 = Color3.fromRGB(201, 169, 97)
goBtn.TextSize = 10
goBtn.Font = Enum.Font.GothamBold
goBtn.AutoButtonColor = false
goBtn.Parent = searchFrame

local gbCorner = Instance.new("UICorner")
gbCorner.CornerRadius = UDim.new(0, 6)
gbCorner.Parent = goBtn

local gbStroke = Instance.new("UIStroke")
gbStroke.Color = Color3.fromRGB(201, 169, 97)
gbStroke.Thickness = 1
gbStroke.Transparency = 0.6
gbStroke.Parent = goBtn

-- Tabs
local tabsFrame = Instance.new("Frame")
tabsFrame.Size = UDim2.new(1, -24, 0, 28)
tabsFrame.Position = UDim2.new(0, 12, 0, 84)
tabsFrame.BackgroundTransparency = 1
tabsFrame.Parent = toolbox

local tabList = {"PULAU", "DECAL", "AUDIO"}
local tabX = 0
local tabBtns = {}
for i, tname in ipairs(tabList) do
    local tbtn = Instance.new("TextButton")
    tbtn.Size = UDim2.new(0, 70, 1, 0)
    tbtn.Position = UDim2.new(0, tabX, 0, 0)
    tbtn.BackgroundColor3 = (i == 1) and Color3.fromRGB(10, 10, 10) or Color3.fromRGB(15, 15, 15)
    tbtn.BorderSizePixel = 0
    tbtn.Text = tname
    tbtn.TextColor3 = (i == 1) and Color3.fromRGB(201, 169, 97) or Color3.fromRGB(106, 101, 93)
    tbtn.TextSize = 9
    tbtn.Font = Enum.Font.GothamBold
    tbtn.AutoButtonColor = false
    tbtn.Parent = tabsFrame

    local tc = Instance.new("UICorner")
    tc.CornerRadius = UDim.new(0, 6)
    tc.Parent = tbtn

    table.insert(tabBtns, tbtn)
    tabX = tabX + 74
end

-- Count info
local countLabel = Instance.new("TextLabel")
countLabel.Size = UDim2.new(1, -24, 0, 18)
countLabel.Position = UDim2.new(0, 12, 0, 118)
countLabel.BackgroundTransparency = 1
countLabel.Text = "0 — 1 HASIL"
countLabel.TextColor3 = Color3.fromRGB(106, 101, 93)
countLabel.TextSize = 9
countLabel.Font = Enum.Font.Gotham
countLabel.TextXAlignment = Enum.TextXAlignment.Left
countLabel.Parent = toolbox

-- Scroll list
local scroll = Instance.new("ScrollingFrame")
scroll.Size = UDim2.new(1, -24, 0, 200)
scroll.Position = UDim2.new(0, 12, 0, 140)
scroll.BackgroundTransparency = 1
scroll.BorderSizePixel = 0
scroll.ScrollBarThickness = 4
scroll.ScrollBarImageColor3 = Color3.fromRGB(201, 169, 97)
scroll.CanvasSize = UDim2.new(0, 0, 0, 0)
scroll.Parent = toolbox

local listLayout = Instance.new("UIListLayout")
listLayout.Padding = UDim.new(0, 6)
listLayout.SortOrder = Enum.SortOrder.LayoutOrder
listLayout.Parent = scroll

-- Output area
local output = Instance.new("Frame")
output.Size = UDim2.new(1, -24, 0, 85)
output.Position = UDim2.new(0, 12, 1, -97)
output.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
output.BorderSizePixel = 0
output.Parent = toolbox

local outCorner = Instance.new("UICorner")
outCorner.CornerRadius = UDim.new(0, 7)
outCorner.Parent = output

local outTitle = Instance.new("TextLabel")
outTitle.Size = UDim2.new(1, -20, 0, 16)
outTitle.Position = UDim2.new(0, 10, 0, 6)
outTitle.BackgroundTransparency = 1
outTitle.Text = "OUTPUT"
outTitle.TextColor3 = Color3.fromRGB(201, 169, 97)
outTitle.TextSize = 9
outTitle.Font = Enum.Font.GothamBold
outTitle.TextXAlignment = Enum.TextXAlignment.Left
outTitle.Parent = output

local outLine = Instance.new("Frame")
outLine.Size = UDim2.new(1, -20, 0, 1)
outLine.Position = UDim2.new(0, 10, 0, 22)
outLine.BackgroundColor3 = Color3.fromRGB(38, 38, 38)
outLine.BorderSizePixel = 0
outLine.Parent = output

local outText = Instance.new("TextLabel")
outText.Size = UDim2.new(1, -20, 1, -30)
outText.Position = UDim2.new(0, 10, 0, 26)
outText.BackgroundTransparency = 1
outText.Text = "✓ Status Toolbox : Siap"
outText.TextColor3 = Color3.fromRGB(184, 150, 90)
outText.TextSize = 9
outText.Font = Enum.Font.Code
outText.TextXAlignment = Enum.TextXAlignment.Left
outText.TextYAlignment = Enum.TextYAlignment.Top
outText.TextWrapped = true
outText.Parent = output

-- ===== FUNGSI SPAWN ISLAND =====
local function spawnIsland(data)
    -- Cek kalau udah ada, hapus dulu
    local existing = mainFolder:FindFirstChild("Island_" .. data.id)
    if existing then existing:Destroy() end

    local folder = Instance.new("Folder")
    folder.Name = "Island_" .. data.id
    folder.Parent = mainFolder

    folder:SetAttribute("ID", data.id)
    folder:SetAttribute("Name", data.name)
    folder:SetAttribute("Creator", data.creator)

    -- Posisi spawn
    local char = player.Character
    local basePos = Vector3.new(0, 50, 0)
    if char and char:FindFirstChild("HumanoidRootPart") then
        basePos = char.HumanoidRootPart.Position
            + char.HumanoidRootPart.CFrame.LookVector * 50
            + Vector3.new(0, 30, 0)
    end

    -- Base pulau
    local base = Instance.new("Part")
    base.Name = "Base"
    base.Size = data.size
    base.Position = basePos
    base.Anchored = true
    base.BrickColor = data.color
    base.Material = data.material
    base.TopSurface = Enum.SurfaceType.Smooth
    base.BottomSurface = Enum.SurfaceType.Smooth
    base.Parent = folder

    -- Billboard label
    local billboard = Instance.new("BillboardGui")
    billboard.Size = UDim2.new(0, 260, 0, 60)
    billboard.StudsOffset = Vector3.new(0, data.size.Y / 2 + 6, 0)
    billboard.AlwaysOnTop = true
    billboard.Parent = base

    local nameTxt = Instance.new("TextLabel")
    nameTxt.Size = UDim2.new(1, 0, 0.55, 0)
    nameTxt.BackgroundTransparency = 1
    nameTxt.Text = data.emoji .. " " .. data.name
    nameTxt.TextColor3 = Color3.fromRGB(255, 255, 255)
    nameTxt.TextStrokeTransparency = 0
    nameTxt.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
    nameTxt.TextSize = 18
    nameTxt.Font = Enum.Font.GothamBold
    nameTxt.Parent = billboard

    local idTxt = Instance.new("TextLabel")
    idTxt.Size = UDim2.new(1, 0, 0.45, 0)
    idTxt.Position = UDim2.new(0, 0, 0.55, 0)
    idTxt.BackgroundTransparency = 1
    idTxt.Text = "ID: " .. data.id .. "  •  by " .. data.creator
    idTxt.TextColor3 = Color3.fromRGB(201, 169, 97)
    idTxt.TextStrokeTransparency = 0
    idTxt.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
    idTxt.TextSize = 12
    idTxt.Font = Enum.Font.Gotham
    idTxt.Parent = billboard

    -- Efek spawn
    base.Position = basePos - Vector3.new(0, 40, 0)
    base.Transparency = 1
    TweenService:Create(base, TweenInfo.new(0.8, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
        Position = basePos,
        Transparency = 0,
    }):Play()

    local light = Instance.new("PointLight")
    light.Color = Color3.fromRGB(201, 169, 97)
    light.Range = 40
    light.Brightness = 3
    light.Parent = base

    TweenService:Create(light, TweenInfo.new(1.5), {Brightness = 0}):Play()
    task.delay(1.5, function() if light then light:Destroy() end end)

    print("[KuzaXY👑] Spawned: " .. data.name .. " (ID: " .. data.id .. ") by " .. data.creator)
end

-- ===== FUNGSI BUAT CARD =====
local function createCard(data)
    local card = Instance.new("TextButton")
    card.Name = data.name
    card.Size = UDim2.new(1, -6, 0, 62)
    card.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
    card.BorderSizePixel = 0
    card.Text = ""
    card.AutoButtonColor = false
    card.Parent = scroll

    local cc = Instance.new("UICorner")
    cc.CornerRadius = UDim.new(0, 8)
    cc.Parent = card

    local cs = Instance.new("UIStroke")
    cs.Color = Color3.fromRGB(31, 31, 31)
    cs.Thickness = 1
    cs.Parent = card

    -- Icon box
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
    ibe.Text = data.emoji
    ibe.TextSize = 22
    ibe.Font = Enum.Font.GothamBold
    ibe.Parent = iconBox

    -- Nama
    local nameLbl = Instance.new("TextLabel")
    nameLbl.Size = UDim2.new(1, -120, 0, 14)
    nameLbl.Position = UDim2.new(0, 60, 0, 12)
    nameLbl.BackgroundTransparency = 1
    nameLbl.Text = data.name
    nameLbl.TextColor3 = Color3.fromRGB(232, 228, 220)
    nameLbl.TextSize = 11
    nameLbl.Font = Enum.Font.GothamBold
    nameLbl.TextXAlignment = Enum.TextXAlignment.Left
    nameLbl.Parent = card

    -- by
    local byLbl = Instance.new("TextLabel")
    byLbl.Size = UDim2.new(1, -120, 0, 12)
    byLbl.Position = UDim2.new(0, 60, 0, 28)
    byLbl.BackgroundTransparency = 1
    byLbl.Text = "by: " .. data.creator
    byLbl.TextColor3 = Color3.fromRGB(106, 101, 93)
    byLbl.TextSize = 9
    byLbl.Font = Enum.Font.Gotham
    byLbl.TextXAlignment = Enum.TextXAlignment.Left
    byLbl.Parent = card

    -- ID
    local idLbl = Instance.new("TextLabel")
    idLbl.Size = UDim2.new(1, -120, 0, 12)
    idLbl.Position = UDim2.new(0, 60, 0, 42)
    idLbl.BackgroundTransparency = 1
    idLbl.Text = "ID: " .. data.id
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

    -- Hover card
    card.MouseEnter:Connect(function()
        TweenService:Create(card, TweenInfo.new(0.15), {
            BackgroundColor3 = Color3.fromRGB(20, 20, 20)
        }):Play()
        TweenService:Create(cs, TweenInfo.new(0.15), {
            Color = Color3.fromRGB(201, 169, 97)
        }):Play()
    end)
    card.MouseLeave:Connect(function()
        TweenService:Create(card, TweenInfo.new(0.15), {
            BackgroundColor3 = Color3.fromRGB(15, 15, 15)
        }):Play()
        TweenService:Create(cs, TweenInfo.new(0.15), {
            Color = Color3.fromRGB(31, 31, 31)
        }):Play()
    end)

    -- Hover insert btn
    insBtn.MouseEnter:Connect(function()
        insBtn.BackgroundColor3 = Color3.fromRGB(30, 28, 20)
        ibs2.Transparency = 0.1
    end)
    insBtn.MouseLeave:Connect(function()
        insBtn.BackgroundColor3 = Color3.fromRGB(10, 10, 10)
        ibs2.Transparency = 0.6
    end)

    -- Klik insert
    insBtn.MouseButton1Click:Connect(function()
        spawnIsland(data)
        outText.Text = "✓ Inserted: " .. data.name .. "\n✓ Folder: KuzaXY_Islands > Island_" .. data.id
    end)

    return card
end

-- ===== BUILD CARDS =====
for _, data in ipairs(ISLANDS) do
    createCard(data)
end

-- Update canvas
listLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
    scroll.CanvasSize = UDim2.new(0, 0, 0, listLayout.AbsoluteContentSize.Y + 10)
end)

-- ===== TOGGLE TOOLBOX =====
local isOpen = false
btn.MouseButton1Click:Connect(function()
    isOpen = not isOpen
    toolbox.Visible = isOpen
end)

hClose.MouseButton1Click:Connect(function()
    isOpen = false
    toolbox.Visible = false
end)

-- ===== SEARCH =====
local function doSearch()
    local q = string.lower(searchBox.Text)
    local count = 0
    for _, child in pairs(scroll:GetChildren()) do
        if child:IsA("TextButton") then
            local match = q == "" or string.find(string.lower(child.Name), q)
            child.Visible = match
            if match then count = count + 1 end
        end
    end
    countLabel.Text = "0 — " .. count .. " HASIL"
    outText.Text = "✓ Pencarian: \"" .. q .. "\" — " .. count .. " hasil"
end

goBtn.MouseButton1Click:Connect(doSearch)
searchBox:GetPropertyChangedSignal("Text"):Connect(doSearch)

-- ===== DRAG TOOLBOX =====
local dragging = false
local dragStart, startPos

header.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1
    or input.UserInputType == Enum.UserInputType.Touch then
        if hClose:IsDescendantOf(header) then return end
        dragging = true
        dragStart = input.Position
        startPos = toolbox.Position
    end
end)

header.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1
    or input.UserInputType == Enum.UserInputType.Touch then
        dragging = false
    end
end)

UIS.InputChanged:Connect(function(input)
    if dragging and (input.UserInputType == Enum.UserInputType.MouseMovement
    or input.UserInputType == Enum.UserInputType.Touch) then
        local delta = input.Position - dragStart
        toolbox.Position = UDim2.new(
            startPos.X.Scale,
            startPos.X.Offset + delta.X,
            startPos.Y.Scale,
            startPos.Y.Offset + delta.Y
        )
    end
end)

print("[KuzaXY👑] Toolbox loaded. Klik 👑 untuk buka.")
print("[KuzaXY👑] Island ready: Pulau (ID: 124432784834277) by prasetiyo")