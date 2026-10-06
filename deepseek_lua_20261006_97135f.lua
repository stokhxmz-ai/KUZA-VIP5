--[[
    KuzaXY👑 Island Loader FULL
    Multi-method asset loader
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
panel.Size = UDim2.new(0, 320, 0, 220)
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

-- ===== INPUT ID =====
local inputFrame = Instance.new("Frame")
inputFrame.Size = UDim2.new(1, -20, 0, 32)
inputFrame.Position = UDim2.new(0, 10, 0, 44)
inputFrame.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
inputFrame.BorderSizePixel = 0
inputFrame.Parent = panel

local ifc = Instance.new("UICorner")
ifc.CornerRadius = UDim.new(0, 7)
ifc.Parent = inputFrame

local ifs = Instance.new("UIStroke")
ifs.Color = Color3.fromRGB(38, 38, 38)
ifs.Thickness = 1
ifs.Parent = inputFrame

local idBox = Instance.new("TextBox")
idBox.Size = UDim2.new(1, -20, 1, 0)
idBox.Position = UDim2.new(0, 10, 0, 0)
idBox.BackgroundTransparency = 1
idBox.Text = "124432784834277"
idBox.PlaceholderText = "Masukkan Asset ID..."
idBox.PlaceholderColor3 = Color3.fromRGB(106, 101, 93)
idBox.TextColor3 = Color3.fromRGB(232, 228, 220)
idBox.TextSize = 11
idBox.Font = Enum.Font.Code
idBox.TextXAlignment = Enum.TextXAlignment.Left
idBox.ClearTextOnFocus = false
idBox.Parent = inputFrame

-- ===== TOMBOL INSERT =====
local insBtn = Instance.new("TextButton")
insBtn.Size = UDim2.new(1, -20, 0, 36)
insBtn.Position = UDim2.new(0, 10, 0, 86)
insBtn.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
insBtn.BorderSizePixel = 0
insBtn.Text = "INSERT PULAU"
insBtn.TextColor3 = Color3.fromRGB(201, 169, 97)
insBtn.TextSize = 11
insBtn.Font = Enum.Font.GothamBold
insBtn.AutoButtonColor = false
insBtn.Parent = panel

local ibc = Instance.new("UICorner")
ibc.CornerRadius = UDim.new(0, 7)
ibc.Parent = insBtn

local ibs = Instance.new("UIStroke")
ibs.Color = Color3.fromRGB(201, 169, 97)
ibs.Thickness = 1
ibs.Transparency = 0.6
ibs.Parent = insBtn

-- ===== OUTPUT =====
local outLbl = Instance.new("TextLabel")
outLbl.Size = UDim2.new(1, -20, 0, 70)
outLbl.Position = UDim2.new(0, 10, 1, -80)
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

-- ===== FUNGSI LOAD (MULTI METHOD) =====
local function loadIsland(id, name, creator)
    outLbl.Text = "⏳ Loading " .. id .. "..."
    print("[KuzaXY👑] Loading asset:", id)

    local model = nil
    local method = ""

    -- METHOD 1: game:GetObjects
    local ok1, result1 = pcall(function()
        return game:GetObjects("rbxassetid://" .. id)
    end)

    if ok1 and result1 and #result1 > 0 then
        model = result1[1]
        method = "GetObjects"
        outLbl.Text = "✓ Method: GetObjects"
    else
        -- METHOD 2: InsertService:LoadAsset
        local ok2, result2 = pcall(function()
            return InsertService:LoadAsset(id)
        end)

        if ok2 and result2 then
            local children = result2:GetChildren()
            if #children > 0 then
                model = children[1]
            else
                model = result2
            end
            method = "LoadAsset"
            outLbl.Text = "✓ Method: LoadAsset"
        else
            -- METHOD 3: Bikin pulau dari Part (fallback)
            outLbl.Text = "⚠ Asset ga bisa di-load\n⚙ Bikin pulau manual..."

            local folder = Instance.new("Folder")
            folder.Name = "KuzaXY_Island_" .. id
            folder.Parent = workspace

            local char = player.Character
            local basePos = Vector3.new(0, 50, 0)
            if char and char:FindFirstChild("HumanoidRootPart") then
                basePos = char.HumanoidRootPart.Position
                    + char.HumanoidRootPart.CFrame.LookVector * 40
                    + Vector3.new(0, 15, 0)
            end

            local base = Instance.new("Part")
            base.Size = Vector3.new(120, 12, 120)
            base.Position = basePos
            base.Anchored = true
            base.BrickColor = BrickColor.new("Bright green")
            base.Material = Enum.Material.Grass
            base.Parent = folder

            local dirt = Instance.new("Part")
            dirt.Size = Vector3.new(120, 20, 120)
            dirt.Position = basePos - Vector3.new(0, 16, 0)
            dirt.Anchored = true
            dirt.BrickColor = BrickColor.new("Brown")
            dirt.Material = Enum.Material.Ground
            dirt.Parent = folder

            -- Pohon
            for i = 1, 4 do
                local px = basePos.X + math.random(-35, 35)
                local pz = basePos.Z + math.random(-35, 35)
                local py = basePos.Y + 6

                local trunk = Instance.new("Part")
                trunk.Size = Vector3.new(2, 8, 2)
                trunk.Position = Vector3.new(px, py + 4, pz)
                trunk.Anchored = true
                trunk.BrickColor = BrickColor.new("Reddish brown")
                trunk.Material = Enum.Material.Wood
                trunk.Parent = folder

                local leaf = Instance.new("Part")
                leaf.Shape = Enum.PartType.Ball
                leaf.Size = Vector3.new(9, 9, 9)
                leaf.Position = Vector3.new(px, py + 10, pz)
                leaf.Anchored = true
                leaf.BrickColor = BrickColor.new("Dark green")
                leaf.Material = Enum.Material.Grass
                leaf.Parent = folder
            end

            -- Billboard
            local bb = Instance.new("BillboardGui")
            bb.Size = UDim2.new(0, 300, 0, 60)
            bb.StudsOffset = Vector3.new(0, 12, 0)
            bb.AlwaysOnTop = true
            bb.Parent = base

            local nt = Instance.new("TextLabel")
            nt.Size = UDim2.new(1, 0, 0.55, 0)
            nt.BackgroundTransparency = 1
            nt.Text = "🏝️ " .. name
            nt.TextColor3 = Color3.fromRGB(255, 255, 255)
            nt.TextStrokeTransparency = 0
            nt.TextSize = 20
            nt.Font = Enum.Font.GothamBold
            nt.Parent = bb

            local it = Instance.new("TextLabel")
            it.Size = UDim2.new(1, 0, 0.45, 0)
            it.Position = UDim2.new(0, 0, 0.55, 0)
            it.BackgroundTransparency = 1
            it.Text = "ID: " .. id .. "  •  by " .. creator
            it.TextColor3 = Color3.fromRGB(201, 169, 97)
            it.TextStrokeTransparency = 0
            it.TextSize = 13
            it.Font = Enum.Font.Gotham
            it.Parent = bb

            outLbl.Text = "✓ Pulau manual spawned"
            return
        end
    end

    -- Kalau model berhasil di-load
    if model then
        model.Parent = workspace
        model.Name = name or ("Island_" .. id)

        local char = player.Character
        local basePos = Vector3.new(0, 50, 0)
        if char and char:FindFirstChild("HumanoidRootPart") then
            basePos = char.HumanoidRootPart.Position
                + char.HumanoidRootPart.CFrame.LookVector * 40
                + Vector3.new(0, 15, 0)
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

        outLbl.Text = "✓ Berhasil! (" .. method .. ")\n" .. (name or id)

        -- Efek
        local light = Instance.new("PointLight")
        light.Color = Color3.fromRGB(201, 169, 97)
        light.Range = 50
        light.Brightness = 3
        if model:IsA("BasePart") then
            light.Parent = model
        else
            local bp = model:FindFirstChildWhichIsA("BasePart")
            if bp then light.Parent = bp end
        end
        if light.Parent then
            TweenService:Create(light, TweenInfo.new(2), {Brightness = 0}):Play()
            task.delay(2, function() if light and light.Parent then light:Destroy() end end)
        end

        print("[KuzaXY👑] Berhasil load via " .. method)
    end
end

-- Klik insert
insBtn.MouseButton1Click:Connect(function()
    local id = tonumber(idBox.Text)
    if id then
        loadIsland(id, "Pulau", "prasetiyo")
    else
        outLbl.Text = "❌ ID tidak valid"
    end
end)

-- Hover insert
insBtn.MouseEnter:Connect(function()
    insBtn.BackgroundColor3 = Color3.fromRGB(25, 22, 15)
    ibs.Transparency = 0.2
end)
insBtn.MouseLeave:Connect(function()
    insBtn.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
    ibs.Transparency = 0.6
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
print("[KuzaXY👑] ID default: 124432784834277")