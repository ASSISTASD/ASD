notis = require(game.ReplicatedStorage:WaitForChild("Notification"))
notis.new("<Color=Yellow>Loading . . .<Color=/>"):Display()
notis.new("<Color=Yellow>CITY PVP SCRIPT<Color=/>"):Display()
local CITYlib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()

local Window = CITYlib:MakeWindow({Name = "CITY", HidePremium = false, IntroText = "CITY", SaveConfig = true, ConfigFolder = "CITY"})


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
    

--------------------------------------------------------------------------------------------------------
 
 
 


--humanoid.WalkSpeed


function fly()
        local mouse=game:GetService("Players").LocalPlayer:GetMouse''
        localplayer=game:GetService("Players").LocalPlayer
        game:GetService("Players").LocalPlayer.Character:WaitForChild("HumanoidRootPart")
        local torso = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart
        local speedSET=25
        local keys={a=false,d=false,w=false,s=false}
        local e1
        local e2
        local function start()
            local pos = Instance.new("BodyPosition",torso)
            local gyro = Instance.new("BodyGyro",torso)
            pos.Name="EPIXPOS"
            pos.maxForce = Vector3.new(math.huge, math.huge, math.huge)
            pos.position = torso.Position
            gyro.maxTorque = Vector3.new(9e9, 9e9, 9e9)
            gyro.CFrame = torso.CFrame
            repeat
                    wait()
                    localplayer.Character.Humanoid.PlatformStand=true
                    local new=gyro.CFrame - gyro.CFrame.p + pos.position
                    if not keys.w and not keys.s and not keys.a and not keys.d then
                    speed=1
                    end
                    if keys.w then
                    new = new + workspace.CurrentCamera.CoordinateFrame.lookVector * speed
                    speed=speed+speedSET
                    end
                    if keys.s then
                    new = new - workspace.CurrentCamera.CoordinateFrame.lookVector * speed
                    speed=speed+speedSET
                    end
                    if keys.d then
                    new = new * CFrame.new(speed,0,0)
                    speed=speed+speedSET
                    end
                    if keys.a then
                    new = new * CFrame.new(-speed,0,0)
                    speed=speed+speedSET
                    end
                    if speed>speedSET then
                    speed=speedSET
                    end
                    pos.position=new.p
                    if keys.w then
                    gyro.CFrame = workspace.CurrentCamera.CoordinateFrame*CFrame.Angles(-math.rad(speed*15),0,0)
                    elseif keys.s then
                    gyro.CFrame = workspace.CurrentCamera.CoordinateFrame*CFrame.Angles(math.rad(speed*15),0,0)
                    else
                    gyro.CFrame = workspace.CurrentCamera.CoordinateFrame
                    end
            until not Fly
            if gyro then 
                    gyro:Destroy() 
            end
            if pos then 
                    pos:Destroy() 
            end
            flying=false
            localplayer.Character.Humanoid.PlatformStand=false
            speed=0
        end
        e1=mouse.KeyDown:connect(function(key)
            if not torso or not torso.Parent then 
                    flying=false e1:disconnect() e2:disconnect() return 
            end
            if key=="w" then
                keys.w=true
            elseif key=="s" then
                keys.s=true
            elseif key=="a" then
                keys.a=true
            elseif key=="d" then
                keys.d=true
            end
        end)
        e2=mouse.KeyUp:connect(function(key)
            if key=="w" then
                keys.w=false
            elseif key=="s" then
                keys.s=false
            elseif key=="a" then
                keys.a=false
            elseif key=="d" then
                keys.d=false
            end
        end)
        start()
    end
    
    function Click()
        game:GetService'VirtualUser':CaptureController()
        game:GetService'VirtualUser':Button1Down(Vector2.new(1280, 672))
    end
    
    function AutoHaki()
        if not game:GetService("Players").LocalPlayer.Character:FindFirstChild("HasBuso") then
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Buso")
        end
    end
    
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
   
    
    function GetDistance(target)
        return math.floor((target.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude)
    end
    
    function BTP(p)
    	pcall(function()
	    	if (p.Position-game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude >= 1500 and not Auto_Raid and game.Players.LocalPlayer.Character.Humanoid.Health > 0 then
				repeat wait()
					game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = p
					wait(.05)
					game.Players.LocalPlayer.Character.Head:Destroy()
					game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = p
				until (p.Position-game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude < 1500 and game.Players.LocalPlayer.Character.Humanoid.Health > 0
			end
		end)
	end

function TelePPlayer(P)
	game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = P
end
    

function TP1(Pos)
        Distance = (Pos.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
        if game.Players.LocalPlayer.Character.Humanoid.Sit == true then game.Players.LocalPlayer.Character.Humanoid.Sit = false end
        pcall(function() tween = game:GetService("TweenService"):Create(game.Players.LocalPlayer.Character.HumanoidRootPart,TweenInfo.new(Distance/210, Enum.EasingStyle.Linear),{CFrame = Pos}) end)
        tween:Play()
        if Distance <= 250 then
            tween:Cancel()
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = Pos
        end
        if _G.StopTween == true then
            tween:Cancel()
            _G.Clip = false
        end
    end
    
    function TP(Pos)
        Distance = (Pos.Position - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
        if Distance < 250 then
            Speed = 600
        elseif Distance >= 1000 then
            Speed = 200
        end
        game:GetService("TweenService"):Create(
            game:GetService("Players").LocalPlayer.Character.HumanoidRootPart,
            TweenInfo.new(Distance/Speed, Enum.EasingStyle.Linear),
            {CFrame = Pos}
        ):Play()
        _G.Clip = true
        wait(Distance/Speed)
        _G.Clip = false
    end

    function topos(Pos)
        Distance = (Pos.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
        if game.Players.LocalPlayer.Character.Humanoid.Sit == true then game.Players.LocalPlayer.Character.Humanoid.Sit = false end
        pcall(function() tween = game:GetService("TweenService"):Create(game.Players.LocalPlayer.Character.HumanoidRootPart,TweenInfo.new(Distance/210, Enum.EasingStyle.Linear),{CFrame = Pos}) end)
        tween:Play()
        if Distance <= 2 then
            tween:Cancel()
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = Pos
        end
        if _G.StopTween == true then
            tween:Cancel()
            _G.Clip = false
        end
    end
    
    
--Tween Boats 
function TPB(CFgo)
	local tween_s = game:service"TweenService"
	local info = TweenInfo.new((game:GetService("Workspace").Boats.Lantern.VehicleSeat.CFrame.Position - CFgo.Position).Magnitude/200, Enum.EasingStyle.Linear)
	tween = tween_s:Create(game:GetService("Workspace").Boats.Lantern.VehicleSeat, info, {CFrame = CFgo})
	tween:Play()

	local tweenfunc = {}

	function tweenfunc:Stop()
		tween:Cancel()
	end

	return tweenfunc
end

function TPP(CFgo)
	if game.Players.LocalPlayer.Character:WaitForChild("Humanoid").Health <= 0 or not game:GetService("Players").LocalPlayer.Character:WaitForChild("Humanoid") then tween:Cancel() repeat wait() until game:GetService("Players").LocalPlayer.Character:WaitForChild("Humanoid") and game:GetService("Players").LocalPlayer.Character:WaitForChild("Humanoid").Health > 0 wait(7) return end
	local tween_s = game:service"TweenService"
	local info = TweenInfo.new((game:GetService("Players")["LocalPlayer"].Character.HumanoidRootPart.Position - CFgo.Position).Magnitude/325, Enum.EasingStyle.Linear)
	tween = tween_s:Create(game.Players.LocalPlayer.Character["HumanoidRootPart"], info, {CFrame = CFgo})
	tween:Play()

	local tweenfunc = {}

	function tweenfunc:Stop()
		tween:Cancel()
	end

	return tweenfunc
end

getgenv().ToTargets = function(p)
    task.spawn(function()
        pcall(function()
            if game:GetService("Players").LocalPlayer:DistanceFromCharacter(p.Position) <= 250 then 
                game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = p
            elseif not game.Players.LocalPlayer.Character:FindFirstChild("Root")then 
                local K = Instance.new("Part",game.Players.LocalPlayer.Character)
                K.Size = Vector3.new(1,0.5,1)
                K.Name = "Root"
                K.Anchored = true
                K.Transparency = 1
                K.CanCollide = false
                K.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame * CFrame.new(0,20,0)
            end
            local U = (game.Players.LocalPlayer.Character.HumanoidRootPart.Position-p.Position).Magnitude
            local z = game:service("TweenService")
            local B = TweenInfo.new((p.Position-game.Players.LocalPlayer.Character.Root.Position).Magnitude/300,Enum.EasingStyle.Linear)
            local S,g = pcall(function()
            local q = z:Create(game.Players.LocalPlayer.Character.Root,B,{CFrame = p})
            q:Play()
        end)
        if not S then 
            return g
        end
        game.Players.LocalPlayer.Character.Root.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
            if S and game.Players.LocalPlayer.Character:FindFirstChild("Root") then 
                pcall(function()
                    if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position-p.Position).Magnitude >= 20 then 
                        spawn(function()
                            pcall(function()
                                if (game.Players.LocalPlayer.Character.Root.Position-game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 150 then 
                                    game.Players.LocalPlayer.Character.Root.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
                                else 
                                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame=game.Players.LocalPlayer.Character.Root.CFrame
                                end
                            end)
                        end)
                    elseif (game.Players.LocalPlayer.Character.HumanoidRootPart.Position-p.Position).Magnitude >= 10 and(game.Players.LocalPlayer.Character.HumanoidRootPart.Position-p.Position).Magnitude < 20 then 
                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = p
                    elseif (game.Players.LocalPlayer.Character.HumanoidRootPart.Position-p.Position).Magnitude < 10 then 
                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = p
                    end
                end)
            end
	    end)
    end)
    end
    
Type = 1
spawn(function()
    while wait(.1) do
		if Type == 1 then
			Pos = CFrame.new(0,PosY,-30)
		elseif Type == 2 then
			Pos = CFrame.new(30,PosY,0)
		elseif Type == 3 then
			Pos = CFrame.new(0,PosY,30)	
		elseif Type == 4 then
			Pos = CFrame.new(-30,PosY,0)
        end
        end
    end)

spawn(function()
    while wait(.1) do
        Type = 1
        wait(0.5)
        Type = 2
        wait(0.5)
        Type = 3
        wait(0.5)
        Type = 4
        wait(0.5)
        Type = 5
        wait(0.5)
    end
end)
    
    spawn(function()
    game:GetService("RunService").Heartbeat:Connect(function()
        if _G.AutoAdvanceDungeon or _G.AutoDoughtBoss or _G.Auto_DungeonMobAura or _G.AutoFarmChest or _G.AutoFactory or _G.AutoFarmBossHallow or _G.AutoFarmSwanGlasses or _G.AutoLongSword or _G.AutoBlackSpikeycoat or _G.AutoElectricClaw or _G.AutoFarmGunMastery or _G.AutoHolyTorch or _G.AutoLawRaid or _G.AutoFarmBoss or _G.AutoTwinHooks or _G.AutoOpenSwanDoor or _G.AutoDragon_Trident or _G.AutoSaber or _G.NOCLIP or _G.AutoFarmFruitMastery or _G.AutoFarmGunMastery or _G.TeleportIsland or _G.Auto_EvoRace or _G.AutoFarmAllMsBypassType or _G.AutoObservationv2 or _G.AutoMusketeerHat or _G.AutoEctoplasm or _G.AutoRengoku or _G.Auto_Rainbow_Haki or _G.AutoObservation or _G.AutoDarkDagger or _G.Safe_Mode or _G.MasteryFruit or _G.AutoBudySword or _G.AutoOderSword or _G.AutoBounty or _G.AutoAllBoss or _G.Auto_Bounty or _G.AutoSharkman or _G.Auto_Mastery_Fruit or _G.Auto_Mastery_Gun or _G.Auto_Dungeon or _G.Auto_Cavender or _G.Auto_Pole or _G.Auto_Kill_Ply or _G.Auto_Factory or _G.AutoSecondSea or _G.TeleportPly or _G.AutoBartilo or _G.Auto_DarkBoss or _G.GrabChest or _G.AutoFarmBounty or _G.Holy_Torch or _G.AutoFarm or _G.Clip or _G.AutoElitehunter or _G.AutoThirdSea or _G.Auto_Bone or _G.Autoheart or _G.Autodoughking or _G.AutoFarmMaterial or _G.AutoNevaSoulGuitar or _G.Auto_Dragon_Trident or _G.Autotushita or _G.d or _G.Autowaden or _G.Autogay or _G.Autopole or _G.Autosaw or _G.AutoObservationHakiV2 or _G.AutoFarmNearest or AutoFarmChest or _G.AutoCarvender or _G.AutoTwinHook or AutoMobAura or _G.Tweenfruit or _G.AutoKai or _G.TeleportNPC or _G.Leather or _G.Auto_Wing or _G.Umm or _G.Makori_gay or Radioactive or Fish or Gunpowder or Dragon_Scale or Cocoafarm or Scrap or MiniHee or _G.AutoFarmSeabaest or Auto_Cursed_Dual_Katana or _G.AutoFarmMob or _G.AutoMysticIsland or _G.AutoFarmDungeon or _G.AutoRaidPirate or _G.AutoQuestRace or _G.TweenMGear or getgenv().AutoFarm or _G.AutoPlayerHunter or _G.AutoFactory or Grab_Chest or _G.Namfon or _G.AutoSwordMastery or _G.AutoSeaBest or _G.AutoKillTial or _G.Auto_Saber or _G.Position_Spawn or _G.Farmfast or _G.AutoRace or _G.RaidPirate or Open_Color_Haki then
            if not game:GetService("Workspace"):FindFirstChild("LOL") then
                local LOL = Instance.new("Part")
                LOL.Name = "LOL"
                LOL.Parent = game.Workspace
                LOL.Anchored = true
                LOL.Transparency = 1
                LOL.Size = Vector3.new(30,-0.5,30)
            elseif game:GetService("Workspace"):FindFirstChild("LOL") then
                game.Workspace["LOL"].CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame * CFrame.new(0, -3.6, 0)
            end
        else
            if game:GetService("Workspace"):FindFirstChild("LOL") then
                game:GetService("Workspace"):FindFirstChild("LOL"):Destroy()
            end
        end
    end)
    end)

    spawn(function()
        pcall(function()
            while wait() do
                if _G.AutoAdvanceDungeon or _G.AutoDoughtBoss or _G.Auto_DungeonMobAura or _G.AutoFarmChest or _G.AutoFactory or _G.AutoFarmBossHallow or _G.AutoFarmSwanGlasses or _G.AutoLongSword or _G.AutoBlackSpikeycoat or _G.AutoElectricClaw or _G.AutoFarmGunMastery or _G.AutoHolyTorch or _G.AutoLawRaid or _G.AutoFarmBoss or _G.AutoTwinHooks or _G.AutoOpenSwanDoor or _G.AutoDragon_Trident or _G.AutoSaber or _G.AutoFarmFruitMastery or _G.AutoFarmGunMastery or _G.TeleportIsland or _G.Auto_EvoRace or _G.AutoFarmAllMsBypassType or _G.AutoObservationv2 or _G.AutoMusketeerHat or _G.AutoEctoplasm or _G.AutoRengoku or _G.Auto_Rainbow_Haki or _G.AutoObservation or _G.AutoDarkDagger or _G.Safe_Mode or _G.MasteryFruit or _G.AutoBudySword or _G.AutoOderSword or _G.AutoBounty or _G.AutoAllBoss or _G.Auto_Bounty or _G.AutoSharkman or _G.Auto_Mastery_Fruit or _G.Auto_Mastery_Gun or _G.Auto_Dungeon or _G.Auto_Cavender or _G.Auto_Pole or _G.Auto_Kill_Ply or _G.Auto_Factory or _G.AutoSecondSea or _G.TeleportPly or _G.AutoBartilo or _G.Auto_DarkBoss or _G.GrabChest or _G.AutoFarmBounty or _G.Holy_Torch or _G.AutoFarm or _G.Clip or FarmBoss or _G.AutoElitehunter or _G.AutoThirdSea or _G.Auto_Bone or _G.Autoheart or _G.Autodoughking or _G.AutoFarmMaterial or _G.AutoNevaSoulGuitar or _G.Auto_Dragon_Trident or _G.Autotushita or _G.d or _G.Autowaden or _G.Autogay or _G.Autopole or _G.Autosaw or _G.AutoObservationHakiV2 or _G.AutoFarmNearest or AutoFarmChest or _G.AutoCarvender or _G.AutoTwinHook or AutoMobAura or _G.Tweenfruit or _G.TeleportNPC or _G.Leather or _G.Auto_Wing or _G.Umm or _G.Makori_gay or Radioactive or Fish or Gunpowder or Dragon_Scale or Cocoafarm or Scrap or MiniHee or _G.AutoFarmSeabaest or Auto_Cursed_Dual_Katana or _G.AutoFarmMob or _G.AutoMysticIsland or _G.AutoFarmDungeon or _G.AutoRaidPirate or _G.AutoQuestRace or _G.TweenMGear or getgenv().AutoFarm or _G.AutoPlayerHunter or _G.AutoFactory or Grab_Chest or _G.Namfon or _G.AutoSwordMastery or _G.Auto_Seabest or _G.AutoSeaBest or _G.AutoKillTial or _G.Auto_Saber or _G.Position_Spawn or _G.Farmfast or _G.AutoRace or _G.RaidPirate or Open_Color_Haki or _G.AutoTerrorshark or FarmShark or _G.farmpiranya or _G.Fish_Crew_Member or _G.AppleAutoDriveBoat or _G.bjirFishBoat or _G.KillGhostShip or _G.AutoFrozenDimension or _G.AutoFKitsune or _G.ATFMirage == true then
                    if not game:GetService("Players").LocalPlayer.Character.HumanoidRootPart:FindFirstChild("BodyClip") then
                        local Noclip = Instance.new("BodyVelocity")
                        Noclip.Name = "BodyClip"
                        Noclip.Parent = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart
                        Noclip.MaxForce = Vector3.new(100000,100000,100000)
                        Noclip.Velocity = Vector3.new(0,0,0)
                    end
                end
            end
        end)
    end)
    
    spawn(function()
        pcall(function()
            game:GetService("RunService").Stepped:Connect(function()
                if _G.AutoAdvanceDungeon or _G.AutoDoughtBoss or _G.Auto_DungeonMobAura or _G.AutoFarmChest or _G.AutoFactory or _G.AutoFarmBossHallow or _G.AutoFarmSwanGlasses or _G.AutoLongSword or _G.AutoBlackSpikeycoat or _G.AutoElectricClaw or _G.AutoFarmGunMastery or _G.AutoHolyTorch or _G.AutoLawRaid or _G.AutoFarmBoss or _G.AutoTwinHooks or _G.AutoOpenSwanDoor or _G.AutoDragon_Trident or _G.AutoSaber or _G.NOCLIP or _G.AutoFarmFruitMastery or _G.AutoFarmGunMastery or _G.TeleportIsland or _G.Auto_EvoRace or _G.AutoFarmAllMsBypassType or _G.AutoObservationv2 or _G.AutoMusketeerHat or _G.AutoEctoplasm or _G.AutoRengoku or _G.Auto_Rainbow_Haki or _G.AutoObservation or _G.AutoDarkDagger or _G.Safe_Mode or _G.MasteryFruit or _G.AutoBudySword or _G.AutoOderSword or _G.AutoBounty or _G.AutoAllBoss or _G.Auto_Bounty or _G.AutoSharkman or _G.Auto_Mastery_Fruit or _G.Auto_Mastery_Gun or _G.Auto_Dungeon or _G.Auto_Cavender or _G.Auto_Pole or _G.Auto_Kill_Ply or _G.Auto_Factory or _G.AutoSecondSea or _G.TeleportPly or _G.AutoBartilo or _G.Auto_DarkBoss or _G.GrabChest or _G.AutoFarmBounty or _G.Holy_Torch or _G.AutoFarm or _G.Clip or _G.AutoElitehunter or _G.AutoThirdSea or _G.Auto_Bone or _G.Autoheart or _G.Autodoughking or _G.AutoFarmMaterial or _G.AutoNevaSoulGuitar or _G.Auto_Dragon_Trident or _G.Autotushita or _G.Autowaden or _G.Autogay or _G.Autopole or _G.Autosaw or _G.AutoObservationHakiV2 or _G.AutoFarmNearest or _G.AutoCarvender or _G.AutoTwinHook or AutoMobAura or _G.Tweenfruit or _G.TeleportNPC or _G.AutoKai or _G.Leather or _G.Auto_Wing or _G.Umm or _G.Makori_gay or Radioactive or Fish or Gunpowder or Dragon_Scale or Cocoafarm or Scrap or MiniHee or _G.AutoFarmSeabaest or Auto_Cursed_Dual_Katana or _G.AutoFarmMob or _G.AutoMysticIsland or _G.AutoFarmDungeon or _G.AutoRaidPirate or _G.AutoQuestRace or _G.TweenMGear or getgenv().AutoFarm or _G.AutoPlayerHunter or _G.AutoFactory or _G.Namfon or _G.AutoSwordMastery or _G.Auto_Seabest or _G.AutoSeaBest or _G.AutoKillTial or _G.Auto_Saber or _G.Position_Spawn or _G.TPB or _G.Farmfast or _G.AutoRace or _G.RaidPirate or Open_Color_Haki or _G.AutoTerrorshark or FarmShark or _G.farmpiranya or _G.Fish_Crew_Member or _G.AppleAutoDriveBoat or _G.AutoFrozenDimension or _G.AutoFKitsune or _G.ATFMirage == true then
                    for _, v in pairs(game:GetService("Players").LocalPlayer.Character:GetDescendants()) do
                        if v:IsA("BasePart") then
                            v.CanCollide = false    
                        end
                    end
                end
            end)
        end)
    end)
    
    spawn(function()
        pcall(function()
            while wait() do
                if _G.AutoAdvanceDungeon or _G.AutoDoughtBoss or _G.Auto_DungeonMobAura or _G.AutoFarmChest or _G.AutoFactory or _G.AutoFarmBossHallow or _G.AutoFarmSwanGlasses or _G.AutoLongSword or _G.AutoBlackSpikeycoat or _G.AutoElectricClaw or _G.AutoFarmGunMastery or _G.AutoHolyTorch or _G.AutoLawRaid or _G.AutoFarmBoss or _G.AutoTwinHooks or _G.AutoOpenSwanDoor or _G.AutoDragon_Trident or _G.AutoSaber or _G.AutoFarmFruitMastery or _G.AutoFarmGunMastery or _G.TeleportIsland or _G.Auto_EvoRace or _G.AutoFarmAllMsBypassType or _G.AutoObservationv2 or _G.AutoMusketeerHat or _G.AutoEctoplasm or _G.AutoRengoku or _G.Auto_Rainbow_Haki or _G.AutoObservation or _G.AutoDarkDagger or _G.Safe_Mode or _G.MasteryFruit or _G.AutoBudySword or _G.AutoOderSword or _G.AutoBounty or _G.AutoAllBoss or _G.Auto_Bounty or _G.AutoSharkman or _G.Auto_Mastery_Fruit or _G.Auto_Mastery_Gun or _G.Auto_Dungeon or _G.Auto_Cavender or _G.Auto_Pole or _G.Auto_Kill_Ply or _G.Auto_Factory or _G.AutoSecondSea or _G.TeleportPly or _G.AutoBartilo or _G.Auto_DarkBoss or _G.GrabChest or _G.AutoFarmBounty or _G.Holy_Torch or _G.AutoFarm or _G.Clip or FarmBoss or _G.AutoElitehunter or _G.AutoThirdSea or _G.Auto_Bone or _G.Autoheart or _G.Autodoughking or _G.AutoFarmMaterial or _G.AutoNevaSoulGuitar or _G.Auto_Dragon_Trident or _G.Autotushita or _G.d or _G.Autowaden or _G.Autogay or _G.Autopole or _G.Autosaw or _G.AutoObservationHakiV2 or _G.AutoFarmNearest or AutoFarmChest or _G.AutoCarvender or _G.AutoTwinHook or AutoMobAura or _G.Tweenfruit or _G.TeleportNPC or _G.Leather or _G.Auto_Wing or _G.Umm or _G.Makori_gay or Radioactive or Fish or Gunpowder or Dragon_Scale or Cocoafarm or Scrap or MiniHee or _G.AutoFarmSeabaest or Auto_Cursed_Dual_Katana or _G.AutoFarmMob or _G.AutoMysticIsland or _G.AutoFarmDungeon or _G.AutoRaidPirate or _G.AutoQuestRace or _G.TweenMGear or getgenv().AutoFarm or _G.AutoPlayerHunter or _G.AutoFactory or Grab_Chest or _G.Namfon or _G.AutoSwordMastery or _G.Auto_Seabest or _G.AutoSeaBest or _G.AutoKillTial or _G.Auto_Saber or _G.Position_Spawn or _G.Farmfast or _G.AutoRace or _G.RaidPirate or _G.AutoTushitaSword or Open_Color_Haki or _G.AutoTerrorshark or FarmShark or _G.farmpiranya or _G.Fish_Crew_Member or _G.AppleAutoDriveBoat or _G.bjirFishBoat or _G.KillGhostShip == true then
                    if not game.Players.LocalPlayer.Character:FindFirstChild("Highlight") then
	            		local Highlight = Instance.new("Highlight")
                    	Highlight.FillColor = Color3.new(0, 255, 0)
	            		Highlight.OutlineColor = Color3.new(0,255,0)
            			Highlight.Parent = game.Players.LocalPlayer.Character
                    end
                end
            end
        end)
    end)
    
    function InstancePos(pos)
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = pos
    end
    
    function TP3(pos)
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = pos
    end
    
    spawn(function()
        while wait() do
            if _G.AutoDoughtBoss or _G.Auto_DungeonMobAura or _G.AutoFarmChest or _G.AutoFarmBossHallow or _G.AutoFactory or _G.AutoFarmSwanGlasses or _G.AutoLongSword or _G.AutoBlackSpikeycoat or _G.AutoElectricClaw or _G.AutoFarmGunMastery or _G.AutoHolyTorch or _G.AutoLawRaid or _G.AutoFarmBoss or _G.AutoTwinHooks or _G.AutoOpenSwanDoor or _G.AutoDragon_Trident or _G.AutoSaber or _G.NOCLIP or _G.AutoFarmFruitMastery or _G.AutoFarmGunMastery or _G.TeleportIsland or _G.Auto_EvoRace or _G.AutoFarmAllMsBypassType or _G.AutoObservationv2 or _G.AutoMusketeerHat or _G.AutoEctoplasm or _G.AutoRengoku or _G.Auto_Rainbow_Haki or _G.AutoObservation or _G.AutoDarkDagger or _G.Safe_Mode or _G.MasteryFruit or _G.AutoBudySword or _G.AutoOderSword or _G.AutoAllBoss or _G.Auto_Bounty or _G.AutoSharkman or _G.Auto_Mastery_Fruit or _G.Auto_Mastery_Gun or _G.Auto_Dungeon or _G.Auto_Cavender or _G.Auto_Pole or _G.Auto_Kill_Ply or _G.Auto_Factory or _G.AutoSecondSea or _G.TeleportPly or _G.AutoBartilo or _G.Auto_DarkBoss or _G.AutoFarm or _G.Clip or _G.AutoElitehunter or _G.AutoThirdSea or _G.Auto_Bone or _G.Autoheart or _G.Autodoughking or _G.d or _G.Autowaden or _G.Autogay or _G.AutoObservationHakiV2 or _G.AutoFarmMaterial or _G.AutoFarmNearest or _G.AutoCarvender or _G.AutoTwinHook or AutoMobAura or _G.Leather or _G.Auto_Wing or _G.Umm or _G.Makori_gay or Radioactive or Fish or Gunpowder or Dragon_Scale or Cocoafarm or Scrap or MiniHee or _G.AutoFarmSeabaest or Auto_Cursed_Dual_Katana or _G.AutoFarmMob or _G.AutoRaidPirate or getgenv().AutoFarm or _G.AutoPlayerHunter or _G.AutoFactory or _G.AttackDummy or _G.AutoSwordMastery or _G.Auto_Seabest or _G.AutoSeaBest or _G.AutoKillTial or _G.Auto_Saber or _G.Farmfast or _G.RaidPirate or _G.AutoTerrorshark or FarmShark or _G.farmpiranya or _G.Fish_Crew_Member or _G.bjirFishBoat or _G.KillGhostShip == true then
                pcall(function()
                    game:GetService("ReplicatedStorage").Remotes.CommE:FireServer("Ken",true)
                end)
            end    
        end
    end)
    
    spawn(function()
    game:GetService("RunService").RenderStepped:Connect(function()
        if _G.AutoClick or Fastattack then
             pcall(function()
                game:GetService'VirtualUser':CaptureController()
			    game:GetService'VirtualUser':Button1Down(Vector2.new(0,1,0,1))
            end)
        end
    end)
   end)

    function StopTween(target)
        if not target then
            _G.StopTween = true
            wait()
            topos(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame)
            wait()
            if game:GetService("Players").LocalPlayer.Character.HumanoidRootPart:FindFirstChild("BodyClip") then
                game:GetService("Players").LocalPlayer.Character.HumanoidRootPart:FindFirstChild("BodyClip"):Destroy()
            end
            _G.StopTween = false
            _G.Clip = false
        end
        if game.Players.LocalPlayer.Character:FindFirstChild('Highlight') then
    		game.Players.LocalPlayer.Character:FindFirstChild('Highlight'):Destroy()
        end
    end
    
    spawn(function()
        pcall(function()
            while wait() do
                for i,v in pairs(game:GetService("Players").LocalPlayer.Backpack:GetChildren()) do  
                    if v:IsA("Tool") then
                        if v:FindFirstChild("RemoteFunctionShoot") then 
                            SelectWeaponGun = v.Name
                        end
                    end
                end
            end
        end)
    end)
    
    game:GetService("Players").LocalPlayer.Idled:connect(function()
        game:GetService("VirtualUser"):Button2Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
        wait(1)
        game:GetService("VirtualUser"):Button2Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
    end)
--------------------------------------------------------------------------------------------------------


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
            if v.Character and v.Character:FindFirstChild("Head") then
                if ESPPlayer then
                    local teamName = v.Team and v.Team.Name or "No Team"
                    local head = v.Character.Head
                    local espName = 'NameEsp' .. Number

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
                            name.Text = ('<font color="rgb(0,0,0)">「 CITY 」</font>\n' .. v.Name .. ' | ' .. math.round((localPlayer.Character.Head.Position - v.Character.Head.Position).Magnitude / 3) .. ' Distance\nHealth: ' .. math.floor(v.Character.Humanoid.Health) .. "/" .. v.Character.Humanoid.MaxHealth .. '\n' .. '| TEAM:' .. '<font color="rgb(255,0,0)"> Pirate </font>' .. '|')
                        elseif teamName == "Marines" then
                            name.Text = ('<font color="rgb(0,0,0)">「 CITY 」</font>\n' .. v.Name .. ' | ' .. math.round((localPlayer.Character.Head.Position - v.Character.Head.Position).Magnitude / 3) .. ' Distance\nHealth: ' .. math.floor(v.Character.Humanoid.Health) .. "/" .. v.Character.Humanoid.MaxHealth .. '\n' .. '| TEAM:' .. '<font color="rgb(0,0,255)"> Marine </font>' .. '|')
                        else
                            name.Text = ('<font color="rgb(0,0,0)">「 CITY 」</font>\n' .. v.Name .. ' | ' .. math.round((localPlayer.Character.Head.Position - v.Character.Head.Position).Magnitude / 3) .. ' Distance\nHealth: ' .. math.floor(v.Character.Humanoid.Health) .. "/" .. v.Character.Humanoid.MaxHealth .. '\n' .. '| TEAM:' .. '<font color="rgb(1,1,1)"> Error </font>' .. '|')
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
                if DevilFruitESP and string.find(v.Name, "Fruit") then
                    local fruitName = v.Name
                    if fruitName == "" or not fruitName then
                        fruitName = "(Unknown Fruit)"
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
                    name.Text = fruitName .. ' \n' .. math.round((game.Players.LocalPlayer.Character.Head.Position - handle.Position).Magnitude / 3) .. ' Distance'
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
        end
        
        local function skmelee_z(holdTime_z)
            EquipWeapon(_G.SelectMel)
            wait(0.1)
            
            game:service('VirtualInputManager'):SendKeyEvent(true, "Z", false, game)
            if holdTime_z then
                wait(holdTime_z)
            end
            game:service('VirtualInputManager'):SendKeyEvent(false, "Z", false, game)
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
spawn(function()
    game:GetService("RunService").RenderStepped:Connect(function()
        if _G.AutoClick or Fastattack then
             pcall(function()
                game:GetService'VirtualUser':CaptureController()
			    game:GetService'VirtualUser':Button1Down(Vector2.new(0,1,0,1))
            end)
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

INFOPLY:AddParagraph("Read me","The script did not work well if you had a lag or high ping, which would cause a delay in performance")



local CBTAP = Window:MakeTab({
	Name = "PLAYER",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

local Playerslist = {}

local function refreshPlayersList()
    Playerslist = {}
    for i, v in pairs(game:GetService("Players"):GetPlayers()) do
        table.insert(Playerslist, v.Name)
    end
end

-- 

local SelectedPly = CBTAP:AddDropdown({
    Name = "SELECT PLAYER",
    Default = Playerslist[1],  -- Assuming Playerslist is not empty initially
    Options = Playerslist,
    Callback = function(Value)
        _G.SelectPly = Value
    end
})

-- Button to refresh the player list
CBTAP:AddButton({
    Name = "REFRESH",
    Callback = function()
        refreshPlayersList()
        SelectedPly:Refresh(Playerslist, true)
    end
})


CBTAP:AddToggle({
	Name = "TP PLAYER",
	Default = false,
	Callback = function(Value)
		_G.TeleportPly = Value
        pcall(function()
            if _G.TeleportPly then
                repeat topos(game:GetService("Players")[_G.SelectPly].Character.HumanoidRootPart.CFrame) wait() until _G.TeleportPly == false
            end
            StopTween(_G.TeleportPly)
        end)
	end    
})


-------++----++----+-++++-----------------




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
	Default = false,
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
CBTAP:AddParagraph("How To Make Combo Text","fruit.(z,x,c,v)\nsword.(z,x)\ngun.(z,x)\nmelee.(z,x,c)\nComma : &\nHold Example : sword.x.hold(99)\n wait : wait(99)")
CBTAP:AddParagraph("Example","fruit.z&wait(0.5)&sword.z.hold(1)&wait(01)&sword.x&wait(0.5)&melee.c&wait(1.5)&melee.z&wait(2)&melee.x")


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

MISCTAP:AddButton({
	Name = "TELEPORT TOOL",
	Callback = function()
local plr = game:GetService("Players").LocalPlayer
local mouse = plr:GetMouse()
local tool = Instance.new("Tool")
tool.RequiresHandle = false
tool.Name = "Teleport Tool"
tool.Activated:Connect(function()
local root = plr.Character.HumanoidRootPart
local pos = mouse.Hit.Position+Vector3.new(0,2.5,0)
local offset = pos-root.Position
root.CFrame = root.CFrame+offset
end)
tool.Parent = plr.Backpack
    end
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
	Name = "AUTO CLICK",
	Default = false,
	Callback = function(Value)
		_G.AutoClick = Value
	end    
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
	Default = true,
	Callback = function(Value)
local SuperFastMode = Value -- à¹€à¸›à¸¥à¸µà¹ˆà¸¢à¸™à¹€à¸›à¹‡à¸™à¸ˆà¸£à¸´à¸‡à¸–à¹‰à¸²à¸„à¸¸à¸“à¸•à¹‰à¸­à¸‡à¸à¸²à¸£à¹‚à¸ˆà¸¡à¸•à¸µ Super Super Super Fast (à¹€à¸Šà¹ˆà¸™à¸à¸²à¸£à¸†à¹ˆà¸²à¸—à¸±à¸™à¸—à¸µ) à¹à¸•à¹ˆà¸ˆà¸°à¸—à¸³à¹ƒà¸«à¹‰à¹€à¸à¸¡à¹€à¸•à¸°à¸„à¸¸à¸“à¸¡à¸²à¸à¸à¸§à¹ˆà¸²à¹‚à¸«à¸¡à¸”à¸›à¸à¸•à¸´
                 _G.SuperFastMode = Value
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





-------------------------------
