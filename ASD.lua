repeat wait() until game:IsLoaded() and game.Players.LocalPlayer
_G.Primary = Color3.fromRGB(255, 255, 255)
_G.Dark = Color3.fromRGB(1, 1, 1)
----------------------------------------------------------------------------------------------------------------------------------------
_G.TieuDe = "CITY NORMAL"
_G.ThongBaoChoose = "Blox Fruits"

_G.Discord = ""
_G.YouTube = ""

_G.SafeFarm = true
assert(getrawmetatable)
    grm = getrawmetatable(game)
    setreadonly(grm, false)
    old = grm.__namecall
    grm.__namecall = newcclosure(function(self, ...)
        local args = {...}
        if tostring(args[1]) == "TeleportDetect" then
            return
        elseif tostring(args[1]) == "CHECKER_1" then
            return
        elseif tostring(args[1]) == "CHECKER" then
            return
        elseif tostring(args[1]) == "GUI_CHECK" then
            return
        elseif tostring(args[1]) == "OneMoreTime" then
            return
        elseif tostring(args[1]) == "checkingSPEED" then
            return
        elseif tostring(args[1]) == "BANREMOTE" then
            return
        elseif tostring(args[1]) == "PERMAIDBAN" then
            return
        elseif tostring(args[1]) == "KICKREMOTE" then
            return
        elseif tostring(args[1]) == "BR_KICKPC" then
            return
        elseif tostring(args[1]) == "BR_KICKMOBILE" then
            return
        end
        return old(self, ...)
    end)
function CheckAntiCheatBypass()
    for i,v in pairs(game:GetService("Players").LocalPlayer.Character:GetDescendants()) do
        if v:IsA("LocalScript") then
            if v.Name == "General" or v.Name == "Shiftlock"  or v.Name == "FallDamage" or v.Name == "4444" or v.Name == "CamBob" or v.Name == "JumpCD" or v.Name == "Looking" or v.Name == "Run" then
                v:Destroy()
            end
        end
     end
     for i,v in pairs(game:GetService("Players").LocalPlayer.PlayerScripts:GetDescendants()) do
        if v:IsA("LocalScript") then
            if v.Name == "RobloxMotor6DBugFix" or v.Name == "CustomForceField" or v.Name == "MenuBloodSp"  or v.Name == "PlayerList" then
                v:Destroy()
            end
        end
    end
end

local function bypassAntiExploit()
    for _, instance in ipairs(filtergc()) do
        if instance:IsA("AntiExploitSystem") then
            instance:Destroy()
        end
    end
end
spawn(function()
    while wait() do
        if _G.SafeFarm then
            pcall(function()
                CheckAntiCheatBypass()
                bypassAntiExploit()
            end)
        end
    end
end)
function intiAppleHub() 
_G.antiscan = true
getgenv().A = require(game:GetService("ReplicatedStorage").CombatFramework.RigLib).wrapAttackAnimationAsync
getgenv().B = require(game.Players.LocalPlayer.PlayerScripts.CombatFramework.Particle).play
_G.setfflag = true
end
spawn(function()
    while wait() do
        if _G.setfflag then
            setfflag("AbuseReportScreenshot", "False")
            setfflag("AbuseReportScreenshotPercentage", "0")
        end
    end
end)
_G.AntiFlagReset = true
spawn(function()
    while wait(2000) do
        if _G.AntiFlagReset then
            pcall(function()
            game:GetService("TeleportService"):Teleport(game.PlaceId, game:GetService("Players").LocalPlayer)
        end)
    end
   end
end)

spawn(function()
    while _G.AntiFlagReset do task.wait()
        if game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("Humanoid") then
            local HealthPercent = game.Players.LocalPlayer.Character.Humanoid.Health / game.Players.LocalPlayer.Character.Humanoid.MaxHealth * 100
            if HealthPercent < 50 then
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame * CFrame.new(0, 100, 0)
            end
        end
        task.wait()
    end
end)

local Players = game:GetService("Players")

local function onCharacterAdded(character)
    local humanoid = character:WaitForChild("Humanoid")
    humanoid.Died:Connect(function()
        humanoid.Health = 0
    end)
end

Players.PlayerAdded:Connect(function(player)
    player.CharacterAdded:Connect(onCharacterAdded)
end)

for _, player in ipairs(Players:GetPlayers()) do
    if player.Character then
        onCharacterAdded(player.Character)
    end
end


----------------------------------------------------------------------------------------------------------------------------------------
local Notification = loadstring(game:HttpGet("https://raw.githubusercontent.com/ASSISTASD/ASD/main/MASSAGE.lua"))()
----------------------------------------------------------------------------------------------------------------------------------------
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")

local function MakeDraggable(topbarobject, object)
local Dragging = nil
local DragInput = nil
local DragStart = nil
local StartPosition = nil

local function Update(input)
local Delta = input.Position - DragStart
local pos = UDim2.new(StartPosition.X.Scale, StartPosition.X.Offset + Delta.X, StartPosition.Y.Scale, StartPosition.Y.Offset + Delta.Y)
local Tween = TweenService:Create(object, TweenInfo.new(0.15), {
 Position = pos
})
Tween:Play()
end

topbarobject.InputBegan:Connect(
 function(input)
 if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
 Dragging = true
 DragStart = input.Position
 StartPosition = object.Position

 input.Changed:Connect(
  function()
  if input.UserInputState == Enum.UserInputState.End then
  Dragging = false
  end
  end
 )
 end
 end
)

topbarobject.InputChanged:Connect(
 function(input)
 if
  input.UserInputType == Enum.UserInputType.MouseMovement or
 input.UserInputType == Enum.UserInputType.Touch
 then
 DragInput = input
 end
 end
)

UserInputService.InputChanged:Connect(
 function(input)
 if input == DragInput and Dragging then
 Update(input)
 end
 end
)
end

local Update = {}

function Update:Window(text,logo,keybind)
local osfunc = {}
local uihide = false
local abc = false
local currentpage = ""
local keybind = keybind or Enum.KeyCode.RightControl
local yoo = string.gsub(tostring(keybind),"Enum.KeyCode.","")

local CITY = Instance.new("ScreenGui")
CITY.Name = "CITY"
CITY.Parent = game.CoreGui
CITY.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

local Main = Instance.new("Frame")
Main.Name = "Main"
Main.Parent = CITY
Main.ClipsDescendants = true
Main.AnchorPoint = Vector2.new(0.5,0.5)
Main.BackgroundColor3 = Color3.fromRGB(1, 1, 1)
Main.BackgroundTransparency = .1
Main.Position = UDim2.new(0.5, 0, 0.5, 0)
Main.Size = UDim2.new(0, 0, 0, 0)



--Main:TweenSize(UDim2.new(0, 656, 0, 400),"Out","Quad",0.4,true)
--Main:TweenSize(UDim2.new(0, 656, 0, 350),"Out","Quad",0.4,true)
Main:TweenSize(UDim2.new(0, 555, 0, 352),"Out","Quad",0.4,true)
local BtnStroke = Instance.new("UIStroke")

 BtnStroke.Name = "BtnStroke"
             BtnStroke.Parent = Main
             BtnStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
             BtnStroke.Color = Color3.fromRGB(1, 1, 1)            BtnStroke.LineJoinMode = Enum.LineJoinMode.Round
         BtnStroke.Thickness = 1
         BtnStroke.Transparency = 0
         BtnStroke.Enabled = true
         BtnStroke.Archivable = true

local MCNR = Instance.new("UICorner")
MCNR.Name = "MCNR"
MCNR.Parent = Main

local MBC = Instance.new("UICorner")
MBC.Name = "MCNR"
MBC.Parent = BackgroundImage

local MBCD = Instance.new("UICorner")
MBCD.Name = "lol"
MBCD.Parent = Dark

local Top = Instance.new("Frame")
Top.Name = "Top"
Top.Parent = Main
Top.BackgroundColor3 = Color3.fromRGB(1, 1, 1)
--Top.Size = UDim2.new(0, 656, 0, 27)
Top.Size = UDim2.new(0, 556, 0, 30)
Top.BackgroundTransparency = 1
local TCNR = Instance.new("UICorner")
TCNR.Name = "TCNR"
TCNR.Parent = Top
TCNR.CornerRadius = UDim.new(0,5) 

local ttittles = Instance.new("TextLabel")
ttittles.Name = "ttittles"
ttittles.Parent = Top
ttittles.BackgroundColor3 = Color3.fromRGB(1, 1, 1)
ttittles.BackgroundTransparency = 1
ttittles.Position = UDim2.new(0,30,0.05,0)
ttittles.Size = UDim2.new(0, 255, 0.05, 25)
ttittles.Font = Enum.Font.SourceSansBold
ttittles.Text = "CITY NORMAL [Free]"
ttittles.TextSize = 15.000
ttittles.TextColor3 = Color3.fromRGB(255, 255, 255)
ttittles.TextXAlignment = Enum.TextXAlignment.Left

local patch= Instance.new("TextLabel")
patch.Name = "patch"
patch.Parent = Top
patch.BackgroundColor3 = Color3.fromRGB(1, 1, 1)
patch.BackgroundTransparency = 1
patch.Position = UDim2.new(0,200,0.05,0)
patch.Size = UDim2.new(0, 255, 0.05, 25)
patch.Font = Enum.Font.SourceSansBold
patch.Text = " "
patch.TextSize = 16.000
patch.TextColor3 = _G.Primary
patch.TextXAlignment = Enum.TextXAlignment.Left

local ServerTime = Instance.new("TextLabel")
ServerTime.Name = "ServerTime"
ServerTime.Parent = Top
ServerTime.BackgroundColor3 = Color3.fromRGB(1, 1, 1)
ServerTime.BackgroundTransparency = 1.000
ServerTime.Position = UDim2.new(0.68, 0,0.074, 0)
ServerTime.Size = UDim2.new(0, 225, 0, 25)
ServerTime.Font = Enum.Font.GothamSemibold
ServerTime.Text = ""
ServerTime.TextSize = 11.000
ServerTime.TextColor3 = Color3.fromRGB(1, 1, 1)
ServerTime.TextXAlignment = Enum.TextXAlignment.Left

function osfunc:Set(textadd)
ServerTime.Text = textadd
end

local function UpdateOS()
local date = os.date("*t")
local hour = (date.hour) % 24
local ampm = hour < 12 and "AM" or "PM"
local timezone = string.format("%02i:%02i:%02i %s", ((hour -1) % 12) + 1, date.min, date.sec, ampm)
local datetime = string.format("%02d/%02d/%04d", date.day, date.month, date.year)
local LocalizationService = game:GetService("LocalizationService")
local Players = game:GetService("Players")
local player = Players.LocalPlayer
local name = player.Name
local result, code = pcall(function()
 return LocalizationService:GetCountryRegionForPlayerAsync(player)
 end)
osfunc:Set(datetime.." - "..timezone.." [" .. code .. "]")
end
spawn(function()
 while true do
 UpdateOS()
 game:GetService("RunService").RenderStepped:Wait()
 end
 end)
 
--[[
local Logo = Instance.new("ImageLabel")
	Logo.Name = "Logo"
	Logo.Parent = Main
	Logo.BackgroundColor3 = Color3.fromRGB(1, 1, 1)
	Logo.BackgroundTransparency = 1
	Logo.Position = UDim2.new(0, 10, 0, 10)
	Logo.Size = UDim2.new(0, 120, 0, 120)
	Logo.Image = "rbxassetid://18251750782"]]--
local Tab = Instance.new("Frame")
Tab.Name = "Tab"
Tab.Parent = Main
Tab.BackgroundColor3 = Color3.fromRGB(1, 1, 1)
Tab.Position = UDim2.new(0, 14, 0, 33)
Tab.BackgroundTransparency = 1
--Tab.CornerRadius = UDim.new(0,5)
Tab.Size = UDim2.new(0, 138, 0, 307)
--Tab.Size = UDim2.new(0, 150, 0, 365)

--local TabCorner = Instance.new("UICorner")

local BtnStroke = Instance.new("UIStroke")
local ScrollTab = Instance.new("ScrollingFrame")
ScrollTab.Name = "ScrollTab"
ScrollTab.Parent = Tab
ScrollTab.Active = true
ScrollTab.BackgroundColor3 = Color3.fromRGB(1, 1, 1)
ScrollTab.Position = UDim2.new(0, 0, 0, 0)
ScrollTab.BackgroundTransparency = 1
ScrollTab.Size = UDim2.new(0, 138, 0, 307)
ScrollTab.ScrollBarThickness = 0

local zzR = Instance.new("UICorner")
--PCNR.Name = "PCNR"
zzR.Parent = Tab
zzR.CornerRadius = UDim.new(0,5)

-- BtnStroke.Name = "BtnStroke"
--             BtnStroke.Parent = Tab 
--             BtnStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
--             BtnStroke.Color = Color3.fromRGB(240, 10, 10)         
--             BtnStroke.LineJoinMode = Enum.LineJoinMode.Round
--         BtnStroke.Thickness = 1
--         BtnStroke.Transparency = 0
--         BtnStroke.Enabled = true
--         BtnStroke.Archivable = true

        
local PLL = Instance.new("UIListLayout")
PLL.Name = "PLL"
PLL.Parent = ScrollTab
PLL.SortOrder = Enum.SortOrder.LayoutOrder
PLL.Padding = UDim.new(0, 2)

local PPD = Instance.new("UIPadding")
PPD.Name = "PPD"
PPD.Parent = ScrollTab
-- PPD.PaddingLeft = UDim.new(0, 2)
-- PPD.PaddingTop = UDim.new(0, 2)
local BtnStroke = Instance.new("UIStroke")
local Page = Instance.new("Frame")
Page.Name = "Page"
Page.Parent = Main
Page.BackgroundColor3 = Color3.fromRGB(1, 1, 1)
Page.Position = UDim2.new(0, 162, 0, 33)
Page.Size = UDim2.new(0, 380, 0, 308)
Page.BackgroundTransparency = 1.000
--[[
BtnStroke.Name = "BtnStroke"
            BtnStroke.Parent = Page
            BtnStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
            BtnStroke.Color = Color3.fromRGB(240, 10, 10)            BtnStroke.LineJoinMode = Enum.LineJoinMode.Round
        BtnStroke.Thickness = 1
        BtnStroke.Transparency = 0
        BtnStroke.Enabled = true
        BtnStroke.Archivable = true
]]--
local PCNR = Instance.new("UICorner")
--PCNR.Name = "PCNR"
PCNR.Parent = Page
PCNR.CornerRadius = UDim.new(0,3)

local MainPage = Instance.new("Frame")
MainPage.Name = "MainPage"
MainPage.Parent = Page
MainPage.ClipsDescendants = true
MainPage.BackgroundColor3 = Color3.fromRGB(1, 1, 1)
MainPage.BackgroundTransparency = 1.000
MainPage.Size = UDim2.new(0, 380, 0, 307)



local PageList = Instance.new("Folder")
PageList.Name = "PageList"
PageList.Parent = MainPage

local UIPageLayout = Instance.new("UIPageLayout")

UIPageLayout.Parent = PageList
UIPageLayout.SortOrder = Enum.SortOrder.LayoutOrder
UIPageLayout.EasingDirection = Enum.EasingDirection.InOut
UIPageLayout.EasingStyle = Enum.EasingStyle.Quad
UIPageLayout.FillDirection = Enum.FillDirection.Vertical
UIPageLayout.Padding = UDim.new(0, 10)
UIPageLayout.TweenTime = 0.400
UIPageLayout.GamepadInputEnabled = false
UIPageLayout.ScrollWheelInputEnabled = false
UIPageLayout.TouchInputEnabled = false

MakeDraggable(Top,Main)


UserInputService.InputBegan:Connect(function(input)
 if input.KeyCode == Enum.KeyCode.RightControl then
 if uihide == false then
 uihide = true
 Main:TweenSize(UDim2.new(0, 0, 0, 0),"In","Quad",0.4,true)
 else
  uihide = false
 Main:TweenSize(UDim2.new(0, 556, 0, 350),"Out","Quad",0.5,true)
 end
 end
 end)
local uitab = {}

function uitab:AddTab(text,img)
local BtnStroke = Instance.new("UIStroke")
local bc = Instance.new("UICorner")
local TabButton = Instance.new("TextButton")
local title = Instance.new("TextLabel")
local TUICorner = Instance.new("UICorner")
local Title = Instance.new("TextLabel")
TabButton.Parent = ScrollTab
TabButton.Name = text.."Server"
TabButton.Text = ""
TabButton.BackgroundColor3 = Color3.fromRGB(1, 1, 1)
TabButton.BackgroundTransparency = 1
TabButton.Size = UDim2.new(0, 136, 0, 30)
TabButton.Font = Enum.Font.SourceSansBold
TabButton.TextColor3 = Color3.fromRGB(1, 1, 1)
TabButton.TextSize = 12.000
TabButton.TextTransparency = 0.9

Title.Parent = TabButton
Title.BackgroundColor3 = Color3.fromRGB(1, 1, 1)
Title.BackgroundTransparency = 1.000
Title.Position = UDim2.new(0, 30, 0, 2)
Title.Size = UDim2.new(0, 100, 0, 25)
Title.Font = Enum.Font.SourceSansBold
Title.Text = "• "..text
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.TextSize = 13.000
Title.TextXAlignment = Enum.TextXAlignment.Left 
			local IDK = Instance.new("ImageLabel")
			IDK.Name = "LogoIDK"
			IDK.Parent = TabButton
			IDK.BackgroundColor3 = Color3.fromRGB(1, 1, 1)
			IDK.BackgroundTransparency = 1.000
			IDK.Position = UDim2.new(0, 6, 0, 4.5)
			IDK.Size = UDim2.new(0, 20, 0, 20)
			IDK.Image = img
TUICorner.CornerRadius = UDim.new(0, 5)
TUICorner.Parent = TabButton

-- BtnStroke.Name = "BtnStroke"
--             BtnStroke.Parent = TabButton
--             BtnStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
--             BtnStroke.Color = Color3.fromRGB(240, 10, 10)            BtnStroke.LineJoinMode = Enum.LineJoinMode.Round
--         BtnStroke.Thickness = 1
--         BtnStroke.Transparency = 0
--         BtnStroke.Enabled = true
--         BtnStroke.Archivable = true 
bc.CornerRadius = UDim.new(0, 5)
bc.Parent = TabButton

--[[
local TabFrame = Instance.new("Frame")

TabFrame.Name = "TabFrame"
TabFrame.Parent = TabButton
TabFrame.ClipsDescendants = false
--TabFrame.Position = UDim2.new(0, 0, 0, 0)
TabFrame.BackgroundColor3 = Color3.fromRGB(1, 1, 1)
TabFrame.BackgroundTransparency = 0.000
TabFrame.Size = UDim2.new(0, 0, 0, 0)
local UICornerFrame = Instance.new("UICorner")
UICornerFrame.CornerRadius = UDim.new(0, 5)
UICornerFrame.Parent = TabFrame
]]--
local MainFramePage = Instance.new("ScrollingFrame")
MainFramePage.Name = text.."_Page"
MainFramePage.Parent = PageList
MainFramePage.Active = true
MainFramePage.BackgroundColor3 = Color3.fromRGB(0, 10, 250)
MainFramePage.Position = UDim2.new(0, 0, 0, 0)
MainFramePage.BackgroundTransparency = 1
MainFramePage.Size = UDim2.new(0, 400, 0, 307)
MainFramePage.ScrollBarThickness = 0
-- MainFramePage.Padding = UDim.new(0, 2)




-- local MStroke = Instance.new("UIStroke")
--             MStroke.Parent = MainPage
--             MStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
--             MStroke.Color = Color3.fromRGB(240, 10, 10)       
--             MStroke.LineJoinMode = Enum.LineJoinMode.Round
--         MStroke.Thickness = 1
--         MStroke.Transparency = 0
--         MStroke.Enabled = true
--         MStroke.Archivable = true
        
        local zzzR = Instance.new("UICorner")
--PCNR.Name = "PCNR"
zzzR.Parent = MainPage
zzzR.CornerRadius = UDim.new(0,5)


local UIPadding = Instance.new("UIPadding")
local UIListLayout = Instance.new("UIListLayout")

UIPadding.Parent = MainFramePage
-- UIPadding.PaddingLeft = UDim.new(0, 10)
-- UIPadding.PaddingTop = UDim.new(0, 10)

UIListLayout.Padding = UDim.new(0,3)
UIListLayout.Parent = MainFramePage
UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
local tabButtons = {} -- Tabel untuk menyimpan tombol tab

-- Fungsi untuk mengaktifkan tab
function ActivateTab(tabButton)
    if activeTab then
        activeTab.BackgroundTransparency = 1
    end

    activeTab = tabButton
    activeTab.BackgroundTransparency = 0.8

    local currentpage = string.gsub(tabButton.Name, "Server", "") .. "_Page"

    for _, page in pairs(PageList:GetChildren()) do
        if page.Name == currentpage then
            UIPageLayout:JumpTo(page)
        end
    end
end

-- Loop untuk mencari dan menyimpan tombol tab dalam tabel
for _, child in pairs(ScrollTab:GetChildren()) do
    if child:IsA("TextButton") then
        table.insert(tabButtons, child)
        
        child.MouseButton1Click:Connect(function()
            ActivateTab(child)
        end)
    end
end

if abc == false then
    for _, button in ipairs(tabButtons) do
        TweenService:Create(
            button,
            TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
            {
                BackgroundTransparency = 1
            }
        ):Play()
    end

    -- Mengaktifkan tab pertama secara default saat pertama kali dijalankan
    
    ActivateTab(tabButtons[1])
    abc = true
end


game:GetService("RunService").Stepped:Connect(function()
 pcall(function()
  MainFramePage.CanvasSize = UDim2.new(0,0,0,UIListLayout.AbsoluteContentSize.Y + 20)
  ScrollTab.CanvasSize = UDim2.new(0,0,0,PLL.AbsoluteContentSize.Y + 20)
  end)
 end)
function Update:Notification(textdesc)
local NotificationHold = Instance.new("TextButton")
local NotificationFrame = Instance.new("Frame")
local OkayBtn = Instance.new("TextButton")
local OkayBtnCorner = Instance.new("UICorner")
local OkayBtnTitle = Instance.new("TextLabel")
local NotificationTitle = Instance.new("TextLabel")
local NotificationDesc = Instance.new("TextLabel")
local NotifCorner = Instance.new("UICorner")
local NotifHolderUIStroke = Instance.new("UIStroke")
local Line = Instance.new("Frame")

NotificationHold.Name = "NotificationHold"
NotificationHold.Parent = Main
NotificationHold.BackgroundColor3 = Color3.new(125,125,125)
NotificationHold.BackgroundTransparency = 1
NotificationHold.BorderSizePixel = 0
NotificationHold.Size = UDim2.new(0, 589, 0, 378)
NotificationHold.AutoButtonColor = false
NotificationHold.Font = Enum.Font.SourceSans
NotificationHold.Text = ""
NotificationHold.TextColor3 = Color3.new(255, 255, 255)
NotificationHold.TextSize = 13.000

TweenService:Create(NotificationHold, TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
 BackgroundTransparency = 1
}):Play()
wait(0.4)

NotificationFrame.Name = "NotificationFrame"
NotificationFrame.Parent = NotificationHold
NotificationFrame.AnchorPoint = Vector2.new(0.5, 0.5)
NotificationFrame.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
NotificationFrame.BorderColor3 = Color3.new(125,0,125)
NotificationFrame.BorderSizePixel = 0
NotificationFrame.Transparency = 0
NotificationFrame.ClipsDescendants = true
NotificationFrame.Position = UDim2.new(0, 295, 0, 190)
NotificationFrame.Size = UDim2.new(0, 0, 0, 0)

NotificationFrame:TweenSize(UDim2.new(0, 400, 0, 250), Enum.EasingDirection.Out, Enum.EasingStyle.Quart, .6, true)

NotifCorner.Name = "NotifCorner"
NotifCorner.Parent = NotificationFrame
NotifCorner.CornerRadius = UDim.new(0, 5)

NotifHolderUIStroke.Name = "NotifHolderUIStroke"
NotifHolderUIStroke.Parent = NotificationFrame
NotifHolderUIStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
NotifHolderUIStroke.Color = Color3.new(125,0,125)
NotifHolderUIStroke.LineJoinMode = Enum.LineJoinMode.Round
NotifHolderUIStroke.Thickness = 2
NotifHolderUIStroke.Transparency = 0
NotifHolderUIStroke.Enabled = true
NotifHolderUIStroke.Archivable = true

OkayBtn.Name = "OkayBtn"
OkayBtn.Parent = NotificationFrame
OkayBtn.BackgroundColor3 = Color3.fromRGB(190, 190, 190)
OkayBtn.BorderSizePixel = 2
OkayBtn.BorderColor3 = Color3.new(125,0,125)
OkayBtn.Position = UDim2.new(0, 125, 0, 190)
OkayBtn.Size = UDim2.new(0, 150, 0, 30)
OkayBtn.AutoButtonColor = true
OkayBtn.Font = Enum.Font.SourceSans
OkayBtn.Text = ""
OkayBtn.TextColor3 = Color3.new(255, 255, 255)
OkayBtn.TextSize = 13.000

OkayBtnCorner.CornerRadius = UDim.new(0, 5)
OkayBtnCorner.Name = "OkayBtnCorner"
OkayBtnCorner.Parent = OkayBtn

OkayBtnTitle.Name = "OkayBtnTitle"
OkayBtnTitle.Parent = OkayBtn
OkayBtnTitle.BackgroundColor3 = Color3.new(125,0,125)
OkayBtnTitle.BackgroundTransparency = 1.000
OkayBtnTitle.Size = UDim2.new(0, 150, 0, 30)
OkayBtnTitle.Text = "OK"
OkayBtnTitle.Font = Enum.Font.SourceSansBold
OkayBtnTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
OkayBtnTitle.TextSize = 22.000

NotificationTitle.Name = "NotificationTitle"
NotificationTitle.Parent = NotificationFrame
NotificationTitle.BackgroundColor3 = Color3.new(125,0,125)
NotificationTitle.BackgroundTransparency = 1.000
NotificationTitle.Position = UDim2.new(0, 0, 0, 10)
NotificationTitle.Size = UDim2.new(0, 400, 0, 25)
NotificationTitle.ZIndex = 3
NotificationTitle.Font = Enum.Font.SourceSansBold
NotificationTitle.Text = "Notification"
NotificationTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
NotificationTitle.TextSize = 22.000

Line.Name = "Line"
Line.Parent = NotificationFrame
Line.BackgroundColor3 = Color3.new(125,0,125)
Line.BorderSizePixel = 0
Line.Position = UDim2.new(0, 10, 0, 40)
Line.Size = UDim2.new(0, 380, 0, 1)

NotificationDesc.Name = "NotificationDesc"
NotificationDesc.Parent = NotificationFrame
NotificationDesc.BackgroundColor3 = _G.SectionColor
NotificationDesc.BackgroundTransparency = 1.000
NotificationDesc.Position = UDim2.new(0, 10, 0, 80)
NotificationDesc.Size = UDim2.new(0, 380, 0, 200)
NotificationDesc.Font = Enum.Font.SourceSansBold
NotificationDesc.Text = textdesc
NotificationDesc.TextScaled = false
NotificationDesc.TextColor3 = Color3.new(255, 255, 255)
NotificationDesc.TextSize = 16.000
NotificationDesc.TextWrapped = true
NotificationDesc.TextXAlignment = Enum.TextXAlignment.Center
NotificationDesc.TextYAlignment = Enum.TextYAlignment.Top

OkayBtn.MouseEnter:Connect(function()
 TweenService:Create(OkayBtn, TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
  BackgroundColor3 = Color3.fromRGB(34,34,34)}):Play()
 end)

OkayBtn.MouseLeave:Connect(function()
 TweenService:Create(OkayBtn, TweenInfo.new(.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
  BackgroundColor3 = Color3.fromRGB(25, 25, 25)}):Play()
 end)

OkayBtn.MouseButton1Click:Connect(function()
 NotificationFrame:TweenSize(UDim2.new(0, 0, 0, 0), Enum.EasingDirection.Out, Enum.EasingStyle.Quart, .6, true)

 wait(0.4)

 TweenService:Create(NotificationHold, TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
  BackgroundTransparency = 1
 }):Play()

 wait(.3)

 NotificationHold:Destroy()
 end)
end

local main = {}
function main:AddButton(text,callback)
local Button = Instance.new("Frame")
local UICorner = Instance.new("UICorner")
local TextBtn = Instance.new("TextButton")
local UICorner_2 = Instance.new("UICorner")
local Black = Instance.new("Frame")
local UICorner_3 = Instance.new("UICorner")

Button.Name = "Button"
Button.Parent = MainFramePage
Button.BackgroundColor3 = Color3.new(0,0,0)
Button.BackgroundTransparency = 1
Button.Size = UDim2.new(0, 358, 0, 33)

UICorner.CornerRadius = UDim.new(0, 5)
UICorner.Parent = Button

TextBtn.Name = "TextBtn"
TextBtn.Parent = Button
TextBtn.BackgroundColor3 = Color3.fromRGB(255, 30, 50)
TextBtn.BackgroundTransparency = .8
TextBtn.Position = UDim2.new(0, 0, 0, 0)
TextBtn.Size = UDim2.new(0, 379, 0, 33)
TextBtn.AutoButtonColor = false
TextBtn.Font = Enum.Font.SourceSansBold
TextBtn.Text = "⇒ "..text.." ⇐"
TextBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
TextBtn.TextSize = 15.000

UICorner_2.CornerRadius = UDim.new(0, 5)
UICorner_2.Parent = TextBtn

Black.Name = "Black"
Black.Parent = Button
Black.BackgroundColor3 = Color3.fromRGB(1, 1, 1)
Black.BackgroundTransparency = 1.000
Black.BorderSizePixel = 0
Black.Position = UDim2.new(0, 0, 0, 0)
Black.Size = UDim2.new(0, 379, 0, 33)

UICorner_3.CornerRadius = UDim.new(0, 5)
UICorner_3.Parent = Black

TextBtn.MouseEnter:Connect(function()
 TweenService:Create(
  Black,
  TweenInfo.new(0.4,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
  {
   BackgroundTransparency = 0.7
  }
 ):Play()
 end)
TextBtn.MouseLeave:Connect(function()
 TweenService:Create(
  Black,
  TweenInfo.new(0.4,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
  {
   BackgroundTransparency = 1
  }
 ):Play()
 end)
TextBtn.MouseButton1Click:Connect(function()
 TextBtn.TextSize = 0
 TweenService:Create(
  TextBtn,
  TweenInfo.new(0.4,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
  {
   TextSize = 15
  }
 ):Play()
 callback()
 end)
end
--[[
function main:Toggle(TogInfo,default,callback)
local toggle = false
local CheckFrame = Instance.new("Frame")
local CheckFrame2 = Instance.new("Frame")
local UIStroke = Instance.new("UIStroke")
local UIListLayout = Instance.new("UIListLayout")
local UICorner = Instance.new("UICorner")
local ImageLabel = Instance.new("ImageLabel")
local Space = Instance.new("TextLabel")
local Title = Instance.new("TextLabel")
local ImageButton = Instance.new("ImageButton")

-- Prop --
CheckFrame.Name = TogInfo or "CheckFrame"
CheckFrame.Parent = MainFramePage
CheckFrame.BackgroundColor3 = Color3.fromRGB(150, 150, 150)
CheckFrame.BackgroundTransparency = 1.000
CheckFrame.BorderSizePixel = 0
CheckFrame.Size = UDim2.new(0, 360, 0, 31)

CheckFrame2.Name = "CheckFrame2"
CheckFrame2.Parent = CheckFrame
CheckFrame2.BackgroundColor3 = Color3.fromRGB(1, 1, 1)
CheckFrame2.BorderSizePixel = 0
CheckFrame2.Position = UDim2.new(0, 1, 0, 1)
CheckFrame2.Size = UDim2.new(0, 360, 0, 31)

UIStroke.Name = "UIStroke"
UIStroke.Parent = CheckFrame2
UIStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
UIStroke.Color = Color3.fromRGB(60,60,255)
UIStroke.LineJoinMode = Enum.LineJoinMode.Round
UIStroke.Thickness = 1
UIStroke.Transparency = 0
UIStroke.Enabled = true
UIStroke.Archivable = true

UICorner.Parent = CheckFrame2
UICorner.CornerRadius = UDim.new(0, 3)

Title.Parent = CheckFrame2
Title.BackgroundColor3 = Color3.fromRGB(150, 150, 150)
Title.BackgroundTransparency = 1.000
Title.Position = UDim2.new(0, 50, 0, 0)
Title.Size = UDim2.new(0, 280, 0, 30)
Title.Font = Enum.Font.SourceSansBold
Title.Text = TogInfo or "checkBox Title"
Title.TextColor3 = Color3.fromRGB(1, 1, 1)
Title.TextSize = 15.000
Title.TextXAlignment = Enum.TextXAlignment.Left

ImageButton.Name = "ImageButton"
ImageButton.Parent = CheckFrame2
ImageButton.BackgroundColor3 = Color3.fromRGB(255,255,255)
ImageButton.BackgroundTransparency = 1.000
ImageButton.Position = UDim2.new(0, 357, 0, 3)
ImageButton.Size = UDim2.new(0, 25, 0, 25)
ImageButton.ZIndex = 2
ImageButton.Image = "rbxassetid://18251750782"
ImageButton.ImageColor3 = Color3.fromRGB(60,60,255)
ImageButton.ImageRectOffset = Vector2.new(940, 784)
ImageButton.ImageRectSize = Vector2.new(48, 48)
if default == true then
	toggle = true
game.TweenService:Create(ImageButton, TweenInfo.new(0.08, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut),
  {
   ImageColor3 = Color3.fromRGB(255,225,225)}
 ):Play()
 ImageButton.ImageRectOffset = Vector2.new(4, 836)
else
toggle = false
game.TweenService:Create(ImageButton, TweenInfo.new(0.08, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut),
  {
   ImageColor3 = Color3.fromRGB(255,255,255)}
 ):Play()
 ImageButton.ImageRectOffset = Vector2.new(940, 784)
end
pcall(callback, toggle)

ImageButton.MouseButton1Click:Connect(function()
 if toggle == false then
 game.TweenService:Create(ImageButton, TweenInfo.new(0.08, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut),
  {
   ImageColor3 = Color3.fromRGB(255,225,225)}
 ):Play()
 ImageButton.ImageRectOffset = Vector2.new(4, 836)
 else
  game.TweenService:Create(ImageButton, TweenInfo.new(0.08, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut),
  {
   ImageColor3 = Color3.fromRGB(255,255,255)}
 ):Play()
 ImageButton.ImageRectOffset = Vector2.new(940, 784)
 end
 toggle = not toggle
 pcall(callback, toggle)
 end)
end
]]--
function main:AddToggle(text,config,callback)
			config = config or false
			local toggled = config
_G.Color = Color3.fromRGB(1, 1, 1)	
_G.TrueColor = Color3.fromRGB(255, 30, 50)
local UICorner = Instance.new("UICorner")
local TogglePadding = Instance.new("UIPadding")
            local UIStroke = Instance.new("UIStroke")
			local Button = Instance.new("TextButton")
			local UICorner_2 = Instance.new("UICorner")
			local Title = Instance.new("TextLabel")
			local ToggleImage = Instance.new("TextButton")
			local UICorner_3 = Instance.new("UICorner")
			local Circle = Instance.new("Frame")
			local UICorner_4 = Instance.new("UICorner")
            local imgLabelIcon = Instance.new("ImageLabel")
			

			Button.Name = "Button"
			Button.Parent = MainFramePage
			Button.BackgroundColor3 = Color3.fromRGB(255, 30, 50)
            Button.BackgroundTransparency = .8
			Button.Size = UDim2.new(0, 379, 0, 46)
			Button.AutoButtonColor = false
			Button.Font = Enum.Font.SourceSans
			Button.Text = ""
			Button.TextColor3 = Color3.fromRGB(255, 255, 255)
			Button.TextSize = 11.000
-- TogglePadding.PaddingBottom = UDim.new(0,2)
            -- UIStroke.Name = "UIStroke"
-- UIStroke.Parent = Circle and ToggleImage
-- UIStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
-- UIStroke.Color = Color3.fromRGB(255, 30, 50)
-- UIStroke.LineJoinMode = Enum.LineJoinMode.Round
-- UIStroke.Thickness = 1
-- UIStroke.Transparency = 0
-- UIStroke.Enabled = true
-- UIStroke.Archivable = true

			UICorner_2.CornerRadius = UDim.new(0, 5)
			UICorner_2.Parent = Button

                imgLabelIcon.Name = "Icon"
				imgLabelIcon.Parent = Button
				imgLabelIcon.BackgroundColor3 = Color3.fromRGB(1, 1, 1)
				imgLabelIcon.BackgroundTransparency = 1.000
				imgLabelIcon.Position = UDim2.new(0, 5, 0, 8)
				imgLabelIcon.Size = UDim2.new(0, 30, 0, 30)
				imgLabelIcon.Image = "rbxassetid://18251750782" 

Title.Parent = Button
Title.BackgroundColor3 = Color3.fromRGB(150, 150, 150)
Title.BackgroundTransparency = 1.000
Title.Position = UDim2.new(0, 40, 0, 0)
Title.Size = UDim2.new(0, 280, 0, 46)
Title.Font = Enum.Font.SourceSansBold
Title.Text = "|  "..text
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.TextSize = 15.000
Title.TextXAlignment = Enum.TextXAlignment.Left

			ToggleImage.Name = "ToggleImage"
			ToggleImage.Parent = Button
			ToggleImage.BackgroundColor3 = Color3.fromRGB(46, 56, 56)
            ToggleImage.BackgroundTransparency = .1
			ToggleImage.Position = UDim2.new(0, 320, 0, 13)
			ToggleImage.Size = UDim2.new(0, 45, 0, 20)
			ToggleImage.Text = ""

			UICorner_3.CornerRadius = UDim.new(0, 10)
			UICorner_3.Parent = ToggleImage

			Circle.Name = "Circle"
			Circle.Parent = ToggleImage
			Circle.BackgroundColor3 = Color3.fromRGB(255, 30, 50)
            Circle.BackgroundTransparency = .7
			Circle.Position = UDim2.new(0, 2, 0, 2)
			Circle.Size = UDim2.new(0, 16, 0, 16)

			UICorner_4.CornerRadius = UDim.new(0, 10)
			UICorner_4.Parent = Circle

			ToggleImage.MouseButton1Click:Connect(function()
				if toggled == false then
					toggled = true
					UIStroke.Color = _G.TrueColor
					Circle:TweenPosition(UDim2.new(0,27,0,2),"Out","Sine",0.2,true)
					TweenService:Create(
						Circle,
						TweenInfo.new(0.4,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
						{BackgroundColor3 = _G.TrueColor}
					):Play()
				else
					toggled = false
					UIStroke.Color = _G.Color
					Circle:TweenPosition(UDim2.new(0,2,0,2),"Out","Sine",0.2,true)
					TweenService:Create(
						Circle,
						TweenInfo.new(0.4,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
						{BackgroundColor3 = Color3.fromRGB(255, 30, 50)}
					):Play()
				end
				pcall(callback,toggled)
			end)

			if config == true then
				toggled = true
				UIStroke.Color = _G.TrueColor
				Circle:TweenPosition(UDim2.new(0,27,0,2),"Out","Sine",0.4,true)
				TweenService:Create(
					Circle,
					TweenInfo.new(0.4,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
					{BackgroundColor3 = _G.TrueColor}
				):Play()
				pcall(callback,toggled)
			end
		end
--[[
function main:BigTitle(text) 
local Title = Instance.new("TextLabel")
Title.Parent = MainFramePage
Title.BackgroundColor3 = Color3.fromRGB(150, 150, 150)
Title.BackgroundTransparency = 1.000
Title.Position = UDim2.new(0, 40, 0, 0)
Title.Size = UDim2.new(0, 280, 0, 30)
Title.Font = Enum.Font.SourceSansBold
Title.Text = text
Title.TextColor3 = Color3.fromRGB(1, 1, 1)
Title.TextSize = 30.000
Title.TextXAlignment = Enum.TextXAlignment.Left
]]--
function main:AddDropdown(text,option,callback)
local isdropping = false
local Dropdown = Instance.new("Frame")
local UICorner = Instance.new("UICorner")
local UICorner_2 = Instance.new("UICorner")
local UICorner_3 = Instance.new("UICorner")
local DropTitle = Instance.new("TextLabel")
local DropScroll = Instance.new("ScrollingFrame")
local UIListLayout = Instance.new("UIListLayout")
local UIPadding = Instance.new("UIPadding")
local DropButton = Instance.new("TextButton")
local SelectItems = Instance.new("TextButton")
local DropImage = Instance.new("ImageLabel")
local UIStroke = Instance.new("UIStroke")

Dropdown.Name = "Dropdown"
Dropdown.Parent = MainFramePage
Dropdown.BackgroundColor3 = Color3.fromRGB(255, 30, 50)
Dropdown.BackgroundTransparency = .8
Dropdown.ClipsDescendants = true
Dropdown.Size = UDim2.new(0, 379, 0, 38)

-- UIStroke.Name = "UIStroke"
-- UIStroke.Parent = SelectItems
-- UIStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
-- UIStroke.Color = Color3.fromRGB(240, 10, 10)
-- UIStroke.LineJoinMode = Enum.LineJoinMode.Round
-- UIStroke.Thickness = 1
-- UIStroke.Transparency = 0
-- UIStroke.Enabled = true
-- UIStroke.Archivable = true

UICorner.CornerRadius = UDim.new(0, 3)
UICorner.Parent = Dropdown
local imgLabelIcon = Instance.new("ImageLabel")

                imgLabelIcon.Name = "Icon"
				imgLabelIcon.Parent = Dropdown
				imgLabelIcon.BackgroundColor3 = Color3.fromRGB(1, 1, 1)
				imgLabelIcon.BackgroundTransparency = 1.000
				imgLabelIcon.Position = UDim2.new(0, 5, 0, 3)
				imgLabelIcon.Size = UDim2.new(0, 30, 0, 30)
				imgLabelIcon.Image = "rbxassetid://18251750782" 

DropTitle.Name = "DropTitle"
DropTitle.Parent = Dropdown
DropTitle.BackgroundColor3 = Color3.fromRGB(255, 30, 50)
DropTitle.BackgroundTransparency = 1
DropTitle.Size = UDim2.new(0, 379, 0, 38)
DropTitle.Font = Enum.Font.SourceSansBold
DropTitle.Text = "| "..text
DropTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
DropTitle.TextSize = 15.000
DropTitle.TextXAlignment = Enum.TextXAlignment.Left 
DropTitle.Position = UDim2.new(0,40,0,0)

SelectItems.Name = "SelectItems"
SelectItems.Parent = Dropdown
SelectItems.BackgroundColor3 = Color3.fromRGB(46, 56, 56)
SelectItems.TextColor3 = Color3.fromRGB(255, 255, 255)
SelectItems.BackgroundTransparency = .1
SelectItems.Position = UDim2.new(0, 220, 0, 34)
SelectItems.Size = UDim2.new(0, 155, 0, 30)
SelectItems.Font = Enum.Font.SourceSansBold
SelectItems.TextSize = 12.000
SelectItems.Text = "Select Items.."
SelectItems.ClipsDescendants = true
SelectItems.TextXAlignment = Enum.TextXAlignment.Left

local Paddings = Instance.new("UIPadding") 
Paddings.Parent = SelectItems
Paddings.PaddingLeft = UDim.new(0, 15)
Paddings.PaddingRight = UDim.new(0, 15)

SelectItems.AnchorPoint = Vector2.new(0, 3)
-- DropScroll.AnchorPoint = Vector2.new(0, 99)
UICorner_2.Parent = SelectItems
UICorner_2.CornerRadius = UDim.new(0, 5)
UICorner_3.Parent = DropScroll
UICorner_3.CornerRadius = UDim.new(0, 5)

-- local ScrollContainer = Instance.new("Frame")
-- ScrollContainer.Name = "ScrollContainer"
-- ScrollContainer.Parent = SelectItems
-- ScrollContainer.Size = UDim2.new(1, 0, 1, 0)
-- DropScroll.BackgroundColor3 = Color3.fromRGB(1, 1, 1)

DropScroll.Name = "DropScroll"
DropScroll.Parent = Dropdown
DropScroll.Active = true
DropScroll.BackgroundColor3 = Color3.fromRGB(46, 56, 56)
DropScroll.BackgroundTransparency = .1
DropScroll.BorderSizePixel = 0
DropScroll.Position = UDim2.new(0, 2, 0, 40)
DropScroll.Size = UDim2.new(0, 375, 0, 100)
-- DropScroll.CanvasSize = UDim2.new(0, 0, 0, 0)
DropScroll.ScrollBarThickness = 3

UIListLayout.Parent = DropScroll
UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
UIListLayout.Padding = UDim.new(0, 5)

UIPadding.Parent = DropScroll
UIPadding.PaddingLeft = UDim.new(0, 5)
UIPadding.PaddingTop = UDim.new(0, 10)


for i,v in next,option do
local Item = Instance.new("TextButton")

Item.Name = "Item"
Item.Parent = DropScroll
Item.BackgroundColor3 = Color3.fromRGB(46, 56, 56)
Item.BackgroundTransparency = 1
Item.Size = UDim2.new(0, 379, 0, 26)
Item.Font = Enum.Font.SourceSansBold
Item.Text = tostring(v)
Item.TextColor3 = Color3.fromRGB(255, 255, 255)
Item.TextSize = 12.000
Item.TextTransparency = 0.500
Item.TextXAlignment = Enum.TextXAlignment.Center

Item.MouseEnter:Connect(function()
 TweenService:Create(
  Item,
  TweenInfo.new(0.3,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
  {
   TextTransparency = 0
  }
 ):Play()
 end)

Item.MouseLeave:Connect(function()
 TweenService:Create(
  Item,
  TweenInfo.new(0.3,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
  {
   TextTransparency = 0.5
  }
 ):Play()
 end)

Item.MouseButton1Click:Connect(function()
 isdropping = false
 Dropdown:TweenSize(UDim2.new(0,379,0,38),"Out","Quad",0.3,true)
 TweenService:Create(
  DropImage,
  TweenInfo.new(0.3,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
  {
   Rotation = 180
  }
 ):Play()
 callback(Item.Text)
 SelectItems.Text = Item.Text
 end)
end

DropScroll.CanvasSize = UDim2.new(0,0,0,UIListLayout.AbsoluteContentSize.Y + 10)

SelectItems.MouseButton1Click:Connect(function()
 if isdropping == false then
 isdropping = true
 Dropdown:TweenSize(UDim2.new(0,379,0,142),"Out","Quad",0.3,true)
 TweenService:Create(
  DropImage,
  TweenInfo.new(0.3,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
  {
   Rotation = 0
  }
 ):Play()
 else
  isdropping = false
 Dropdown:TweenSize(UDim2.new(0,379,0,38),"Out","Quad",0.3,true)
 TweenService:Create(
  DropImage,
  TweenInfo.new(0.3,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
  {
   Rotation = 180
  }
 ):Play()
 end
 end)

local dropfunc = {}
function dropfunc:Add(t)
local Item = Instance.new("TextButton")
Item.Name = "Item"
Item.Parent = DropScroll
Item.BackgroundColor3 = Color3.fromRGB(1, 1, 1)
Item.BackgroundTransparency = 1.000
Item.Size = UDim2.new(0, 379, 0, 26)
Item.Font = Enum.Font.SourceSansBold
Item.Text = tostring(t)
Item.TextColor3 = Color3.fromRGB(255, 255, 255)
Item.TextSize = 13.000
Item.TextTransparency = 0.500

Item.MouseEnter:Connect(function()
 TweenService:Create(
  Item,
  TweenInfo.new(0.3,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
  {
   TextTransparency = 0
  }
 ):Play()
 end)

Item.MouseLeave:Connect(function()
 TweenService:Create(
  Item,
  TweenInfo.new(0.3,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
  {
   TextTransparency = 0.5
  }
 ):Play()
 end)

Item.MouseButton1Click:Connect(function()
 isdropping = false
 Dropdown:TweenSize(UDim2.new(0,379,0,38),"Out","Quad",0.3,true)
 TweenService:Create(
  DropImage,
  TweenInfo.new(0.3,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
  {
   Rotation = 180
  }
 ):Play()
 callback(Item.Text)
 DropTitle.Text = text..": "..Item.Text
 end)
end
function dropfunc:Clear()
DropTitle.Text = tostring(text)..": "
isdropping = false
Dropdown:TweenSize(UDim2.new(0,379,0,38),"Out","Quad",0.3,true)
TweenService:Create(
 DropImage,
 TweenInfo.new(0.3,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
 {
  Rotation = 180
 }
):Play()
for i,v in next, DropScroll:GetChildren() do
if v:IsA("TextButton") then
v:Destroy()
end
end
end
return dropfunc
end
  
    function main:AddSlider(text, min, max, start, callback)
                local sliderfunc = {}
                local SliderFrame = Instance.new("Frame")
                local SliderFrame_2 = Instance.new("Frame")
                local UIStroke = Instance.new("UIStroke")
                local UICorner = Instance.new("UICorner")
                local ImageLabel = Instance.new("ImageLabel")
                local Space = Instance.new("TextLabel")
                local Title = Instance.new("TextLabel")
                local SliderInput = Instance.new("Frame")
                local SliderButton = Instance.new("Frame")
                local SliderCount = Instance.new("Frame")
                local SliderCorner = Instance.new("UICorner")
                local SliderCorner2 = Instance.new("UICorner")
                local BoxFrame = Instance.new("Frame")
                local SliderBox = Instance.new("TextBox")
                local SliderStroke = Instance.new("UIStroke")
                local Title_2 = Instance.new("TextButton")
                local UICorner_2 = Instance.new("UICorner")
                local UICorner_3 = Instance.new("UICorner")
                
                -- Prop --
                SliderFrame.Name = slidertitle or "SliderFrame"
                SliderFrame.Parent = MainFramePage
                SliderFrame.BackgroundColor3 = Color3.fromRGB(240, 240, 240)                SliderFrame.BackgroundTransparency = 1.000
                SliderFrame.BorderSizePixel = 0
                SliderFrame.Size = UDim2.new(0, 379, 0, 60)
            
                SliderFrame_2.Name = "SliderFrame_2"
                SliderFrame_2.Parent = SliderFrame
                SliderFrame_2.BackgroundColor3 = Color3.fromRGB(255, 30, 50)
                SliderFrame_2.BackgroundTransparency = .8
                SliderFrame_2.BorderSizePixel = 0
                SliderFrame_2.Position = UDim2.new(0, 1, 0, 1)
                SliderFrame_2.Size = UDim2.new(0, 379, 0, 60)
                
                -- UIStroke.Name = "UIStroke"
                -- UIStroke.Parent = SliderFrame_2
                -- UIStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
                -- UIStroke.Color = Color3.fromRGB(240, 10, 10)      
                -- UIStroke.LineJoinMode = Enum.LineJoinMode.Round
                -- UIStroke.Thickness = 1
                -- UIStroke.Transparency = 0
                -- UIStroke.Enabled = true
                -- UIStroke.Archivable = true
                
                UICorner.Parent = SliderFrame_2
                UICorner.CornerRadius = UDim.new(0, 3)
                
                ImageLabel.Name = "ImageLabel"
                ImageLabel.Parent = SliderFrame_2
                ImageLabel.BackgroundColor3 = Color3.fromRGB(240, 240, 240)        
                ImageLabel.BackgroundTransparency = 1.000
                ImageLabel.BorderSizePixel = 0
                ImageLabel.Position = UDim2.new(0, 7.5, 0, 7.5)
                ImageLabel.Size = UDim2.new(0, 30, 0, 30)
                ImageLabel.Image = "rbxassetid://18251750782"
                
                
                
            
                Title.Parent = SliderFrame_2
Title.BackgroundColor3 = Color3.fromRGB(150, 150, 150)
Title.BackgroundTransparency = 1.000
Title.Position = UDim2.new(0, 45, 0, 5)
Title.Size = UDim2.new(0, 280, 0, 30)
Title.Font = Enum.Font.SourceSansBold
Title.Text = "|  "..text
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.TextSize = 15.000
Title.TextXAlignment = Enum.TextXAlignment.Left
                
                SliderInput.Name = "SliderInput"
                SliderInput.Parent = SliderFrame_2
                SliderInput.BackgroundColor3 = Color3.fromRGB(46, 56, 56) 
                SliderInput.BackgroundTransparency = 0
                SliderInput.BorderSizePixel = 0
                SliderInput.Position = UDim2.new(0, 8, 0, 42)
                SliderInput.Size = UDim2.new(0, 364, 0, 6)
                
                SliderCorner2.CornerRadius = UDim.new(0, 100000)
                SliderCorner2.Parent = SliderInput
                
                SliderButton.Name = "SliderButton"
                SliderButton.Parent = SliderInput
                SliderButton.BackgroundColor3 = Color3.fromRGB(46, 56, 56)              SliderButton.BackgroundTransparency = 1.000
                SliderButton.BorderSizePixel = 0
                SliderButton.Position = UDim2.new(0, 0, 0, -7)
                SliderButton.Size = UDim2.new(0, 300, 0, 25)
            
                SliderCount.Name = "SliderCount"
                SliderCount.Parent = SliderButton
                SliderCount.BackgroundColor3 = Color3.fromRGB(50, 10, 20)           
                SliderCount.BackgroundTransparency = 0
                SliderCount.BorderSizePixel = 0
                SliderCount.Position = UDim2.new(0,start,0,0)
                SliderCount.Size = UDim2.new(0, 18, 0, 18)
               
                Title_2.Name = "Title_2"
                Title_2.Parent = SliderButton
                Title_2.AnchorPoint = Vector2.new(0, 0)
                Title_2.BackgroundColor3 = Color3.fromRGB(1, 1, 1)     
                Title_2.AutoButtonColor = false
                Title_2.BackgroundTransparency = 1.000
                Title_2.Position = UDim2.new(0,start,0,0)
                Title_2.Size = UDim2.new(0, 18, 0, 18)
                Title_2.Font = Enum.Font.SourceSansBold
                Title_2.Text = tostring(start and math.floor((start / max) * (max - min) + min) or 0)
                Title_2.TextColor3 = Color3.fromRGB(255, 255, 255)
                Title_2.TextSize = 8.000
                Title_2.TextXAlignment = Enum.TextXAlignment.Center
                
                UICorner_2.Parent = Title_2
                UICorner_2.CornerRadius = UDim.new(0, 100000)
                
                SliderCorner.CornerRadius = UDim.new(0, 100000)
                SliderCorner.Parent = SliderCount
                
                -- SliderStroke.Name = "SliderStroke"
                -- SliderStroke.Parent = BoxFrame
                -- SliderStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
                -- SliderStroke.Color = Color3.fromRGB(240, 10, 10)          
                -- SliderStroke.LineJoinMode = Enum.LineJoinMode.Round
                -- SliderStroke.Thickness = 1
                -- SliderStroke.Transparency = 0.5
                -- SliderStroke.Enabled = true
                -- SliderStroke.Archivable = true
                
                BoxFrame.Name = "BoxFrame"
                BoxFrame.Parent = SliderFrame_2
                BoxFrame.BackgroundColor3 = Color3.fromRGB(1, 1, 1)   
                             BoxFrame.BackgroundTransparency = 1.000
                BoxFrame.Size = UDim2.new(0, 50, 0, 15)
                BoxFrame.Position = UDim2.new(0, 319, 0, 8)
            
                SliderBox.Name = "SliderBox"
                SliderBox.Parent = BoxFrame
                SliderBox.BackgroundColor3 = Color3.fromRGB(46, 56, 56)
                SliderBox.BackgroundTransparency = .1
                SliderBox.BorderSizePixel = 0
                SliderBox.Position = UDim2.new(0, 0, 0, 1.65)
                SliderBox.Size = UDim2.new(0, 50, 0, 15)
                SliderBox.ClearTextOnFocus = false
                SliderBox.Font = Enum.Font.Code
                SliderBox.Text = tostring(start and math.floor((start / max) * (max - min) + min) or 0)
                SliderBox.TextColor3 = Color3.fromRGB(255, 255, 255)
                SliderBox.TextSize = 10.000
                SliderBox.TextTransparency = 0
                SliderBox.TextXAlignment = Enum.TextXAlignment.Center
                SliderBox.TextEditable = true
                
                UICorner_3.Parent = BoxFrame
                UICorner_3.CornerRadius = UDim.new(0, 2)
                
                -- Slider Script --
                local dragging
                local SliderButtonStart
                local SliderButtonInput
                local slide = SliderButton
                
                local function slide(input)
                    local slidein = UDim2.new(math.clamp((input.Position.X - SliderButton.AbsolutePosition.X) / SliderButton.AbsoluteSize.X, 0, 1), 0, 0, 0)
                    SliderCount:TweenPosition(slidein, Enum.EasingDirection.InOut, Enum.EasingStyle.Linear, 0.08, true)
                    Title_2:TweenPosition(slidein, Enum.EasingDirection.InOut, Enum.EasingStyle.Linear, 0.12, true)
                    local Value = math.floor(((slidein.X.Scale * max) / max) * (max - min) + min)
                    SliderBox.Text = tostring(Value)
                    Title_2.Text = tostring(Value)
                    pcall(callback, Value, slidein)
                end
            
                SliderButton.InputBegan:Connect(function(input)
                    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
                        dragging = true
                        SliderButtonInput = input
                        SliderButtonStart = input.Position.X
                        slidein = SliderButton.AbsolutePosition.X
                        game.TweenService:Create(SliderCount, TweenInfo.new(0.08, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut), {BackgroundTransparency = 0, Size = UDim2.new(0, 14, 0, 14)}):Play()
                        game.TweenService:Create(Title_2, TweenInfo.new(0.12, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut), {AnchorPoint = Vector2.new(0.22, 0.8), TextSize = 13.000, BackgroundTransparency = 0, Size = UDim2.new(0, 25, 0, 25)}):Play()
                        game.TweenService:Create(SliderBox, TweenInfo.new(0.08, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut), {TextTransparency = 0}):Play()
                        game.TweenService:Create(SliderInput, TweenInfo.new(0.08, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut), {BackgroundTransparency = 0.5}):Play()
                        game.TweenService:Create(SliderStroke, TweenInfo.new(0.08, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut), {Transparency = 0}):Play()
                    end
                    input.Changed:Connect(function(input)
                        if input.UserInputType == Enum.UserInputState.End then
                        dragging = false
                        
                        end
                    end)
                end)
                SliderButton.InputEnded:Connect(function(input)
                    if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
                        dragging = false
                        SliderButtonInput = input
                        game.TweenService:Create(SliderCount, TweenInfo.new(0.08, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut), {BackgroundTransparency = 0.3, Size = UDim2.new(0, 18, 0, 18)}):Play()
                        game.TweenService:Create(Title_2, TweenInfo.new(0.12, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut), {AnchorPoint = Vector2.new(0, 0), TextSize = 8.000, BackgroundTransparency = 1.000, Size = UDim2.new(0, 18, 0, 18)}):Play()
                        game.TweenService:Create(SliderBox, TweenInfo.new(0.08, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut), {TextTransparency = 0.5}):Play()
                        game.TweenService:Create(SliderInput, TweenInfo.new(0.08, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut), {BackgroundTransparency = 0.7}):Play()
                        game.TweenService:Create(SliderStroke, TweenInfo.new(0.08, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut), {Transparency = 0.5}):Play()
                    end
                end)
                UserInputService.InputChanged:Connect(function(input)
                    if input == SliderButtonInput and dragging then
                        slide(input)
                    end
                end)
                
                function set(property)
                    if property == "Text" then
                        if tonumber(SliderBox.Text) then 
                            if tonumber(SliderBox.Text) <= max then
                                Value = SliderBox.Text
                                Title_2.Text = SliderBox.Text
                                SliderCount:TweenPosition(UDim2.new(((tonumber(SliderBox.Text) or min) - min) / (max - min), 0, 0, 0), "InOut", "Linear", 0.08, true)
                                Title_2:TweenPosition(UDim2.new(((tonumber(SliderBox.Text) or min) - min) / (max - min), 0, 0, 0), "InOut", "Linear", 0.12, true)
                                pcall(function()
                                    callback(Value)
                                end)
                            end
                            if tonumber(SliderBox.Text) > max then
                                SliderBox.Text = max
                                Title_2.Text = max
                                Value = max
                                SliderCount:TweenPosition(UDim2.new(((max or min) - min) / (max - min), 0, 0, 0), "InOut", "Linear", 0.08, true)
                                Title_2:TweenPosition(UDim2.new(((max or min) - min) / (max - min), 0, 0, 0), "InOut", "Linear", 0.12, true)
                                pcall(function()
                                    callback(Value)
                                end)
                            end
                            if tonumber(SliderBox.Text) >= min then
                                Value = SliderBox.Text
                                Title_2.Text = SliderBox.Text
                                SliderCount:TweenPosition(UDim2.new(((tonumber(SliderBox.Text) or min) - min) / (max - min), 0, 0, 0), "InOut", "Linear", 0.08, true)
                                Title_2:TweenPosition(UDim2.new(((tonumber(SliderBox.Text) or min) - min) / (max - min), 0, 0, 0), "InOut", "Linear", 0.12, true)
                                pcall(function()
                                    callback(Value)
                                end)
                            end
                            if tonumber(SliderBox.Text) < min then
                                Value = min
                                Title_2 = min
                                SliderCount.Position = UDim2.new(((min or min) - min) / (max - min), 0, 0, 0)
                                Title_2.Position = UDim2.new(((min or min) - min) / (max - min), 0, 0, 0)
                                pcall(function()
                                    callback(Value)
                                end)
                            end
                        else
                            SliderBox.Text = "" or Value
                            Title_2.Text = Value
                        end
                    end
                end
                
                SliderBox.Focused:Connect(function()
                    SliderBox.Changed:Connect(set)
                end)
                
                SliderBox.FocusLost:Connect(function(enterP)
                    if not enterP then
                        if SliderBox.Text == "" then
                            SliderBox.Text = min
                            Title_2.Text = min
                            Value = min
                            SliderCount:TweenPosition(UDim2.new(((min) - min) / (max - min), 0, 0, 0), "InOut", "Linear", 0.08, true)
                            Title_2:TweenPosition(UDim2.new(((min) - min) / (max - min), 0, 0, 0), "InOut", "Linear", 0.12, true)
                            pcall(function()
                                callback(Value)
                            end)
                        end
                        if tonumber(SliderBox.Text) > tonumber(max) then
                            Value = max
                            SliderBox.Text = max
                            Title_2.Text = max
                            SliderCount:TweenPosition(UDim2.new(((max or min) - min) / (max - min), 0, 0, 0), "InOut", "Linear", 0.08, true)
                            Title_2:TweenPosition(UDim2.new(((max or min) - min) / (max - min), 0, 0, 0), "InOut", "Linear", 0.12, true)
                            pcall(function()
                                callback(Value)
                            end)
                        else
                            Value = tonumber(SliderBox.Text)
                        end
                        if tonumber(SliderBox.Text) < min then
                            SliderBox.Text = min
                            Title_2.Text = min
                            Value = min
                            SliderCount:TweenPosition(UDim2.new(((min) - min) / (max - min), 0, 0, 0), "InOut", "Linear", 0.08, true)
                            Title_2:TweenPosition(UDim2.new(((min) - min) / (max - min), 0, 0, 0), "InOut", "Linear", 0.12, true)
                            pcall(function()
                                callback(Value)
                            end)
                        else
                            Value = tonumber(SliderBox.Text)
                        end
                    end
                    if tonumber(SliderBox.Text) > max then
                        SliderBox.Text = max
                        Title_2.Text = max
                        Value = max
                        SliderCount:TweenPosition(UDim2.new(((max or min) - min) / (max - min), 0, 0, 0), "InOut", "Linear", 0.08, true)
                        Title_2:TweenPosition(UDim2.new(((max or min) - min) / (max - min), 0, 0, 0), "InOut", "Linear", 0.12, true)
                        pcall(function()
                            callback(Value)
                        end)
                    else
                        Value = tonumber(SliderBox.Text)
                    end
                    if tonumber(SliderBox.Text) < min then
                        SliderBox.Text = min
                        Title_2.Text = min
                        Value = min
                        SliderCount.Position = UDim2.new(((min) - min) / (max - min), 0, 0, 0)
                        Title_2.Position = UDim2.new(((min) - min) / (max - min), 0, 0, 0)
                        pcall(function()
                            callback(Value)
                        end)
                    else
                        Value = tonumber(SliderBox.Text)
                    end
                    if SliderBox.Text == "" then
                        SliderBox.Text = min
                        Title_2.Text = min
                        Value = min
                        SliderCount:TweenPosition(UDim2.new(((min) - min) / (max - min), 0, 0, 0), "InOut", "Linear", 0.08, true)
                        Title_2:TweenPosition(UDim2.new(((min) - min) / (max - min), 0, 0, 0), "InOut", "Linear", 0.12, true)
                        pcall(function()
                            callback(Value)
                        end)
                    end
                end)
                return sliderfunc
            end

function main:AddSlider2(text,min,max,set,callback)
local Slider = Instance.new("Frame")
local slidercorner = Instance.new("UICorner")
local sliderr = Instance.new("Frame")
local sliderrcorner = Instance.new("UICorner")
local ImageLabel = Instance.new("ImageLabel")
local SliderStroke = Instance.new("UIStroke")
local Title = Instance.new("TextLabel")
local HAHA = Instance.new("Frame")
local AHEHE = Instance.new("TextButton")
local bar = Instance.new("Frame")
local bar1 = Instance.new("Frame")
local bar1corner = Instance.new("UICorner")
local barcorner = Instance.new("UICorner")
local circlebar = Instance.new("Frame")
local UICorner = Instance.new("UICorner")
local slidervalue = Instance.new("Frame")
local valuecorner = Instance.new("UICorner")
local TextBox = Instance.new("TextBox")
local UICorner_2 = Instance.new("UICorner")
local posto = Instance.new("UIStroke")

Slider.Name = "Slider"
Slider.Parent = MainFramePage
Slider.BackgroundColor3 = Color3.fromRGB(1, 1, 1)
Slider.BackgroundTransparency = 1
Slider.Size = UDim2.new(0, 379, 0, 60)

slidercorner.CornerRadius = UDim.new(0, 5)
slidercorner.Name = "slidercorner"
slidercorner.Parent = Slider

sliderr.Name = "sliderr"
sliderr.Parent = Slider
sliderr.BackgroundColor3 = Color3.fromRGB(255, 30, 50)
sliderr.BackgroundTransparency = .8
sliderr.Position = UDim2.new(0, 1, 0, 1)
sliderr.Size = UDim2.new(0, 379, 0, 60)

sliderrcorner.CornerRadius = UDim.new(0, 5)
sliderrcorner.Name = "sliderrcorner"
sliderrcorner.Parent = sliderr

                ImageLabel.Name = "ImageLabel"
                ImageLabel.Parent = sliderr
                ImageLabel.BackgroundColor3 = Color3.fromRGB(1, 1, 1)        
                ImageLabel.BackgroundTransparency = 1.000
                ImageLabel.BorderSizePixel = 0
                ImageLabel.Position = UDim2.new(0, 7.5, 0, 7.5)
                ImageLabel.Size = UDim2.new(0, 30, 0, 30)
                ImageLabel.Image = "rbxassetid://18251750782"
                
                
                
            
                Title.Parent = sliderr
Title.BackgroundColor3 = Color3.fromRGB(150, 150, 150)
Title.BackgroundTransparency = 1.000
Title.Position = UDim2.new(0, 45, 0, 5)
Title.Size = UDim2.new(0, 280, 0, 30)
Title.Font = Enum.Font.SourceSansBold
Title.Text = "|  "..text
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.TextSize = 15.000
Title.TextXAlignment = Enum.TextXAlignment.Left

HAHA.Name = "HAHA"
HAHA.Parent = sliderr
HAHA.BackgroundColor3 = Color3.fromRGB(1, 1, 1)
HAHA.BackgroundTransparency = 1.000
HAHA.Size = UDim2.new(0, 359, 0, 29)

AHEHE.Name = "AHEHE"
AHEHE.Parent = sliderr
AHEHE.BackgroundColor3 = Color3.fromRGB(1, 1, 1)
AHEHE.BackgroundTransparency = 1.000
AHEHE.Position = UDim2.new(0, 10, 0, 42)
AHEHE.Size = UDim2.new(0, 359, 0, 5)
AHEHE.Font = Enum.Font.SourceSans
AHEHE.Text = ""
AHEHE.TextColor3 = Color3.fromRGB(255, 255, 255)
AHEHE.TextSize = 14.000

bar.Name = "bar"
bar.Parent = AHEHE
bar.BackgroundColor3 = Color3.fromRGB(255, 10, 10)
bar.Size = UDim2.new(0, 359, 0, 5)
bar.BackgroundTransparency = .8

bar1.Name = "bar1"
bar1.Parent = bar
bar1.BackgroundColor3 = Color3.fromRGB(46, 56, 56)
bar1.BackgroundTransparency = 0
bar1.Size = UDim2.new(set/max, 0, 0, 5)

bar1corner.CornerRadius = UDim.new(0, 5)
bar1corner.Name = "bar1corner"
bar1corner.Parent = bar1

barcorner.CornerRadius = UDim.new(0, 5)
barcorner.Name = "barcorner"
barcorner.Parent = bar

                -- SliderStroke.Name = "SliderStroke"
                -- SliderStroke.Parent = sliderr
                -- SliderStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
                -- SliderStroke.Color = Color3.fromRGB(240, 10, 10)          
                -- SliderStroke.LineJoinMode = Enum.LineJoinMode.Round
                -- SliderStroke.Thickness = 1
                -- SliderStroke.Transparency = 0
                -- SliderStroke.Enabled = true
                -- SliderStroke.Archivable = true

circlebar.Name = "circlebar"
circlebar.Parent = bar1
circlebar.BackgroundColor3 = Color3.fromRGB(46, 56, 56)
circlebar.Position = UDim2.new(1, -2, 0, -3)
circlebar.Size = UDim2.new(0, 10, 0, 10)

UICorner.CornerRadius = UDim.new(0, 100)
UICorner.Parent = circlebar

slidervalue.Name = "slidervalue"
slidervalue.Parent = sliderr
slidervalue.BackgroundColor3 = Color3.fromRGB(46, 56, 56)
slidervalue.BackgroundTransparency = .1
slidervalue.Position = UDim2.new(0, 319, 0, 10)
slidervalue.Size = UDim2.new(0, 50, 0, 15)

valuecorner.CornerRadius = UDim.new(0, 2)
valuecorner.Name = "valuecorner"
valuecorner.Parent = slidervalue

TextBox.Parent = slidervalue
TextBox.BackgroundColor3 = Color3.fromRGB(46, 56, 56)
TextBox.BackgroundTransparency = .1
TextBox.Position = UDim2.new(0, 0, 0, 0)
TextBox.Size = UDim2.new(0, 50, 0, 16)
TextBox.Font = Enum.Font.Code
TextBox.TextColor3 = Color3.fromRGB(255, 255, 255)
TextBox.TextSize = 9.000
TextBox.Text = set
TextBox.TextTransparency = .1
TextBox.ClearTextOnFocus = false
TextBox.TextXAlignment = Enum.TextXAlignment.Center

-- posto.Name = "posto"
-- posto.Parent = TextBox
-- posto.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
-- posto.Color = Color3.fromRGB(240, 10, 10)posto.LineJoinMode = Enum.LineJoinMode.Round
-- posto.Thickness = 1
-- posto.Transparency = 0.6
-- posto.Enabled = true
-- posto.Archivable = true

UICorner_2.CornerRadius = UDim.new(0, 3)
UICorner_2.Parent = TextBox

local mouse = game.Players.LocalPlayer:GetMouse()
local uis = game:GetService("UserInputService")

if Value == nil then
Value = set
pcall(function()
 callback(Value)
 end)
end

AHEHE.MouseButton1Down:Connect(function()
 Value = math.floor((((tonumber(max) - tonumber(min)) / 349) * bar1.AbsoluteSize.X) + tonumber(min)) or 0
 pcall(function()
  callback(Value)
  end)
 bar1.Size = UDim2.new(0, math.clamp(mouse.X - bar1.AbsolutePosition.X, 0, 349), 0, 5)
 circlebar.Position = UDim2.new(0, math.clamp(mouse.X - bar1.AbsolutePosition.X - 2, 0, 349), 0, -3)
 moveconnection = mouse.Move:Connect(function()
  TextBox.Text = Value
  Value = math.floor((((tonumber(max) - tonumber(min)) / 349) * bar1.AbsoluteSize.X) + tonumber(min))
  pcall(function()
   callback(Value)
   end)
  bar1.Size = UDim2.new(0, math.clamp(mouse.X - bar1.AbsolutePosition.X, 0, 349), 0, 5)
  circlebar.Position = UDim2.new(0, math.clamp(mouse.X - bar1.AbsolutePosition.X - 2, 0, 349), 0, -3)
  end)
 releaseconnection = uis.InputEnded:Connect(function(Mouse)
  if Mouse.UserInputType == Enum.UserInputType.MouseButton1 then
  Value = math.floor((((tonumber(max) - tonumber(min)) / 349) * bar1.AbsoluteSize.X) + tonumber(min))
  pcall(function()
   callback(Value)
   end)
  bar1.Size = UDim2.new(0, math.clamp(mouse.X - bar1.AbsolutePosition.X, 0, 349), 0, 5)
  circlebar.Position = UDim2.new(0, math.clamp(mouse.X - bar1.AbsolutePosition.X - 2, 0, 349), 0, -3)
  moveconnection:Disconnect()
  releaseconnection:Disconnect()
  end
  end)
 end)
releaseconnection = uis.InputEnded:Connect(function(Mouse)
 if Mouse.UserInputType == Enum.UserInputType.MouseButton1 then
 Value = math.floor((((tonumber(max) - tonumber(min)) / 349) * bar1.AbsoluteSize.X) + tonumber(min))
 TextBox.Text = Value
 end
 end)

TextBox.FocusLost:Connect(function()
 if tonumber(TextBox.Text) > max then
 TextBox.Text = max
 end
 bar1.Size = UDim2.new((TextBox.Text or 0) / max, 0, 0, 5)
 circlebar.Position = UDim2.new(1, -2, 0, -3)
 TextBox.Text = tostring(TextBox.Text and math.floor((TextBox.Text / max) * (max - min) + min))
 pcall(callback, TextBox.Text)
 end)
end

function main:AddTextbox(text,disappear,callback)
local Textbox = Instance.new("Frame")
local TextboxCorner = Instance.new("UICorner")
local Textboxx = Instance.new("Frame")
local TextboxxCorner = Instance.new("UICorner")
local TextboxLabel = Instance.new("TextLabel")
local txtbtn = Instance.new("TextButton")
local RealTextbox = Instance.new("TextBox")
local UICorner = Instance.new("UICorner")

Textbox.Name = "Textbox"
Textbox.Parent = MainFramePage
Textbox.BackgroundColor3 = Color3.new(255,130,0)
Textbox.BackgroundTransparency = 0
Textbox.Size = UDim2.new(0, 379, 0, 31)

TextboxCorner.CornerRadius = UDim.new(0, 5)
TextboxCorner.Name = "TextboxCorner"
TextboxCorner.Parent = Textbox

Textboxx.Name = "Textboxx"
Textboxx.Parent = Textbox
Textboxx.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
Textboxx.Position = UDim2.new(0, 1, 0, 1)
Textboxx.Size = UDim2.new(0, 385, 0, 29)

TextboxxCorner.CornerRadius = UDim.new(0, 5)
TextboxxCorner.Name = "TextboxxCorner"
TextboxxCorner.Parent = Textboxx

TextboxLabel.Name = "TextboxLabel"
TextboxLabel.Parent = Textbox
TextboxLabel.BackgroundColor3 = Color3.fromRGB(1, 1, 1)TextboxLabel.BackgroundTransparency = 1.000
TextboxLabel.Position = UDim2.new(0, 15, 0, 0)
TextboxLabel.Text = text
TextboxLabel.Size = UDim2.new(0, 145, 0, 31)
TextboxLabel.Font = Enum.Font.SourceSansBold
TextboxLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
TextboxLabel.TextSize = 16.000
TextboxLabel.TextTransparency = 0
TextboxLabel.TextXAlignment = Enum.TextXAlignment.Left

txtbtn.Name = "txtbtn"
txtbtn.Parent = Textbox
txtbtn.BackgroundColor3 = Color3.fromRGB(1, 1, 1)
txtbtn.BackgroundTransparency = 1.000
txtbtn.Position = UDim2.new(0, 1, 0, 1)
txtbtn.Size = UDim2.new(0, 379, 0, 29)
txtbtn.Font = Enum.Font.SourceSans
txtbtn.Text = ""
txtbtn.TextColor3 = Color3.fromRGB(255, 255, 255)
txtbtn.TextSize = 14.000

RealTextbox.Name = "RealTextbox"
RealTextbox.Parent = Textbox
RealTextbox.BackgroundColor3 = Color3.fromRGB(1, 1, 1)
RealTextbox.BackgroundTransparency = 0
RealTextbox.Position = UDim2.new(0, 275, 0, 4)
RealTextbox.Size = UDim2.new(0, 100, 0, 24)
RealTextbox.Font = Enum.Font.SourceSansBold
RealTextbox.Text = ""
RealTextbox.TextColor3 = Color3.fromRGB(225, 225, 225)
RealTextbox.TextSize = 11.000
RealTextbox.TextTransparency = 0

RealTextbox.FocusLost:Connect(function()
 callback(RealTextbox.Text)
 if disappear then
 RealTextbox.Text = ""
 end
 end)

UICorner.CornerRadius = UDim.new(0, 5)
UICorner.Parent = RealTextbox
end
function main:AddLabel(text)
local Label = Instance.new("TextLabel")
local PaddingLabel = Instance.new("UIPadding")
local labelfunc = {}

Label.Name = "Label"
Label.Parent = MainFramePage
Label.BackgroundColor3 = Color3.fromRGB(1, 1, 1)
Label.BackgroundTransparency = 1.000
Label.Size = UDim2.new(0, 410, 0, 20)
Label.Font = Enum.Font.SourceSansBold
Label.TextColor3 = Color3.fromRGB(225, 225, 225)
Label.TextSize = 16.000
Label.Text = text
Label.TextXAlignment = Enum.TextXAlignment.Left

PaddingLabel.PaddingLeft = UDim.new(0,15)
PaddingLabel.Parent = Label
PaddingLabel.Name = "PaddingLabel"

function labelfunc:Set(newtext)
Label.Text = newtext
end
return labelfunc
end

function main:AddLabel1(text)
local Label1 = Instance.new("TextLabel")
local PaddingLabel1 = Instance.new("UIPadding")
local Label1func = {}

Label1.Name = "Label1"
Label1.Parent = MainFramePage
Label1.BackgroundColor3 = Color3.fromRGB(1, 1, 1)
Label1.BackgroundTransparency = 1.000
Label1.Size = UDim2.new(0, 410, 0, 20)
Label1.Font = Enum.Font.SourceSansBold
Label1.TextColor3 = Color3.fromRGB(255, 255, 255)
Label1.TextSize = 15.000
Label1.Text = text
Label1.TextXAlignment = Enum.TextXAlignment.Left

PaddingLabel1.PaddingLeft = UDim.new(0,15)
PaddingLabel1.Parent = Label1
PaddingLabel1.Name = "PaddingLabel1"
function Label1func:Refresh(tochange)
Label1.Text = tochange
end

return Label1func
end
            
            

function main:AddTextbox(text,disappear,callback)
local Textbox = Instance.new("Frame")
local TextboxCorner = Instance.new("UICorner")
local Textboxx = Instance.new("Frame")
local TextboxxCorner = Instance.new("UICorner")
local TextboxLabel = Instance.new("TextLabel")
local txtbtn = Instance.new("TextButton")
local RealTextbox = Instance.new("TextBox")
local UICorner = Instance.new("UICorner")

Textbox.Name = "Textbox"
Textbox.Parent = MainFramePage
Textbox.BackgroundColor3 = Color3.new(255,130,0)
Textbox.BackgroundTransparency = 0
Textbox.Size = UDim2.new(0, 379, 0, 31)

TextboxCorner.CornerRadius = UDim.new(0, 5)
TextboxCorner.Name = "TextboxCorner"
TextboxCorner.Parent = Textbox

Textboxx.Name = "Textboxx"
Textboxx.Parent = Textbox
Textboxx.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
Textboxx.Position = UDim2.new(0, 1, 0, 1)
Textboxx.Size = UDim2.new(0, 385, 0, 29)

TextboxxCorner.CornerRadius = UDim.new(0, 3)
TextboxxCorner.Name = "TextboxxCorner"
TextboxxCorner.Parent = Textboxx

TextboxLabel.Name = "TextboxLabel"
TextboxLabel.Parent = Textbox
TextboxLabel.BackgroundColor3 = Color3.fromRGB(1, 1, 1)TextboxLabel.BackgroundTransparency = 1.000
TextboxLabel.Position = UDim2.new(0, 15, 0, 0)
TextboxLabel.Text = text
TextboxLabel.Size = UDim2.new(0, 145, 0, 31)
TextboxLabel.Font = Enum.Font.SourceSansBold
TextboxLabel.TextColor3 = Color3.fromRGB(225, 225, 225)
TextboxLabel.TextSize = 16.000
TextboxLabel.TextTransparency = 0
TextboxLabel.TextXAlignment = Enum.TextXAlignment.Left

txtbtn.Name = "txtbtn"
txtbtn.Parent = Textbox
txtbtn.BackgroundColor3 = Color3.fromRGB(1, 1, 1)txtbtn.BackgroundTransparency = 1.000
txtbtn.Position = UDim2.new(0, 1, 0, 1)
txtbtn.Size = UDim2.new(0, 379, 0, 29)
txtbtn.Font = Enum.Font.SourceSans
txtbtn.Text = ""
txtbtn.TextColor3 = Color3.fromRGB(255, 255, 255)
txtbtn.TextSize = 14.000

RealTextbox.Name = "RealTextbox"
RealTextbox.Parent = Textbox
RealTextbox.BackgroundColor3 = Color3.fromRGB(1, 1, 1)
RealTextbox.BackgroundTransparency = 0
RealTextbox.Position = UDim2.new(0, 275, 0, 4)
RealTextbox.Size = UDim2.new(0, 100, 0, 24)
RealTextbox.Font = Enum.Font.SourceSansBold
RealTextbox.Text = ""
RealTextbox.TextColor3 = Color3.fromRGB(225, 225, 225)
RealTextbox.TextSize = 11.000
RealTextbox.TextTransparency = 0

RealTextbox.FocusLost:Connect(function()
 callback(RealTextbox.Text)
 if disappear then
 RealTextbox.Text = ""
 end
 end)

UICorner.CornerRadius = UDim.new(0, 3)
UICorner.Parent = RealTextbox
end
function main:AddLabel(text)
local Label = Instance.new("TextLabel")
local PaddingLabel = Instance.new("UIPadding")
local labelfunc = {}

Label.Name = "Label"
Label.Parent = MainFramePage
Label.BackgroundColor3 = Color3.fromRGB(1, 1, 1)
Label.BackgroundTransparency = 1.000
Label.Size = UDim2.new(0, 410, 0, 30)
Label.Font = Enum.Font.SourceSansBold
Label.TextColor3 = Color3.fromRGB(225, 225, 225)
Label.TextSize = 14.000
Label.Text = text
Label.TextXAlignment = Enum.TextXAlignment.Left

PaddingLabel.PaddingLeft = UDim.new(0,15)
PaddingLabel.Parent = Label
PaddingLabel.Name = "PaddingLabel"

function labelfunc:Set(newtext)
Label.Text = newtext
end
return labelfunc
end

function main:AddLabel1(text)
local Label1 = Instance.new("TextLabel")
local PaddingLabel1 = Instance.new("UIPadding")
local Label1func = {}

Label1.Name = "Label1"
Label1.Parent = MainFramePage
Label1.BackgroundColor3 = Color3.fromRGB(1, 1, 1)
Label1.BackgroundTransparency = 1.000
Label1.Size = UDim2.new(0, 410, 0, 20)
Label1.Font = Enum.Font.SourceSansBold
Label1.TextColor3 = Color3.fromRGB(255, 255, 255)
Label1.TextSize = 15.000
Label1.Text = text
Label1.RichText = true
Label1.TextXAlignment = Enum.TextXAlignment.Left

PaddingLabel1.PaddingLeft = UDim.new(0,15)
PaddingLabel1.Parent = Label1
PaddingLabel1.Name = "PaddingLabel1"
function Label1func:Refresh(tochange)
Label1.Text = tochange
end

return Label1func
end

function main:Dis(text,display)
local Label1 = Instance.new("TextLabel")
local PaddingLabel1 = Instance.new("UIPadding")
local Label1func = {}

Label1.Name = "Label1"
Label1.Parent = MainFramePage
Label1.BackgroundColor3 = Color3.fromRGB(1, 1, 1)
Label1.BackgroundTransparency = 1.000
Label1.Size = UDim2.new(0, 410, 0, 20)
Label1.Font = Enum.Font.SourceSansBold
Label1.TextColor3 = Color3.fromRGB(255, 255, 255)
Label1.TextSize = 15.000
Label1.Text = text
Label1.TextXAlignment = Enum.TextXAlignment.Left

Labeld.Name = "Labeld"
Labeld.Parent = MainFramePage
Labeld.BackgroundColor3 = Color3.fromRGB(1, 1, 1)
Labeld.BackgroundTransparency = 1.000
Labeld.Size = UDim2.new(0, 410, 0, 20)
Labeld.Font = Enum.Font.SourceSansBold
Labeld.TextColor3 = Color3.fromRGB(255, 255, 255)Labeld.TextSize = 15.000
Labeld.Text = display or ""
Labeld.TextXAlignment = Enum.TextXAlignment.Left

PaddingLabel1.PaddingLeft = UDim.new(0,15)
PaddingLabel1.Parent = Label1
PaddingLabel1.Name = "PaddingLabel1"
function Label1func:Refresh(tochange)
Label1.Text = tochange
end

return Label1func
end

function main:AddSeperator(text)
local Seperator = Instance.new("Frame")
local Sep1 = Instance.new("Frame")
local Sep2 = Instance.new("TextLabel")
local Sep3 = Instance.new("Frame")

Seperator.Name = "Seperator"
Seperator.Parent = MainFramePage
Seperator.BackgroundColor3 = _G.Primary
Seperator.BackgroundTransparency = .8
Seperator.Size = UDim2.new(0, 379, 0, 30)

Sep1.Name = "Sep1"
Sep1.Parent = Seperator
Sep1.BackgroundColor3 = _G.Dark
Sep1.BackgroundTransparency = .1
Sep1.BorderSizePixel = 0
Sep1.Position = UDim2.new(0, 10, 0, 10)
Sep1.Size = UDim2.new(0, 20, 0, 10)

Sep2.Name = "Sep2"
Sep2.Parent = Seperator
Sep2.BackgroundColor3 = Color3.fromRGB(1, 1, 1)
Sep2.BackgroundTransparency = 1
Sep2.Position = UDim2.new(0, 0, 0, 0)
Sep2.Size = UDim2.new(0, 379, 0, 30)
Sep2.Font = Enum.Font.SourceSansBold
Sep2.Text = ">> "..text.." <<"
Sep2.TextColor3 = Color3.fromRGB(255, 255, 255)
Sep2.TextSize = 14.000

Sep3.Name = "Sep3"
Sep3.Parent = Seperator
Sep3.BackgroundColor3 = _G.Dark
Sep3.BackgroundTransparency = .1
Sep3.BorderSizePixel = 0
Sep3.Position = UDim2.new(0, 349, 0, 10)
Sep3.Size = UDim2.new(0, 20, 0, 10)
end

function main:AddLine()
local Linee = Instance.new("Frame")
local Line = Instance.new("Frame")

Linee.Name = "Linee"
Linee.Parent = MainFramePage
Linee.BackgroundColor3 = Color3.fromRGB(1, 1, 1)
Linee.BackgroundTransparency = 1.000
Linee.Position = UDim2.new(0, 0, 0.119999997, 0)
Linee.Size = UDim2.new(0, 310, 0, 20)

Line.Name = "Line"
Line.Parent = Linee
Line.BackgroundColor3 = Color3.new(125,125,125)
Line.BorderSizePixel = 0
Line.Position = UDim2.new(0, 0, 0, 10)
Line.Size = UDim2.new(0, 379, 0, 1)
end

function main:UserCITY()
    local Players = game:GetService("Players")
    local player = Players.LocalPlayer
    local userId = player.UserId
    local thumbType = Enum.ThumbnailType.AvatarBust
    local thumbSize = Enum.ThumbnailSize.Size420x420 -- Ubah ukuran thumbnail menjadi 420x420
    local content, isReady = Players:GetUserThumbnailAsync(userId, thumbType, thumbSize)
    
    local UserPlayer = Instance.new("Frame")
    UserPlayer.Name = "UserPlayer"
    UserPlayer.Position = UDim2.new(0, 0, 0, 0)
    UserPlayer.Size = UDim2.new(0, 400, 0, 110)
    UserPlayer.BackgroundTransparency = 1
    UserPlayer.BackgroundColor3 = Color3.fromRGB(1, 1, 1) 
    UserPlayer.Parent = MainFramePage
    
    local UserImage = Instance.new("ImageLabel")
    UserImage.Size = UDim2.new(0, 100, 0, 100) -- Ubah ukuran gambar menjadi 200x300
    UserImage.Position = UDim2.new(0, 10, 0, 10)
    UserImage.BackgroundTransparency = 1
    UserImage.Image = content
    UserImage.Parent = UserPlayer

    local TCNR = Instance.new("UICorner")
    TCNR.Name = "TCNR"
    TCNR.Parent = UserImage
    TCNR.CornerRadius = UDim.new(0,50) 
    
       local UserName = Instance.new("TextLabel")
    UserName.Size = UDim2.new(0, 10, 0, 30)
    UserName.Position = UDim2.new(0, 120, 0, 30)
    UserName.TextSize = 30
    UserName.Font = Enum.Font.SourceSansBold
    UserName.TextColor3 = _G.Primary
    UserName.BackgroundTransparency = 1
    UserName.TextTransparency = .1
    UserName.Text = game.Players.LocalPlayer.DisplayName
    UserName.Parent = UserPlayer
    UserName.TextXAlignment = Enum.TextXAlignment.Left
    
    
    local P = Instance.new("TextLabel")
    P.Size = UDim2.new(0, 100, 0, 30)
    P.Position = UDim2.new(0, 122, 0, 55) 
    P.TextSize = 15
    P.Font = Enum.Font.Jura
    P.TextColor3 = Color3.new(255, 255, 255)
    P.BackgroundTransparency = 1
    P.Text = "> User Name: "..game.Players.LocalPlayer.Name
    P.Parent = UserPlayer
    P.TextXAlignment = Enum.TextXAlignment.Left
    
    local U = Instance.new("TextLabel")
    U.Size = UDim2.new(0, 100, 0, 30)
    U.Position = UDim2.new(0, 122, 0, 72) 
    U.TextSize = 15
    U.Font = Enum.Font.Jura
    U.TextColor3 = Color3.new(255, 255, 255)
    U.BackgroundTransparency = 1
    U.Text = "> User ID: "..game.Players.LocalPlayer.UserId
    U.Parent = UserPlayer
    U.TextXAlignment = Enum.TextXAlignment.Left
    
    main:AddLine()


end

return main
end
return uitab
end
--------------------------------------------------------------------------------------------------------

--------------------------------------------------------------------------------------------------------
local Library = Update:Window("CITY NORMAL","BLOX FRUIT",Enum.KeyCode.RightControl);
--------------------------------------------------------------------------------------------------------
local CITY = Library:AddTab("Information","rbxassetid://18251750782")
local Settings = Library:AddTab("Settings Farming","rbxassetid://18251750782")
local Main = Library:AddTab("General","rbxassetid://18251750782")
local M = Library:AddTab("Item & Quest","rbxassetid://18251750782")
local Ss = Library:AddTab("Stats","rbxassetid://18251750782")
local RaceV4 = Library:AddTab("Race V4","rbxassetid://18251750782")
local EventGame = Library:AddTab("Game Event","rbxassetid://18251750782")
local P = Library:AddTab("Local Player","rbxassetid://18251750782")
local Status = Library:AddTab("Status Sever","rbxassetid://18251750782")
local Visual = Library:AddTab("Visual","rbxassetid://18251750782")
local R = Library:AddTab("Dungeon","rbxassetid://18251750782")
local T = Library:AddTab("Teleport","rbxassetid://18251750782")
local S = Library:AddTab("Shop","rbxassetid://18251750782")
local D = Library:AddTab("Devil Fruit","rbxassetid://18251750782")
local Misc = Library:AddTab("Miscellaneous","rbxassetid://18251750782")
--------------------------------------------------------------------------------------------------------


----------------------------------------------------------------------------------------------------------------------------------------
local ScreenGui1 = Instance.new("ScreenGui")
local ImageButton1 = Instance.new("ImageButton")
local UICorner = Instance.new("UICorner")
local UIStroke = Instance.new("UIStroke")

ScreenGui1.Name = "ImageButton"
ScreenGui1.Parent = game.CoreGui
ScreenGui1.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

ImageButton1.Parent = ScreenGui1
ImageButton1.BackgroundColor3 = Color3.fromRGB(0, 105, 148)
ImageButton1.BorderSizePixel = 0
ImageButton1.Position = UDim2.new(0.120833337, 0, 0.0952890813, 0)
ImageButton1.Size = UDim2.new(0, 50, 0, 50)
ImageButton1.Draggable = true
ImageButton1.Image = "http://www.roblox.com/asset/?id=17416719866"
ImageButton1.MouseButton1Down:connect(function()
  game:GetService("VirtualInputManager"):SendKeyEvent(true,305,false,game)
  game:GetService("VirtualInputManager"):SendKeyEvent(false,305,false,game)
end)
UICorner.Parent = ImageButton1
UIStroke.Color = Color3.fromRGB(0, 105, 148)
UIStroke.Thickness = 1.5
UIStroke.Parent = ImageButton1
----------------------------------------------------------------------------------------------------------------------------------------