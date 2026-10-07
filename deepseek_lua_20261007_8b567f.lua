-- ===== BANNER BY WYZ =====
print([[
  ____   __   __  __      __  ______  ____
 | __ )  \ \ / /  \ \    / / |__  /  |___ \
 |  _ \   \ V /    \ \  / /    / /     __) |
 | |_) |   | |      \ \/ /    / /_    / __/
 |____/    |_|       \__/    /____|  |_____|

                BY WYZ
]])

-- ===== SERVICE =====
local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")

local player = Players.LocalPlayer
local mouse = player:GetMouse()

-- ===== WHITELIST =====
local AUTHORIZED_USERNAMES = {
    "gruzz255",
}

local function isAuthorized(username)
    for _, name in ipairs(AUTHORIZED_USERNAMES) do
        if string.lower(name) == string.lower(username) then
            return true
        end
    end
    return false
end

if not isAuthorized(player.Name) then
    warn("[Terrain Tools] Kamu tidak punya akses.")
    return
end

-- ===== MATERIALS =====
local MATERIALS = {
    {name = "Grass", material = Enum.Material.Grass, shades = {
        Color3.fromRGB(86, 171, 47), Color3.fromRGB(120, 190, 33), Color3.fromRGB(60, 140, 60),
        Color3.fromRGB(155, 200, 60), Color3.fromRGB(34, 120, 60), Color3.fromRGB(150, 180, 90),
        Color3.fromRGB(45, 100, 45), Color3.fromRGB(100, 160, 80), Color3.fromRGB(180, 210, 100),
        Color3.fromRGB(70, 130, 50),
    }},
    {name = "Rock", material = Enum.Material.Rock, shades = {
        Color3.fromRGB(120, 113, 108), Color3.fromRGB(90, 90, 92), Color3.fromRGB(160, 160, 160),
        Color3.fromRGB(70, 70, 74), Color3.fromRGB(140, 130, 120), Color3.fromRGB(110, 100, 95),
        Color3.fromRGB(180, 175, 170), Color3.fromRGB(60, 60, 65), Color3.fromRGB(150, 140, 130),
        Color3.fromRGB(100, 105, 110),
    }},
    {name = "Ground", material = Enum.Material.Ground, shades = {
        Color3.fromRGB(101, 67, 33), Color3.fromRGB(139, 90, 43), Color3.fromRGB(160, 120, 80),
        Color3.fromRGB(87, 58, 30), Color3.fromRGB(120, 80, 50), Color3.fromRGB(180, 140, 100),
        Color3.fromRGB(70, 45, 25), Color3.fromRGB(150, 100, 60), Color3.fromRGB(110, 70, 40),
        Color3.fromRGB(200, 160, 120),
    }},
    {name = "Pavement", material = Enum.Material.Pavement, shades = {
        Color3.fromRGB(160, 160, 160), Color3.fromRGB(190, 190, 190), Color3.fromRGB(130, 130, 130),
        Color3.fromRGB(210, 210, 210), Color3.fromRGB(100, 100, 105), Color3.fromRGB(170, 165, 160),
        Color3.fromRGB(80, 80, 85), Color3.fromRGB(150, 150, 155), Color3.fromRGB(220, 220, 215),
        Color3.fromRGB(115, 115, 118),
    }},
    {name = "Sand", material = Enum.Material.Sand, shades = {
        Color3.fromRGB(237, 201, 175), Color3.fromRGB(222, 184, 135), Color3.fromRGB(244, 217, 165),
        Color3.fromRGB(210, 170, 120), Color3.fromRGB(250, 230, 190), Color3.fromRGB(195, 155, 105),
        Color3.fromRGB(230, 195, 150), Color3.fromRGB(180, 140, 90), Color3.fromRGB(245, 225, 200),
        Color3.fromRGB(200, 180, 140),
    }},
    {name = "Water", material = Enum.Material.Water, shades = {
        Color3.fromRGB(59, 130, 246), Color3.fromRGB(14, 116, 144), Color3.fromRGB(56, 189, 248),
        Color3.fromRGB(30, 64, 175), Color3.fromRGB(6, 182, 212), Color3.fromRGB(37, 99, 235),
        Color3.fromRGB(103, 232, 249), Color3.fromRGB(29, 78, 216), Color3.fromRGB(125, 211, 252),
        Color3.fromRGB(8, 47, 73),
    }},
    {name = "Ice", material = Enum.Material.Ice, shades = {
        Color3.fromRGB(200, 240, 245), Color3.fromRGB(224, 247, 250), Color3.fromRGB(178, 235, 242),
        Color3.fromRGB(165, 220, 230), Color3.fromRGB(210, 245, 250), Color3.fromRGB(140, 210, 220),
        Color3.fromRGB(235, 250, 252), Color3.fromRGB(120, 195, 210), Color3.fromRGB(190, 230, 235),
        Color3.fromRGB(150, 200, 215),
    }},
    {name = "Lava", material = Enum.Material.CrackedLava, shades = {
        Color3.fromRGB(255, 80, 20), Color3.fromRGB(220, 40, 10), Color3.fromRGB(255, 140, 30),
        Color3.fromRGB(180, 20, 10), Color3.fromRGB(255, 170, 60), Color3.fromRGB(150, 15, 10),
        Color3.fromRGB(255, 100, 40), Color3.fromRGB(255, 200, 80), Color3.fromRGB(200, 30, 15),
        Color3.fromRGB(120, 10, 5),
    }},
}

local SHAPES = {"Block", "Ball", "Cylinder"}

-- ===== STATE =====
local state = {
    materialIndex = 1,
    colorIndex = 1,
    shape = "Block",
    brushSize = 6,
    eraseMode = false,
    toolActive = false,
    actions = {},
}

local function currentMaterialData() return MATERIALS[state.materialIndex] end
local function currentColor() return currentMaterialData().shades[state.colorIndex] end

-- ===== HELPER =====
local function make(class, props, parent)
    local obj = Instance.new(class)
    for k, v in pairs(props) do obj[k] = v end
    obj.Parent = parent
    return obj
end
local function corner(obj, radius)
    make("UICorner", {CornerRadius = UDim.new(0, radius or 6)}, obj)
end

-- ===== TERRAIN API =====
local Terrain = workspace.Terrain

local function doTerrainFill(shape, position, size, radius, height, material, color)
    if material and color then
        if material == Enum.Material.Water then
            Terrain.WaterColor = color
        else
            pcall(function() Terrain:SetMaterialColor(material, color) end)
        end
    end
    if shape == "Block" then
        Terrain:FillBlock(CFrame.new(position), size, material)
    elseif shape == "Ball" then
        Terrain:FillBall(position, radius, material)
    elseif shape == "Cylinder" then
        Terrain:FillCylinder(CFrame.new(position), height, radius, material)
    end
end

local function doTerrainErase(shape, position, size, radius)
    if shape == "Ball" then
        Terrain:FillBall(position, radius, Enum.Material.Air)
    else
        Terrain:FillBlock(CFrame.new(position), size, Enum.Material.Air)
    end
end

-- ===== GUI =====
local screenGui = make("ScreenGui", {
    Name = "TerrainToolsGui",
    ResetOnSpawn = false,
    IgnoreGuiInset = true,
}, player:WaitForChild("PlayerGui"))

local camera = workspace.CurrentCamera
local uiScale = make("UIScale", {Scale = 1}, screenGui)
local function updateScale()
    local viewport = camera and camera.ViewportSize or Vector2.new(1600, 720)
    uiScale.Scale = math.clamp(viewport.Y / 900, 0.55, 1)
end
updateScale()
if camera then
    camera:GetPropertyChangedSignal("ViewportSize"):Connect(updateScale)
end

-- Tombol petak 👑
local toggleBg = make("Frame", {
    Size = UDim2.new(0, 70, 0, 70),
    Position = UDim2.new(0, 90, 0, 90),
    BackgroundColor3 = Color3.fromRGB(19, 20, 25),
    BorderSizePixel = 0,
}, screenGui)
corner(toggleBg, 12)
make("UIStroke", {Thickness = 2, Color = Color3.fromRGB(212, 175, 55)}, toggleBg)

make("TextLabel", {
    Size = UDim2.new(1, 0, 0, 32),
    Position = UDim2.new(0, 0, 0, 6),
    BackgroundTransparency = 1,
    Text = "👑",
    TextSize = 22,
    Font = Enum.Font.GothamBold,
}, toggleBg)

make("TextLabel", {
    Size = UDim2.new(1, 0, 0, 14),
    Position = UDim2.new(0, 0, 1, -20),
    BackgroundTransparency = 1,
    Text = "TERRAIN",
    TextColor3 = Color3.fromRGB(212, 175, 55),
    TextSize = 8,
    Font = Enum.Font.GothamBold,
}, toggleBg)

local toggleBtn = make("TextButton", {
    Size = UDim2.new(1, 0, 1, 0),
    BackgroundTransparency = 1,
    Text = "",
}, toggleBg)

-- Panel
local panel = make("Frame", {
    Size = UDim2.new(0, 220, 0, 480),
    Position = UDim2.new(0, 180, 0, 90),
    BackgroundColor3 = Color3.fromRGB(18, 18, 22),
    BorderSizePixel = 0,
    Visible = false,
}, screenGui)
corner(panel, 16)
make("UIStroke", {Thickness = 2, Color = Color3.fromRGB(212, 175, 55)}, panel)

local header = make("Frame", {
    Size = UDim2.new(1, 0, 0, 34),
    BackgroundColor3 = Color3.fromRGB(30, 30, 38),
    BorderSizePixel = 0,
}, panel)
corner(header, 16)

make("TextLabel", {
    Size = UDim2.new(1, -10, 1, 0),
    Position = UDim2.new(0, 10, 0, 0),
    BackgroundTransparency = 1,
    Text = "Terrain Tools by Wyz Verse",
    TextColor3 = Color3.fromRGB(212, 175, 55),
    TextSize = 12,
    Font = Enum.Font.GothamBold,
    TextXAlignment = Enum.TextXAlignment.Left,
}, header)

local content = make("ScrollingFrame", {
    Size = UDim2.new(1, -12, 1, -42),
    Position = UDim2.new(0, 6, 0, 38),
    BackgroundTransparency = 1,
    BorderSizePixel = 0,
    ScrollBarThickness = 6,
    ScrollBarImageColor3 = Color3.fromRGB(212, 175, 55),
    CanvasSize = UDim2.new(0, 0, 0, 460),
}, panel)

local function label(text, y)
    return make("TextLabel", {
        Size = UDim2.new(1, 0, 0, 16),
        Position = UDim2.new(0, 0, 0, y),
        BackgroundTransparency = 1,
        Text = text,
        TextColor3 = Color3.fromRGB(200, 180, 130),
        TextSize = 11,
        Font = Enum.Font.GothamBold,
        TextXAlignment = Enum.TextXAlignment.Left,
    }, content)
end

-- Material grid
label("Material", 0)
local materialGrid = make("Frame", {
    Size = UDim2.new(1, 0, 0, 84),
    Position = UDim2.new(0, 0, 0, 18),
    BackgroundTransparency = 1,
}, content)

local materialButtons = {}
local function refreshMaterialButtons()
    for i, btn in ipairs(materialButtons) do
        btn.BackgroundColor3 = (i == state.materialIndex) and Color3.fromRGB(150, 120, 40) or Color3.fromRGB(45, 45, 50)
    end
end
for i, m in ipairs(MATERIALS) do
    local col = (i - 1) % 4
    local row = math.floor((i - 1) / 4)
    local btn = make("TextButton", {
        Size = UDim2.new(0, 48, 0, 38),
        Position = UDim2.new(0, col * 52, 0, row * 42),
        BackgroundColor3 = Color3.fromRGB(45, 45, 50),
        BorderSizePixel = 0,
        Text = m.name,
        TextColor3 = Color3.new(1, 1, 1),
        TextSize = 9,
        Font = Enum.Font.GothamMedium,
        TextWrapped = true,
    }, materialGrid)
    corner(btn)
    materialButtons[i] = btn
    btn.Activated:Connect(function()
        state.materialIndex = i
        state.colorIndex = 1
        refreshMaterialButtons()
        refreshColorSwatches()
    end)
end
refreshMaterialButtons()

-- Warna
label("Warna", 106)
local colorRow = make("Frame", {
    Size = UDim2.new(1, 0, 0, 40),
    Position = UDim2.new(0, 0, 0, 124),
    BackgroundTransparency = 1,
}, content)

local colorSwatches, colorStrokes = {}, {}
function refreshColorSwatches()
    local mat = currentMaterialData()
    for i, sw in ipairs(colorSwatches) do
        sw.BackgroundColor3 = mat.shades[i]
        colorStrokes[i].Enabled = (i == state.colorIndex)
    end
end
for i = 1, 10 do
    local col = (i - 1) % 5
    local row = math.floor((i - 1) / 5)
    local sw = make("TextButton", {
        Size = UDim2.new(0, 34, 0, 16),
        Position = UDim2.new(0, col * 38, 0, row * 20),
        Text = "",
        BorderSizePixel = 0,
    }, colorRow)
    corner(sw, 4)
    local stroke = make("UIStroke", {Color = Color3.new(1, 1, 1), Thickness = 2, Enabled = false}, sw)
    colorSwatches[i] = sw
    colorStrokes[i] = stroke
    sw.Activated:Connect(function()
        state.colorIndex = i
        refreshColorSwatches()
    end)
end
refreshColorSwatches()

-- Bentuk
label("Bentuk", 172)
local shapeRow = make("Frame", {
    Size = UDim2.new(1, 0, 0, 30),
    Position = UDim2.new(0, 0, 0, 190),
    BackgroundTransparency = 1,
}, content)

local shapeButtons = {}
local function refreshShapeButtons()
    for name, btn in pairs(shapeButtons) do
        btn.BackgroundColor3 = (name == state.shape) and Color3.fromRGB(150, 120, 40) or Color3.fromRGB(45, 45, 50)
    end
end
for i, shapeName in ipairs(SHAPES) do
    local btn = make("TextButton", {
        Size = UDim2.new(0, 66, 0, 28),
        Position = UDim2.new(0, (i - 1) * 72, 0, 0),
        BackgroundColor3 = Color3.fromRGB(45, 45, 50),
        BorderSizePixel = 0,
        Text = shapeName,
        TextColor3 = Color3.new(1, 1, 1),
        TextSize = 10,
        Font = Enum.Font.GothamBold,
    }, shapeRow)
    corner(btn)
    shapeButtons[shapeName] = btn
    btn.Activated:Connect(function()
        state.shape = shapeName
        refreshShapeButtons()
    end)
end
refreshShapeButtons()

-- Brush slider
local brushLabel = label("Ukuran Brush: 6", 228)
local sliderTrack = make("Frame", {
    Size = UDim2.new(1, 0, 0, 22),
    Position = UDim2.new(0, 0, 0, 246),
    BackgroundColor3 = Color3.fromRGB(45, 45, 50),
    BorderSizePixel = 0,
}, content)
corner(sliderTrack)
local sliderKnob = make("Frame", {
    Size = UDim2.new(0, 16, 0, 16),
    Position = UDim2.new((state.brushSize - 1) / 23, -8, 0.5, -8),
    BackgroundColor3 = Color3.fromRGB(212, 175, 55),
    BorderSizePixel = 0,
}, sliderTrack)
corner(sliderKnob, 8)

local draggingSlider = false
local sliderInput = make("TextButton", {BackgroundTransparency = 1, Size = UDim2.new(1, 0, 1, 0), Text = ""}, sliderTrack)
sliderInput.MouseButton1Down:Connect(function() draggingSlider = true end)
UserInputService.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        draggingSlider = false
    end
end)
RunService.RenderStepped:Connect(function()
    if draggingSlider then
        local pos = UserInputService:GetMouseLocation()
        local rel = math.clamp((pos.X - sliderTrack.AbsolutePosition.X) / sliderTrack.AbsoluteSize.X, 0, 1)
        state.brushSize = math.floor(rel * 23) + 1
        sliderKnob.Position = UDim2.new(rel, -8, 0.5, -8)
        brushLabel.Text = "Ukuran Brush: " .. state.brushSize
    end
end)

-- Erase
local eraseBtn = make("TextButton", {
    Size = UDim2.new(1, 0, 0, 32),
    Position = UDim2.new(0, 0, 0, 280),
    BackgroundColor3 = Color3.fromRGB(120, 50, 50),
    Text = "ERASE: OFF",
    TextColor3 = Color3.new(1, 1, 1),
    TextSize = 11,
    Font = Enum.Font.GothamBold,
}, content)
corner(eraseBtn)

-- Undo
local undoBtn = make("TextButton", {
    Size = UDim2.new(1, 0, 0, 32),
    Position = UDim2.new(0, 0, 0, 318),
    BackgroundColor3 = Color3.fromRGB(120, 95, 30),
    Text = "UNDO",
    TextColor3 = Color3.new(1, 1, 1),
    TextSize = 11,
    Font = Enum.Font.GothamBold,
}, content)
corner(undoBtn)

-- Start/Stop
local startBtn = make("TextButton", {
    Size = UDim2.new(1, 0, 0, 36),
    Position = UDim2.new(0, 0, 0, 356),
    BackgroundColor3 = Color3.fromRGB(35, 100, 55),
    Text = "START TAP",
    TextColor3 = Color3.new(1, 1, 1),
    TextSize = 12,
    Font = Enum.Font.GothamBold,
}, content)
corner(startBtn)

-- View Script
local viewBtn = make("TextButton", {
    Size = UDim2.new(1, 0, 0, 32),
    Position = UDim2.new(0, 0, 0, 400),
    BackgroundColor3 = Color3.fromRGB(40, 60, 120),
    Text = "LIHAT & COPY SCRIPT",
    TextColor3 = Color3.new(1, 1, 1),
    TextSize = 11,
    Font = Enum.Font.GothamBold,
}, content)
corner(viewBtn)

-- ===== DRAG PANEL =====
do
    local dragging, dragStart, startPos
    header.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            dragging = true
            dragStart = input.Position
            startPos = panel.Position
            input.Changed:Connect(function()
                if input.UserInputState == Enum.UserInputState.End then dragging = false end
            end)
        end
    end)
    UserInputService.InputChanged:Connect(function(input)
        if dragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
            local delta = input.Position - dragStart
            panel.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
        end
    end)
end

toggleBtn.Activated:Connect(function()
    panel.Visible = not panel.Visible
end)

-- ===== TAP HANDLER =====
local function doTap(hitPosition)
    local size = Vector3.new(state.brushSize, state.brushSize, state.brushSize)
    local radius = state.brushSize / 2

    if state.eraseMode then
        table.insert(state.actions, {type = "erase", shape = state.shape, position = hitPosition, size = size, radius = radius})
        doTerrainErase(state.shape, hitPosition, size, radius)
    else
        local matData = currentMaterialData()
        table.insert(state.actions, {
            type = "fill", shape = state.shape, position = hitPosition, size = size,
            radius = radius, height = state.brushSize, material = matData.material, color = currentColor(),
        })
        doTerrainFill(state.shape, hitPosition, size, radius, state.brushSize, matData.material, currentColor())
    end
end

mouse.Button1Down:Connect(function()
    if not state.toolActive then return end
    if not mouse.Hit then return end
    doTap(mouse.Hit.Position)
end)

-- Erase toggle
eraseBtn.Activated:Connect(function()
    if state.eraseMode then
        state.eraseMode = false
        eraseBtn.Text = "ERASE: OFF"
        eraseBtn.BackgroundColor3 = Color3.fromRGB(120, 50, 50)
    else
        state.eraseMode = true
        eraseBtn.Text = "ERASE: ON"
        eraseBtn.BackgroundColor3 = Color3.fromRGB(150, 30, 30)
    end
end)

-- Undo
undoBtn.Activated:Connect(function()
    local lastAction = table.remove(state.actions)
    if not lastAction then return end
    doTerrainErase(lastAction.shape, lastAction.position, lastAction.size, lastAction.radius)
end)

-- Start/Stop
startBtn.Activated:Connect(function()
    state.toolActive = not state.toolActive
    if state.toolActive then
        startBtn.Text = "STOP TAP"
        startBtn.BackgroundColor3 = Color3.fromRGB(120, 50, 50)
    else
        startBtn.Text = "START TAP"
        startBtn.BackgroundColor3 = Color3.fromRGB(35, 100, 55)
    end
end)

-- Brush indicator
local indicator = make("Part", {
    Name = "TerrainBrushIndicator",
    Anchored = true,
    CanCollide = false,
    CanQuery = false,
    Material = Enum.Material.Neon,
    Transparency = 0.5,
    Color = Color3.fromRGB(74, 222, 128),
}, workspace)

RunService.RenderStepped:Connect(function()
    if state.toolActive and mouse.Hit then
        indicator.Transparency = 0.5
        indicator.Color = state.eraseMode and Color3.fromRGB(239, 68, 68) or currentColor()
        indicator.Size = Vector3.new(state.brushSize, 1, state.brushSize)
        indicator.CFrame = CFrame.new(mouse.Hit.Position)
    else
        indicator.Transparency = 1
    end
end)

print("[Terrain Tools] Ready. Klik 👑 buat buka panel.")