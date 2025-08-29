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
