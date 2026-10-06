--[[
    KuzaXY👑 Island Loader FULL
    Banner ASCII + Toolbox + 2 Pulau
]]

-- ===== BANNER ASCII =====
print([[
 _  __ _   _ ______ _     __   __
| |/ /| | | |__  / / \   \ \ / /
| ' / | | | | / / / _ \   \ V / 
| . \ | |_| |/ /_/ ___ \   | |  
|_|\_\ \___//____/_/   \_\  |_|  
                                 
    👑  K U Z A X Y  👑
    Island Loader System
    SYSTEM ONLINE
]])

-- ===== SERVICE =====
local Players = game:GetService("Players")
local UIS = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")

local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

-- ===== DATA PULAU =====
local ISLANDS = {
    {
        assetId = 129704081202695,
        imageId = 99889426616263,
        name = "Pulau",
        creator = "NX COMMUNYTY",
        emoji = "🏝️",
    },
    {
        assetId = 92051454821719,
        imageId = 85335198899132,
        name = "Pulau",
        creator = "Nanz",
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
panel.Size = UDim2.new(0, 340, 0, 500)
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

local hLine = Instance.new("Frame")
hLine.Size = UDim2.new(1, -24, 0, 1)
hLine.Position = UDim2.new(0, 12, 1, -1)
hLine.BackgroundColor3 = Color3.fromRGB(201, 169, 97)
hLine.BackgroundTransparency = 0.6
hLine.BorderSizePixel = 0
hLine.Parent = hdr

local hIcon = Instance.new("TextLabel")
hIcon.Size = UDim2.new(0, 20, 1, 0)
hIcon.Position = UDim2.new(0, 10, 0, 0)
hIcon.BackgroundTransparency = 1
hIcon.Text = "🛠️"
hIcon.TextSize = 12
hIcon.Parent = hdr

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

-- ===== SCROLL LIST =====
local scroll = Instance.new("ScrollingFrame")
scroll.Size = UDim2.new(1, -20, 1, -180)
scroll.Position = UDim2.new(0, 10, 0, 44)
scroll.BackgroundTransparency = 1
scroll.BorderSizePixel = 0
scroll.ScrollBarThickness = 4
scroll.ScrollBarImageColor3 = Color3.fromRGB(201, 169, 97)
scroll.CanvasSize = UDim2.new(0, 0, 0, 0)
scroll.Parent = panel

local listLayout = Instance.new("UIListLayout")
listLayout.Padding = UDim.new(0, 8)
listLayout.Parent = scroll

-- ===== OUTPUT =====
local outLbl = Instance.new("TextLabel")
outLbl.Size = UDim2.new(1, -20, 0, 60)
outLbl.Position = UDim2.new(0, 10, 1, -70)
outLbl.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
outLbl.BorderSizePixel = 0
outLbl.Text = "✓ Status : Siap"
outLbl.TextColor3 = Color3.fromRGB(184, 150, 90)
outLbl.TextSize = 9
outLbl.Font = Enum.Font.Code
outLbl.TextXAlignment = Enum.TextXAlignment.Left
outLbl.TextYAlignment = Enum.TextYAlignment.Top
outLbl.TextWrapped = true
outLbl.Parent = panel

local olc = Instance.new("UICorner")
olc.CornerRadius = UDim.new(0, 6)
olc.Parent = outLbl

local olp = Instance.new("UIPadding")
olp.PaddingLeft = UDim.new(0, 8)
olp.PaddingTop = UDim.new(0, 4)
olp.Parent = outLbl

-- ===== FUNGSI LOAD ASSET =====
local function loadIsland(data)
    outLbl.Text = "⏳ Loading " .. data.assetId .. "..."
    print("[KuzaXY👑] Loading:", data.assetId)

    local ok, result = pcall(function()
        return game:GetObjects("rbxassetid://" .. data.assetId)
    end)

    if not ok or not result or #result == 0 then
        outLbl.Text = "❌ Gagal load\n" .. tostring(result)
        return
    end

    local model = result[1]
    model.Parent = workspace
    model.Name = data.name .. "_" .. data.assetId

    local char = player.Character
    local basePos = Vector3.new(0, 50, 0)
    if char and char:FindFirstChild("HumanoidRootPart") then
        basePos = char.HumanoidRootPart.Position
            + char.HumanoidRootPart.CFrame.LookVector * 50
            + Vector3.new(0, 20, 0)
    end

    if model:IsA("Model") then
        if model.PrimaryPart then
            model:PivotTo(CFrame.new(basePos))
        else
            model:MoveTo(basePos)
        end
    elseif model:IsA("BasePart") then
        model.Position = basePos
    end

    outLbl.Text = "✓ Berhasil: " .. data.name
    print("[KuzaXY👑] Berhasil:", data.name, "by", data.creator)
end

-- ===== FUNGSI BUAT CARD =====
local function createCard(data)
    local card = Instance.new("TextButton")
    card.Size = UDim2.new(1, -6, 0, 130)
    card.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
    card.BorderSizePixel = 0
    card.Text = ""
    card.AutoButtonColor = false
    card.Parent = scroll

    local cc = Instance.new("UICorner")
    cc.CornerRadius = UDim.new(0, 8)
    cc.Parent = card

    local cs = Instance.new("UIStroke")
    cs.Color = Color3.fromRGB(38, 38, 38)
    cs.Thickness = 1
    cs.Parent = card

    -- Preview gambar
    local preview = Instance.new("Frame")
    preview.Size = UDim2.new(1, -16, 0, 68)
    preview.Position = UDim2.new(0, 8, 0, 8)
    preview.BackgroundColor3 = Color3.fromRGB(40, 80, 120)
    preview.BorderSizePixel = 0
    preview.Parent = card

    local pvc = Instance.new("UICorner")
    pvc.CornerRadius = UDim.new(0, 6)
    pvc.Parent = preview

    if data.imageId then
        local img = Instance.new("ImageLabel")
        img.Size = UDim2.new(1, 0, 1, 0)
        img.BackgroundTransparency = 1
        img.Image = "rbxassetid://" .. data.imageId
        img.ScaleType = Enum.ScaleType.Crop
        img.Parent = preview

        local ic = Instance.new("UICorner")
        ic.CornerRadius = UDim.new(0, 6)
        ic.Parent = img
    end

    local emojiLbl = Instance.new("TextLabel")
    emojiLbl.Size = UDim2.new(1, 0, 1, 0)
    emojiLbl.BackgroundTransparency = 1
    emojiLbl.Text = data.emoji
    emojiLbl.TextSize = 36
    emojiLbl.Parent = preview

    -- Nama
    local nameLbl = Instance.new("TextLabel")
    nameLbl.Size = UDim2.new(1, -100, 0, 16)
    nameLbl.Position = UDim2.new(0, 8, 0, 82)
    nameLbl.BackgroundTransparency = 1
    nameLbl.Text = data.emoji .. " " .. data.name
    nameLbl.TextColor3 = Color3.fromRGB(232, 228, 220)
    nameLbl.TextSize = 12
    nameLbl.Font = Enum.Font.GothamBold
    nameLbl.TextXAlignment = Enum.TextXAlignment.Left
    nameLbl.Parent = card

    -- by
    local byLbl = Instance.new("TextLabel")
    byLbl.Size = UDim2.new(1, -100, 0, 12)
    byLbl.Position = UDim2.new(0, 8, 0, 100)
    byLbl.BackgroundTransparency = 1
    byLbl.Text = "by: " .. data.creator
    byLbl.TextColor3 = Color3.fromRGB(168, 162, 154)
    byLbl.TextSize = 9
    byLbl.Font = Enum.Font.Gotham
    byLbl.TextXAlignment = Enum.TextXAlignment.Left
    byLbl.Parent = card

    -- ID
    local idLbl = Instance.new("TextLabel")
    idLbl.Size = UDim2.new(1, -100, 0, 12)
    idLbl.Position = UDim2.new(0, 8, 0, 112)
    idLbl.BackgroundTransparency = 1
    idLbl.Text = "ID: " .. data.assetId
    idLbl.TextColor3 = Color3.fromRGB(201, 169, 97)
    idLbl.TextSize = 9
    idLbl.Font = Enum.Font.Code
    idLbl.TextXAlignment = Enum.TextXAlignment.Left
    idLbl.Parent = card

    -- Tombol INSERT abu-abu
    local insBtn = Instance.new("TextButton")
    insBtn.Size = UDim2.new(0, 70, 0, 32)
    insBtn.Position = UDim2.new(1, -80, 0.5, 20)
    insBtn.BackgroundColor3 = Color3.fromRGB(80, 80, 80)
    insBtn.BorderSizePixel = 0
    insBtn.Text = "INSERT"
    insBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
    insBtn.TextSize = 10
    insBtn.Font = Enum.Font.GothamBold
    insBtn.AutoButtonColor = false
    insBtn.Parent = card

    local ibc = Instance.new("UICorner")
    ibc.CornerRadius = UDim.new(0, 7)
    ibc.Parent = insBtn

    local ibs = Instance.new("UIStroke")
    ibs.Color = Color3.fromRGB(140, 140, 140)
    ibs.Thickness = 1
    ibs.Transparency = 0.3
    ibs.Parent = insBtn

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
            Color = Color3.fromRGB(38, 38, 38)
        }):Play()
    end)

    -- Hover insert
    insBtn.MouseEnter:Connect(function()
        insBtn.BackgroundColor3 = Color3.fromRGB(120, 120, 120)
        ibs.Transparency = 0
    end)
    insBtn.MouseLeave:Connect(function()
        insBtn.BackgroundColor3 = Color3.fromRGB(80, 80, 80)
        ibs.Transparency = 0.3
    end)

    -- Klik insert
    insBtn.MouseButton1Click:Connect(function()
        loadIsland(data)
    end)
end

-- ===== BUILD CARD =====
for _, data in ipairs(ISLANDS) do
    createCard(data)
end

-- Update canvas
listLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
    scroll.CanvasSize = UDim2.new(0, 0, 0, listLayout.AbsoluteContentSize.Y + 10)
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
print("[KuzaXY👑] Total pulau: " .. #ISLANDS)