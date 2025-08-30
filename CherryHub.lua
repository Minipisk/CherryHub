local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local ICONS = {
    MURDER = "Skull",
    STEAL_BRAINROT = "Zap",
    DEAD_RAILS = "Train",
    DOORS = "Door",
    BLADE_BALL = "Circle",
    EVADE = "Run",
    BLOXFRUITS = "Apple",
    VIOLENCE = "Sword",
    NIGHT = "Moon",
    PLS_DON = "Hand",
    BUILD_BOAT = "Anchor",
    JAILBREAK = "Lock",
    UNIVERSAL = "Globe",
    INFO = "Info"
}

local Window = Rayfield:CreateWindow({
    Name = "🍒 Cherru Hub v2.0 | " .. game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId).Name,
    LoadingTitle = "Cherru Hub",
    LoadingSubtitle = "by @impossible_blade",
    ConfigurationSaving = { Enabled = false },
    Discord = { Enabled = false },
    KeySystem = false,
})

local Tabs = {}

local function CreateTabSafe(name, icon)
    local success, tab = pcall(function()
        return Window:CreateTab(name, icon)
    end)
    if success and tab then
        Tabs[name] = tab
        return tab
    else
        return nil
    end
end

local function SafeLoad(name, url)
    pcall(function()
        local scriptCode = game:HttpGet(url, true)
        if scriptCode and #scriptCode > 10 then
            local f = loadstring(scriptCode)
            f()
        end
    end)
end

local MurderTab = CreateTabSafe("Murder Mystery 2", ICONS.MURDER)
if MurderTab then
    MurderTab:CreateSection("Auto Farm")
    MurderTab:CreateButton({Name = "Auto Farm", Callback = function() SafeLoad("Auto Farm", "https://raw.githubusercontent.com/BIudnyHoIandan/MM2/main/primordial/script/amg.lua") end})
    MurderTab:CreateButton({Name = "YARHM", Callback = function() SafeLoad("YARHM", "https://rawscripts.net/raw/Universal-Script-YARHM-12403") end})
    MurderTab:CreateButton({Name = "OverDrive Hub", Callback = function() SafeLoad("OverDrive Hub", "https://rawscripts.net/raw/Universal-Script-overdrive-h-hub-script-key-require-39673") end})
end

local StealBrainrotTab = CreateTabSafe("Steal Brainrot", ICONS.STEAL_BRAINROT)
if StealBrainrotTab then
    StealBrainrotTab:CreateSection("Steal Scripts")
    StealBrainrotTab:CreateButton({Name = "Fast Steal", Callback = function() SafeLoad("Fast Steal", "https://pastefy.app/J3oDjwQ5/raw") end})
    StealBrainrotTab:CreateButton({Name = "Chili Hub", Callback = function() SafeLoad("Chili Hub", "https://rawscripts.net/raw/Steal-a-Brainrot-KEYLESS-TRUE-THE-BEST-STEAL-A-BRAINROT-SCRIPT-45137") end})
end

local DeadRailsTab = CreateTabSafe("Dead Rails", ICONS.DEAD_RAILS)
if DeadRailsTab then
    DeadRailsTab:CreateSection("Dead Rails Scripts")
    DeadRailsTab:CreateButton({Name = "Moon Diety", Callback = function() SafeLoad("Moon Diety", "https://raw.githubusercontent.com/m00ndiety/Moondiety/main/Loader") end})
    DeadRailsTab:CreateButton({Name = "TN Hub", Callback = function() SafeLoad("TN Hub", "https://raw.githubusercontent.com/thiennrb7/Script/main/Bringall") end})
end

local DoorsTab = CreateTabSafe("Doors", ICONS.DOORS)
if DoorsTab then
    DoorsTab:CreateSection("Doors Scripts")
    DoorsTab:CreateButton({Name = "KingHub", Callback = function() SafeLoad("KingHub", "https://raw.githubusercontent.com/KINGHUB01/BlackKing-obf/main/Doors%20Blackking%20And%20BobHub") end})
    DoorsTab:CreateButton({Name = "Velocity X", Callback = function() SafeLoad("Velocity X", "https://raw.githubusercontent.com/DasVelocity/VelocityX/main/VelocityX.lua") end})
    DoorsTab:CreateButton({Name = "NullFire", Callback = function() SafeLoad("NullFire", "https://raw.githubusercontent.com/TeamNullFire/NullFire/main/loader.lua") end})
end

local BladeBallTab = CreateTabSafe("Blade Ball", ICONS.BLADE_BALL)
if BladeBallTab then
    BladeBallTab:CreateSection("Blade Ball Scripts")
    BladeBallTab:CreateButton({Name = "Soluna", Callback = function() SafeLoad("Soluna", "https://soluna-script.vercel.app/bladeball.lua") end})
    BladeBallTab:CreateButton({Name = "Bedol V2", Callback = function() SafeLoad("Bedol V2", "https://raw.githubusercontent.com/3345-c-a-t-s-u-s/-beta-/main/AutoParry.lua") end})
end

local EvadeTab = CreateTabSafe("Evade", ICONS.EVADE)
if EvadeTab then
    EvadeTab:CreateSection("Evade Scripts")
    EvadeTab:CreateButton({Name = "Draconic X", Callback = function() SafeLoad("Draconic X", "https://raw.githubusercontent.com/Nyxarth910/Draconic-Hub-X/main/files/Evade/Overhaul.lua") end})
end

local BloxFruitsTab = CreateTabSafe("Blox Fruits", ICONS.BLOXFRUITS)
if BloxFruitsTab then
    BloxFruitsTab:CreateSection("Blox Fruits Scripts")
    BloxFruitsTab:CreateButton({Name = "RedZ Universal", Callback = function() SafeLoad("RedZ Universal", "https://raw.githubusercontent.com/Overgustx2/TsuoLoader/main/Tsuo.lua") end})
    BloxFruitsTab:CreateButton({Name = "Vxeze Hub", Callback = function() SafeLoad("Vxeze Hub", "https://raw.githubusercontent.com/suntisalts/WeshkyHub/main/MainLoader.lua") end})
end

local UniversalTab = CreateTabSafe("Universal", ICONS.UNIVERSAL)
if UniversalTab then
    UniversalTab:CreateSection("Universal Scripts")
    UniversalTab:CreateButton({Name = "Infinite Yield", Callback = function() SafeLoad("Infinite Yield", "https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source") end})
    UniversalTab:CreateButton({Name = "Fly", Callback = function() SafeLoad("Fly", "https://pastebin.com/raw/YSL3xKYU") end})
end

local InfoTab = CreateTabSafe("Info", ICONS.INFO)
if InfoTab then
    InfoTab:CreateSection("Information")
    InfoTab:CreateLabel("Автор: @impossible_blade")
    InfoTab:CreateLabel("Канал: t.me/cherruscript")
    InfoTab:CreateDivider()
    InfoTab:CreateLabel("Device: " .. tostring(game:GetService("UserInputService"):GetPlatform()))
    InfoTab:CreateLabel("Executor: Delta Executor")
end
