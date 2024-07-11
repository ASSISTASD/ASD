local openshit = Instance.new("ScreenGui")
local mainopen = Instance.new("TextButton")
local mainopens = Instance.new("UICorner")
local loki = Instance.new("ImageLabel")
local posto = Instance.new("UIStroke")

openshit.Name = "openshit"
openshit.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
openshit.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

mainopen.Name = "mainopen"
mainopen.Parent = openshit
mainopen.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
mainopen.Position = UDim2.new(0.101969875, 0, 0.110441767, 0)
mainopen.Size = UDim2.new(0, 64, 0, 42)
mainopen.Text = ""
mainopen.Visible = true
mainopen.Draggable = true
mainopen.MouseButton1Click:Connect(function()
	game:GetService("VirtualInputManager"):SendKeyEvent(true,305,false,game)
	game:GetService("VirtualInputManager"):SendKeyEvent(false,305,false,game)
end)

mainopens.Parent = mainopen
 
 loki.Name = "loki"
 loki.Parent = mainopen
 loki.BackgroundColor3 = Color3.fromRGB(224,224,224)
 loki.BackgroundTransparency = 1.000
 loki.Position = UDim2.new(-0.0529999994, 0, -0.244000003, 0)
 loki.Size = UDim2.new(0, 69, 0, 62)
 loki.Image = "rbxassetid://18251750733"
 
 posto.Name = "posto"
 posto.Parent = mainopen
 posto.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
 posto.Color = Color3.fromRGB(224,224,224)
 posto.LineJoinMode = Enum.LineJoinMode.Round
 posto.Thickness = 1
 posto.Transparency = 0
 posto.Enabled = true
 posto.Archivable = true
 
 
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
 _G.BGColor_1 = Color3.fromRGB(255,255,255)
 _G.BGColor_2 = Color3.fromRGB(255, 255, 255)
 _G.Color = Color3.fromRGB(1,1,1)
 _G.WindowBackgroundColor = Color3.fromRGB(255,255,255)
 _G.BackgroundItemColor = Color3.fromRGB(200, 200, 200)
 _G.TabWindowColor = Color3.fromRGB(255, 255, 255)
 _G.ContainerColor = Color3.fromRGB(255,255,255)
 _G.TitleTextColor = Color3.fromRGB(150, 150, 150)
 _G.ImageColor = Color3.fromRGB(200,200,200)
 _G.LineThemeColor = Color3.fromRGB(150, 150, 150)
 _G.TabTextColor = Color3.fromRGB(1, 1, 1)
 _G.TabImageColor = Color3.fromRGB(150, 150, 150)
 _G.TabThemeColor = Color3.fromRGB(250, 0, 0)
 _G.SectionColor = Color3.fromRGB(150, 150, 150)
 _G.SectionImageColor = Color3.fromRGB(150, 150, 150)
 _G.SectionTextColor = Color3.fromRGB(150, 150, 150)
 _G.SectionOn = Color3.fromRGB(0, 250, 0)
 
 local Update = {}
 
 
	local TweenService = game:GetService("TweenService")
	local Balaraja = Instance.new("ScreenGui")
	
		Balaraja.Name = "Balaraja"
    Balaraja.Parent = game.CoreGui
    Balaraja.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
	
    local NotiFrame = Instance.new("Frame")
    NotiFrame.Name = "NotiFrame"
    NotiFrame.Parent = Balaraja
    NotiFrame.AnchorPoint = Vector2.new(0.5, 0.5)
    NotiFrame.BackgroundColor3 = Color3.fromRGB(35,35,35)
    NotiFrame.BorderSizePixel = 0
    NotiFrame.Position =  UDim2.new(1, -210, 1, 100)
    NotiFrame.Size = UDim2.new(0, 300, 0, 400)
    NotiFrame.ClipsDescendants = true
    NotiFrame.BackgroundTransparency = 1
    
    local Notilistlayout = Instance.new("UIListLayout")
    Notilistlayout.Parent = NotiFrame
    Notilistlayout.SortOrder = Enum.SortOrder.LayoutOrder
    Notilistlayout.Padding = UDim.new(0, 5)		

    
 function Update:Window(text,logo,keybind)
 local osfunc = {}
 local uihide = false
 local abc = false
 local logo = logo or 11340301587
 local currentpage = ""
 local keybind = keybind or Enum.KeyCode.RightControl
 local yoo = string.gsub(tostring(keybind),"Enum.KeyCode.","")
 
 local ZENHUB = Instance.new("ScreenGui")
 ZENHUB.Name = "ZENHUB"
 ZENHUB.Parent = game.CoreGui
 ZENHUB.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
 
 local Main = Instance.new("Frame")
 Main.Name = "Main"
 Main.Parent = ZENHUB
 Main.ClipsDescendants = true
 Main.AnchorPoint = Vector2.new(0.5,0.5)
 Main.BackgroundColor3 = Color3.fromRGB(255,255,255)
 Main.Position = UDim2.new(0.5, 0, 0.5, 0)
 Main.Size = UDim2.new(0, 0, 0, 0)
 Main.BackgroundTransparency = 0.5
 

 Main:TweenSize(UDim2.new(0, 480, 0, 280),"Out","Quad",0.4,true)
 
 
 local MCNR = Instance.new("UICorner")
 MCNR.Name = "MCNR"
 MCNR.Parent = Main
 
 local Top = Instance.new("Frame")
 Top.Name = "Top"
 Top.Parent = Main
 Top.BackgroundColor3 = Color3.fromRGB(1, 1, 1)
 Top.BackgroundTransparency = 0.5
 Top.Size = UDim2.new(0, 480, 0, 20)
 
 local TCNR = Instance.new("UICorner")
 TCNR.Name = "TCNR"
 TCNR.Parent = Top
 
 local Logo = Instance.new("ImageLabel")
 Logo.Name = "Logo"
 Logo.Parent = Top
 Logo.BackgroundColor3 = Color3.fromRGB(224,224,224)
 Logo.BackgroundTransparency = 1.000
 Logo.Position = UDim2.new(-0.01, 0,-0.2, 0)
 Logo.Size = UDim2.new(0, 55,0, 45)
 Logo.Image = "rbxassetid://"..tostring(logo)
 
 local Name = Instance.new("TextLabel")
 Name.Name = "Name"
 Name.Parent = Top
 Name.BackgroundColor3 = Color3.fromRGB(224,224,224)
 Name.BackgroundTransparency = 1.000
 Name.Position = UDim2.new(0.0909756112, 0, -0.15, 0)
 Name.Size = UDim2.new(0, 61, 0, 25)
 Name.Font = Enum.Font.Code
 Name.Text = text
 Name.TextColor3 = Color3.fromRGB(0, 255, 255)
 Name.TextSize = 16.000
 
 local Hub = Instance.new("TextLabel")
 Hub.Name = "Hub"
 Hub.Parent = Top
 Hub.BackgroundColor3 = Color3.fromRGB(224,224,224)
 Hub.BackgroundTransparency = 1.000
 Hub.Position = UDim2.new(0, 110, -0.15, 0)
 Hub.Size = UDim2.new(0, 81, 0, 25)
 Hub.Font = Enum.Font.Code
 Hub.Text = "| PVP |"
 Hub.TextColor3 = Color3.fromRGB(0, 255, 255)
 Hub.TextSize = 16.000
 Hub.TextXAlignment = Enum.TextXAlignment.Left
 
 
 local MainImage = Instance.new("ImageLabel")
 local MainImageFrame = Instance.new("Frame")
 -- MainImage.Name =  "MainImage"
 MainImage.Parent = Main
 MainImage.BackgroundColor3 = Color3.fromRGB(224,224,224)
 MainImage.BackgroundTransparency = 1.000
 MainImage.Position = UDim2.new(0, 25, 0, 25)
 MainImage.Size = UDim2.new(0, 100, 0, 170)
 MainImage.Image = ""
 
 
 local Tab = Instance.new("Frame")
 Tab.Name = "Tab"
 Tab.Parent = Main
 Tab.BackgroundColor3 = Color3.fromRGB(200,200,200)
 Tab.Position = UDim2.new(0, 5, 0, 30)
 --Tab.CornerRadius = UDim.new(0,5)
 Tab.Size = UDim2.new(0, 0, 0, 0)
 --Tab.Size = UDim2.new(0, 150, 0, 365)
 
 --local TabCorner = Instance.new("UICorner")
 local TabCorner = Instance.new("UIListLayout")
 TabCorner.Name = "TabCorner"
 TabCorner.Parent = Tab
 TabCorner.SortOrder = Enum.SortOrder.LayoutOrder
 TabCorner.Padding = UDim.new(0, 15)
 
 local TCNR = Instance.new("UICorner")
 TCNR.Name = "TCNR"
 TCNR.Parent = Tab
 
 local ScrollTab = Instance.new("ScrollingFrame")
 ScrollTab.Name = "ScrollTab"
 ScrollTab.Parent = Tab
 ScrollTab.Active = true
 ScrollTab.BackgroundColor3 = Color3.fromRGB(224,224,224)
 ScrollTab.BackgroundTransparency = 1.000
 ScrollTab.Size = UDim2.new(0, 133, 0, 250)
 ScrollTab.CanvasSize = UDim2.new(0, 0, 0, 0)
 ScrollTab.ScrollBarThickness = 0
 
 local PLL = Instance.new("UIListLayout")
 PLL.Name = "PLL"
 PLL.Parent = ScrollTab
 PLL.SortOrder = Enum.SortOrder.LayoutOrder
 PLL.Padding = UDim.new(0, 15)
 
 local PPD = Instance.new("UIPadding")
 PPD.Name = "PPD"
 PPD.Parent = ScrollTab
 PPD.PaddingLeft = UDim.new(0, 10)
 PPD.PaddingTop = UDim.new(0, 10)
 
 local Page = Instance.new("Frame")
 Page.Name = "Page"
 Page.Parent = Main
 Page.BackgroundColor3 = Color3.fromRGB(255,255,255)
 Page.Position = UDim2.new(0.295726834, 0, 0.144050003, 0)
 Page.Size = UDim2.new(0, 330, 0, 280)
 Page.BackgroundTransparency = 1
 
 local PCNR = Instance.new("UICorner")
 PCNR.Name = "PCNR"
 PCNR.Parent = Page
 
 local MainPage = Instance.new("Frame")
 MainPage.Name = "MainPage"
 MainPage.Parent = Page
 MainPage.ClipsDescendants = true
 MainPage.BackgroundColor3 = Color3.fromRGB(224,224,224)
 MainPage.BackgroundTransparency = 1.000
 MainPage.Size = UDim2.new(0, 325, 0, 316)
 
 local PageList = Instance.new("Folder")
 PageList.Name = "PageList"
 PageList.Parent = MainPage
 
 local UIPageLayout = Instance.new("UIPageLayout")
 
 UIPageLayout.Parent = PageList
 UIPageLayout.SortOrder = Enum.SortOrder.LayoutOrder
 UIPageLayout.EasingDirection = Enum.EasingDirection.InOut
 UIPageLayout.EasingStyle = Enum.EasingStyle.Quad
 UIPageLayout.FillDirection = Enum.FillDirection.Vertical
 UIPageLayout.Padding = UDim.new(0, 15)
 UIPageLayout.TweenTime = 0.400
 UIPageLayout.GamepadInputEnabled = false
 UIPageLayout.ScrollWheelInputEnabled = false
 UIPageLayout.TouchInputEnabled = false
 
 MakeDraggable(Top,Main)
 
 UserInputService.InputBegan:Connect(function(input)
  if input.KeyCode == Enum.KeyCode[yoo] then
  if uihide == false then
  uihide = true
  Main:TweenSize(UDim2.new(0, 0, 0, 0),"In","Quad",0.4,true)
  else
   uihide = false
  Main:TweenSize(UDim2.new(0, 480, 0, 280),"Out","Quad",0.5,true)
  end
  end
  end)
 local uitab = {}
 
 function uitab:Tab(text,img)
 local TabButton = Instance.new("TextButton")
 local TabImage = Instance.new("ImageLabel")
 TabButton.Parent = ScrollTab
 TabButton.Name = text.."Server"
 TabButton.Text = text
 TabButton.BackgroundColor3 = Color3.fromRGB(224,224,224)
 TabButton.BackgroundTransparency = 1.000
 TabButton.Size = UDim2.new(0, 110, 0, 28)
 TabButton.Font = Enum.Font.Gotham
 TabButton.TextColor3 = Color3.fromRGB(1,1,1)
 TabButton.TextSize = 14.000
 TabButton.TextTransparency = 0.100
 
 local TabFrame = Instance.new("Frame")
 local UICornerFrame = Instance.new("UICorner")
 TabFrame.Name = "TabFrame"
 TabFrame.Parent = TabButton
 TabFrame.ClipsDescendants = true
 --TabFrame.Position = UDim2.new(0, 1, 0.1, 2)
 TabFrame.BackgroundColor3 = Color3.fromRGB(31, 31, 31)
 TabFrame.BackgroundTransparency = 0.500
 TabFrame.Size = UDim2.new(0, 120, 0.1, 23)
 UICornerFrame.CornerRadius = UDim.new(0, 5)
 UICornerFrame.Parent = TabFrame
 
 TabImage.Name = text or "TabImage"
 TabImage.Parent = TabFrame
 TabImage.BackgroundColor3 = _G.Color
 TabImage.BackgroundTransparency = 1.000
 TabImage.Position = UDim2.new(0.05, 0, 0.1, 0)
 TabImage.Size = UDim2.new(0, 20, 0, 20)
 TabImage.Image = img or "rbxassetid://8666601749"
 TabImage.ImageColor3 = _G.Color
 
 local MainFramePage = Instance.new("ScrollingFrame")
 MainFramePage.Name = text.."_Page"
 MainFramePage.Parent = PageList
 MainFramePage.Active = true
 MainFramePage.BackgroundColor3 = Color3.fromRGB(224,224,224)
 MainFramePage.BackgroundTransparency = 1.000
 MainFramePage.BorderSizePixel = 0
 MainFramePage.Size = UDim2.new(0, 400, 0, 245)
 MainFramePage.CanvasSize = UDim2.new(0, 0, 0, 0)
 MainFramePage.ScrollBarThickness = 0
 
 local UIPadding = Instance.new("UIPadding")
 local UIListLayout = Instance.new("UIListLayout")
 
 UIPadding.Parent = MainFramePage
 UIPadding.PaddingLeft = UDim.new(0, 10)
 UIPadding.PaddingTop = UDim.new(0, 10)
 
 UIListLayout.Padding = UDim.new(0,15)
 UIListLayout.Parent = MainFramePage
 UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
 
 
 
 TabButton.MouseButton1Click:Connect(function()
  for i,v in next, ScrollTab:GetChildren() do
  if v:IsA("TextButton") then
  TweenService:Create(
   v,
   TweenInfo.new(0.3,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
   {
    TextTransparency = 0.5
   }
  ):Play()
  end
  TweenService:Create(
   TabButton,
   TweenInfo.new(0.3,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
   {
    TextTransparency = 0
   }
  ):Play()
  end
  for i,v in next, PageList:GetChildren() do
  currentpage = string.gsub(TabButton.Name,"Server","").."_Page"
  if v.Name == currentpage then
  UIPageLayout:JumpTo(v)
  end
  end
  end)
 
 if abc == false then
 for i,v in next, ScrollTab:GetChildren() do
 if v:IsA("TextButton") then
 TweenService:Create(
  v,
  TweenInfo.new(0.3,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
  {
   TextTransparency = 0.5
  }
 ):Play()
 end
 TweenService:Create(
  TabButton,
  TweenInfo.new(0.3,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
  {
   TextTransparency = 0
  }
 ):Play()
 end
 UIPageLayout:JumpToIndex(1)
 abc = true
 end
 
 game:GetService("RunService").Stepped:Connect(function()
  pcall(function()
   MainFramePage.CanvasSize = UDim2.new(0,0,0,UIListLayout.AbsoluteContentSize.Y + 20)
   ScrollTab.CanvasSize = UDim2.new(0,0,0,PLL.AbsoluteContentSize.Y + 20)
   end)
  end)
 
 
 
 local main = {}
 function main:Button(text,callback)
 local Button = Instance.new("Frame")
 local UICorner = Instance.new("UICorner")
 local TextBtn = Instance.new("TextButton")
 local UICorner_2 = Instance.new("UICorner")
 local Black = Instance.new("Frame")
 local UICorner_3 = Instance.new("UICorner")
 
 Button.Name = "Button"
 Button.Parent = MainFramePage
 Button.BackgroundColor3 = Color3.fromRGB(1, 1, 1)
 Button.BackgroundTransparency = 1
 Button.BorderSizePixel = 2
 Button.Size = UDim2.new(0, 310, 0, 31)
 
 UICorner.CornerRadius = UDim.new(0, 5)
 UICorner.Parent = Button
 
 TextBtn.Name = "TextBtn"
 TextBtn.Parent = Button
 TextBtn.BackgroundColor3 = Color3.fromRGB(1,1,1)
 TextBtn.BackgroundTransparency = 0.400
 TextBtn.Position = UDim2.new(0, 1, 0, 1)
 TextBtn.Size = UDim2.new(0, 308, 0, 29)
 TextBtn.AutoButtonColor = false
 TextBtn.Font = Enum.Font.Gotham
 TextBtn.Text = text
 TextBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
 TextBtn.TextSize = 14.000
 
 UICorner_2.CornerRadius = UDim.new(0, 5)
 UICorner_2.Parent = TextBtn
 
 Black.Name = "Black"
 Black.Parent = Button
 Black.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
 Black.BackgroundTransparency = 1.000
 Black.BorderSizePixel = 0
 Black.Position = UDim2.new(0, 1, 0, 1)
 Black.Size = UDim2.new(0, 310, 0, 29)
 
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
 CheckFrame.Size = UDim2.new(0, 38, 0, 30)
 
 CheckFrame2.Name = "CheckFrame2"
 CheckFrame2.Parent = CheckFrame
 CheckFrame2.BackgroundColor3 = Color3.fromRGB(30,30,30)
 CheckFrame2.BackgroundTransparency = 1
 CheckFrame2.BorderSizePixel = 0
 CheckFrame2.Position = UDim2.new(0, 3, 0, 0)
 CheckFrame2.Size = UDim2.new(0, 308, 0, 30)
 
 UIStroke.Name = "UIStroke"
 UIStroke.Parent = CheckFrame2
 UIStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
 UIStroke.Color = Color3.fromRGB(1,1,1)
 UIStroke.LineJoinMode = Enum.LineJoinMode.Round
 UIStroke.Thickness = 1
 UIStroke.Transparency = 0
 UIStroke.Enabled = true
 UIStroke.Archivable = true
 
 UICorner.Parent = CheckFrame2
 UICorner.CornerRadius = UDim.new(0, 3)
 
 ImageLabel.Name = "ImageLabel"
 ImageLabel.Parent = CheckFrame2
 ImageLabel.BackgroundColor3 = Color3.fromRGB(150, 150, 150)
 ImageLabel.BackgroundTransparency = 1.000
 ImageLabel.BorderSizePixel = 0
 ImageLabel.Position = UDim2.new(-0.018, 0,-0.252, 0)
 ImageLabel.Size = UDim2.new(0, 45,0, 45)
 ImageLabel.Image = "rbxassetid://"
 ImageLabel.ImageColor3 = Color3.fromRGB(224,224,224)
 
 Space.Name = "Space"
 Space.Parent = CheckFrame2
 Space.BackgroundColor3 = Color3.fromRGB(150, 150, 150)
 Space.BackgroundTransparency = 1.000
 Space.Position = UDim2.new(0, 30, 0, 0)
 Space.Size = UDim2.new(0, 15, 0, 30)
 Space.Font = Enum.Font.Gotham
 Space.Text = ""
 Space.TextSize = 12.000
 Space.TextColor3 = Color3.fromRGB(255,225,225)
 Space.TextXAlignment = Enum.TextXAlignment.Center
 
 Title.Name = "Title"
 Title.Parent = CheckFrame2
 Title.BackgroundColor3 = Color3.fromRGB(1, 1, 1)
 Title.BackgroundTransparency = 1.000
 Title.Position = UDim2.new(0, 50, 0, 0)
 Title.Size = UDim2.new(0, 280, 0, 30)
 Title.Font = Enum.Font.Gotham
 Title.Text = TogInfo or "checkBox Title"
 Title.TextColor3 = Color3.fromRGB(1,1,1)
 Title.TextSize = 14.000
 Title.TextXAlignment = Enum.TextXAlignment.Left
 
 ImageButton.Name = "ImageButton"
 ImageButton.Parent = CheckFrame2
 ImageButton.BackgroundColor3 = Color3.fromRGB(224,224,224)
 ImageButton.BackgroundTransparency = 1.000
 ImageButton.Position = UDim2.new(0, 280, 0, 4)
 ImageButton.Size = UDim2.new(0, 23, 0, 23)
 ImageButton.ZIndex = 2
 ImageButton.Image = "rbxassetid://3926311105"
 ImageButton.ImageColor3 = Color3.fromRGB(1,1,1)
 ImageButton.ImageRectOffset = Vector2.new(940, 784)
 ImageButton.ImageRectSize = Vector2.new(48, 48)
 
 -- Toggle Script --
 
 if default == true then
 ImageButton.ImageRectOffset = Vector2.new(4, 836)
 game.TweenService:Create(ImageButton, TweenInfo.new(0.08, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut),
  {
   ImageColor3 = Color3.fromRGB(1,1,1)}
 ):Play()
 toggle = not toggle
 pcall(callback, toggle)
 end
 
 ImageButton.MouseButton1Click:Connect(function()
  if toggle == false then
  game.TweenService:Create(ImageButton, TweenInfo.new(0.08, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut),
   {
    ImageColor3 = Color3.fromRGB(1,1,1)}
  ):Play()
  ImageButton.ImageRectOffset = Vector2.new(4, 836)
  else
   game.TweenService:Create(ImageButton, TweenInfo.new(0.08, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut),
   {
    ImageColor3 = Color3.fromRGB(1,1,1)}
  ):Play()
  ImageButton.ImageRectOffset = Vector2.new(940, 784)
  end
  toggle = not toggle
  pcall(callback, toggle)
  end)
 end
 
 function main:Dropdown(text,option,callback)
 local isdropping = false
 local Dropdown = Instance.new("Frame")
 local UICorner = Instance.new("UICorner")
 local DropTitle = Instance.new("TextLabel")
 local DropScroll = Instance.new("ScrollingFrame")
 local UIListLayout = Instance.new("UIListLayout")
 local UIPadding = Instance.new("UIPadding")
 local DropButton = Instance.new("TextButton")
 local DropImage = Instance.new("ImageLabel")
 local posto1 = Instance.new("UIStroke")
 
 Dropdown.Name = "Dropdown"
 Dropdown.Parent = MainFramePage
 Dropdown.BackgroundColor3 = Color3.fromRGB(28,28,28)
 Dropdown.BackgroundTransparency = 1
 Dropdown.ClipsDescendants = true
 Dropdown.Size = UDim2.new(0, 310, 0, 31)
 
 posto1.Name = "posto"
 posto1.Parent = Dropdown
 posto1.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
 posto1.Color = Color3.fromRGB(1,1,1)
 posto1.LineJoinMode = Enum.LineJoinMode.Round
 posto1.Thickness = 1
 posto1.Transparency = 0
 posto1.Enabled = true
 posto1.Archivable = true
 
 UICorner.CornerRadius = UDim.new(0, 5)
 UICorner.Parent = Dropdown
 
 DropTitle.Name = "DropTitle"
 DropTitle.Parent = Dropdown
 DropTitle.BackgroundColor3 = Color3.fromRGB(224,224,224)
 DropTitle.BackgroundTransparency = 1.000
 DropTitle.Size = UDim2.new(0, 310, 0, 31)
 DropTitle.Font = Enum.Font.Gotham
 DropTitle.Text = text.. " : "
 DropTitle.TextColor3 = Color3.fromRGB(1, 1, 1)
 DropTitle.TextSize = 12.000
 
 DropScroll.Name = "DropScroll"
 DropScroll.Parent = DropTitle
 DropScroll.Active = true
 DropScroll.BackgroundColor3 = Color3.fromRGB(1,1,1)
 DropScroll.BackgroundTransparency = 1.000
 DropScroll.BorderSizePixel = 0
 DropScroll.Position = UDim2.new(0, 0, 0, 31)
 DropScroll.Size = UDim2.new(0, 310, 0, 100)
 DropScroll.CanvasSize = UDim2.new(0, 0, 0, 0)
 DropScroll.ScrollBarThickness = 3
 
 UIListLayout.Parent = DropScroll
 UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
 UIListLayout.Padding = UDim.new(0, 5)
 
 UIPadding.Parent = DropScroll
 UIPadding.PaddingLeft = UDim.new(0, 5)
 UIPadding.PaddingTop = UDim.new(0, 5)
 
 DropImage.Name = "DropImage"
 DropImage.Parent = Dropdown
 DropImage.BackgroundColor3 = Color3.fromRGB(224,224,224)
 DropImage.BackgroundTransparency = 1.000
 DropImage.Position = UDim2.new(0, 280, 0, 6)
 DropImage.Rotation = 180.000
 DropImage.Size = UDim2.new(0, 20, 0, 20)
 DropImage.Image = "rbxassetid://6031090990"
 
 DropButton.Name = "DropButton"
 DropButton.Parent = Dropdown
 DropButton.BackgroundColor3 = Color3.fromRGB(224,224,224)
 DropButton.BackgroundTransparency = 1.000
 DropButton.Size = UDim2.new(0, 310, 0, 31)
 DropButton.Font = Enum.Font.SourceSans
 DropButton.Text = ""
 DropButton.TextColor3 = Color3.fromRGB(0, 0, 0)
 DropButton.TextSize = 14.000
 
 for i,v in next,option do
 local Item = Instance.new("TextButton")
 
 Item.Name = "Item"
 Item.Parent = DropScroll
 Item.BackgroundColor3 = Color3.fromRGB(224,224,224)
 Item.BackgroundTransparency = 1.000
 Item.Size = UDim2.new(0, 310, 0, 26)
 Item.Font = Enum.Font.Gotham
 Item.Text = tostring(v)
 Item.TextColor3 = Color3.fromRGB(1, 1, 1)
 Item.TextSize = 14.000
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
  Dropdown:TweenSize(UDim2.new(0,310,0,31),"Out","Quad",0.3,true)
  TweenService:Create(
   DropImage,
   TweenInfo.new(0.3,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
   {
    Rotation = 180
   }
  ):Play()
  callback(Item.Text)
  DropTitle.Text = text.." : "..Item.Text
  end)
 end
 
 DropScroll.CanvasSize = UDim2.new(0,0,0,UIListLayout.AbsoluteContentSize.Y + 10)
 
 DropButton.MouseButton1Click:Connect(function()
  if isdropping == false then
  isdropping = true
  Dropdown:TweenSize(UDim2.new(0,310,0,131),"Out","Quad",0.3,true)
  TweenService:Create(
   DropImage,
   TweenInfo.new(0.3,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
   {
    Rotation = 0
   }
  ):Play()
  else
   isdropping = false
  Dropdown:TweenSize(UDim2.new(0,310,0,31),"Out","Quad",0.3,true)
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
 Item.BackgroundColor3 = Color3.fromRGB(224,224,224)
 Item.BackgroundTransparency = 1.000
 Item.Size = UDim2.new(0, 310, 0, 26)
 Item.Font = Enum.Font.Gotham
 Item.Text = tostring(t)
 Item.TextColor3 = Color3.fromRGB(1, 1, 1)
 Item.TextSize = 14.000
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
  Dropdown:TweenSize(UDim2.new(0,310,0,31),"Out","Quad",0.3,true)
  TweenService:Create(
   DropImage,
   TweenInfo.new(0.3,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
   {
    Rotation = 180
   }
  ):Play()
  callback(Item.Text)
  DropTitle.Text = text.." : "..Item.Text
  end)
 end
 function dropfunc:Clear()
 DropTitle.Text = tostring(text).." : "
 isdropping = false
 Dropdown:TweenSize(UDim2.new(0,310,0,31),"Out","Quad",0.3,true)
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
 

 
 function main:Slider(text,min,max,set,callback)
 local Slider = Instance.new("Frame")
 local slidercorner = Instance.new("UICorner")
 local sliderr = Instance.new("Frame")
 local sliderrcorner = Instance.new("UICorner")
 local SliderLabel = Instance.new("TextLabel")
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
 Slider.BackgroundColor3 = _G.Color
 Slider.BackgroundTransparency = 0
 Slider.Size = UDim2.new(0, 310, 0, 51)
 
 
 slidercorner.CornerRadius = UDim.new(0, 5)
 slidercorner.Name = "slidercorner"
 slidercorner.Parent = Slider
 
 sliderr.Name = "sliderr"
 sliderr.Parent = Slider
 sliderr.BackgroundTransparency = 0
 sliderr.BackgroundColor3 = Color3.fromRGB(30,30,30)
 sliderr.Position = UDim2.new(0, 1, 0, 1)
 sliderr.Size = UDim2.new(0, 308, 0, 49)
 
 sliderrcorner.CornerRadius = UDim.new(0, 5)
 sliderrcorner.Name = "sliderrcorner"
 sliderrcorner.Parent = sliderr
 
 SliderLabel.Name = "SliderLabel"
 SliderLabel.Parent = sliderr
 SliderLabel.BackgroundColor3 = Color3.fromRGB(224,224,224)
 SliderLabel.BackgroundTransparency = 1.000
 SliderLabel.Position = UDim2.new(0, 15, 0, 0)
 SliderLabel.Size = UDim2.new(0, 180, 0, 26)
 SliderLabel.Font = Enum.Font.Gotham
 SliderLabel.Text = text
 SliderLabel.TextColor3 = Color3.fromRGB(224,224,224)
 SliderLabel.TextSize = 12.000
 SliderLabel.TextTransparency = 0
 SliderLabel.TextXAlignment = Enum.TextXAlignment.Left
 
 HAHA.Name = "HAHA"
 HAHA.Parent = sliderr
 HAHA.BackgroundColor3 = Color3.fromRGB(224,224,224)
 HAHA.BackgroundTransparency = 1.000
 HAHA.Size = UDim2.new(0, 290, 0, 29)
 
 AHEHE.Name = "AHEHE"
 AHEHE.Parent = sliderr
 AHEHE.BackgroundColor3 = Color3.fromRGB(224,224,224)
 AHEHE.BackgroundTransparency = 1.000
 AHEHE.Position = UDim2.new(0, 10, 0, 35)
 AHEHE.Size = UDim2.new(0, 290, 0, 5)
 AHEHE.Font = Enum.Font.SourceSans
 AHEHE.Text = ""
 AHEHE.TextColor3 = Color3.fromRGB(0, 0, 0)
 AHEHE.TextSize = 14.000
 
 bar.Name = "bar"
 bar.Parent = AHEHE
 bar.BackgroundColor3 = _G.BGColor_2
 bar.Size = UDim2.new(0, 290, 0, 5)
 
 bar1.Name = "bar1"
 bar1.Parent = bar
 bar1.BackgroundColor3 = _G.Color
 bar1.BackgroundTransparency = 0
 bar1.Size = UDim2.new(set/max, 0, 0, 5)
 
 bar1corner.CornerRadius = UDim.new(0, 5)
 bar1corner.Name = "bar1corner"
 bar1corner.Parent = bar1
 
 barcorner.CornerRadius = UDim.new(0, 5)
 barcorner.Name = "barcorner"
 barcorner.Parent = bar
 
 circlebar.Name = "circlebar"
 circlebar.Parent = bar1
 circlebar.BackgroundColor3 = Color3.fromRGB(224,224,224)
 circlebar.Position = UDim2.new(1, -2, 0, -3)
 circlebar.Size = UDim2.new(0, 10, 0, 10)
 
 UICorner.CornerRadius = UDim.new(0, 100)
 UICorner.Parent = circlebar
 
 slidervalue.Name = "slidervalue"
 slidervalue.Parent = sliderr
 slidervalue.BackgroundColor3 = _G.Color
 slidervalue.BackgroundTransparency = 1
 slidervalue.Position = UDim2.new(0, 245, 0, 5)
 slidervalue.Size = UDim2.new(0, 65, 0, 18)
 
 valuecorner.CornerRadius = UDim.new(0, 5)
 valuecorner.Name = "valuecorner"
 valuecorner.Parent = slidervalue
 
 TextBox.Parent = slidervalue
 TextBox.BackgroundColor3 = _G.BGColor_2
 TextBox.Position = UDim2.new(0, 0, 0, 0)
 TextBox.Size = UDim2.new(0, 60, 0, 20)
 TextBox.Font = Enum.Font.Gotham
 TextBox.TextColor3 = Color3.fromRGB(1,1,1)
 TextBox.TextSize = 12
 TextBox.Text = set
 TextBox.TextTransparency = 0
 
 posto.Name = "posto"
 posto.Parent = TextBox
 posto.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
 posto.Color = Color3.fromRGB(224,224,224)
 posto.LineJoinMode = Enum.LineJoinMode.Round
 posto.Thickness = 1
 posto.Transparency = 0
 posto.Enabled = true
 posto.Archivable = true
 
 UICorner_2.CornerRadius = UDim.new(0, 5)
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
  Value = math.floor((((tonumber(max) - tonumber(min)) / 300) * bar1.AbsoluteSize.X) + tonumber(min)) or 0
  pcall(function()
   callback(Value)
   end)
  bar1.Size = UDim2.new(0, math.clamp(mouse.X - bar1.AbsolutePosition.X, 0, 300), 0, 5)
  circlebar.Position = UDim2.new(0, math.clamp(mouse.X - bar1.AbsolutePosition.X - 2, 0, 290), 0, -3)
  moveconnection = mouse.Move:Connect(function()
   TextBox.Text = Value
   Value = math.floor((((tonumber(max) - tonumber(min)) / 300) * bar1.AbsoluteSize.X) + tonumber(min))
   pcall(function()
    callback(Value)
    end)
   bar1.Size = UDim2.new(0, math.clamp(mouse.X - bar1.AbsolutePosition.X, 0, 300), 0, 5)
   circlebar.Position = UDim2.new(0, math.clamp(mouse.X - bar1.AbsolutePosition.X - 2, 0, 290), 0, -3)
   end)
  releaseconnection = uis.InputEnded:Connect(function(Mouse)
   if Mouse.UserInputType == Enum.UserInputType.MouseButton1 then
   Value = math.floor((((tonumber(max) - tonumber(min)) / 300) * bar1.AbsoluteSize.X) + tonumber(min))
   pcall(function()
    callback(Value)
    end)
   bar1.Size = UDim2.new(0, math.clamp(mouse.X - bar1.AbsolutePosition.X, 0, 300), 0, 5)
   circlebar.Position = UDim2.new(0, math.clamp(mouse.X - bar1.AbsolutePosition.X - 2, 0, 290), 0, -3)
   moveconnection:Disconnect()
   releaseconnection:Disconnect()
   end
   end)
  end)
 releaseconnection = uis.InputEnded:Connect(function(Mouse)
  if Mouse.UserInputType == Enum.UserInputType.MouseButton1 then
  Value = math.floor((((tonumber(max) - tonumber(min)) / 300) * bar1.AbsoluteSize.X) + tonumber(min))
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
 function main:Textbox(text,disappear,callback)
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
 Textbox.BackgroundColor3 = _G.Color
 Textbox.BackgroundTransparency = 0
 Textbox.Size = UDim2.new(0, 306, 0, 31)
 
 TextboxCorner.CornerRadius = UDim.new(0, 5)
 TextboxCorner.Name = "TextboxCorner"
 TextboxCorner.Parent = Textbox
 
 Textboxx.Name = "Textboxx"
 Textboxx.Parent = Textbox
 Textboxx.BackgroundColor3 = Color3.fromRGB(100,100,100)
 Textboxx.Position = UDim2.new(0, 1, 0, 1)
 Textboxx.Size = UDim2.new(0, 304, 0, 29)
 
 TextboxxCorner.CornerRadius = UDim.new(0, 5)
 TextboxxCorner.Name = "TextboxxCorner"
 TextboxxCorner.Parent = Textboxx
 
 TextboxLabel.Name = "TextboxLabel"
 TextboxLabel.Parent = Textbox
 TextboxLabel.BackgroundColor3 = Color3.fromRGB(224,224,224)
 TextboxLabel.BackgroundTransparency = 1.000
 TextboxLabel.Position = UDim2.new(0, 15, 0, 0)
 TextboxLabel.Text = text
 TextboxLabel.Size = UDim2.new(0, 128, 0, 31)
 TextboxLabel.Font = Enum.Font.Gotham
 TextboxLabel.TextColor3 = Color3.fromRGB(225, 225, 225)
 TextboxLabel.TextSize = 16.000
 TextboxLabel.TextTransparency = 0
 TextboxLabel.TextXAlignment = Enum.TextXAlignment.Left
 
 txtbtn.Name = "txtbtn"
 txtbtn.Parent = Textbox
 txtbtn.BackgroundColor3 = Color3.fromRGB(224,224,224)
 txtbtn.BackgroundTransparency = 1.000
 txtbtn.Position = UDim2.new(0, 1, 0, 1)
 txtbtn.Size = UDim2.new(0, 310, 0, 29)
 txtbtn.Font = Enum.Font.SourceSans
 txtbtn.Text = ""
 txtbtn.TextColor3 = Color3.fromRGB(0, 0, 0)
 txtbtn.TextSize = 14.000
 
 RealTextbox.Name = "RealTextbox"
 RealTextbox.Parent = Textbox
 RealTextbox.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
 RealTextbox.BackgroundTransparency = 0
 RealTextbox.Position = UDim2.new(0, 190, 0, 4)
 RealTextbox.Size = UDim2.new(0, 100, 0, 24)
 RealTextbox.Font = Enum.Font.Gotham
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
 function main:Label(text)
 local Label = Instance.new("TextLabel")
 local PaddingLabel = Instance.new("UIPadding")
 local labelfunc = {}
 
 Label.Name = "Label"
 Label.Parent = MainFramePage
 Label.BackgroundColor3 = Color3.fromRGB(224,224,224)
 Label.BackgroundTransparency = 1.000
 Label.Size = UDim2.new(0, 325, 0, 20)
 Label.Font = Enum.Font.Gotham
 Label.TextColor3 = Color3.fromRGB(1,1,1)
 Label.TextSize = 12.000
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
 
 function main:Label1(text)
 local Label1 = Instance.new("TextLabel")
 local PaddingLabel1 = Instance.new("UIPadding")
 local Label1func = {}
 
 Label1.Name = "Label1"
 Label1.Parent = MainFramePage
 Label1.BackgroundColor3 = Color3.fromRGB(224,224,224)
 Label1.BackgroundTransparency = 1.000
 Label1.Size = UDim2.new(0, 325, 0, 20)
 Label1.Font = Enum.Font.Gotham
 Label1.TextColor3 = Color3.fromRGB(1, 1, 1)
 Label1.TextSize = 12.000
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
 
function main:Seperator(text)
 local Seperator = Instance.new("Frame")
 local Sep1 = Instance.new("Frame")
 local Sep2 = Instance.new("TextLabel")
 local Sep3 = Instance.new("Frame")
 
 Seperator.Name = "Seperator"
 Seperator.Parent = MainFramePage
 Seperator.BackgroundColor3 = Color3.fromRGB(224,224,224)
 Seperator.BackgroundTransparency = 1.000
 Seperator.Size = UDim2.new(0, 290, 0, 20)
 
 Sep1.Name = "Sep1"
 Sep1.Parent = Seperator
 Sep1.BackgroundColor3 = _G.Color
 Sep1.BorderSizePixel = 0
 Sep1.Position = UDim2.new(0, 0, 0, 10)
 Sep1.Size = UDim2.new(0, 80, 0, 1)
 
 Sep2.Name = "Sep2"
 Sep2.Parent = Seperator
 Sep2.BackgroundColor3 = Color3.fromRGB(224,224,224)
 Sep2.BackgroundTransparency = 1.000
 Sep2.Position = UDim2.new(0, 120, 0, 0)
 Sep2.Size = UDim2.new(0, 80, 0, 20)
 Sep2.Font = Enum.Font.Gotham
 Sep2.Text = text
 Sep2.TextColor3 = Color3.fromRGB(1,1,1)
 Sep2.TextSize = 16.000
 
 Sep3.Name = "Sep3"
 Sep3.Parent = Seperator
 Sep3.BackgroundColor3 = _G.Color
 Sep3.BorderSizePixel = 0
 Sep3.Position = UDim2.new(0, 240, 0, 10)
 Sep3.Size = UDim2.new(0, 80, 0, 1)
 end
 
 
 function main:Line()
 local Linee = Instance.new("Frame")
 local Line = Instance.new("Frame")
 
 Linee.Name = "Linee"
 Linee.Parent = MainFramePage
 Linee.BackgroundColor3 = Color3.fromRGB(224,224,224)
 Linee.BackgroundTransparency = 1.000
 Linee.Position = UDim2.new(0, 0, 0.119999997, 0)
 Linee.Size = UDim2.new(0, 310, 0, 20)
 
 Line.Name = "Line"
 Line.Parent = Linee
 Line.BackgroundColor3 = _G.Color
 Line.BorderSizePixel = 0
 Line.Position = UDim2.new(0, 0, 0, 10)
 Line.Size = UDim2.new(0, 325, 0, 1)
 end
 return main
 end
 return uitab
 end
 
 


----------------------------------save confing
 
-- التأكد من أن HttpService متاح
local HttpService = game:GetService("HttpService")

-- اسم الملف الرئيسي
local MainFileName = "CITYPVP"
local ModeName = "PVPV2"
-- البيانات المراد حفظها
local CITY_CONFIG = {
    Show_Info = _G.ShowInfo or false,
    
    Aimbot = _G.Aimbot or false,
    --
    Mod_Aim = _G.ModAim or "AIM DISTANCE",
    
    ESP_Player = _G.ESPPlayer or false,
    
    Devil_Fruit_ESP = _G.DevilFruitESP or false,
    
    Walk_Water = _G.WalkWater or false,
    
    Inf_Ability = _G.InfAbility or false,
    
    Auto_Awakening_Race = _G.AutoAwakeningRace or false,
    
    Fast_Attack = _G.FastAttack or false,
    
    Super_Fast_Mode = _G.SuperFastMode or false
    
}

-- علم لتتبع التعديلات
local isSettingsModified = false

-- وظيفة لحفظ الملف
local function UpdateFile(FileName)
    assert(type(FileName) == "string", "Oopsies! FileName should be a string.")
    writefile(string.format("%s/%s/%s.lua", MainFileName, ModeName, FileName), HttpService:JSONEncode(CITY_CONFIG))
end

-- وظيفة لقراءة الملف
local function LoadFile(FileName)
    assert(type(FileName) == "string", "Oopsies! FileName should be a string.")
    
    local File = string.format("%s/%s/%s.lua", MainFileName, ModeName, FileName)
    local ConfigData = HttpService:JSONDecode(readfile(File))
    for Index, Value in pairs(ConfigData) do
        CITY_CONFIG[Index] = Value
    end
end

-- الحصول على اسم اللاعب
local PlayerName = game.Players.LocalPlayer.Name

-- وظيفة للتحقق من وجود الملف
local function FileExists(FileName)
    local File = string.format("%s/%s/%s.lua", MainFileName, ModeName, FileName)
    return pcall(function() readfile(File) end)
end

-- التحقق من وجود ملف اللاعب
if not FileExists(PlayerName) then
    UpdateFile(PlayerName)
end

wait(2)

-- قراءة البيانات عند بدء اللعبة باستخدام اسم اللاعب
LoadFile(PlayerName)

-- تحديث _G بالقيم المحملة
_G.ShowInfo = CITY_CONFIG.Show_Info
_G.Aimbot = CITY_CONFIG.Aimbot
_G.ModAim = CITY_CONFIG.Mod_Aim
_G.ESPPlayer = CITY_CONFIG.ESP_Player
_G.DevilFruitESP = CITY_CONFIG.Devil_Fruit_ESP
_G.No_clip = CITY_CONFIG.No_clip
_G.WalkWater = CITY_CONFIG.Walk_Water
_G.InfAbility = CITY_CONFIG.Inf_Ability
_G.AutoAwakeningRace = CITY_CONFIG.Auto_Awakening_Race
_G.FastAttack = CITY_CONFIG.Fast_Attack
_G.SuperFastMode = CITY_CONFIG.Super_Fast_Mode








-- متابعة التعديلات وتحديث الملف عند التغيير
spawn(function()
    while true do
        wait(1)
        if isSettingsModified then
            UpdateFile(PlayerName)
            isSettingsModified = false -- تعيين العلم إلى false بعد التحديث
        end
    end
end)


----------------------------------save confing

if game.PlaceId == 2753915549 then
	World1 = true
elseif game.PlaceId == 4442272183 then
	World2 = true
elseif game.PlaceId == 7449423635 then
	World3 = true
end

function isnil(thing)
    return (thing == nil)
end
local function round(n)
	return math.floor(tonumber(n) + 0.5)
end
Number = math.random(1, 1000000)
function UpdatePlayerChams()
    local players = game:GetService('Players')
    local localPlayer = players.LocalPlayer

    for i, v in pairs(players:GetChildren()) do
        pcall(function()
            if v ~= localPlayer and v.Character and v.Character:FindFirstChild("Head") then  -- Ignore local player
                if _G.ESPPlayer then
                    local teamName = v.Team and v.Team.Name or "No Team"
                    local head = v.Character.Head
                    local espName = 'NameEsp' .. Number

                    local distance = (localPlayer.Character.Head.Position - v.Character.Head.Position).Magnitude
                    if distance == 0 then return end  -- Ignore if distance is 0

                    if not head:FindFirstChild(espName) then
                        local bill = Instance.new('BillboardGui', head)
                        bill.Name = espName
                        bill.ExtentsOffset = Vector3.new(0, 1, 0)
                        bill.Size = UDim2.new(1, 200, 1, 30)
                        bill.Adornee = head
                        bill.AlwaysOnTop = true

                        local name = Instance.new('TextLabel', bill)
                        name.Font = Enum.Font.GothamSemibold
                        name.TextSize = 10
                        name.TextWrapped = true
                        name.RichText = true  -- Enable RichText
                        name.Size = UDim2.new(1, 0, 2, 0)
                        name.TextYAlignment = Enum.TextYAlignment.Top
                        name.BackgroundTransparency = 1
                        name.TextStrokeTransparency = 0.5
                        name.TextColor3 = Color3.fromRGB(255, 255, 255)
                    else
                        local name = head[espName].TextLabel
                        if teamName == "Pirates" then
                            name.Text = ('<font color="rgb(0,0,0)">「 CITY 」</font>\n' .. v.Name .. ' | ' .. math.round(distance / 3) .. ' Distance\nHealth: ' .. math.floor(v.Character.Humanoid.Health) .. "/" .. v.Character.Humanoid.MaxHealth .. '\n' .. '| TEAM:' .. '<font color="rgb(255,0,0)"> Pirate </font>' .. '|')
                        elseif teamName == "Marines" then
                            name.Text = ('<font color="rgb(0,0,0)">「 CITY 」</font>\n' .. v.Name .. ' | ' .. math.round(distance / 3) .. ' Distance\nHealth: ' .. math.floor(v.Character.Humanoid.Health) .. "/" .. v.Character.Humanoid.MaxHealth .. '\n' .. '| TEAM:' .. '<font color="rgb(0,0,255)"> Marine </font>' .. '|')
                        else
                            name.Text = ('<font color="rgb(0,0,0)">「 CITY 」</font>\n' .. v.Name .. ' | ' .. math.round(distance / 3) .. ' Distance\nHealth: ' .. math.floor(v.Character.Humanoid.Health) .. "/" .. v.Character.Humanoid.MaxHealth .. '\n' .. '| TEAM:' .. '<font color="rgb(1,1,1)"> Error </font>' .. '|')
                        end
                    end
                else
                    if v.Character.Head:FindFirstChild('NameEsp' .. Number) then
                        v.Character.Head:FindFirstChild('NameEsp' .. Number):Destroy()
                    end
                end
            end
        end)
    end
end


function UpdateDevilChams() 
    for i, v in pairs(game.Workspace:GetChildren()) do
        pcall(function()
            local handle = v:FindFirstChild("Handle")
            if handle then
                local billboardName = 'NameEsp'..Number
                if _G.DevilFruitESP and string.find(v.Name, "Fruit") then
                    local fruitName = v.Name
                    local motor6D = v:FindFirstChild("Fruit") and v.Fruit:FindFirstChild("Fruit") and v.Fruit.Fruit:FindFirstChildOfClass("Motor6D")
                    
                    -- تحقق إضافي للتأكد من وجود العناصر قبل محاولة الوصول إلى AnimationId
                    local id1, id2
                    if v:FindFirstChild("Fruit") then
                        local fruit = v.Fruit
                        if fruit:FindFirstChild("Animation") then
                            id1 = fruit.Animation.AnimationId
                        end
                        if fruit:FindFirstChild("Idle") then
                            id2 = fruit.Idle.AnimationId
                        end
                    end
                    
                    HACK = tostring(motor6D)
                    ANIM1 = tostring(id1)
                    ANIM2 = tostring(id2)
                    local City = ""
                    if fruitName == "Fruit " then
                        if ANIM2 == "rbxassetid://15123689268" then
                            City = "<SPRING> |"
                            fruitName = "Spawned"
                        elseif ANIM2 == "rbxassetid://15123613404" then
                            City = "<CHOP> |"
                            fruitName = "Spawned"
                        elseif ANIM1 == "rbxassetid://15123595806" then
                            City = "<BOMB> |"
                            fruitName = "Spawned"
                        elseif ANIM2 == "rbxassetid://15123629861" then
                            City = "<FLAME> |"
                            fruitName = "Spawned"
                        ---------------------------------------------------------------------------------------
                        elseif ANIM1 == "rbxassetid://15124425041" then
                            City = "<ROCKET> |"
                            fruitName = "Spawned"
                        elseif ANIM2 == "rbxassetid://15123627377" then
                            City = "<FALOCAN> |"
                            fruitName = "Spawned"
                        elseif ANIM2 == "rbxassetid://15123618591" then
                            City = "<DARK> |"
                            fruitName = "Spawned"
                        ---------------------------------------------------------------------------------------
                        elseif ANIM2 == "rbxassetid://15123662036" then
                            City = "<GHOST> |"
                            fruitName = "Spawned"
                        elseif ANIM1 == "rbxassetid://15123659214" then
                            City = "<QUAKE> |"
                            fruitName = "Spawned"
                        elseif ANIM2 == "rbxassetid://15123643097" then
                            City = "<LOVE> |"
                            fruitName = "Spawned"
                        elseif ANIM2 == "rbxassetid://15123681598" then
                            City = "<SPIDER> |"
                            fruitName = "Spawned"
                        ---------------------------------------------------------------------------------------
                        elseif ANIM2 == "rbxassetid://15123624401" then
                            City = "<DOUGH> |"
                            fruitName = "Spawned"
                        elseif ANIM2 == "rbxassetid://15123685330" then
                            City = "<SPIN> |"
                            fruitName = "Spawned"
                        elseif ANIM2 == "rbxassetid://15123677932" then
                            City = "<SMOKE> |"
                            fruitName = "Spawned"
                            
                            
                        elseif ANIM2 == "rbxassetid://15123673019" then
                            City = "<SAND> |"
                            fruitName = "Spawned"
                        elseif ANIM2 == "rbxassetid://15123640714" then
                            City = "<LIGHT> |"
                            fruitName = "Spawned"
                        elseif ANIM2 == "rbxassetid://15123668008" then
                            City = "<RUBBER> |"
                            fruitName = "Spawned"
                        elseif ANIM2 == "rbxassetid://15123645682" then
                            City = "<MAGMA> |"
                            fruitName = "Spawned"
                        elseif ANIM2 == "rbxassetid://15123679712" then
                            City = "<SOUND> |"
                            fruitName = "Spawned"
                        elseif ANIM2 == "rbxassetid://15123654553" then
                            City = "<PHOENIX> |"
                            fruitName = "Spawned"
                        elseif ANIM2 == "rbxassetid://15123656798" then
                            City = "<PORTAL> |"
                            fruitName = "Spawned"
                        elseif ANIM2 == "rbxassetid://15123652069" then
                            City = "<PAIN> |"
                            fruitName = "Spawned"
                        elseif ANIM2 == "rbxassetid://15123587371" then
                            City = "<BLIZZARD> |"
                            fruitName = "Spawned"
                        elseif ANIM2 == "rbxassetid://15123633312" then
                            City = "<GRAVITY> |"
                            fruitName = "Spawned"
                        elseif ANIM2 == "rbxassetid://10773719142" then
                            City = "<VENOM> |"
                            fruitName = "Spawned"
                        elseif ANIM2 == "rbxassetid://15123616275" then
                            City = "<CONTROL> |"
                            fruitName = "Spawned"
                        elseif ANIM1 == "GG" then
                            City = "<LEO> |"
                            fruitName = "Spawned"
                        elseif HACK == "GG" then
                            City = "<KITSUNE> |"
                            fruitName = "Spawned"
                        else
                            fruitName = "Spawned"
                            City = "<???> |"
                        end
                    end

                    local bill = handle:FindFirstChild(billboardName) or Instance.new('BillboardGui', handle)
                    bill.Name = billboardName
                    bill.ExtentsOffset = Vector3.new(0, 1, 0)
                    bill.Size = UDim2.new(1, 200, 1, 30)
                    bill.Adornee = handle
                    bill.AlwaysOnTop = true

                    local name = bill:FindFirstChildOfClass('TextLabel') or Instance.new('TextLabel', bill)
                    name.Font = Enum.Font.GothamSemibold
                    name.FontSize = Enum.FontSize.Size14
                    name.TextWrapped = true
                    name.Size = UDim2.new(1, 0, 2, 0)
                    name.TextYAlignment = Enum.TextYAlignment.Top
                    name.BackgroundTransparency = 1
                    name.TextStrokeTransparency = 0.5
                    name.TextColor3 = Color3.fromRGB(255, 255, 0)
                    name.Text = '| ' .. fruitName .. '| ' .. City .. '\n' .. math.round((game.Players.LocalPlayer.Character.Head.Position - handle.Position).Magnitude / 3) .. ' Distance'
                else
                    local bill = handle:FindFirstChild(billboardName)
                    if bill then
                        bill:Destroy()
                    end
                end
            end
        end)
    end
end


spawn(function()
	    while wait(0.1) do
		    if FlowerESP then
			    UpdateFlowerChams() 
		    end
		    if _G.DevilFruitESP then
			    UpdateDevilChams() 
		    end
		    if ChestESP then
			    UpdateChestChams() 
		    end
		    if _G.ESPPlayer then
			    UpdatePlayerChams()
		    end
		    if RealFruitESP then
			    UpdateRealFruitChams()
		    end
	    end
    end)



--------------------------------------------------------------------------------------------------------
local mouse = game.Players.LocalPlayer:GetMouse()
local guiservice = game:GetService("GuiService")
local players = game:GetService("Players")
local localPlayer = players.LocalPlayer
local currentCamera = game:GetService("Workspace").CurrentCamera
local circle = Drawing.new("Circle")

-------- UI Info --------
local infoplayers = Instance.new("ScreenGui")
local Main = Instance.new("Frame")
local MainCorner = Instance.new("UICorner")
local Profile = Instance.new("Frame")
local ProfileCorner = Instance.new("UICorner")
local ImageProfile = Instance.new("ImageLabel")
local ImageProfileCorner = Instance.new("UICorner")
local HealthPlayers = Instance.new("TextLabel")
local NamePlayers = Instance.new("TextLabel")
local loackplayerslabel = Instance.new("TextLabel")
local Healthbar = Instance.new("Frame")
local HealthbarCorner = Instance.new("UICorner")
local Healthgreen = Instance.new("Frame")
local HealthgreenCorner = Instance.new("UICorner")

infoplayers.Name = "infoplayers"
infoplayers.Parent = game:GetService("CoreGui")
infoplayers.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

Main.Name = "Main"
Main.Parent = infoplayers
Main.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Main.Position = UDim2.new(0.45, 0, -0.1, 0)
Main.Size = UDim2.new(0, 130, 0, 35)  -- حجم أصغر

MainCorner.Name = "MainCorner"
MainCorner.Parent = Main

Profile.Name = "Profile"
Profile.Parent = Main
Profile.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Profile.Position = UDim2.new(0.057, 0, 0.149, 0)
Profile.Size = UDim2.new(0, 25, 0, 25)  -- حجم أصغر

ProfileCorner.CornerRadius = UDim.new(0, 50)
ProfileCorner.Name = "ProfileCorner"
ProfileCorner.Parent = Profile

ImageProfile.Name = "ImageProfile"
ImageProfile.Parent = Profile
ImageProfile.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
ImageProfile.BackgroundTransparency = 0
ImageProfile.Position = UDim2.new(0, 0, 0, 0)
ImageProfile.Size = UDim2.new(0, 25, 0, 25)  -- حجم أصغر
ImageProfile.Image = ''

ImageProfileCorner.CornerRadius = UDim.new(0, 50)
ImageProfileCorner.Name = "ImageProfileCorner"
ImageProfileCorner.Parent = ImageProfile

HealthPlayers.Name = "HealthPlayers"
HealthPlayers.Parent = Profile
HealthPlayers.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
HealthPlayers.BackgroundTransparency = 1.0
HealthPlayers.Position = UDim2.new(1.242, 0, 0.3, 0)
HealthPlayers.Size = UDim2.new(0, 86, 0, 11)  -- حجم أصغر
HealthPlayers.Font = Enum.Font.FredokaOne
HealthPlayers.Text = "Health | N/A"
HealthPlayers.TextColor3 = Color3.fromRGB(255, 255, 255)
HealthPlayers.TextSize = 9.5  -- حجم نص أصغر
HealthPlayers.TextXAlignment = Enum.TextXAlignment.Left
HealthPlayers.TextYAlignment = Enum.TextYAlignment.Bottom
HealthPlayers.TextStrokeTransparency = 0.2
                        
NamePlayers.Name = "NamePlayers"
NamePlayers.Parent = Profile
NamePlayers.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
NamePlayers.BackgroundTransparency = 1.0
NamePlayers.Position = UDim2.new(1.242, 0, -0.1, 0)
NamePlayers.Size = UDim2.new(0, 86, 0, 11)  -- حجم أصغر
NamePlayers.Font = Enum.Font.FredokaOne
NamePlayers.Text = "Name | N/A"
NamePlayers.TextColor3 = Color3.fromRGB(255, 255, 255)
NamePlayers.TextSize = 9.5  -- حجم نص أصغر
NamePlayers.TextXAlignment = Enum.TextXAlignment.Left
NamePlayers.TextYAlignment = Enum.TextYAlignment.Bottom
NamePlayers.TextStrokeTransparency = 0.2

Healthbar.Name = "Healthbar"
Healthbar.Parent = Profile
Healthbar.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Healthbar.Position = UDim2.new(1.233, 0, 0.8, 0)
Healthbar.Size = UDim2.new(0, 77, 0, 4)  -- حجم أصغر


HealthbarCorner.Name = "HealthbarCorner"
HealthbarCorner.Parent = Healthbar

Healthgreen.Name = "Healthgreen"
Healthgreen.Parent = Healthbar
Healthgreen.BackgroundColor3 = Color3.fromRGB(0, 227, 110)
Healthgreen.Size = UDim2.new(0, 77, 0, 4)  -- حجم أصغر

HealthgreenCorner.Name = "HealthgreenCorner"
HealthgreenCorner.Parent = Healthgreen


-------




getgenv().setting = {
    Fov = 100,
    Color = Color3.fromRGB(191, 255, 209),
    LockPlayers = false,
}

local Playersaimbot = nil
local PlayersPosition = nil
--[[
spawn(function()
    pcall(function()
        while wait(.1) do
            if _G.Aimbot then
                for _, v in pairs(players:GetPlayers()) do
                    if game.Workspace.Characters:FindFirstChild(v.Name) or game.Workspace.Characters:FindFirstChild(v.DisplayName) then
                        if v.Character:FindFirstChild('HumanoidRootPart') then
                            local pos = currentCamera:WorldToViewportPoint(v.Character.HumanoidRootPart.Position)
                            local magnitude = (Vector2.new(pos.X, pos.Y) - Vector2.new(402, 196)).magnitude
                            if magnitude < getgenv().setting.Fov then
                                if magnitude < math.huge then
                                    if (v.Character.HumanoidRootPart.Position - localPlayer.Character.HumanoidRootPart.Position).magnitude <= 1000 then
                                        if v.Name ~= localPlayer.Name then
                                            if not getgenv().setting.LockPlayers then
                                                Playersaimbot = v.Name
                                                PlayersPosition = v.Character.HumanoidRootPart.Position
                                                v.Character.HumanoidRootPart.Size = Vector3.new(10,10,10)
                                            end
                                        end
                                    end
                                end
                            end
                        end
                    end
                end
            end
        end
    end)
end)
]]

spawn(function()
    pcall(function()
        local players = game:GetService("Players")
        local localPlayer = players.LocalPlayer
        
        while wait(0.1) do
            if _G.Aimbot then
                if _G.ModAim == "AIM DISTANCE" then
                    local closestPlayer = nil
                    local shortestDistance = math.huge
                    
                    for _, v in pairs(players:GetPlayers()) do
                        if v ~= localPlayer and v.Character and v.Character:FindFirstChild("HumanoidRootPart") then
                            local playerChar = v.Character
                            local rootPart = playerChar.HumanoidRootPart
                            local localChar = localPlayer.Character
                            if localChar and localChar:FindFirstChild("HumanoidRootPart") then
                                local localRootPart = localChar.HumanoidRootPart
                                local distance = (rootPart.Position - localRootPart.Position).Magnitude
                                
                                if distance < shortestDistance and distance <= 25000 then
                                    closestPlayer = v
                                    shortestDistance = distance
                                end
                            end
                        end
                    end
                    
                    if closestPlayer then
                        local rootPart = closestPlayer.Character.HumanoidRootPart
                        Playersaimbot = closestPlayer.Name
                        PlayersPosition = rootPart.Position
                        rootPart.Size = Vector3.new(10, 10, 10)
                    end
                elseif _G.ModAim == "AIM PLAYER" and _G.SelectPly then
                    local targetPlayer = players:FindFirstChild(_G.SelectPly)
                    if targetPlayer and targetPlayer.Character and targetPlayer.Character:FindFirstChild("HumanoidRootPart") then
                        local rootPart = targetPlayer.Character.HumanoidRootPart
                        Playersaimbot = targetPlayer.Name
                        PlayersPosition = rootPart.Position
                        rootPart.Size = Vector3.new(10, 10, 10)
                    end
                end
            end
        end
    end)
end)


spawn(function()
    game.GetService(game, "RunService").RenderStepped:Connect(function()
        if Playersaimbot ~= nil then 
            for i,v in pairs(game.Players:GetChildren()) do
                if v.Name == Playersaimbot then 
                    if game.Workspace.Characters:FindFirstChild(v.Name) then
                        NamePlayers.Text = "Name | "..v.Name
                        HealthPlayers.Text = "Health | "..math.floor(v.Character.Humanoid.Health).."/"..v.Character.Humanoid.MaxHealth
                        local hp = v.Character.Humanoid.Health/v.Character.Humanoid.MaxHealth
                        pcall(function()
                        Healthgreen:TweenSize(UDim2.new(hp,0,0,8),Enum.EasingDirection.Out,Enum.EasingStyle.Quad,0.15)
                        end)
                        ImageProfile.Image = game:GetService("Players"):GetUserThumbnailAsync(v.UserId, Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size420x420)
                    end
                end
            end
        end
    end)
end)


-- تحديث الموقع في تردد معين بدلاً من حلقة لانهائية
spawn(function()
    while wait(0.0000000000000000000000000000000001) do  -- تحديث الموقع كل 0.1 ثانية
        local targetPlayer = game.Players:FindFirstChild(Playersaimbot)
        if targetPlayer and targetPlayer.Character and targetPlayer.Character:FindFirstChild("HumanoidRootPart") then
            PlayersPosition = targetPlayer.Character.HumanoidRootPart.Position
        end
    end
end)

spawn(function()
	local gg = getrawmetatable(game)
	local old = gg.__namecall
	setreadonly(gg,false)
	gg.__namecall = newcclosure(function(...)
		local method = getnamecallmethod()
		local args = {...}
		if tostring(method) == "FireServer" then
			if tostring(args[1]) == "RemoteEvent" then
				if tostring(args[2]) ~= "true" and tostring(args[2]) ~= "false" then
					if Playersaimbot ~= nil then
                        args[2] = PlayersPosition
                        return old(unpack(args))
                    end
				end
			end
		end
		return old(...)
	end)
end)



--------
local Library = Update:Window("CITY ","")
 
 --------------------------
local MAIN = Library:Tab("MAIN","rbxassetid://11446825283")
local MISC = Library:Tab("MISC","rbxassetid://11446835336")


MAIN:Toggle("SHOW INFO PLAYER",_G.ShowInfo,function(value)
 _G.ShowInfo = value
 CITY_CONFIG.Show_Info = value
 isSettingsModified = true
end)

game:GetService("RunService").Stepped:Connect(function()
		if _G.ShowInfo then
			Main.Visible = true
		else
			Main.Visible = false
		end
	end)

    Playerslist = {}
    
    for i,v in pairs(game:GetService("Players"):GetChildren()) do
        table.insert(Playerslist,v.Name)
    end

-- 

local SelectedPly = MAIN:Dropdown("SELECT PLAYER",Playerslist,function(value)
    _G.SelectPly = value
end)

MAIN:Button("REFRESH",function()
        Playerslist = {}
        SelectedPly:Clear()
        for i,v in pairs(game:GetService("Players"):GetChildren()) do  
            SelectedPly:Add(v.Name)
        end
    end)


MAIN:Toggle("ENABLE AIMBOT",_G.Aimbot,function(value)
 _G.Aimbot = value
 CITY_CONFIG.Aimbot = value
 isSettingsModified = true
end)


MAIN:Dropdown("MODE AIMBOT",{"AIM DISTANCE","AIM PLAYER"},function(value)
    _G.ModAim = value
    CITY_CONFIG.Mod_Aim = value
    isSettingsModified = true
end)





MAIN:Toggle("ESP PLAYERS",_G.ESPPlayer,function(a)
     _G.ESPPlayer = a
     CITY_CONFIG.ESP_Player = a
     isSettingsModified = true
	 UpdatePlayerChams()
end)

MAIN:Toggle("ESP FRUIT",_G.DevilFruitESP,function(a)
         _G.DevilFruitESP = a
         CITY_CONFIG.Devil_Fruit_ESP = a
         isSettingsModified = true
         UpdateDevilChams() 
end)

MISC:Toggle("NO CLIP",_G.No_clip,function(Value)
        _G.No_clip = Value
        CITY_CONFIG.No_clip = Value
        isSettingsModified = true
    end)
    
MISC:Toggle("WALK IN WATER",_G.WalkWater,function(Value)
        _G.WalkWater = Value
        CITY_CONFIG.Walk_Water = Value
        isSettingsModified = true
    end)
MISC:Toggle("MINK ABILITY",_G.InfAbility,function(Value)
        _G.InfAbility = Value
        CITY_CONFIG.Inf_Ability = Value
        isSettingsModified = true
        if Value == false then
            game:GetService("Players").LocalPlayer.Character.HumanoidRootPart:FindFirstChild("Agility"):Destroy()
        end
    end)
    
 

MISC:Toggle("AUTO AWAKENING",_G.AutoAwakeningRace,function(Value)
        _G.AutoAwakeningRace = Value
        CITY_CONFIG.Auto_Awakening_Race = Value
        isSettingsModified = true
    end)
    
spawn(function()
    game:GetService("RunService").RenderStepped:Connect(function()
        local player = game.Players.LocalPlayer
        if player.Character:FindFirstChild("RaceEnergy") then
            if _G.AutoAwakeningRace and player.Character.RaceEnergy.Value == 1 then
                game:GetService("VirtualInputManager"):SendKeyEvent(true, "Y", false, game)
                wait(0.1)
                game:GetService("VirtualInputManager"):SendKeyEvent(false, "Y", false, game)
                wait(9)
            end
        end
    end)
end)


spawn(function()
			while task.wait(.1) do
				pcall(function()
					if _G.WalkWater then
						game:GetService("Workspace").Map["WaterBase-Plane"].Size = Vector3.new(1000,112,1000)
					else
						game:GetService("Workspace").Map["WaterBase-Plane"].Size = Vector3.new(1000,80,1000)
					end
				end)
			end
		end)

spawn(function()
    pcall(function()
        game:GetService("RunService").Stepped:Connect(function()
            if _G.No_clip then
                for _, v in pairs(game.Players.LocalPlayer.Character:GetDescendants()) do
                    if v:IsA("BasePart") then
                        v.CanCollide = false    
                    end
                end
            end
        end)
    end)
end)


    function InfAb()
        if _G.InfAbility then
            if not game:GetService("Players").LocalPlayer.Character.HumanoidRootPart:FindFirstChild("Agility") then
                local inf = Instance.new("ParticleEmitter")
                inf.Acceleration = Vector3.new(0,0,0)
                inf.Archivable = true
                inf.Drag = 20
                inf.EmissionDirection = Enum.NormalId.Top
                inf.Enabled = true
                inf.Lifetime = NumberRange.new(0,0)
                inf.LightInfluence = 0
                inf.LockedToPart = true
                inf.Name = "Agility"
                inf.Rate = 500
                local numberKeypoints2 = {
                    NumberSequenceKeypoint.new(0, 0);
                    NumberSequenceKeypoint.new(1, 4); 
                }
                inf.Size = NumberSequence.new(numberKeypoints2)
                inf.RotSpeed = NumberRange.new(99999999, 99999999)
                inf.Rotation = NumberRange.new(0, 0)
                inf.Speed = NumberRange.new(100, 100)
                inf.SpreadAngle = Vector2.new(0,0,0,0)
                inf.Texture = ""
                inf.VelocityInheritance = 0
                inf.ZOffset = 2
                inf.Transparency = NumberSequence.new(0)
                inf.Color = ColorSequence.new(Color3.fromRGB(0,0,0),Color3.fromRGB(0,0,0))
                inf.Parent = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart
            end
        else
            if game:GetService("Players").LocalPlayer.Character.HumanoidRootPart:FindFirstChild("Agility") then
                game:GetService("Players").LocalPlayer.Character.HumanoidRootPart:FindFirstChild("Agility"):Destroy()
            end
        end
    end
    
    local LocalPlayer = game:GetService'Players'.LocalPlayer
    local originalstam = LocalPlayer.Character.Energy.Value
spawn(function()
        while wait(.1) do
            if _G.InfAbility then
                InfAb()
            end
        end
    end)
MISC:Line()

MISC:Toggle("FAST ATTACK",_G.FastAttack,function(value)
 _G.FastAttack = value
 CITY_CONFIG.Fast_Attack = value
 isSettingsModified = true
 
 
end)
local CameraShaker = require(game.ReplicatedStorage.Util.CameraShaker)
CombatFrameworkR = require(game:GetService("Players").LocalPlayer.PlayerScripts.CombatFramework)
y = debug.getupvalues(CombatFrameworkR)[2]
spawn(function()
    game:GetService("RunService").RenderStepped:Connect(function()
        if _G.FastAttack then
            if typeof(y) == "table" then
                pcall(function()
                    CameraShaker:Stop()
                    y.activeController.timeToNextAttack = (math.huge^math.huge^math.huge)
                    y.activeController.timeToNextAttack = 0.1
                    y.activeController.hitboxMagnitude = 500
                    y.activeController.active = false
                    y.activeController.timeToNextBlock = 0
                    y.activeController.focusStart = 99999999
                    y.activeController.increment = 1
                    y.activeController.blocking = false
                    y.activeController.attacking = false
                    y.activeController.humanoid.AutoRotate = true
                end)
            end
        end
    end)
end)
spawn(function()
    game:GetService("RunService").RenderStepped:Connect(function()
        if _G.FastAttack == true then
            game.Players.LocalPlayer.Character.Stun.Value = 0
            game.Players.LocalPlayer.Character.Busy.Value = false        
        end
    end)
end)

MISC:Toggle("SUPER FAST ATTACK",_G.SuperFastMode,function(value)
         local SuperFastMode = value -- à¹€à¸›à¸¥à¸µà¹ˆà¸¢à¸™à¹€à¸›à¹‡à¸™à¸ˆà¸£à¸´à¸‡à¸–à¹‰à¸²à¸„à¸¸à¸“à¸•à¹‰à¸­à¸‡à¸à¸²à¸£à¹‚à¸ˆà¸¡à¸•à¸µ Super Super Super Fast (à¹€à¸Šà¹ˆà¸™à¸à¸²à¸£à¸†à¹ˆà¸²à¸—à¸±à¸™à¸—à¸µ) à¹à¸•à¹ˆà¸ˆà¸°à¸—à¸³à¹ƒà¸«à¹‰à¹€à¸à¸¡à¹€à¸•à¸°à¸„à¸¸à¸“à¸¡à¸²à¸à¸à¸§à¹ˆà¸²à¹‚à¸«à¸¡à¸”à¸›à¸à¸•à¸´
             _G.SuperFastMode = value
             CITY_CONFIG.Super_Fast_Mode = value
             isSettingsModified = true

        local plr = game.Players.LocalPlayer
        
        local CbFw = debug.getupvalues(require(plr.PlayerScripts.CombatFramework))
        local CbFw2 = CbFw[2]
        
        function GetCurrentBlade() 
            local p13 = CbFw2.activeController
            local ret = p13.blades[1]
            if not ret then return end
            while ret.Parent~=game.Players.LocalPlayer.Character do ret=ret.Parent end
            return ret
        end
        function AttackNoCD() 
            local AC = CbFw2.activeController
            for i = 1, 1 do 
                local bladehit = require(game.ReplicatedStorage.CombatFramework.RigLib).getBladeHits(
                    plr.Character,
                    {plr.Character.HumanoidRootPart},
                    60
                )
                local cac = {}
                local hash = {}
                for k, v in pairs(bladehit) do
                    if v.Parent:FindFirstChild("HumanoidRootPart") and not hash[v.Parent] then
                        table.insert(cac, v.Parent.HumanoidRootPart)
                        hash[v.Parent] = true
                    end
                end
                bladehit = cac
                if #bladehit > 0 then
                    local u8 = debug.getupvalue(AC.attack, 5)
                    local u9 = debug.getupvalue(AC.attack, 6)
                    local u7 = debug.getupvalue(AC.attack, 4)
                    local u10 = debug.getupvalue(AC.attack, 7)
                    local u12 = (u8 * 798405 + u7 * 727595) % u9
                    local u13 = u7 * 798405
                    (function()
                        u12 = (u12 * u9 + u13) % 1099511627776
                        u8 = math.floor(u12 / u9)
                        u7 = u12 - u8 * u9
                    end)()
                    u10 = u10 + 1
                    debug.setupvalue(AC.attack, 5, u8)
                    debug.setupvalue(AC.attack, 6, u9)
                    debug.setupvalue(AC.attack, 4, u7)
                    debug.setupvalue(AC.attack, 7, u10)
                    pcall(function()
                        for k, v in pairs(AC.animator.anims.basic) do
                            v:Play()
                        end                  
                    end)
                    if plr.Character:FindFirstChildOfClass("Tool") and AC.blades and AC.blades[1] then 
                        game:GetService("ReplicatedStorage").RigControllerEvent:FireServer("weaponChange",tostring(GetCurrentBlade()))
                        game.ReplicatedStorage.Remotes.Validator:FireServer(math.floor(u12 / 1099511627776 * 16777215), u10)
                        game:GetService("ReplicatedStorage").RigControllerEvent:FireServer("hit", bladehit, i, "") 
                    end
                end
            end
        end
        local cac
        if SuperFastMode then 
        	cac=task.wait
        else
        	cac=wait
        end
        while cac() do 
        	AttackNoCD()
        end

end)
