local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local MarketplaceService = game:GetService("MarketplaceService")
local player = Players.LocalPlayer
local isMobile = UserInputService.TouchEnabled
local PlaceName = MarketplaceService:GetProductInfo(game.PlaceId).Name

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "CherryHub"
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
ScreenGui.IgnoreGuiInset = true
ScreenGui.Parent = game:GetService("CoreGui")

local dragging = false
local dragInput, dragStart, startPos

local CherryButton = Instance.new("TextButton")
CherryButton.Size = UDim2.new(0, 60, 0, 60)
CherryButton.Position = UDim2.new(0, 20, 0, 20)
CherryButton.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
CherryButton.Text = "🍒"
CherryButton.TextColor3 = Color3.fromRGB(255, 0, 0)
CherryButton.Font = Enum.Font.GothamBold
CherryButton.TextSize = 30
CherryButton.ZIndex = 10
CherryButton.Parent = ScreenGui

local CherryCorner = Instance.new("UICorner")
CherryCorner.CornerRadius = UDim.new(1, 0)
CherryCorner.Parent = CherryButton

local CherryStroke = Instance.new("UIStroke")
CherryStroke.Color = Color3.fromRGB(100, 100, 100)
CherryStroke.Thickness = 2
CherryStroke.Parent = CherryButton

local function updateInput(input)
    local delta = input.Position - dragStart
    CherryButton.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
end

CherryButton.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        dragging = true
        dragStart = input.Position
        startPos = CherryButton.Position
        
        TweenService:Create(CherryButton, TweenInfo.new(0.1), {Size = UDim2.new(0, 55, 0, 55)}):Play()
        
        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then
                dragging = false
                TweenService:Create(CherryButton, TweenInfo.new(0.1), {Size = UDim2.new(0, 60, 0, 60)}):Play()
            end
        end)
    end
end)

CherryButton.InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
        dragInput = input
    end
end)

UserInputService.InputChanged:Connect(function(input)
    if input == dragInput and dragging then
        updateInput(input)
    end
end)

if not isMobile then
    CherryButton.MouseEnter:Connect(function()
        TweenService:Create(CherryButton, TweenInfo.new(0.2), {Size = UDim2.new(0, 65, 0, 65)}):Play()
        TweenService:Create(CherryButton, TweenInfo.new(0.2), {TextSize = 32}):Play()
    end)
    
    CherryButton.MouseLeave:Connect(function()
        TweenService:Create(CherryButton, TweenInfo.new(0.2), {Size = UDim2.new(0, 60, 0, 60)}):Play()
        TweenService:Create(CherryButton, TweenInfo.new(0.2), {TextSize = 30}):Play()
    end)
end

local MainFrame = Instance.new("Frame")
MainFrame.Size = UDim2.new(0.9, 0, 0.8, 0)
MainFrame.Position = UDim2.new(0.05, 0, 0.1, 0)
MainFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
MainFrame.ClipsDescendants = true
MainFrame.Visible = false
MainFrame.Parent = ScreenGui

local UICorner = Instance.new("UICorner")
UICorner.CornerRadius = UDim.new(0, 16)
UICorner.Parent = MainFrame

local UIGradient = Instance.new("UIGradient")
UIGradient.Color = ColorSequence.new{
    ColorSequenceKeypoint.new(0, Color3.fromRGB(25, 25, 25)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(40, 40, 40))
}
UIGradient.Rotation = 45
UIGradient.Parent = MainFrame

local UIStroke = Instance.new("UIStroke")
UIStroke.Color = Color3.fromRGB(100, 100, 100)
UIStroke.Thickness = 2
UIStroke.Parent = MainFrame

local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(1, 0, 0, 60)
Title.Position = UDim2.new(0, 0, 0, 0)
Title.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Title.Text = "🍒 Cherry Hub v1.0 | " .. PlaceName
Title.TextColor3 = Color3.fromRGB(255, 0, 0)
Title.Font = Enum.Font.GothamBold
Title.TextSize = 22
Title.Parent = MainFrame

local TitleCorner = Instance.new("UICorner")
TitleCorner.CornerRadius = UDim.new(0, 16)
TitleCorner.Parent = Title

local TabContainer = Instance.new("Frame")
TabContainer.Size = UDim2.new(1, -20, 0, 50)
TabContainer.Position = UDim2.new(0, 10, 0, 70)
TabContainer.BackgroundTransparency = 1
TabContainer.Parent = MainFrame

local Tabs = {"Murder", "Steal Brainrot", "Dead Rails", "Doors", "Blade Ball", "Evade", "BloxFruits", "Universal", "Info"}
local CurrentTab = "Murder"

local ContentContainer = Instance.new("ScrollingFrame")
ContentContainer.Size = UDim2.new(1, -20, 1, -150)
ContentContainer.Position = UDim2.new(0, 10, 0, 130)
ContentContainer.BackgroundTransparency = 1
ContentContainer.ScrollBarThickness = 6
ContentContainer.CanvasSize = UDim2.new(0, 0, 0, 0)
ContentContainer.AutomaticCanvasSize = Enum.AutomaticSize.Y
ContentContainer.Parent = MainFrame

local UIListLayout = Instance.new("UIListLayout")
UIListLayout.Padding = UDim.new(0, 10)
UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
UIListLayout.Parent = ContentContainer

UIListLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
    ContentContainer.CanvasSize = UDim2.new(0, 0, 0, UIListLayout.AbsoluteContentSize.Y)
end)

local function findInTable(tbl, value)
    for i, v in ipairs(tbl) do
        if v == value then
            return i
        end
    end
    return nil
end

local function UpdateTabs()
    for _, tabName in ipairs(Tabs) do
        local tab = TabContainer:FindFirstChild(tabName .. "Tab")
        if tab then
            if tabName == CurrentTab then
                TweenService:Create(tab, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(255, 85, 85)}):Play()
                tab.TextColor3 = Color3.fromRGB(255, 255, 255)
            else
                TweenService:Create(tab, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(50, 50, 50)}):Play()
                tab.TextColor3 = Color3.fromRGB(200, 200, 200)
            end
        end
    end
end

local function CreateTab(name)
    if TabContainer:FindFirstChild(name .. "Tab") then return end
    
    local TabButton = Instance.new("TextButton")
    TabButton.Name = name .. "Tab"
    TabButton.Size = UDim2.new(1 / #Tabs - 0.05, 0, 1, 0)
    
    local tabIndex = findInTable(Tabs, name)
    if tabIndex then
        TabButton.Position = UDim2.new((tabIndex - 1) * (1 / #Tabs), 0, 0, 0)
    end
    
    TabButton.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    TabButton.Text = name
    TabButton.TextColor3 = Color3.fromRGB(200, 200, 200)
    TabButton.Font = Enum.Font.GothamMedium
    TabButton.TextSize = 14
    TabButton.Parent = TabContainer
    
    local TabCorner = Instance.new("UICorner")
    TabCorner.CornerRadius = UDim.new(0, 10)
    TabCorner.Parent = TabButton

    if not isMobile then
        TabButton.MouseEnter:Connect(function()
            if CurrentTab ~= name then 
                TweenService:Create(TabButton, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(70, 70, 70)}):Play() 
            end
        end)
        TabButton.MouseLeave:Connect(function()
            if CurrentTab ~= name then 
                TweenService:Create(TabButton, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(50, 50, 50)}):Play() 
            end
        end)
    end

    TabButton.MouseButton1Click:Connect(function()
        CurrentTab = name
        UpdateTabs()
        LoadTabContent(name)
    end)
end

local function CreateScriptButton(name, url, arg)
    local Button = Instance.new("TextButton")
    Button.Size = UDim2.new(1, 0, 0, 60)
    Button.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
    Button.Text = name
    Button.TextColor3 = Color3.fromRGB(255, 255, 255)
    Button.Font = Enum.Font.GothamBold
    Button.TextSize = 18
    Button.Parent = ContentContainer
    Button.TextTransparency = 1
    
    local ButtonCorner = Instance.new("UICorner")
    ButtonCorner.CornerRadius = UDim.new(0, 12)
    ButtonCorner.Parent = Button

    if not isMobile then
        Button.MouseEnter:Connect(function() 
            TweenService:Create(Button, TweenInfo.new(0.15), {BackgroundColor3 = Color3.fromRGB(80, 80, 80)}):Play() 
        end)
        Button.MouseLeave:Connect(function() 
            TweenService:Create(Button, TweenInfo.new(0.15), {BackgroundColor3 = Color3.fromRGB(60, 60, 60)}):Play() 
        end)
    end

    Button.MouseButton1Click:Connect(function()
        pcall(function()
            if arg then
                loadstring(game:HttpGet(url, true))(arg)
            else
                loadstring(game:HttpGet(url, true))()
            end
        end)
    end)

    TweenService:Create(Button, TweenInfo.new(0.3), {TextTransparency = 0}):Play()
end

function LoadTabContent(tabName)
    for _, child in pairs(ContentContainer:GetChildren()) do
        if not child:IsA("UIListLayout") then 
            child:Destroy() 
        end
    end
    
    local function AddLabel(text)
        local label = Instance.new("TextLabel")
        label.Size = UDim2.new(1, 0, 0, 40)
        label.BackgroundTransparency = 1
        label.Text = text
        label.TextColor3 = Color3.fromRGB(200, 200, 200)
        label.Font = Enum.Font.GothamMedium
        label.TextSize = 16
        label.TextXAlignment = Enum.TextXAlignment.Left
        label.Parent = ContentContainer
    end

    if tabName == "Murder" then
        CreateScriptButton("Auto Farm", "https://raw.githubusercontent.com/BIudnyHoIandan/MM2/refs/heads/main/primordial/script/amg.lua")
        CreateScriptButton("YARHM", "https://rawscripts.net/raw/Universal-Script-YARHM-12403", "t.me/Cherruscript")
    elseif tabName == "Steal Brainrot" then
        CreateScriptButton("Fast Steal", "https://pastefy.app/J3oDjwQ5/raw")
        CreateScriptButton("Chili Hub", "https://rawscripts.net/raw/Steal-a-Brainrot-KEYLESS-TRUE-THE-BEST-STEAL-A-BRAINROT-SCRIPT-45137")
    elseif tabName == "Dead Rails" then
        CreateScriptButton("Moon Diety", "https://raw.githubusercontent.com/m00ndiety/Moondiety/refs/heads/main/Loader")
        CreateScriptButton("TN Hub", "https://raw.githubusercontent.com/thiennrb7/Script/refs/heads/main/Bringall")
    elseif tabName == "Doors" then
        CreateScriptButton("KingHub", "https://raw.githubusercontent.com/KINGHUB01/BlackKing-obf/main/Doors%20Blackking%20And%20BobHub")
        CreateScriptButton("Velocity X", "https://raw.githubusercontent.com/DasVelocity/VelocityX/refs/heads/main/VelocityX.lua")
        CreateScriptButton("NullFire", "https://raw.githubusercontent.com/TeamNullFire/NullFire/main/loader.lua", "t.me/Cherruscript")
    elseif tabName == "Blade Ball" then
        CreateScriptButton("Soluna", "https://soluna-script.vercel.app/bladeball.lua", "t.me/Cherruscript")
        CreateScriptButton("Bedol V2", "https://raw.githubusercontent.com/3345-c-a-t-s-u-s/-beta-/main/AutoParry.lua")
    elseif tabName == "Evade" then
        CreateScriptButton("Draconic X", "https://raw.githubusercontent.com/Nyxarth910/Draconic-Hub-X/refs/heads/main/files/Evade/Overhaul.lua", "t.me/Cherruscript")
    elseif tabName == "BloxFruits" then
        AddLabel("Blox Fruits scripts coming soon!")
    elseif tabName == "Universal" then
        AddLabel("Universal scripts coming soon!")
    elseif tabName == "Info" then
        AddLabel("Cherry Hub v1.0")
        AddLabel("Author: @impossible_blade")
        AddLabel("Telegram: t.me/Cherruscript")
    end
end

local function ToggleUI()
    if MainFrame.Visible then
        TweenService:Create(MainFrame, TweenInfo.new(0.3), {Size = UDim2.new(0, 0, 0.8, 0), Position = UDim2.new(0.5, 0, 0.1, 0)}):Play()
        wait(0.3)
        MainFrame.Visible = false
    else
        MainFrame.Visible = true
        MainFrame.Size = UDim2.new(0, 0, 0.8, 0)
        MainFrame.Position = UDim2.new(0.5, 0, 0.1, 0)
        TweenService:Create(MainFrame, TweenInfo.new(0.3), {Size = UDim2.new(0.9, 0, 0.8, 0), Position = UDim2.new(0.05, 0, 0.1, 0)}):Play()
    end
end

CherryButton.MouseButton1Click:Connect(ToggleUI)

for _, tabName in ipairs(Tabs) do
    CreateTab(tabName)
end

UpdateTabs()
LoadTabContent(CurrentTab)

if isMobile then
    local CloseButton = Instance.new("TextButton")
    CloseButton.Size = UDim2.new(0, 40, 0, 40)
    CloseButton.Position = UDim2.new(1, -45, 0, 10)
    CloseButton.BackgroundColor3 = Color3.fromRGB(255, 50, 50)
    CloseButton.Text = "X"
    CloseButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    CloseButton.Font = Enum.Font.GothamBold
    CloseButton.TextSize = 18
    CloseButton.Parent = MainFrame
    
    local CloseCorner = Instance.new("UICorner")
    CloseCorner.CornerRadius = UDim.new(0, 20)
    CloseCorner.Parent = CloseButton
    
    CloseButton.MouseButton1Click:Connect(function()
        ToggleUI()
    end)
end
