local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()
task.wait(1)

-- Используем стандартные Lucide иконки Rayfield
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

-- CherruHub интерфейс
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

-- Статистика инъекций
local function trackInjection()
    local count = 0
    if isfile and isfile("CherryHub_Stats.txt") then
        count = tonumber(readfile("CherryHub_Stats.txt")) or 0
    end
    count = count + 1
    if writefile then
        writefile("CherryHub_Stats.txt", tostring(count))
    end
    return count
end

local injectionCount = trackInjection()

-- Безопасное создание вкладки
local function CreateTabSafe(name, icon)
    local success, tab = pcall(function()
        return Window:CreateTab(name, icon)
    end)
    if success then
        return tab
    else
        return nil
    end
end

-- Функция безопасного loadstring
local function SafeLoad(url)
    pcall(function()
        local scriptContent = game:HttpGet(url, true)
        loadstring(scriptContent)()
    end)
end

-- Создаем все вкладки
local tabs = {
    {name = "Murder", icon = ICONS.MURDER},
    {name = "Steal Brainrot", icon = ICONS.STEAL_BRAINROT},
    {name = "Dead Rails", icon = ICONS.DEAD_RAILS},
    {name = "Doors", icon = ICONS.DOORS},
    {name = "Blade Ball", icon = ICONS.BLADE_BALL},
    {name = "Evade", icon = ICONS.EVADE},
    {name = "BloxFruits", icon = ICONS.BLOXFRUITS},
    {name = "Violence", icon = ICONS.VIOLENCE},
    {name = "99night", icon = ICONS.NIGHT},
    {name = "pls don", icon = ICONS.PLS_DON},
    {name = "BuildBoat", icon = ICONS.BUILD_BOAT},
    {name = "JailBreak", icon = ICONS.JAILBREAK},
    {name = "Universal", icon = ICONS.UNIVERSAL},
    {name = "Info", icon = ICONS.INFO}
}

local createdTabs = {}

for _, tabInfo in ipairs(tabs) do
    local tab = CreateTabSafe(tabInfo.name, tabInfo.icon)
    if tab then
        createdTabs[tabInfo.name] = tab
    end
end

-- Далее добавляем кнопки так же как у тебя, например:
if createdTabs["Murder"] then
    local MurderTab = createdTabs["Murder"]
    MurderTab:CreateSection("Auto Farm")
    MurderTab:CreateButton({Name = "Auto Farm", Callback = function() SafeLoad("https://raw.githubusercontent.com/BIudnyHoIandan/MM2/refs/heads/main/primordial/script/amg.lua") end})
    MurderTab:CreateButton({Name = "YARHM", Callback = function() SafeLoad("https://rawscripts.net/raw/Universal-Script-YARHM-12403") end})
    MurderTab:CreateButton({Name = "OverDrive Hub", Callback = function() SafeLoad("https://rawscripts.net/raw/Universal-Script-overdrive-h-hub-script-key-require-39673") end})
end

-- Здесь добавляешь остальные вкладки по аналогии (Steal Brainrot, Dead Rails, Doors...)  

-- Info вкладка
if createdTabs["Info"] then
    local InfoTab = createdTabs["Info"]
    InfoTab:CreateSection("Information")
    InfoTab:CreateLabel("Cherru Hub v2.0")
    InfoTab:CreateLabel("Author: @impossible_blade")
    InfoTab:CreateLabel("Telegram: t.me/Cherruscript")
    InfoTab:CreateLabel("Total Injections: "..injectionCount)
    InfoTab:CreateLabel("UI: Rayfield Library")

    InfoTab:CreateSection("Statistics")
    InfoTab:CreateButton({
        Name = "Reset Injection Count",
        Callback = function()
            if writefile then
                writefile("CherryHub_Stats.txt", "0")
                Rayfield:Notify({
                    Title = "Statistics Reset",
                    Content = "Injection counter has been reset to 0",
                    Duration = 3,
                    Image = ICONS.INFO,
                })
            end
        end
    })
end

-- Уведомление о загрузке
Rayfield:Notify({
    Title = "Cherru Hub Loaded",
    Content = "Successfully injected! Total injections: "..injectionCount,
    Duration = 5,
    Image = ICONS.INFO,
})

Rayfield:LoadConfiguration()
