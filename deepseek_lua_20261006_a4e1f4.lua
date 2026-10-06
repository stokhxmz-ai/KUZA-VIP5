--[[
    Test Load Asset ID — 4 Cara
    Buat cek cara mana yang work di Delta kamu
]]

local ASSET_ID = 124432784834277

print("========================================")
print("   TEST LOAD ASSET: " .. ASSET_ID)
print("========================================")

-- ===== TEST 1: game:GetObjects =====
print("\n[TEST 1] game:GetObjects()")
local ok1, result1 = pcall(function()
    return game:GetObjects("rbxassetid://" .. ASSET_ID)
end)

if ok1 and result1 then
    print("  Status: BERHASIL")
    print("  Tipe: " .. typeof(result1))
    print("  Jumlah: " .. #result1)

    -- Coba spawn
    if #result1 > 0 then
        local model = result1[1]
        print("  Isi[1]: " .. model.ClassName .. " - " .. model.Name)
        model.Parent = workspace
        print("  ✅ Model di-spawn ke Workspace!")
    end
else
    print("  Status: GAGAL")
    print("  Error: " .. tostring(result1))
end

-- ===== TEST 2: InsertService:LoadAsset =====
print("\n[TEST 2] InsertService:LoadAsset()")
local ok2, result2 = pcall(function()
    return game:GetService("InsertService"):LoadAsset(ASSET_ID)
end)

if ok2 and result2 then
    print("  Status: BERHASIL")
    print("  Tipe: " .. typeof(result2))
else
    print("  Status: GAGAL")
    print("  Error: " .. tostring(result2))
end

-- ===== TEST 3: Cek Function Bawaan Executor =====
print("\n[TEST 3] Cek Function Bawaan")
print("  loadasset     : " .. tostring(loadasset))
print("  getcustomasset: " .. tostring(getcustomasset))
print("  game.LoadAsset: " .. tostring(game.LoadAsset))
print("  workspace.LoadAsset: " .. tostring(workspace.LoadAsset))
print("  insertservice : " .. tostring(insertservice))
print("  getsynasset   : " .. tostring(getsynasset))

-- ===== TEST 4: HTTP Asset Delivery =====
print("\n[TEST 4] HTTP Asset Delivery")
local ok4, result4 = pcall(function()
    return game:HttpGet("https://assetdelivery.roblox.com/v1/asset?id=" .. ASSET_ID)
end)

if ok4 and result4 then
    print("  Status: BERHASIL")
    print("  Panjang response: " .. #tostring(result4) .. " karakter")
    print("  Preview: " .. string.sub(tostring(result4), 1, 100))
else
    print("  Status: GAGAL")
    print("  Error: " .. tostring(result4))
end

print("\n========================================")
print("   TEST SELESAI")
print("========================================")