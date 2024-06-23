notis = require(game.ReplicatedStorage:WaitForChild("Notification"))
notis.new("<Color=Yellow>Loading . . .<Color=/>"):Display()
notis.new("<Color=Yellow>ASD PVP SCRIPT<Color=/>"):Display()
local asdlib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()

local Window = asdlib:MakeWindow({Name = "ASD", HidePremium = false, IntroText = "ASD", SaveConfig = true, ConfigFolder = "ASD"})


local IsTeamCheckEnabled = false 

spawn(function()
    game:GetService('RunService').RenderStepped:Connect(function()
        if _G.Hitbox then
            local localPlayer = game:GetService('Players').LocalPlayer
            if not localPlayer then return end
            
            local localPlayerTeam = localPlayer.Team
            
            for _, player in ipairs(game:GetService('Players'):GetPlayers()) do
                if player ~= localPlayer and (not IsTeamCheckEnabled or player.Team ~= localPlayerTeam) then
                    local humanoidRootPart = player.Character and player.Character:FindFirstChild("HumanoidRootPart")
                    if humanoidRootPart then
                        humanoidRootPart.Size = Vector3.new(_G.HitboxZi, _G.HitboxZi, _G.HitboxZi)
                        humanoidRootPart.Transparency = 0.7
                        humanoidRootPart.BrickColor = BrickColor.new("Really blue")
                        humanoidRootPart.Material = Enum.Material.Neon
                        humanoidRootPart.CanCollide = false
                    end
                end
            end
        end
    end)
end)









function Hop()
        local PlaceID = game.PlaceId
        local AllIDs = {}
        local foundAnything = ""
        local actualHour = os.date("!*t").hour
        local Deleted = false
        function TPReturner()
            local Site;
            if foundAnything == "" then
                Site = game.HttpService:JSONDecode(game:HttpGet('https://games.roblox.com/v1/games/' .. PlaceID .. '/servers/Public?sortOrder=Asc&limit=100'))
            else
                Site = game.HttpService:JSONDecode(game:HttpGet('https://games.roblox.com/v1/games/' .. PlaceID .. '/servers/Public?sortOrder=Asc&limit=100&cursor=' .. foundAnything))
            end
            local ID = ""
            if Site.nextPageCursor and Site.nextPageCursor ~= "null" and Site.nextPageCursor ~= nil then
                foundAnything = Site.nextPageCursor
            end
            local num = 0;
            for i,v in pairs(Site.data) do
                local Possible = true
                ID = tostring(v.id)
                if tonumber(v.maxPlayers) > tonumber(v.playing) then
                    for _,Existing in pairs(AllIDs) do
                        if num ~= 0 then
                            if ID == tostring(Existing) then
                                Possible = false
                            end
                        else
                            if tonumber(actualHour) ~= tonumber(Existing) then
                                local delFile = pcall(function()
                                    AllIDs = {}
                                    table.insert(AllIDs, actualHour)
                                end)
                            end
                        end
                        num = num + 1
                    end
                    if Possible == true then
                        table.insert(AllIDs, ID)
                        wait()
                        pcall(function()
                            wait()
                            game:GetService("TeleportService"):TeleportToPlaceInstance(PlaceID, ID, game.Players.LocalPlayer)
                        end)
                        wait(4)
                    end
                end
            end
        end
        function Teleport() 
            while wait() do
                pcall(function()
                    TPReturner()
                    if foundAnything ~= "" then
                        TPReturner()
                    end
                end)
            end
        end
        Teleport()
    end       
    

-- set local



local mouse = game.Players.LocalPlayer:GetMouse()
local guiservice = game.GetService(game, "GuiService")
local players = game.GetService(game, "Players")
local localPlayer = players.LocalPlayer
local currentCamera = game.GetService(game, "Workspace").CurrentCamera
local circle = Drawing.new("Circle")

--------ui ifo
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
Main.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
Main.Position = UDim2.new(0.5, 0, -0.1, 0)
Main.Size = UDim2.new(0, 280, 0, 70)
Main.Visible = true

MainCorner.Name = "MainCorner"
MainCorner.Parent = Main

Profile.Name = "Profile"
Profile.Parent = Main
Profile.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Profile.Position = UDim2.new(0.0570342205, 0, 0.149425298, 0)
Profile.Size = UDim2.new(0, 50, 0, 50)

ProfileCorner.CornerRadius = UDim.new(0, 100)
ProfileCorner.Name = "ProfileCorner"
ProfileCorner.Parent = Profile

ImageProfile.Name = "ImageProfile"
ImageProfile.Parent = Profile
ImageProfile.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
ImageProfile.BackgroundTransparency = 0
ImageProfile.Position = UDim2.new(0, 0, 0, 0)
ImageProfile.Size = UDim2.new(0, 50, 0, 50)
ImageProfile.Image = ''

ImageProfileCorner.CornerRadius = UDim.new(0, 100)
ImageProfileCorner.Name = "ImageProfileCorner"
ImageProfileCorner.Parent = ImageProfile

HealthPlayers.Name = "HealthPlayers"
HealthPlayers.Parent = Profile
HealthPlayers.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
HealthPlayers.BackgroundTransparency = 1.000
HealthPlayers.Position = UDim2.new(1.24220526, 0, 0.4, 0)
HealthPlayers.Size = UDim2.new(0, 173, 0, 22)
HealthPlayers.Font = Enum.Font.FredokaOne
HealthPlayers.Text = "Health | N/A"
HealthPlayers.TextColor3 = Color3.fromRGB(255, 255, 255)
HealthPlayers.TextSize = 19.000
HealthPlayers.TextXAlignment = Enum.TextXAlignment.Left
HealthPlayers.TextYAlignment = Enum.TextYAlignment.Bottom




NamePlayers.Name = "NamePlayers"
NamePlayers.Parent = Profile
NamePlayers.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
NamePlayers.BackgroundTransparency = 1.000
NamePlayers.Position = UDim2.new(1.24220526, 0, 0, 0)
NamePlayers.Size = UDim2.new(0, 173, 0, 22)
NamePlayers.Font = Enum.Font.FredokaOne
NamePlayers.Text = "Name | N/A"
NamePlayers.TextColor3 = Color3.fromRGB(255, 255, 255)
NamePlayers.TextSize = 19.000
NamePlayers.TextXAlignment = Enum.TextXAlignment.Left
NamePlayers.TextYAlignment = Enum.TextYAlignment.Bottom

Healthbar.Name = "Healthbar"
Healthbar.Parent = Profile
Healthbar.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Healthbar.Position = UDim2.new(1.23333335, 0, 0.99000024, 0)
Healthbar.Size = UDim2.new(0, 155, 0, 8)

HealthbarCorner.Name = "HealthbarCorner"
HealthbarCorner.Parent = Healthbar

Healthgreen.Name = "Healthgreen"
Healthgreen.Parent = Healthbar
Healthgreen.BackgroundColor3 = Color3.fromRGB(0, 227, 110)
Healthgreen.Size = UDim2.new(0, 155, 0, 8)

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

spawn(function()
    pcall(function()
        while wait() do
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


spawn(function()
    while wait() do
        for _, v in pairs(game.Players:GetChildren()) do
            if v.Name == Playersaimbot then
                PlayersPosition = v.Character.HumanoidRootPart.Position
            end
        end
    end
end)

spawn(function()
    local gg = getrawmetatable(game)
    local old = gg.__namecall
    setreadonly(gg, false)
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



local UIS = game:GetService("UserInputService")
local Players = game:GetService("Players")

UIS.TouchTapInWorld:Connect(function(touchPositions, gameProcessedEvent)
    pcall(function()
        if Playersaimbot ~= nil then
            local args = {
                [1] = PlayersPosition,
                [2] = Players:FindFirstChild(Playersaimbot).Character.HumanoidRootPart
            }
            local tool = Players.LocalPlayer.Character:FindFirstChildOfClass("Tool")
            if tool then
                tool.RemoteFunctionShoot:InvokeServer(unpack(args))
            end
        end
    end)
end)


local FOVCircle = Drawing.new("Circle")
	FOVCircle.Thickness = 2
	FOVCircle.NumSides = 100
	FOVCircle.Visible = true 
	FOVCircle.Filled = false
	FOVCircle.Transparency = 0.1
	FOVCircle.Radius = 100
	FOVCircle.Color = Color3.fromRGB(1, 0, 0)
	
	game:GetService("RunService").Stepped:Connect(function()
		FOVCircle.Radius = Fov
		FOVCircle.Thickness = 2
		FOVCircle.NumSides = 100
		FOVCircle.Filled = false
		FOVCircle.Position = Vector2.new(402, 196)
		if ShowFov then
			FOVCircle.Visible = true
		else
			FOVCircle.Visible = false
		end
	end)
	


function UpdateIslandESP() 
        for i,v in pairs(game:GetService("Workspace")["_WorldOrigin"].Locations:GetChildren()) do
            pcall(function()
                if IslandESP then 
                    if v.Name ~= "Sea" then
                        if not v:FindFirstChild('NameEsp') then
                            local bill = Instance.new('BillboardGui',v)
                            bill.Name = 'NameEsp'
                            bill.ExtentsOffset = Vector3.new(0, 1, 0)
                            bill.Size = UDim2.new(1,200,1,30)
                            bill.Adornee = v
                            bill.AlwaysOnTop = true
                            local name = Instance.new('TextLabel',bill)
                            name.Font = "GothamBold"
                            name.FontSize = "Size14"
                            name.TextWrapped = true
                            name.Size = UDim2.new(1,0,1,0)
                            name.TextYAlignment = 'Top'
                            name.BackgroundTransparency = 1
                            name.TextStrokeTransparency = 0.5
                            name.TextColor3 = Color3.fromRGB(255, 255, 255)
                        else
                            v['NameEsp'].TextLabel.Text = (v.Name ..'   \n'.. round((game:GetService('Players').LocalPlayer.Character.Head.Position - v.Position).Magnitude/3) ..' Distance')
                        end
                    end
                else
                    if v:FindFirstChild('NameEsp') then
                        v:FindFirstChild('NameEsp'):Destroy()
                    end
                end
            end)
        end
    end
    
    function isnil(thing)
	return (thing == nil)
end
local function round(n)
	return math.floor(tonumber(n) + 0.5)
end
Number = math.random(1, 1000000)
function UpdatePlayerChams()
	for i,v in pairs(game:GetService'Players':GetChildren()) do
		pcall(function()
			if not isnil(v.Character) then
				if ESPPlayer then
					if not isnil(v.Character.Head) and not v.Character.Head:FindFirstChild('NameEsp'..Number) then
						local bill = Instance.new('BillboardGui',v.Character.Head)
						bill.Name = 'NameEsp'..Number
						bill.ExtentsOffset = Vector3.new(0, 1, 0)
						bill.Size = UDim2.new(1,200,1,30)
						bill.Adornee = v.Character.Head
						bill.AlwaysOnTop = true
						local name = Instance.new('TextLabel',bill)
						name.Font = Enum.Font.GothamSemibold
						name.FontSize = "Size14"
						name.TextWrapped = true
						name.Text = (v.Name ..' \n'.. round((game:GetService('Players').LocalPlayer.Character.Head.Position - v.Character.Head.Position).Magnitude/3) ..' Distance')
						name.Size = UDim2.new(1,0,1,0)
						name.TextYAlignment = 'Top'
						name.BackgroundTransparency = 1
						name.TextStrokeTransparency = 0.5
						if v.Team == game.Players.LocalPlayer.Team then
							name.TextColor3 = Color3.new(51, 25, 25)
						else
							name.TextColor3 = Color3.new(255, 255, 255)
						end
					else
						v.Character.Head['NameEsp'..Number].TextLabel.Text = (v.Name ..' | '.. round((game:GetService('Players').LocalPlayer.Character.Head.Position - v.Character.Head.Position).Magnitude/3) ..' Distance\nHealth: ' .. round(v.Character.Humanoid.Health*100/v.Character.Humanoid.MaxHealth) .. '%')
					end
				else
					if v.Character.Head:FindFirstChild('NameEsp'..Number) then
						v.Character.Head:FindFirstChild('NameEsp'..Number):Destroy()
					end
				end
			end
		end)
	end
end
function UpdateChestChams() 
	for i,v in pairs(game.Workspace:GetChildren()) do
		pcall(function()
			if string.find(v.Name,"Chest") then
				if ChestESP then
					if string.find(v.Name,"Chest") then
						if not v:FindFirstChild('NameEsp'..Number) then
							local bill = Instance.new('BillboardGui',v)
							bill.Name = 'NameEsp'..Number
							bill.ExtentsOffset = Vector3.new(0, 1, 0)
							bill.Size = UDim2.new(1,200,1,30)
							bill.Adornee = v
							bill.AlwaysOnTop = true
							local name = Instance.new('TextLabel',bill)
							name.Font = Enum.Font.GothamSemibold
							name.FontSize = "Size14"
							name.TextWrapped = true
							name.Size = UDim2.new(1,0,1,0)
							name.TextYAlignment = 'Top'
							name.BackgroundTransparency = 1
							name.TextStrokeTransparency = 0.5
							if v.Name == "Chest1" then
								name.TextColor3 = Color3.fromRGB(255, 255, 255)
								name.Text = ("Chest 1" ..' \n'.. round((game:GetService('Players').LocalPlayer.Character.Head.Position - v.Position).Magnitude/3) ..' Distance')
							end
							if v.Name == "Chest2" then
								name.TextColor3 = Color3.fromRGB(255, 255, 255)
								name.Text = ("Chest 2" ..' \n'.. round((game:GetService('Players').LocalPlayer.Character.Head.Position - v.Position).Magnitude/3) ..' Distance')
							end
							if v.Name == "Chest3" then
								name.TextColor3 = Color3.fromRGB(255, 255, 255)
								name.Text = ("Chest 3" ..' \n'.. round((game:GetService('Players').LocalPlayer.Character.Head.Position - v.Position).Magnitude/3) ..' Distance')
							end
						else
							v['NameEsp'..Number].TextLabel.Text = (v.Name ..'   \n'.. round((game:GetService('Players').LocalPlayer.Character.Head.Position - v.Position).Magnitude/3) ..' Distance')
						end
					end
				else
					if v:FindFirstChild('NameEsp'..Number) then
						v:FindFirstChild('NameEsp'..Number):Destroy()
					end
				end
			end
		end)
	end
end
function UpdateDevilChams() 
	for i,v in pairs(game.Workspace:GetChildren()) do
		pcall(function()
			if DevilFruitESP then
				if string.find(v.Name, "Fruit") then   
					if not v.Handle:FindFirstChild('NameEsp'..Number) then
						local bill = Instance.new('BillboardGui',v.Handle)
						bill.Name = 'NameEsp'..Number
						bill.ExtentsOffset = Vector3.new(0, 1, 0)
						bill.Size = UDim2.new(1,200,1,30)
						bill.Adornee = v.Handle
						bill.AlwaysOnTop = true
						local name = Instance.new('TextLabel',bill)
						name.Font = Enum.Font.GothamSemibold
						name.FontSize = "Size14"
						name.TextWrapped = true
						name.Size = UDim2.new(1,0,1,0)
						name.TextYAlignment = 'Top'
						name.BackgroundTransparency = 1
						name.TextStrokeTransparency = 0.5
						name.TextColor3 = Color3.fromRGB(255, 255, 255)
						name.Text = (v.Name ..' \n'.. round((game:GetService('Players').LocalPlayer.Character.Head.Position - v.Handle.Position).Magnitude/3) ..' Distance')
					else
						v.Handle['NameEsp'..Number].TextLabel.Text = (v.Name ..'   \n'.. round((game:GetService('Players').LocalPlayer.Character.Head.Position - v.Handle.Position).Magnitude/3) ..' Distance')
					end
				end
			else
				if v.Handle:FindFirstChild('NameEsp'..Number) then
					v.Handle:FindFirstChild('NameEsp'..Number):Destroy()
				end
			end
		end)
	end
end
function UpdateFlowerChams() 
	for i,v in pairs(game.Workspace:GetChildren()) do
		pcall(function()
			if v.Name == "Flower2" or v.Name == "Flower1" then
				if FlowerESP then 
					if not v:FindFirstChild('NameEsp'..Number) then
						local bill = Instance.new('BillboardGui',v)
						bill.Name = 'NameEsp'..Number
						bill.ExtentsOffset = Vector3.new(0, 1, 0)
						bill.Size = UDim2.new(1,200,1,30)
						bill.Adornee = v
						bill.AlwaysOnTop = true
						local name = Instance.new('TextLabel',bill)
						name.Font = Enum.Font.GothamSemibold
						name.FontSize = "Size14"
						name.TextWrapped = true
						name.Size = UDim2.new(1,0,1,0)
						name.TextYAlignment = 'Top'
						name.BackgroundTransparency = 1
						name.TextStrokeTransparency = 0.5
						name.TextColor3 = Color3.fromRGB(255, 255, 255)
						if v.Name == "Flower1" then 
							name.Text = ("Blue Flower" ..' \n'.. round((game:GetService('Players').LocalPlayer.Character.Head.Position - v.Position).Magnitude/3) ..' Distance')
							name.TextColor3 = Color3.fromRGB(255, 255, 255)
						end
						if v.Name == "Flower2" then
							name.Text = ("Red Flower" ..' \n'.. round((game:GetService('Players').LocalPlayer.Character.Head.Position - v.Position).Magnitude/3) ..' Distance')
							name.TextColor3 = Color3.fromRGB(255, 255, 255)
						end
					else
						v['NameEsp'..Number].TextLabel.Text = (v.Name ..'   \n'.. round((game:GetService('Players').LocalPlayer.Character.Head.Position - v.Position).Magnitude/3) ..' Distance')
					end
				else
					if v:FindFirstChild('NameEsp'..Number) then
					v:FindFirstChild('NameEsp'..Number):Destroy()
					end
				end
			end   
		end)
	end
end
function UpdateRealFruitChams() 
	for i,v in pairs(game.Workspace.AppleSpawner:GetChildren()) do
		if v:IsA("Tool") then
			if RealFruitESP then 
				if not v.Handle:FindFirstChild('NameEsp'..Number) then
					local bill = Instance.new('BillboardGui',v.Handle)
					bill.Name = 'NameEsp'..Number
					bill.ExtentsOffset = Vector3.new(0, 1, 0)
					bill.Size = UDim2.new(1,200,1,30)
					bill.Adornee = v.Handle
					bill.AlwaysOnTop = true
					local name = Instance.new('TextLabel',bill)
					name.Font = Enum.Font.GothamSemibold
					name.FontSize = "Size14"
					name.TextWrapped = true
					name.Size = UDim2.new(1,0,1,0)
					name.TextYAlignment = 'Top'
					name.BackgroundTransparency = 1
					name.TextStrokeTransparency = 0.5
					name.TextColor3 = Color3.fromRGB(255, 255, 255)
					name.Text = (v.Name ..' \n'.. round((game:GetService('Players').LocalPlayer.Character.Head.Position - v.Handle.Position).Magnitude/3) ..' Distance')
				else
					v.Handle['NameEsp'..Number].TextLabel.Text = (v.Name ..' '.. round((game:GetService('Players').LocalPlayer.Character.Head.Position - v.Handle.Position).Magnitude/3) ..' Distance')
				end
			else
				if v.Handle:FindFirstChild('NameEsp'..Number) then
					v.Handle:FindFirstChild('NameEsp'..Number):Destroy()
				end
			end 
		end
	end
	for i,v in pairs(game.Workspace.PineappleSpawner:GetChildren()) do
		if v:IsA("Tool") then
			if RealFruitESP then 
				if not v.Handle:FindFirstChild('NameEsp'..Number) then
					local bill = Instance.new('BillboardGui',v.Handle)
					bill.Name = 'NameEsp'..Number
					bill.ExtentsOffset = Vector3.new(0, 1, 0)
					bill.Size = UDim2.new(1,200,1,30)
					bill.Adornee = v.Handle
					bill.AlwaysOnTop = true
					local name = Instance.new('TextLabel',bill)
					name.Font = Enum.Font.GothamSemibold
					name.FontSize = "Size14"
					name.TextWrapped = true
					name.Size = UDim2.new(1,0,1,0)
					name.TextYAlignment = 'Top'
					name.BackgroundTransparency = 1
					name.TextStrokeTransparency = 0.5
					name.TextColor3 = Color3.fromRGB(255, 255, 255)
					name.Text = (v.Name ..' \n'.. round((game:GetService('Players').LocalPlayer.Character.Head.Position - v.Handle.Position).Magnitude/3) ..' Distance')
				else
					v.Handle['NameEsp'..Number].TextLabel.Text = (v.Name ..' '.. round((game:GetService('Players').LocalPlayer.Character.Head.Position - v.Handle.Position).Magnitude/3) ..' Distance')
				end
			else
				if v.Handle:FindFirstChild('NameEsp'..Number) then
					v.Handle:FindFirstChild('NameEsp'..Number):Destroy()
				end
			end 
		end
	end
	for i,v in pairs(game.Workspace.BananaSpawner:GetChildren()) do
		if v:IsA("Tool") then
			if RealFruitESP then 
				if not v.Handle:FindFirstChild('NameEsp'..Number) then
					local bill = Instance.new('BillboardGui',v.Handle)
					bill.Name = 'NameEsp'..Number
					bill.ExtentsOffset = Vector3.new(0, 1, 0)
					bill.Size = UDim2.new(1,200,1,30)
					bill.Adornee = v.Handle
					bill.AlwaysOnTop = true
					local name = Instance.new('TextLabel',bill)
					name.Font = Enum.Font.GothamSemibold
					name.FontSize = "Size14"
					name.TextWrapped = true
					name.Size = UDim2.new(1,0,1,0)
					name.TextYAlignment = 'Top'
					name.BackgroundTransparency = 1
					name.TextStrokeTransparency = 0.5
					name.TextColor3 = Color3.fromRGB(255, 255, 255)
					name.Text = (v.Name ..' \n'.. round((game:GetService('Players').LocalPlayer.Character.Head.Position - v.Handle.Position).Magnitude/3) ..' Distance')
				else
					v.Handle['NameEsp'..Number].TextLabel.Text = (v.Name ..' '.. round((game:GetService('Players').LocalPlayer.Character.Head.Position - v.Handle.Position).Magnitude/3) ..' Distance')
				end
			else
				if v.Handle:FindFirstChild('NameEsp'..Number) then
					v.Handle:FindFirstChild('NameEsp'..Number):Destroy()
				end
			end 
		end
	end
end

function UpdateIslandESP() 
        for i,v in pairs(game:GetService("Workspace")["_WorldOrigin"].Locations:GetChildren()) do
            pcall(function()
                if IslandESP then 
                    if v.Name ~= "Sea" then
                        if not v:FindFirstChild('NameEsp') then
                            local bill = Instance.new('BillboardGui',v)
                            bill.Name = 'NameEsp'
                            bill.ExtentsOffset = Vector3.new(0, 1, 0)
                            bill.Size = UDim2.new(1,200,1,30)
                            bill.Adornee = v
                            bill.AlwaysOnTop = true
                            local name = Instance.new('TextLabel',bill)
                            name.Font = "GothamBold"
                            name.FontSize = "Size14"
                            name.TextWrapped = true
                            name.Size = UDim2.new(1,0,1,0)
                            name.TextYAlignment = 'Top'
                            name.BackgroundTransparency = 1
                            name.TextStrokeTransparency = 0.5
                            name.TextColor3 = Color3.fromRGB(255, 255, 255)
                        else
                            v['NameEsp'].TextLabel.Text = (v.Name ..'   \n'.. round((game:GetService('Players').LocalPlayer.Character.Head.Position - v.Position).Magnitude/3) ..' Distance')
                        end
                    end
                else
                    if v:FindFirstChild('NameEsp') then
                        v:FindFirstChild('NameEsp'):Destroy()
                    end
                end
            end)
        end
    end
    
    function isnil(thing)
	return (thing == nil)
end
local function round(n)
	return math.floor(tonumber(n) + 0.5)
end
Number = math.random(1, 1000000)
function UpdatePlayerChams()
	for i,v in pairs(game:GetService'Players':GetChildren()) do
		pcall(function()
			if not isnil(v.Character) then
				if ESPPlayer then
					if not isnil(v.Character.Head) and not v.Character.Head:FindFirstChild('NameEsp'..Number) then
						local bill = Instance.new('BillboardGui',v.Character.Head)
						bill.Name = 'NameEsp'..Number
						bill.ExtentsOffset = Vector3.new(0, 1, 0)
						bill.Size = UDim2.new(1,200,1,30)
						bill.Adornee = v.Character.Head
						bill.AlwaysOnTop = true
						local name = Instance.new('TextLabel',bill)
						name.Font = Enum.Font.GothamSemibold
						name.FontSize = "Size14"
						name.TextWrapped = true
						name.Text = (v.Name ..' \n'.. round((game:GetService('Players').LocalPlayer.Character.Head.Position - v.Character.Head.Position).Magnitude/3) ..' Distance')
						name.Size = UDim2.new(1,0,1,0)
						name.TextYAlignment = 'Top'
						name.BackgroundTransparency = 1
						name.TextStrokeTransparency = 0.5
						if v.Team == game.Players.LocalPlayer.Team then
							name.TextColor3 = Color3.new(51, 25, 25)
						else
							name.TextColor3 = Color3.new(255, 255, 255)
						end
					else
						v.Character.Head['NameEsp'..Number].TextLabel.Text = (v.Name ..' | '.. round((game:GetService('Players').LocalPlayer.Character.Head.Position - v.Character.Head.Position).Magnitude/3) ..' Distance\nHealth: ' .. round(v.Character.Humanoid.Health*100/v.Character.Humanoid.MaxHealth) .. '%')
					end
				else
					if v.Character.Head:FindFirstChild('NameEsp'..Number) then
						v.Character.Head:FindFirstChild('NameEsp'..Number):Destroy()
					end
				end
			end
		end)
	end
end
function UpdateChestChams() 
	for i,v in pairs(game.Workspace:GetChildren()) do
		pcall(function()
			if string.find(v.Name,"Chest") then
				if ChestESP then
					if string.find(v.Name,"Chest") then
						if not v:FindFirstChild('NameEsp'..Number) then
							local bill = Instance.new('BillboardGui',v)
							bill.Name = 'NameEsp'..Number
							bill.ExtentsOffset = Vector3.new(0, 1, 0)
							bill.Size = UDim2.new(1,200,1,30)
							bill.Adornee = v
							bill.AlwaysOnTop = true
							local name = Instance.new('TextLabel',bill)
							name.Font = Enum.Font.GothamSemibold
							name.FontSize = "Size14"
							name.TextWrapped = true
							name.Size = UDim2.new(1,0,1,0)
							name.TextYAlignment = 'Top'
							name.BackgroundTransparency = 1
							name.TextStrokeTransparency = 0.5
							if v.Name == "Chest1" then
								name.TextColor3 = Color3.fromRGB(255, 255, 255)
								name.Text = ("Chest 1" ..' \n'.. round((game:GetService('Players').LocalPlayer.Character.Head.Position - v.Position).Magnitude/3) ..' Distance')
							end
							if v.Name == "Chest2" then
								name.TextColor3 = Color3.fromRGB(255, 255, 255)
								name.Text = ("Chest 2" ..' \n'.. round((game:GetService('Players').LocalPlayer.Character.Head.Position - v.Position).Magnitude/3) ..' Distance')
							end
							if v.Name == "Chest3" then
								name.TextColor3 = Color3.fromRGB(255, 255, 255)
								name.Text = ("Chest 3" ..' \n'.. round((game:GetService('Players').LocalPlayer.Character.Head.Position - v.Position).Magnitude/3) ..' Distance')
							end
						else
							v['NameEsp'..Number].TextLabel.Text = (v.Name ..'   \n'.. round((game:GetService('Players').LocalPlayer.Character.Head.Position - v.Position).Magnitude/3) ..' Distance')
						end
					end
				else
					if v:FindFirstChild('NameEsp'..Number) then
						v:FindFirstChild('NameEsp'..Number):Destroy()
					end
				end
			end
		end)
	end
end
function UpdateDevilChams() 
	for i,v in pairs(game.Workspace:GetChildren()) do
		pcall(function()
			if DevilFruitESP then
				if string.find(v.Name, "Fruit") then   
					if not v.Handle:FindFirstChild('NameEsp'..Number) then
						local bill = Instance.new('BillboardGui',v.Handle)
						bill.Name = 'NameEsp'..Number
						bill.ExtentsOffset = Vector3.new(0, 1, 0)
						bill.Size = UDim2.new(1,200,1,30)
						bill.Adornee = v.Handle
						bill.AlwaysOnTop = true
						local name = Instance.new('TextLabel',bill)
						name.Font = Enum.Font.GothamSemibold
						name.FontSize = "Size14"
						name.TextWrapped = true
						name.Size = UDim2.new(1,0,1,0)
						name.TextYAlignment = 'Top'
						name.BackgroundTransparency = 1
						name.TextStrokeTransparency = 0.5
						name.TextColor3 = Color3.fromRGB(255, 255, 255)
						name.Text = (v.Name ..' \n'.. round((game:GetService('Players').LocalPlayer.Character.Head.Position - v.Handle.Position).Magnitude/3) ..' Distance')
					else
						v.Handle['NameEsp'..Number].TextLabel.Text = (v.Name ..'   \n'.. round((game:GetService('Players').LocalPlayer.Character.Head.Position - v.Handle.Position).Magnitude/3) ..' Distance')
					end
				end
			else
				if v.Handle:FindFirstChild('NameEsp'..Number) then
					v.Handle:FindFirstChild('NameEsp'..Number):Destroy()
				end
			end
		end)
	end
end
function UpdateFlowerChams() 
	for i,v in pairs(game.Workspace:GetChildren()) do
		pcall(function()
			if v.Name == "Flower2" or v.Name == "Flower1" then
				if FlowerESP then 
					if not v:FindFirstChild('NameEsp'..Number) then
						local bill = Instance.new('BillboardGui',v)
						bill.Name = 'NameEsp'..Number
						bill.ExtentsOffset = Vector3.new(0, 1, 0)
						bill.Size = UDim2.new(1,200,1,30)
						bill.Adornee = v
						bill.AlwaysOnTop = true
						local name = Instance.new('TextLabel',bill)
						name.Font = Enum.Font.GothamSemibold
						name.FontSize = "Size14"
						name.TextWrapped = true
						name.Size = UDim2.new(1,0,1,0)
						name.TextYAlignment = 'Top'
						name.BackgroundTransparency = 1
						name.TextStrokeTransparency = 0.5
						name.TextColor3 = Color3.fromRGB(255, 255, 255)
						if v.Name == "Flower1" then 
							name.Text = ("Blue Flower" ..' \n'.. round((game:GetService('Players').LocalPlayer.Character.Head.Position - v.Position).Magnitude/3) ..' Distance')
							name.TextColor3 = Color3.fromRGB(255, 255, 255)
						end
						if v.Name == "Flower2" then
							name.Text = ("Red Flower" ..' \n'.. round((game:GetService('Players').LocalPlayer.Character.Head.Position - v.Position).Magnitude/3) ..' Distance')
							name.TextColor3 = Color3.fromRGB(255, 255, 255)
						end
					else
						v['NameEsp'..Number].TextLabel.Text = (v.Name ..'   \n'.. round((game:GetService('Players').LocalPlayer.Character.Head.Position - v.Position).Magnitude/3) ..' Distance')
					end
				else
					if v:FindFirstChild('NameEsp'..Number) then
					v:FindFirstChild('NameEsp'..Number):Destroy()
					end
				end
			end   
		end)
	end
end
function UpdateRealFruitChams() 
	for i,v in pairs(game.Workspace.AppleSpawner:GetChildren()) do
		if v:IsA("Tool") then
			if RealFruitESP then 
				if not v.Handle:FindFirstChild('NameEsp'..Number) then
					local bill = Instance.new('BillboardGui',v.Handle)
					bill.Name = 'NameEsp'..Number
					bill.ExtentsOffset = Vector3.new(0, 1, 0)
					bill.Size = UDim2.new(1,200,1,30)
					bill.Adornee = v.Handle
					bill.AlwaysOnTop = true
					local name = Instance.new('TextLabel',bill)
					name.Font = Enum.Font.GothamSemibold
					name.FontSize = "Size14"
					name.TextWrapped = true
					name.Size = UDim2.new(1,0,1,0)
					name.TextYAlignment = 'Top'
					name.BackgroundTransparency = 1
					name.TextStrokeTransparency = 0.5
					name.TextColor3 = Color3.fromRGB(255, 255, 255)
					name.Text = (v.Name ..' \n'.. round((game:GetService('Players').LocalPlayer.Character.Head.Position - v.Handle.Position).Magnitude/3) ..' Distance')
				else
					v.Handle['NameEsp'..Number].TextLabel.Text = (v.Name ..' '.. round((game:GetService('Players').LocalPlayer.Character.Head.Position - v.Handle.Position).Magnitude/3) ..' Distance')
				end
			else
				if v.Handle:FindFirstChild('NameEsp'..Number) then
					v.Handle:FindFirstChild('NameEsp'..Number):Destroy()
				end
			end 
		end
	end
	for i,v in pairs(game.Workspace.PineappleSpawner:GetChildren()) do
		if v:IsA("Tool") then
			if RealFruitESP then 
				if not v.Handle:FindFirstChild('NameEsp'..Number) then
					local bill = Instance.new('BillboardGui',v.Handle)
					bill.Name = 'NameEsp'..Number
					bill.ExtentsOffset = Vector3.new(0, 1, 0)
					bill.Size = UDim2.new(1,200,1,30)
					bill.Adornee = v.Handle
					bill.AlwaysOnTop = true
					local name = Instance.new('TextLabel',bill)
					name.Font = Enum.Font.GothamSemibold
					name.FontSize = "Size14"
					name.TextWrapped = true
					name.Size = UDim2.new(1,0,1,0)
					name.TextYAlignment = 'Top'
					name.BackgroundTransparency = 1
					name.TextStrokeTransparency = 0.5
					name.TextColor3 = Color3.fromRGB(255, 255, 255)
					name.Text = (v.Name ..' \n'.. round((game:GetService('Players').LocalPlayer.Character.Head.Position - v.Handle.Position).Magnitude/3) ..' Distance')
				else
					v.Handle['NameEsp'..Number].TextLabel.Text = (v.Name ..' '.. round((game:GetService('Players').LocalPlayer.Character.Head.Position - v.Handle.Position).Magnitude/3) ..' Distance')
				end
			else
				if v.Handle:FindFirstChild('NameEsp'..Number) then
					v.Handle:FindFirstChild('NameEsp'..Number):Destroy()
				end
			end 
		end
	end
	for i,v in pairs(game.Workspace.BananaSpawner:GetChildren()) do
		if v:IsA("Tool") then
			if RealFruitESP then 
				if not v.Handle:FindFirstChild('NameEsp'..Number) then
					local bill = Instance.new('BillboardGui',v.Handle)
					bill.Name = 'NameEsp'..Number
					bill.ExtentsOffset = Vector3.new(0, 1, 0)
					bill.Size = UDim2.new(1,200,1,30)
					bill.Adornee = v.Handle
					bill.AlwaysOnTop = true
					local name = Instance.new('TextLabel',bill)
					name.Font = Enum.Font.GothamSemibold
					name.FontSize = "Size14"
					name.TextWrapped = true
					name.Size = UDim2.new(1,0,1,0)
					name.TextYAlignment = 'Top'
					name.BackgroundTransparency = 1
					name.TextStrokeTransparency = 0.5
					name.TextColor3 = Color3.fromRGB(255, 255, 255)
					name.Text = (v.Name ..' \n'.. round((game:GetService('Players').LocalPlayer.Character.Head.Position - v.Handle.Position).Magnitude/3) ..' Distance')
				else
					v.Handle['NameEsp'..Number].TextLabel.Text = (v.Name ..' '.. round((game:GetService('Players').LocalPlayer.Character.Head.Position - v.Handle.Position).Magnitude/3) ..' Distance')
				end
			else
				if v.Handle:FindFirstChild('NameEsp'..Number) then
					v.Handle:FindFirstChild('NameEsp'..Number):Destroy()
				end
			end 
		end
	end
end

spawn(function()
    while wait() do
        pcall(function()
            if MobESP then
                for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                    if v:FindFirstChild('HumanoidRootPart') then
                        if not v:FindFirstChild("MobEap") then
                            local BillboardGui = Instance.new("BillboardGui")
                            local TextLabel = Instance.new("TextLabel")

                            BillboardGui.Parent = v
                            BillboardGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
                            BillboardGui.Active = true
                            BillboardGui.Name = "MobEap"
                            BillboardGui.AlwaysOnTop = true
                            BillboardGui.LightInfluence = 1.000
                            BillboardGui.Size = UDim2.new(0, 200, 0, 50)
                            BillboardGui.StudsOffset = Vector3.new(0, 2.5, 0)

                            TextLabel.Parent = BillboardGui
                            TextLabel.BackgroundColor3 = Color3.fromRGB(0, 105, 148)
                            TextLabel.BackgroundTransparency = 1.000
                            TextLabel.Size = UDim2.new(0, 200, 0, 50)
                            TextLabel.Font = Enum.Font.SourceSansBold
                            TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
                            TextLabel.Text.Size = 35
                        end
                        local Dis = math.floor((game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v.HumanoidRootPart.Position).Magnitude)
                        v.MobEap.TextLabel.Text = v.Name.." - "..Dis.." Distance"
                    end
                end
            else
                for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                    if v:FindFirstChild("MobEap") then
                        v.MobEap:Destroy()
                    end
                end
            end
        end)
    end
end)

spawn(function()
    while wait() do
        pcall(function()
            if SeaESP then
                for i,v in pairs(game:GetService("Workspace").SeaBeasts:GetChildren()) do
                    if v:FindFirstChild('HumanoidRootPart') then
                        if not v:FindFirstChild("Seaesps") then
                            local BillboardGui = Instance.new("BillboardGui")
                            local TextLabel = Instance.new("TextLabel")

                            BillboardGui.Parent = v
                            BillboardGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
                            BillboardGui.Active = true
                            BillboardGui.Name = "Seaesps"
                            BillboardGui.AlwaysOnTop = true
                            BillboardGui.LightInfluence = 1.000
                            BillboardGui.Size = UDim2.new(0, 200, 0, 50)
                            BillboardGui.StudsOffset = Vector3.new(0, 2.5, 0)

                            TextLabel.Parent = BillboardGui
                            TextLabel.BackgroundColor3 = Color3.fromRGB(0, 105, 148)
                            TextLabel.BackgroundTransparency = 1.000
                            TextLabel.Size = UDim2.new(0, 200, 0, 50)
                            TextLabel.Font = Enum.Font.SourceSansBold
                            TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
                            TextLabel.Text.Size = 35
                        end
                        local Dis = math.floor((game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v.HumanoidRootPart.Position).Magnitude)
                        v.Seaesps.TextLabel.Text = v.Name.." - "..Dis.." Distance"
                    end
                end
            else
                for i,v in pairs (game:GetService("Workspace").SeaBeasts:GetChildren()) do
                    if v:FindFirstChild("Seaesps") then
                        v.Seaesps:Destroy()
                    end
                end
            end
        end)
    end
end)

spawn(function()
    while wait() do
        pcall(function()
            if NpcESP then
                for i,v in pairs(game:GetService("Workspace").NPCs:GetChildren()) do
                    if v:FindFirstChild('HumanoidRootPart') then
                        if not v:FindFirstChild("NpcEspes") then
                            local BillboardGui = Instance.new("BillboardGui")
                            local TextLabel = Instance.new("TextLabel")

                            BillboardGui.Parent = v
                            BillboardGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
                            BillboardGui.Active = true
                            BillboardGui.Name = "NpcEspes"
                            BillboardGui.AlwaysOnTop = true
                            BillboardGui.LightInfluence = 1.000
                            BillboardGui.Size = UDim2.new(0, 200, 0, 50)
                            BillboardGui.StudsOffset = Vector3.new(0, 2.5, 0)

                            TextLabel.Parent = BillboardGui
                            TextLabel.BackgroundColor3 = Color3.fromRGB(0, 105, 148)
                            TextLabel.BackgroundTransparency = 1.000
                            TextLabel.Size = UDim2.new(0, 200, 0, 50)
                            TextLabel.Font = Enum.Font.SourceSansBold
                            TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
                            TextLabel.Text.Size = 35
                        end
                        local Dis = math.floor((game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v.HumanoidRootPart.Position).Magnitude)
                        v.NpcEspes.TextLabel.Text = v.Name.." - "..Dis.." Distance"
                    end
                end
            else
                for i,v in pairs (game:GetService("Workspace").NPCs:GetChildren()) do
                    if v:FindFirstChild("NpcEspes") then
                        v.NpcEspes:Destroy()
                    end
                end
            end
        end)
    end
end)
spawn(function()
	    while wait(1) do
		    if FlowerESP then
			    UpdateFlowerChams() 
		    end
		    if DevilFruitESP then
			    UpdateDevilChams() 
		    end
		    if ChestESP then
			    UpdateChestChams() 
		    end
		    if ESPPlayer then
			    UpdatePlayerChams()
		    end
		    if RealFruitESP then
			    UpdateRealFruitChams()
		    end
	    end
    end)
function UpdateIslandMirageESP() 
    for i,v in pairs(game:GetService("Workspace")["_WorldOrigin"].Locations:GetChildren()) do
        pcall(function()
            if MirageIslandESP then 
                if v.Name == "Mirage Island" then
                    if not v:FindFirstChild('NameEsp') then
                        local bill = Instance.new('BillboardGui',v)
                        bill.Name = 'NameEsp'
                        bill.ExtentsOffset = Vector3.new(0, 1, 0)
                        bill.Size = UDim2.new(1,200,1,30)
                        bill.Adornee = v
                        bill.AlwaysOnTop = true
                        local name = Instance.new('TextLabel',bill)
                        name.Font = "Code"
                        name.FontSize = "Size14"
                        name.TextWrapped = true
                        name.Size = UDim2.new(1,0,1,0)
                        name.TextYAlignment = 'Top'
                        name.BackgroundTransparency = 1
                        name.TextStrokeTransparency = 0.5
                        name.TextColor3 = Color3.fromRGB(255, 255, 255)
                    else
                        v['NameEsp'].TextLabel.Text = (v.Name ..'   \n'.. round((game:GetService('Players').LocalPlayer.Character.Head.Position - v.Position).Magnitude/3) ..' M')
                    end
                end
            else
                if v:FindFirstChild('NameEsp') then
                    v:FindFirstChild('NameEsp'):Destroy()
                end
            end
        end)
    end
end
function UpdateAfdESP() 
    for i,v in pairs(game:GetService("Workspace").NPCs:GetChildren()) do
        pcall(function()
            if AfdESP then 
                if v.Name == "Advanced Fruit Dealer" then
                    if not v:FindFirstChild('NameEsp') then
                        local bill = Instance.new('BillboardGui',v)
                        bill.Name = 'NameEsp'
                        bill.ExtentsOffset = Vector3.new(0, 1, 0)
                        bill.Size = UDim2.new(1,200,1,30)
                        bill.Adornee = v
                        bill.AlwaysOnTop = true
                        local name = Instance.new('TextLabel',bill)
                        name.Font = "Code"
                        name.FontSize = "Size14"
                        name.TextWrapped = true
                        name.Size = UDim2.new(1,0,1,0)
                        name.TextYAlignment = 'Top'
                        name.BackgroundTransparency = 1
                        name.TextStrokeTransparency = 0.5
                        name.TextColor3 = Color3.fromRGB(255, 255, 255)
                    else
                        v['NameEsp'].TextLabel.Text = (v.Name ..'   \n'.. round((game:GetService('Players').LocalPlayer.Character.Head.Position - v.Position).Magnitude/3) ..' M')
                    end
                end
            else
                if v:FindFirstChild('NameEsp') then
                    v:FindFirstChild('NameEsp'):Destroy()
                end
            end
        end)
    end
end
----------
spawn(function()
	    while wait(1) do
		    if FlowerESP then
			    UpdateFlowerChams() 
		    end
		    if DevilFruitESP then
			    UpdateDevilChams() 
		    end
		    if ChestESP then
			    UpdateChestChams() 
		    end
		    if ESPPlayer then
			    UpdatePlayerChams()
		    end
		    if RealFruitESP then
			    UpdateRealFruitChams()
		    end
	    end
    end)
    
game:GetService("RunService").Stepped:Connect(function()
		if _G.ShowInfo then
			Main.Visible = true
		else
			Main.Visible = false
		end
	end)

spawn(function()
			while task.wait() do
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
        if InfAbility then
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
                inf.Speed = NumberRange.new(120, 120)
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
        while wait() do
            if InfAbility then
                InfAb()
            end
        end
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
                    y.activeController.focusStart = 9999999999999999999999
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

spawn(function()
    while wait(.1) do
        if _G.AUTOHAKI then 
            if not game.Players.LocalPlayer.Character:FindFirstChild("HasBuso") then
                local args = {
                    [1] = "Buso"
                }
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
            end
        end
    end
end)

spawn(function()
    game:GetService("RunService").RenderStepped:Connect(function()
        if _G.AutoAwakeningRace and game.Players.LocalPlayer.Character.RaceEnergy.Value == 1 then
            game:GetService("VirtualInputManager"):SendKeyEvent(true, "Y", false, game)
            wait(0.1)
            game:GetService("VirtualInputManager"):SendKeyEvent(false, "Y", false, game)
        end
    end)
end)

----------auto combo
local combotext = Instance.new("StringValue")
combotext.Value = ""

task.spawn(function()
	while wait() do
		pcall(function()
			if _G.SelectMel == "Melee" then
				for i ,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
					if v.ToolTip == "Melee" then
						if game.Players.LocalPlayer.Backpack:FindFirstChild(tostring(v.Name)) then
							_G.SelectMel = v.Name
						end
					end
				end
			elseif _G.SelectSrd == "Sword" then
				for i ,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
					if v.ToolTip == "Sword" then
						if game.Players.LocalPlayer.Backpack:FindFirstChild(tostring(v.Name)) then
							_G.SelectSrd = v.Name
						end
					end
				end
			elseif _G.SelectGun == "Gun" then
				for i ,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
					if v.ToolTip == "Gun" then
						if game.Players.LocalPlayer.Backpack:FindFirstChild(tostring(v.Name)) then
							_G.SelectGun = v.Name
						end
					end
				end
			elseif _G.SelectFru == "Fruit" then
				for i ,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
					if v.ToolTip == "Blox Fruit" then
						if game.Players.LocalPlayer.Backpack:FindFirstChild(tostring(v.Name)) then
							_G.SelectFru = v.Name
						end
					end
				end
			end
		end)
	end
    end)
    



    function UnEquipWeapon(Weapon)
        if game.Players.LocalPlayer.Character:FindFirstChild(Weapon) then
            _G.NotAutoEquip = true
            wait(.5)
            game.Players.LocalPlayer.Character:FindFirstChild(Weapon).Parent = game.Players.LocalPlayer.Backpack
            wait(.1)
            _G.NotAutoEquip = false
        end
    end
    
    function EquipWeapon(ToolSe)
        if not _G.NotAutoEquip then
            if game.Players.LocalPlayer.Backpack:FindFirstChild(ToolSe) then
                Tool = game.Players.LocalPlayer.Backpack:FindFirstChild(ToolSe)
                wait(.1)
                game.Players.LocalPlayer.Character.Humanoid:EquipTool(Tool)
            end
        end
    end

_G.SelectMel = "Melee"
_G.SelectGun = "Gun"
_G.SelectFru = "Fruit"
_G.SelectSrd = "Sword"

local function executeTextProcess()
    getgenv().keytoclick = "Combo"
    local tool = Instance.new("Tool")
    tool.RequiresHandle = false
    tool.Name = keytoclick
    tool.Activated:connect(function()
        local text = combotext.Value
        local parts = {}
        for part in string.gmatch(text, "([^&]+)") do
            table.insert(parts, part)
        end
        local function extractWaitTime(part)
            local waitTime = string.match(part, "wait%((%d+%.?%d*)%)")
            return waitTime and tonumber(waitTime) or nil
        end
        ---melee hold
        local function extractHoldTime_x(part)
            local holdTime_x = string.match(part, "melee%.x%.hold%((%d+)%)")
            return holdTime_x and tonumber(holdTime_x) or nil
        end
        
        local function extractHoldTime_z(part)
            local holdTime_z = string.match(part, "melee%.z%.hold%((%d+)%)")
            return holdTime_z and tonumber(holdTime_z) or nil
        end
        
        local function extractHoldTime_c(part)
            local holdTime_c = string.match(part, "melee%.c%.hold%((%d+)%)")
            return holdTime_c and tonumber(holdTime_c) or nil
        end
        
        --melee fun
        
        local function skmelee_x(holdTime_x)
            EquipWeapon(_G.SelectMel)
            wait(0.1)
            
            game:service('VirtualInputManager'):SendKeyEvent(true, "X", false, game)
            if holdTime_x then
                wait(holdTime_x)
            end
            game:service('VirtualInputManager'):SendKeyEvent(false, "X", false, game)
            print("your text")
        end
        
        local function skmelee_z(holdTime_z)
            EquipWeapon(_G.SelectMel)
            wait(0.1)
            
            game:service('VirtualInputManager'):SendKeyEvent(true, "Z", false, game)
            if holdTime_z then
                wait(holdTime_z)
            end
            game:service('VirtualInputManager'):SendKeyEvent(false, "Z", false, game)
            print("your")
        end
        
        local function skmelee_c(holdTime_c)
            EquipWeapon(_G.SelectMel)
            wait(0.1)
            
            game:service('VirtualInputManager'):SendKeyEvent(true, "C", false, game)
            if holdTime_c then
                wait(holdTime_c)
            end
            game:service('VirtualInputManager'):SendKeyEvent(false, "C", false, game)
        end
        
        --gun hold
        local function extractHoldTime_x_G(part)
            local holdTime_x_G = string.match(part, "gun%.x%.hold%((%d+)%)")
            return holdTime_x_G and tonumber(holdTime_x_G) or nil
        end
        local function extractHoldTime_z_G(part)
            local holdTime_z_G = string.match(part, "gun%.z%.hold%((%d+)%)")
            return holdTime_z_G and tonumber(holdTime_z_G) or nil
        end
        ---gun fun
        
        
        local function skgun_x(holdTime_x_G)
            EquipWeapon(_G.SelectGun)
            wait(0.1)
            
            game:service('VirtualInputManager'):SendKeyEvent(true, "X", false, game)
            if holdTime_x_G then
                wait(holdTime_x_G)
            end
            game:service('VirtualInputManager'):SendKeyEvent(false, "X", false, game)
        end
        
        local function skgun_z(holdTime_z_G)
            EquipWeapon(_G.SelectGun)
            wait(0.1)
            
            game:service('VirtualInputManager'):SendKeyEvent(true, "Z", false, game)
            if holdTime_z_G then
                wait(holdTime_z_G)
            end
            game:service('VirtualInputManager'):SendKeyEvent(false, "Z", false, game)
        end
        
        ----------sword hold
        local function extractHoldTime_x_S(part)
            local holdTime_x_S = string.match(part, "sword%.x%.hold%((%d+)%)")
            return holdTime_x_S and tonumber(holdTime_x_S) or nil
        end
        
        local function extractHoldTime_z_S(part)
            local holdTime_z_S = string.match(part, "sword%.z%.hold%((%d+)%)")
            return holdTime_z_S and tonumber(holdTime_z_S) or nil
        end
        ---sword fun
        local function skSrd_x(holdTime_x_S)
            EquipWeapon(_G.SelectSrd)
            wait(0.1)
            
            game:service('VirtualInputManager'):SendKeyEvent(true, "X", false, game)
            if holdTime_x_S then
                wait(holdTime_x_S)
            end
            game:service('VirtualInputManager'):SendKeyEvent(false, "X", false, game)
        end
        
        local function skSrd_z(holdTime_z_S)
            EquipWeapon(_G.SelectSrd)
            wait(0.1)
            
            game:service('VirtualInputManager'):SendKeyEvent(true, "Z", false, game)
            if holdTime_z_S then
                wait(holdTime_z_S)
            end
            game:service('VirtualInputManager'):SendKeyEvent(false, "Z", false, game)
        end
        
        ---------frut hold
        local function extractHoldTime_x_F(part)
            local holdTime_x_F = string.match(part, "fruit%.x%.hold%((%d+)%)")
            return holdTime_x_F and tonumber(holdTime_x_F) or nil
        end
        
        local function extractHoldTime_z_F(part)
            local holdTime_z_F = string.match(part, "fruit%.z%.hold%((%d+)%)")
            return holdTime_z_F and tonumber(holdTime_z_F) or nil
        end
        
        local function extractHoldTime_c_F(part)
            local holdTime_c_F = string.match(part, "fruit%.c%.hold%((%d+)%)")
            return holdTime_c_F and tonumber(holdTime_c_F) or nil
        end
        
        local function extractHoldTime_v_F(part)
            local holdTime_v_F = string.match(part, "fruit%.v%.hold%((%d+)%)")
            return holdTime_v_F and tonumber(holdTime_v_F) or nil
        end
        ----------fruit fun
        local function skFRU_x(holdTime_x_F)
            EquipWeapon(_G.SelectFru)
            wait(0.1)
            
            game:service('VirtualInputManager'):SendKeyEvent(true, "X", false, game)
            if holdTime_x_F then
                wait(holdTime_x_F)
            end
            game:service('VirtualInputManager'):SendKeyEvent(false, "X", false, game)
        end
        
        local function skFRU_z(holdTime_z_F)
            EquipWeapon(_G.SelectFru)
            wait(0.1)
            
            game:service('VirtualInputManager'):SendKeyEvent(true, "Z", false, game)
            if holdTime_z_F then
                wait(holdTime_z_F)
            end
            game:service('VirtualInputManager'):SendKeyEvent(false, "Z", false, game)
        end
        
        local function skFRU_c(holdTime_c_F)
            EquipWeapon(_G.SelectFru)
            wait(0.1)
            
            game:service('VirtualInputManager'):SendKeyEvent(true, "C", false, game)
            if holdTime_c_F then
                wait(holdTime_c_F)
            end
            game:service('VirtualInputManager'):SendKeyEvent(false, "C", false, game)
        end
        
        local function skFRU_v(holdTime_v_F)
            EquipWeapon(_G.SelectFru)
            wait(0.1)
            
            game:service('VirtualInputManager'):SendKeyEvent(true, "V", false, game)
            if holdTime_v_F then
                wait(holdTime_v_F)
            end
            game:service('VirtualInputManager'):SendKeyEvent(false, "V", false, game)
        end
        --work zhahaha
        
        for _, part in ipairs(parts) do
            local waitTime = extractWaitTime(part)
            if waitTime then
                    wait(waitTime)
                    print(waitTime)
            elseif string.match(part, "melee%.x%.hold%(%d+%)") then
                local holdTime_x = extractHoldTime_x(part)
                skmelee_x(holdTime_x)
            elseif string.match(part, "melee%.z%.hold%(%d+%)") then
                local holdTime_z = extractHoldTime_z(part)
                skmelee_z(holdTime_z)
            elseif string.match(part, "melee%.c%.hold%(%d+%)") then
                local holdTime_c = extractHoldTime_c(part)
                skmelee_c(holdTime_c)    
            elseif part == "melee.x" then
                skmelee_x()
            elseif part == "melee.z" then
                skmelee_z()
            elseif part == "melee.c" then
                skmelee_c()
            --------------------- sword
            elseif string.match(part, "sword%.x%.hold%(%d+%)") then
                local holdTime_x_S = extractHoldTime_x_S(part)
                skSrd_x(holdTime_x_S)    
            elseif string.match(part, "sword%.z%.hold%(%d+%)") then
                local holdTime_z_S = extractHoldTime_z_S(part)
                skSrd_z(holdTime_z_S)
            elseif part == "sword.x" then
                skSrd_x()
            elseif part == "sword.z" then
                skSrd_z()
            ------------------gun
            elseif string.match(part, "gun%.x%.hold%(%d+%)") then
                local holdTime_x_G = extractHoldTime_x_G(part)
                skgun_x(holdTime_x_G)    
            elseif string.match(part, "gun%.z%.hold%(%d+%)") then
                local holdTime_z_G = extractHoldTime_z_G(part)
                skgun_z(holdTime_z_G)
            elseif part == "gun.x" then
                skgun_x()
            elseif part == "gun.z" then
                skgun_z()
            -----+--------------fruit
            elseif string.match(part, "fruit%.x%.hold%(%d+%)") then
                local holdTime_x_F = extractHoldTime_x_F(part)
                skFRU_x(holdTime_x_F)    
            elseif string.match(part, "fruit%.z%.hold%(%d+%)") then
                local holdTime_z_F = extractHoldTime_z_F(part)
                skFRU_z(holdTime_z_F)    
            elseif string.match(part, "fruit%.c%.hold%(%d+%)") then
                local holdTime_c_F = extractHoldTime_c_F(part)
                skFRU_c(holdTime_c_F)    
            elseif string.match(part, "fruit%.v%.hold%(%d+%)") then
                local holdTime_v_F = extractHoldTime_v_F(part)
                skFRU_v(holdTime_v_F)   
            elseif part == "fruit.x" then
                skFRU_x()
            elseif part == "fruit.z" then
                skFRU_z()
            elseif part == "fruit.c" then
                skFRU_c()
            elseif part == "fruit.v" then
                skFRU_v()
            end
        end
    end)
    tool.Parent = game.Players.LocalPlayer.Backpack
    wait(0.2)
end


function NoDodgeCool()
    if not nododgecool then return end

    local player = game:GetService("Players").LocalPlayer
    local character = player.Character
    if not character or not character:FindFirstChild("Dodge") then return end

    for _, v in ipairs(getgc()) do
        if typeof(v) == "function" then
            local env = getfenv(v)
            if env and env.script == character.Dodge then
                for i2, v2 in ipairs(getupvalues(v)) do
                    if typeof(v2) == "number" and v2 >= 0.1 then
                        local function disableCooldown()
                            setupvalue(v, i2, 0)
                        end

                        repeat
                            disableCooldown()
                            wait(0.05)  -- تقليل فترة الانتظار لجعل الكود أسرع
                        until not nododgecool
                    end
                end
            end
        end
    end
end

---------------

-------------race v4
spawn(function()
    pcall(function()
        while wait() do
            if _G.AutoQuestRace then
				if game:GetService("Players").LocalPlayer.Data.Race.Value == "Human" then
					for i,v in pairs(game.Workspace.Enemies:GetDescendants()) do
						if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
							pcall(function()
								repeat wait(.1)
									v.Humanoid.Health = 0
									v.HumanoidRootPart.CanCollide = false
									sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge)
								until not _G.AutoQuestRace or not v.Parent or v.Humanoid.Health <= 0
							end)
						end
					end
				elseif game:GetService("Players").LocalPlayer.Data.Race.Value == "Skypiea" then
					for i,v in pairs(game:GetService("Workspace").Map.SkyTrial.Model:GetDescendants()) do
						if v.Name ==  "snowisland_Cylinder.081" then
							topos(v.CFrame* CFrame.new(0,0,0))
						end
					end
				elseif game:GetService("Players").LocalPlayer.Data.Race.Value == "Fishman" then
					for i,v in pairs(game:GetService("Workspace").SeaBeasts.SeaBeast1:GetDescendants()) do
						if v.Name ==  "HumanoidRootPart" then
							topos(v.CFrame* CFrame.new(PosX,PosY,PosZ))
							for i,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
								if v:IsA("Tool") then
									if v.ToolTip == "Melee" then -- "Blox Fruit" , "Sword" , "Wear" , "Agility"
										game.Players.LocalPlayer.Character.Humanoid:EquipTool(v)
									end
								end
							end
							game:GetService("VirtualInputManager"):SendKeyEvent(true,122,false,game.Players.LocalPlayer.Character.HumanoidRootPart)
							game:GetService("VirtualInputManager"):SendKeyEvent(false,122,false,game.Players.LocalPlayer.Character.HumanoidRootPart)
							wait(.2)
							game:GetService("VirtualInputManager"):SendKeyEvent(true,120,false,game.Players.LocalPlayer.Character.HumanoidRootPart)
							game:GetService("VirtualInputManager"):SendKeyEvent(false,120,false,game.Players.LocalPlayer.Character.HumanoidRootPart)
							wait(.2)
							game:GetService("VirtualInputManager"):SendKeyEvent(true,99,false,game.Players.LocalPlayer.Character.HumanoidRootPart)
							game:GetService("VirtualInputManager"):SendKeyEvent(false,99,false,game.Players.LocalPlayer.Character.HumanoidRootPart)
							for i,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
								if v:IsA("Tool") then
									if v.ToolTip == "Blox Fruit" then -- "Blox Fruit" , "Sword" , "Wear" , "Agility"
										game.Players.LocalPlayer.Character.Humanoid:EquipTool(v)
									end
								end
							end
							game:GetService("VirtualInputManager"):SendKeyEvent(true,122,false,game.Players.LocalPlayer.Character.HumanoidRootPart)
							game:GetService("VirtualInputManager"):SendKeyEvent(false,122,false,game.Players.LocalPlayer.Character.HumanoidRootPart)
							wait(.2)
							game:GetService("VirtualInputManager"):SendKeyEvent(true,120,false,game.Players.LocalPlayer.Character.HumanoidRootPart)
							game:GetService("VirtualInputManager"):SendKeyEvent(false,120,false,game.Players.LocalPlayer.Character.HumanoidRootPart)
							wait(.2)
							game:GetService("VirtualInputManager"):SendKeyEvent(true,99,false,game.Players.LocalPlayer.Character.HumanoidRootPart)
							game:GetService("VirtualInputManager"):SendKeyEvent(false,99,false,game.Players.LocalPlayer.Character.HumanoidRootPart)
					
							wait(0.5)
							for i,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
								if v:IsA("Tool") then
									if v.ToolTip == "Sword" then -- "Blox Fruit" , "Sword" , "Wear" , "Agility"
										game.Players.LocalPlayer.Character.Humanoid:EquipTool(v)
									end
								end
							end
							game:GetService("VirtualInputManager"):SendKeyEvent(true,122,false,game.Players.LocalPlayer.Character.HumanoidRootPart)
							game:GetService("VirtualInputManager"):SendKeyEvent(false,122,false,game.Players.LocalPlayer.Character.HumanoidRootPart)
							wait(.2)
							game:GetService("VirtualInputManager"):SendKeyEvent(true,120,false,game.Players.LocalPlayer.Character.HumanoidRootPart)
							game:GetService("VirtualInputManager"):SendKeyEvent(false,120,false,game.Players.LocalPlayer.Character.HumanoidRootPart)
							wait(.2)
							game:GetService("VirtualInputManager"):SendKeyEvent(true,99,false,game.Players.LocalPlayer.Character.HumanoidRootPart)
							game:GetService("VirtualInputManager"):SendKeyEvent(false,99,false,game.Players.LocalPlayer.Character.HumanoidRootPart)
							wait(0.5)
							for i,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
								if v:IsA("Tool") then
									if v.ToolTip == "Gun" then -- "Blox Fruit" , "Sword" , "Wear" , "Agility"
										game.Players.LocalPlayer.Character.Humanoid:EquipTool(v)
									end
								end
							end
							game:GetService("VirtualInputManager"):SendKeyEvent(true,122,false,game.Players.LocalPlayer.Character.HumanoidRootPart)
							game:GetService("VirtualInputManager"):SendKeyEvent(false,122,false,game.Players.LocalPlayer.Character.HumanoidRootPart)
							wait(.2)
							game:GetService("VirtualInputManager"):SendKeyEvent(true,120,false,game.Players.LocalPlayer.Character.HumanoidRootPart)
							game:GetService("VirtualInputManager"):SendKeyEvent(false,120,false,game.Players.LocalPlayer.Character.HumanoidRootPart)
							wait(.2)
							game:GetService("VirtualInputManager"):SendKeyEvent(true,99,false,game.Players.LocalPlayer.Character.HumanoidRootPart)
							game:GetService("VirtualInputManager"):SendKeyEvent(false,99,false,game.Players.LocalPlayer.Character.HumanoidRootPart)
						end
					end
				elseif game:GetService("Players").LocalPlayer.Data.Race.Value == "Cyborg" then
					topos(CFrame.new(28654, 14898.7832, -30, 1, 0, 0, 0, 1, 0, 0, 0, 1))
				elseif game:GetService("Players").LocalPlayer.Data.Race.Value == "Ghoul" then
					for i,v in pairs(game.Workspace.Enemies:GetDescendants()) do
						if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
							pcall(function()
								repeat wait(.1)
									v.Humanoid.Health = 0
									v.HumanoidRootPart.CanCollide = false
									sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge)
								until not _G.AutoQuestRace or not v.Parent or v.Humanoid.Health <= 0
							end)
						end
					end
				elseif game:GetService("Players").LocalPlayer.Data.Race.Value == "Mink" then
					for i,v in pairs(game:GetService("Workspace"):GetDescendants()) do
						if v.Name == "StartPoint" then
							topos(v.CFrame* CFrame.new(0,10,0))
					  	end
				   	end
				end
			end
        end
    end)
end)

spawn(function()
        game:GetService("RunService").RenderStepped:Connect(function()
            while wait(.1) do
                if _G.NoStunV2 then
                    game.Players.LocalPlayer.Character.HumanoidRootPart.Size = Vector3.new(2,1,0.93)
                end
            end
        end)
    end)



--------
local INFOPLY = Window:MakeTab({
	Name = "INFO",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

local SINFOPLY = INFOPLY:AddSection({
	Name = "YOUR ACCOUNT"
})


local localrace = INFOPLY:AddLabel("???")
local LOCLV = INFOPLY:AddLabel("???")
local localbountyhornor = INFOPLY:AddLabel("???")
local plyserv = INFOPLY:AddLabel("Players")

    spawn(function()
        while wait() do
            pcall(function()
                for i,v in pairs(game:GetService("Players"):GetPlayers()) do
                    if i == 12 then
                        plyserv:Set("Players:".." "..i.." ".."/".." ".."12".." ".."(Max)")
                    elseif i == 1 then
                        plyserv:Set("Player:".." "..i.." ".."/".." ".."12")
                    else
                        plyserv:Set("Players:".." "..i.." ".."/".." ".."12")
                    end
                end
            end)
        end
    end)



spawn(function()
        while wait() do
            pcall(function()
                localrace:Set("Race:".." "..game:GetService("Players").LocalPlayer.Data.Race.Value)
            end)
        end
    end)
spawn(function()
        while wait() do
            pcall(function()
                LOCLV:Set("Level:".." "..game:GetService("Players").LocalPlayer.Data.Level.Value)
            end)
        end
    end)    
spawn(function()
        while wait() do
            pcall(function()
                localbountyhornor:Set("Bounty / Honor:".." "..game:GetService("Players").LocalPlayer.leaderstats["Bounty/Honor"].Value)
            end)
        end
    end)





local CBTAP = Window:MakeTab({
	Name = "PLAYER",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

local SectionCB = CBTAP:AddSection({
	Name = "AIMBOT"
})

CBTAP:AddSlider({
	Name = "FOV SIZE",
	Min = 1,
	Max = 360,
	Default = 100,
	Color = Color3.fromRGB(255,255,255),
	Increment = 1,
	ValueName = "SIZE AIM BOT",
	Callback = function(Value)
		Fov = Value
	end    
})


CBTAP:AddToggle({
	Name = "SHOW FOV",
	Default = false,
	Callback = function(Value)
		ShowFov = Value
	end    
})

CBTAP:AddToggle({
	Name = "SHOW INFO PLAYER",
	Default = true,
	Callback = function(Value)
		_G.ShowInfo = Value
	end    
})

CBTAP:AddToggle({
	Name = "AIMBOT",
	Default = false,
	Callback = function(Value)
		_G.Aimbot = Value
	end    
})



local LOCKAIM = CBTAP:AddLabel("Lock Players | OFF")




CBTAP:AddToggle({
	Name = "LOCK AIMBOT",
	Default = false,
	Callback = function(Value)
        if Value == false then
            LOCKAIM:Set("Lock Players | OFF")
            getgenv().setting['LockPlayers'] = false
            print(getgenv().setting['LockPlayers'])
        else
            LOCKAIM:Set("Lock Players | ON")
            getgenv().setting['LockPlayers'] = true
            print(getgenv().setting['LockPlayers'])
        end
	end    
})



local SectionCB = CBTAP:AddSection({
    Name = "AUTO COMBO"
})

local combois = CBTAP:AddLabel("COMBO :")

spawn(function()
        while wait() do
            pcall(function()
                combois:Set("COMBO : ".." "..combotext.Value)
            end)
        end
    end)
-- إنشاء TextBox للحصول على مدخلات المستخدم
CBTAP:AddTextbox({
	Name = "COMBO TEXT",
	Default = "",
	TextDisappear = true,
	Callback = function(Value)
		combotext.Value = Value
	end	  
})


CBTAP:AddButton({
    Name = "COMBO",
    Callback = function()
        executeTextProcess()
    end
})

CBTAP:AddToggle({
	Name = "HIT BOX",
	Default = false,
	Callback = function(Value)
		_G.Hitbox = Value
	end    
})

CBTAP:AddDropdown({
    Name = "SELECT SIZE",
    Default = "20",  -- Assuming Playerslist is not empty initially
    Options = {"10","20","30","40"},
    Callback = function(Value)
        _G.HitboxZi = Value
    end
})

local ESPTAP = Window:MakeTab({
	Name = "ESP",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

local Sectionesp = ESPTAP:AddSection({
	Name = "ESP"
})
ESPTAP:AddToggle({
	Name = "ESP PLAYERS",
	Default = false,
	Callback = function(a)
		ESPPlayer = a
	UpdatePlayerChams()
	end    
})

ESPTAP:AddToggle({
	Name = "ESP FRUIT",
	Default = false,
	Callback = function(a)
		DevilFruitESP = a
        while DevilFruitESP do wait()
            UpdateDevilChams() 
        end
	end    
})


local MISCTAP = Window:MakeTab({
	Name = "MISC",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

local Sectionmisc = MISCTAP:AddSection({
	Name = "PLAYERS"
})

MISCTAP:AddToggle({
	Name = "NO STUN",
	Default = false,
	Callback = function(Value)
		_G.NoStunV2 = Value
	end    
})

MISCTAP:AddToggle({
	Name = "WALK IN WATER",
	Default = false,
	Callback = function(Value)
		_G.WalkWater = Value
	end    
})

MISCTAP:AddToggle({
	Name = "NO CLIP",
	Default = false,
	Callback = function(Value)
		_G.No_clip = Value
	end    
})


MISCTAP:AddButton({
	Name = "NO FOG IN SEA",
	Callback = function()
    	game:GetService("Lighting").LightingLayers:Destroy()
    end
})



MISCTAP:AddToggle({
	Name = "INFINITY ABILITY",
	Default = true,
	Callback = function(Value)
        InfAbility = Value
        if Value == false then
            game:GetService("Players").LocalPlayer.Character.HumanoidRootPart:FindFirstChild("Agility"):Destroy()
        end
	end    
})

MISCTAP:AddToggle({
	Name = "AUTO AWAKENING RACE",
	Default = true,
	Callback = function(Value)
		_G.AutoAwakeningRace = Value
	end    
})

local Sectionmisc = MISCTAP:AddSection({
	Name = "TEAM"
})

MISCTAP:AddButton({
	Name = "TEAM PIRATES ",
	Callback = function()
    local args = {
			[1] = "SetTeam",
			[2] = "Pirates"
		}
		game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args)) 
		local args = {
			[1] = "BartiloQuestProgress"
		}
		game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
	end
		
})

MISCTAP:AddButton({
	Name = "TEAM MARINES ",
	Callback = function()
    local args = {
			[1] = "SetTeam",
			[2] = "Marines"
		}
		game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args)) 
		local args = {
			[1] = "BartiloQuestProgress"
		}
		game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
	end
		
})

local Sectionmisc = MISCTAP:AddSection({
	Name = "SERVER"
})


MISCTAP:AddButton({
	Name = "SERVER HOP",
	Callback = function()
    	Hop()
    end
})

MISCTAP:AddButton({
	Name = "REJOIN",
	Callback = function()
    	game:GetService("TeleportService"):Teleport(game.PlaceId, game:GetService("Players").LocalPlayer)
    end
})




MISCTAP:AddButton({
	Name = "SERVER HOP LOWER",
	Callback = function()
    	getgenv().AutoTeleport = true
        getgenv().DontTeleportTheSameNumber = true 
        getgenv().CopytoClipboard = false
        if not game:IsLoaded() then
            print("Game is loading waiting...")
        end
        local maxplayers = math.huge
        local serversmaxplayer;
        local goodserver;
        local gamelink = "https://games.roblox.com/v1/games/" .. game.PlaceId .. "/servers/Public?sortOrder=Asc&limit=100" 
        function serversearch()
            for _, v in pairs(game:GetService("HttpService"):JSONDecode(game:HttpGetAsync(gamelink)).data) do
                if type(v) == "table" and v.playing ~= nil and maxplayers > v.playing then
                    serversmaxplayer = v.maxPlayers
                    maxplayers = v.playing
                    goodserver = v.id
                end
            end       
        end
        function getservers()
            serversearch()
            for i,v in pairs(game:GetService("HttpService"):JSONDecode(game:HttpGetAsync(gamelink))) do
                if i == "nextPageCursor" then
                    if gamelink:find("&cursor=") then
                        local a = gamelink:find("&cursor=")
                        local b = gamelink:sub(a)
                        gamelink = gamelink:gsub(b, "")
                    end
                    gamelink = gamelink .. "&cursor=" ..v
                    getservers()
                end
            end
        end 
        getservers()
        if AutoTeleport then
            if DontTeleportTheSameNumber then 
                if #game:GetService("Players"):GetPlayers() - 4  == maxplayers then
                    return warn("It has same number of players (except you)")
                elseif goodserver == game.JobId then
                    return warn("Your current server is the most empty server atm") 
                end
            end
            game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, goodserver)
        end
    end
})

local Sectionmisc = MISCTAP:AddSection({
	Name = "VISUAL"
})

MISCTAP:AddToggle({
	Name = "NO DODGE COOL DOWN",
	Default = false,
	Callback = function(Value)
		nododgecool = Value
		NoDodgeCool()
	end    
})


MISCTAP:AddToggle({
	Name = "INFINITY OBSERVATION",
	Default = getgenv().InfiniteObRange,
	Callback = function(Value)
        getgenv().InfiniteObRange = Value
        local VS = game:GetService("Players").LocalPlayer.VisionRadius.Value
        while getgenv().InfiniteObRange do
            wait()
            local player = game:GetService("Players").LocalPlayer
            local char = player.Character
            local VisionRadius = player.VisionRadius
            if player then
                if char.Humanoid.Health <= 0 then 
                    wait(5) 
                end
                VisionRadius.Value = math.huge
            elseif getgenv().InfiniteObRange == false and player then
                VisionRadius.Value = VS
            end
        end
	end    
})

MISCTAP:AddToggle({
	Name = "INFINIT GEPPO",
	Default = false,
	Callback = function(Value)
		getgenv().InfGeppo = Value
	end    
})

    spawn(function()
        while wait() do
            pcall(function()
                if getgenv().InfGeppo then
                    for i,v in next, getgc() do
                        if game:GetService("Players").LocalPlayer.Character.Geppo then
                            if typeof(v) == "function" and getfenv(v).script == game:GetService("Players").LocalPlayer.Character.Geppo then
                                for i2,v2 in next, getupvalues(v) do
                                    if tostring(i2) == "9" then
                                        repeat wait(.1)
                                            setupvalue(v,i2,0)
                                        until not getgenv().InfGeppo or game:GetService("Players").LocalPlayer.Character.Humanoid.Health <= 0 
                                    end
                                end
                            end
                        end
                    end
                end
            end)
        end
    end)
    
MISCTAP:AddToggle({
	Name = "INFINIT SORU",
	Default = false,
	Callback = function(Value)
		getgenv().InfSoru = Value
	end    
})

    spawn(function()
        while wait() do
            pcall(function()
                if getgenv().InfSoru and game:GetService("Players").LocalPlayer.Character:FindFirstChild("HumanoidRootPart") ~= nil  then
                    for i,v in next, getgc() do
                        if game:GetService("Players").LocalPlayer.Character.Soru then
                            if typeof(v) == "function" and getfenv(v).script == game:GetService("Players").LocalPlayer.Character.Soru then
                                for i2,v2 in next, getupvalues(v) do
                                    if typeof(v2) == "table" then
                                        repeat wait(0.1)
                                            v2.LastUse = 0
                                        until not getgenv().InfSoru or game:GetService("Players").LocalPlayer.Character.Humanoid.Health <= 0
                                    end
                                end
                            end
                        end
                    end
                end
            end)
        end
    end)
    
local STAP = Window:MakeTab({
	Name = "SETTING",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})
local Sectionst = STAP:AddSection({
	Name = "SETTING"
})

STAP:AddToggle({
	Name = "FAST ATTACK",
	Default = true,
	Callback = function(Value)
		_G.FastAttack = Value
	end    
})

STAP:AddToggle({
	Name = "SUPER FAST",
	Default = false,
	Callback = function(Value)
            local SuperFastMode = Value -- à¹€à¸›à¸¥à¸µà¹ˆà¸¢à¸™à¹€à¸›à¹‡à¸™à¸ˆà¸£à¸´à¸‡à¸–à¹‰à¸²à¸„à¸¸à¸“à¸•à¹‰à¸­à¸‡à¸à¸²à¸£à¹‚à¸ˆà¸¡à¸•à¸µ Super Super Super Fast (à¹€à¸Šà¹ˆà¸™à¸à¸²à¸£à¸†à¹ˆà¸²à¸—à¸±à¸™à¸—à¸µ) à¹à¸•à¹ˆà¸ˆà¸°à¸—à¸³à¹ƒà¸«à¹‰à¹€à¸à¸¡à¹€à¸•à¸°à¸„à¸¸à¸“à¸¡à¸²à¸à¸à¸§à¹ˆà¸²à¹‚à¸«à¸¡à¸”à¸›à¸à¸•à¸´
                 _G.SuperFastMode = Value
    

	end    
})

STAP:AddToggle({
	Name = "BYPASS TP",
	Default = BypassTP,
	Callback = function(Value)
		BypassTP = Value
	end    
})

STAP:AddToggle({
	Name = "AUTO HAKI",
	Default = true,
	Callback = function(Value)
		_G.AUTOHAKI = Value
	end    
})


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


-------------------------------
