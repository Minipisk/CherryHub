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
    Name = "Cherru Hub v2.0 | " .. game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId).Name,
    LoadingTitle = "Cherru Hub",
    LoadingSubtitle = "by @impossible_blade",
    ConfigurationSaving = {
        Enabled = true,
        FolderName = "CherruHub",
        FileName = "Configuration"
    },
    Discord = {
        Enabled = true,
        Invite = "discord.gg/cherru",
        RememberJoins = true
    },
    KeySystem = false,
})

local function trackInjection()
    local count = 0
    if isfile("CherryHub_Stats.txt") then
        count = tonumber(readfile("CherryHub_Stats.txt")) or 0
    end
    count = count + 1
    writefile("CherryHub_Stats.txt", tostring(count))
    return count
end

local injectionCount = trackInjection()

local MurderTab = Window:CreateTab("Murder", ICONS.MURDER)
MurderTab:CreateSection("Auto Farm")
MurderTab:CreateButton({Name="Auto Farm", Callback=function() loadstring(game:HttpGet("https://raw.githubusercontent.com/BIudnyHoIandan/MM2/refs/heads/main/primordial/script/amg.lua"))() end})
MurderTab:CreateButton({Name="YARHM", Callback=function() loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-YARHM-12403", true))("t.me/Cherruscript") end})
MurderTab:CreateButton({Name="OverDrive Hub", Callback=function() loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-overdrive-h-hub-script-key-require-39673"))() end})

local StealBrainrotTab = Window:CreateTab("Steal Brainrot", ICONS.STEAL_BRAINROT)
StealBrainrotTab:CreateSection("Steal Scripts")
StealBrainrotTab:CreateButton({Name="Fast Steal", Callback=function() loadstring(game:HttpGet("https://pastefy.app/J3oDjwQ5/raw"))() end})
StealBrainrotTab:CreateButton({Name="Chili Hub", Callback=function() loadstring(game:HttpGet("https://rawscripts.net/raw/Steal-a-Brainrot-KEYLESS-TRUE-THE-BEST-STEAL-A-BRAINROT-SCRIPT-45137"))() end})

local DeadRailsTab = Window:CreateTab("Dead Rails", ICONS.DEAD_RAILS)
DeadRailsTab:CreateSection("Dead Rails Scripts")
DeadRailsTab:CreateButton({Name="Moon Diety", Callback=function() loadstring(game:HttpGet("https://raw.githubusercontent.com/m00ndiety/Moondiety/refs/heads/main/Loader"))() end})
DeadRailsTab:CreateButton({Name="TN Hub", Callback=function() loadstring(game:HttpGet("https://raw.githubusercontent.com/thiennrb7/Script/refs/heads/main/Bringall"))() end})

local DoorsTab = Window:CreateTab("Doors", ICONS.DOORS)
DoorsTab:CreateSection("Doors Scripts")
DoorsTab:CreateButton({Name="KingHub", Callback=function() loadstring(game:HttpGet("https://raw.githubusercontent.com/KINGHUB01/BlackKing-obf/main/Doors Blackking And BobHub"))() end})
DoorsTab:CreateButton({Name="Velocity X", Callback=function() loadstring(game:HttpGet("https://raw.githubusercontent.com/DasVelocity/VelocityX/refs/heads/main/VelocityX.lua"))() end})
DoorsTab:CreateButton({Name="NullFire", Callback=function() loadstring(game:HttpGet("https://raw.githubusercontent.com/TeamNullFire/NullFire/main/loader.lua", true))("t.me/Cherruscript") end})

local BladeBallTab = Window:CreateTab("Blade Ball", ICONS.BLADE_BALL)
BladeBallTab:CreateSection("Blade Ball Scripts")
BladeBallTab:CreateButton({Name="Soluna", Callback=function() loadstring(game:HttpGet("https://soluna-script.vercel.app/bladeball.lua", true))("t.me/Cherruscript") end})
BladeBallTab:CreateButton({Name="Bedol V2", Callback=function() loadstring(game:HttpGet("https://raw.githubusercontent.com/3345-c-a-t-s-u-s/-beta-/main/AutoParry.lua"))() end})

local EvadeTab = Window:CreateTab("Evade", ICONS.EVADE)
EvadeTab:CreateSection("Evade Scripts")
EvadeTab:CreateButton({Name="Draconic X", Callback=function() loadstring(game:HttpGet("https://raw.githubusercontent.com/Nyxarth910/Draconic-Hub-X/refs/heads/main/files/Evade/Overhaul.lua", true))("t.me/Cherruscript") end})

local BloxFruitsTab = Window:CreateTab("BloxFruits", ICONS.BLOXFRUITS)
BloxFruitsTab:CreateSection("BloxFruits Scripts")
BloxFruitsTab:CreateButton({Name="RedZ Universal", Callback=function() loadstring(game:HttpGet("https://raw.githubusercontent.com/Overgustx2/TsuoLoader/refs/heads/main/Tsuo.lua", true))("t.me/Cherruscript") end})
BloxFruitsTab:CreateButton({Name="Vxeze Hub", Callback=function() loadstring(game:HttpGet("https://raw.githubusercontent.com/suntisalts/WeshkyHub/refs/heads/main/MainLoader.lua", true))("t.me/Cherruscript") end})

local ViolenceTab = Window:CreateTab("Violence", ICONS.VIOLENCE)
ViolenceTab:CreateSection("Violence Scripts")
ViolenceTab:CreateButton({Name="NXP Hub", Callback=function() loadstring(game:HttpGet("https://rawscripts.net/raw/UPDATE-Violence-District-Keyless-script-Esp-Spee-etc-49072", true))("t.me/Cherruscript") end})
ViolenceTab:CreateButton({Name="77wiki", Callback=function() loadstring(game:HttpGet("https://raw.githubusercontent.com/areyourealforme/77wiki/refs/heads/main/violencedistrict.lua"))() end})

local NightTab = Window:CreateTab("99night", ICONS.NIGHT)
NightTab:CreateSection("99 Nights Scripts")
NightTab:CreateButton({Name="Moon || Key 🗝️", Callback=function() loadstring(game:HttpGet("https://raw.githubusercontent.com/m00ndiety/99-nights-in-the-forest/refs/heads/main/Main"))() end})
NightTab:CreateButton({Name="VoidWare", Callback=function() loadstring(game:HttpGet("https://raw.githubusercontent.com/VapeVoidware/VW-Add/main/nightsintheforest.lua", true))("t.me/Cherruscript") end})
NightTab:CreateButton({Name="Crystal Hub", Callback=function() loadstring(game:HttpGet("https://raw.githubusercontent.com/shinichi-dz/phucshinsayhi/refs/heads/main/99NightsInTheForest.lua", true))("t.me/Cherruscript") end})

local PlsDonTab = Window:CreateTab("pls don", ICONS.PLS_DON)
PlsDonTab:CreateSection("Pls Donate Scripts")
PlsDonTab:CreateButton({Name="Auto thx", Callback=function() loadstring(game:HttpGet("https://raw.githubusercontent.com/mad27coder/RobloxProjectLua/refs/heads/main/AutoChat#https://raw.githubusercontent.com/mad27coder/RobloxProjectLua/refs/heads/main/AutoChat#"))() end})

local BuildBoatTab = Window:CreateTab("BuildBoat", ICONS.BUILD_BOAT)
BuildBoatTab:CreateSection("BuildBoat Scripts")
BuildBoatTab:CreateButton({Name="WeshkyHub", Callback=function() loadstring(game:HttpGet("https://raw.githubusercontent.com/suntisalts/WeshkyHub/refs/heads/main/MainLoader.lua", true))("t.me/Cherruscript") end})

local JailBreakTab = Window:CreateTab("JailBreak", ICONS.JAILBREAK)
JailBreakTab:CreateSection("JailBreak Scripts")
JailBreakTab:CreateButton({Name="Aoi Setup", Callback=function() loadstring(game:HttpGet("https://raw.githubusercontent.com/zyn789/Aoi-Script/main/Jailbreak", true))("t.me/Cherruscript") end})

local UniversalTab = Window:CreateTab("Universal", ICONS.UNIVERSAL)
UniversalTab:CreateSection("Universal Scripts")
UniversalTab:CreateButton({Name="RedZ Universal", Callback=function() loadstring(game:HttpGet("https://raw.githubusercontent.com/Overgustx2/TsuoLoader/refs/heads/main/Tsuo.lua", true))("t.me/Cherruscript") end})
UniversalTab:CreateButton({Name="Fling GUI", Callback=function() loadstring(game:HttpGet("https://raw.githubusercontent.com/0Ben1/fe./main/Fling GUI", true))("t.me/Cherruscript") end})
UniversalTab:CreateButton({Name="Fly", Callback=function() loadstring(game:HttpGet("https://pastebin.com/raw/YSL3xKYU", true))("t.me/Cherruscript") end})
UniversalTab:CreateButton({Name="Infinite Yield (IY FE)", Callback=function() loadstring(game:HttpGet("https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source"))() end})
UniversalTab:CreateButton({Name="TROLL FE", Callback=function() loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Free-AK47-universal-script-no-key-47023", true))("t.me/Cherruscript") end})
UniversalTab:CreateButton({Name="ANIMATION R15", Callback=function() loadstring(game:HttpGet("https://raw.githubusercontent.com/Boxten-Keyes/music/refs/heads/main/music%23%5Bscripts%5D/music%23%5Bmiscellaneous%5D/music%23%5Bfe%20r15%20animation%20player%5D.lua"))() end})

local InfoTab = Window:CreateTab("Info", ICONS.INFO)
InfoTab:CreateSection("Information")
InfoTab:CreateLabel("Cherru Hub v2.0")
InfoTab:CreateLabel("Author: @impossible_blade")
InfoTab:CreateLabel("Telegram: t.me/Cherruscript")
InfoTab:CreateLabel("Total Injections: " .. injectionCount)
InfoTab:CreateLabel("UI: Rayfield Library")

InfoTab:CreateSection("Statistics")
InfoTab:CreateButton({
    Name = "Reset Injection Count",
    Callback = function()
        writefile("CherryHub_Stats.txt", "0")
        Rayfield:Notify({
            Title = "Statistics Reset",
            Content = "Injection counter has been reset to 0",
            Duration = 3,
            Image = ICONS.INFO,
        })
    end,
})

Rayfield:Notify({
    Title = "Cherru Hub Loaded",
    Content = "Successfully injected! Total injections: " .. injectionCount,
    Duration = 5,
    Image = ICONS.INFO,
})

Rayfield:LoadConfiguration()
