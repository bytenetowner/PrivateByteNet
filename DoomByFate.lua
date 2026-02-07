local repo = "https://raw.githubusercontent.com/deividcomsono/Obsidian/main/"
local Library = loadstring(game:HttpGet(repo .. "Library.lua"))()
local ThemeManager = loadstring(game:HttpGet(repo .. "addons/ThemeManager.lua"))()
local SaveManager = loadstring(game:HttpGet(repo .. "addons/SaveManager.lua"))()

local Options = Library.Options
local Toggles = Library.Toggles

Library.ForceCheckbox = false
Library.ShowToggleFrameInKeybinds = true

local Window = Library:CreateWindow({
    Title = "sharedbyte's Hub",
    Footer = "v2.5",
    Icon = 95816097006870,
    NotifySide = "Right",
	ShowCustomCursor = false,
})

GenTab = Window:AddTab("Generators", "tower-control")

local UsageBox = GenTab:AddLeftGroupbox("Generators", "battery-charging")

local GenSettingsBox = GenTab:AddRightGroupbox("Settings", "file-cog")

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")

local LocalPlayer = Players.LocalPlayer
local PlayerGui = LocalPlayer:WaitForChild("PlayerGui")

local SolveDelaySlider = GenSettingsBox:AddSlider("SolveDelay", {
	Text = "Solve Delay",
	Default = 7.5,
	Min = 0,
	Max = 15,
	Rounding = 1,
})

local RandomizationSlider = GenSettingsBox:AddSlider("Randomization", {
	Text = "Randomization",
	Default = 0.5,
	Min = 0,
	Max = 5,
	Rounding = 2,
})

local AutoPuzzleEnabled = false
local ActivePuzzles = {}

local function SolvePuzzle(Puzzle)
	local Range = RandomizationSlider.Value
	local RandomOffset = math.random(-Range * 10, Range * 10) / 10
	local FinalDelay = math.max(0, SolveDelaySlider.Value + RandomOffset)
	
	local StartTime = tick()
	local Connection
	
	Connection = RunService.Heartbeat:Connect(function()
		if not AutoPuzzleEnabled or not Puzzle:IsDescendantOf(PlayerGui) then
			Connection:Disconnect()
			ActivePuzzles[Puzzle] = nil
			return
		end
		
		if tick() - StartTime >= FinalDelay then
			local Event = Puzzle:FindFirstChild("Event")
			if Event then
				Event:Fire(true)
			end
			Connection:Disconnect()
			ActivePuzzles[Puzzle] = nil
		end
	end)
	
	ActivePuzzles[Puzzle] = Connection
end

local function OnChildAdded(Child)
	if AutoPuzzleEnabled and Child.Name == "generatorpuzzle" and not ActivePuzzles[Child] then
		SolvePuzzle(Child)
	end
end

local EnabledGenSolving = UsageBox:AddToggle("AutoGenMinigame", {
	Text = "Auto Puzzle",
	Default = false,
	Callback = function(State)
		AutoPuzzleEnabled = State
		if State then
			for _, Child in ipairs(PlayerGui:GetChildren()) do
				OnChildAdded(Child)
			end
		end
	end,
})

PlayerGui.ChildAdded:Connect(OnChildAdded)

VisualsTab = Window:AddTab("Visuals", "lightbulb")

local ESPBox = VisualsTab:AddLeftGroupbox("ESP n Stuff", "siren")

local players = game:GetService("Players")
local runservice = game:GetService("RunService")
local camera = workspace.CurrentCamera
local survivors = workspace:WaitForChild("survivors")

local localplayer = players.LocalPlayer
local esp = {}
local connection

local function createesp(player)
	if player == localplayer or esp[player] then return end

	local name = Drawing.new("Text")
	name.Center = true
	name.Outline = true
	name.Size = 12
	name.Visible = false

	local disttext = Drawing.new("Text")
	disttext.Center = true
	disttext.Outline = true
	disttext.Size = 12
	disttext.Visible = false

	local corners = {}
	for i = 1, 8 do
		local line = Drawing.new("Line")
		line.Thickness = 1
		line.Visible = false
		corners[i] = line
	end

	local healthbar = Drawing.new("Line")
	healthbar.Thickness = 1.5
	healthbar.Visible = false

	esp[player] = {
		name = name,
		distance = disttext,
		corners = corners,
		healthbar = healthbar
	}
end

local function removeesp(player)
	if not esp[player] then return end
	esp[player].name:Remove()
	esp[player].distance:Remove()
	esp[player].healthbar:Remove()
	for _, c in ipairs(esp[player].corners) do c:Remove() end
	esp[player] = nil
end

local function updatevisibility(data, state)
	data.name.Visible = state
	data.distance.Visible = state
	data.healthbar.Visible = state
	for _, c in ipairs(data.corners) do c.Visible = state end
end

players.PlayerAdded:Connect(function(player)
	if player ~= localplayer then createesp(player) end
end)

players.PlayerRemoving:Connect(removeesp)

for _, p in ipairs(players:GetPlayers()) do
	if p ~= localplayer then createesp(p) end
end

local function startesp()
	if connection then connection:Disconnect() end
	connection = runservice.RenderStepped:Connect(function()
		for _, player in ipairs(players:GetPlayers()) do
			local data = esp[player]
			if data then
				local char = player.Character
				local hum = char and char:FindFirstChild("Humanoid")
				local hrp = char and char:FindFirstChild("HumanoidRootPart")

				if char and hum and hrp then
					local pos, onscreen = camera:WorldToViewportPoint(hrp.Position)
					local mag = (camera.CFrame.Position - hrp.Position).Magnitude

					if onscreen and mag <= 2000 then
						local color = survivors:FindFirstChild(player.Name) and Color3.fromRGB(0, 255, 0) or Color3.fromRGB(255, 0, 0)
						local size = math.clamp(3000 / mag, 20, 300)
						local w, h = size, size * 1.8
						local topleft = Vector2.new(pos.X - w / 2, pos.Y - h / 2)
						local topright = Vector2.new(pos.X + w / 2, pos.Y - h / 2)
						local bottomleft = Vector2.new(pos.X - w / 2, pos.Y + h / 2)
						local bottomright = Vector2.new(pos.X + w / 2, pos.Y + h / 2)
						local len = w * 0.25

						local c = data.corners
						c[1].From = topleft; c[1].To = topleft + Vector2.new(len, 0)
						c[2].From = topleft; c[2].To = topleft + Vector2.new(0, len)
						c[3].From = topright; c[3].To = topright - Vector2.new(len, 0)
						c[4].From = topright; c[4].To = topright + Vector2.new(0, len)
						c[5].From = bottomleft; c[5].To = bottomleft + Vector2.new(len, 0)
						c[6].From = bottomleft; c[6].To = bottomleft + Vector2.new(0, -len)
						c[7].From = bottomright; c[7].To = bottomright - Vector2.new(len, 0)
						c[8].From = bottomright; c[8].To = bottomright - Vector2.new(0, -len)

						for _, ln in ipairs(c) do
							ln.Color = color
							ln.Visible = true
						end

						local hppercent = hum.Health / hum.MaxHealth
						data.healthbar.From = bottomleft + Vector2.new(-6, 0)
						data.healthbar.To = bottomleft + Vector2.new(-6, -h * hppercent)
						data.healthbar.Color = hum.Health <= (hum.MaxHealth / 2) and Color3.fromRGB(255, 0, 0) or Color3.fromRGB(0, 255, 0)
						data.healthbar.Visible = true

						data.name.Text = player.DisplayName
						data.name.Position = Vector2.new(pos.X, topleft.Y - 16)
						data.name.Color = color
						data.name.Visible = true

						data.distance.Text = math.floor(mag) .. "m"
						data.distance.Position = Vector2.new(pos.X, bottomleft.Y + 5)
						data.distance.Color = color
						data.distance.Visible = true
					else
						updatevisibility(data, false)
					end
				else
					updatevisibility(data, false)
				end
			end
		end
	end)
end

local function stopesp()
	if connection then connection:Disconnect() connection = nil end
	for _, data in pairs(esp) do updatevisibility(data, false) end
end

ESPBox:AddToggle("PlayersESP", {
	Text = "Players",
	Default = false,
	Callback = function(state)
		if state then startesp() else stopesp() end
	end,
})

local replicatedstorage = game:GetService("ReplicatedStorage")
local workspace = game:GetService("Workspace")

local map = workspace:WaitForChild("map")
local selfembodiment = replicatedstorage:FindFirstChild("selfembodiment") or Instance.new("Folder")
selfembodiment.Name = "selfembodiment"
selfembodiment.Parent = replicatedstorage

local connections = {}

local function create_visual_assets()
	if not selfembodiment:FindFirstChild("generatorhighlight") then
		local highlight = Instance.new("Highlight")
		highlight.Name = "generatorhighlight"
		highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
		highlight.Enabled = true
		highlight.FillColor = Color3.fromRGB(123, 255, 80)
		highlight.FillTransparency = 0.5
		highlight.OutlineColor = Color3.fromRGB(255, 255, 255)
		highlight.OutlineTransparency = 0.541
		highlight.Archivable = true
		highlight.Parent = selfembodiment
	end

	if not selfembodiment:FindFirstChild("genbillboard") then
		local source = replicatedstorage:WaitForChild("resources"):WaitForChild("peekbillboard")
		local billboard = source:Clone()
		billboard.Name = "genbillboard"
		billboard.Parent = selfembodiment
		local eye = billboard:WaitForChild("Frame"):WaitForChild("eye")
		eye.ImageColor3 = Color3.fromRGB(153, 255, 89)
	end
end

local function remove_generator_visuals(generator)
	local highlight = generator:FindFirstChild("generatorhighlight")
	if highlight then
		highlight:Destroy()
	end

	local model = generator:FindFirstChild("model")
	if model then
		local billboard = model:FindFirstChild("genbillboard")
		if billboard then
			billboard:Destroy()
		end
	end
end

local function watch_generator_progress(generator)
	local progress = generator:FindFirstChild("progress")
	if not progress then return end

	local label = progress:FindFirstChild("TextLabel")
	if not label or not label:IsA("TextLabel") then return end

	local conn = label:GetPropertyChangedSignal("Text"):Connect(function()
		if label.Text == "4/4" then
			remove_generator_visuals(generator)
		end
	end)

	table.insert(connections, conn)

	if label.Text == "4/4" then
		remove_generator_visuals(generator)
	end
end

local function decorate_generator(generator)
	local model = generator:FindFirstChild("model")
	if model then
		local billboard = selfembodiment:FindFirstChild("genbillboard")
		if billboard then
			billboard:Clone().Parent = model
		end
	end

	local highlight = selfembodiment:FindFirstChild("generatorhighlight")
	if highlight then
		highlight:Clone().Parent = generator
	end

	watch_generator_progress(generator)
end

local function enable_generator_visuals()
	create_visual_assets()

	for _, obj in ipairs(map:GetDescendants()) do
		if obj.Name == "template_generator" then
			decorate_generator(obj)
		end
	end

	local conn = map.DescendantAdded:Connect(function(descendant)
		if descendant:IsDescendantOf(map) and descendant.Name == "template_generator" then
			decorate_generator(descendant)
		end
	end)

	table.insert(connections, conn)
end

local function disable_generator_visuals()
	for _, conn in ipairs(connections) do
		if typeof(conn) == "RBXScriptConnection" then
			conn:Disconnect()
		end
	end

	table.clear(connections)

	for _, obj in ipairs(map:GetDescendants()) do
		if obj.Name == "template_generator" then
			remove_generator_visuals(obj)
		end
	end
end

local GenESP = ESPBox:AddToggle("GenESP", {
	Text = "Generators",
	Default = false,
	Callback = function(state)
		if state then
			enable_generator_visuals()
		else
			disable_generator_visuals()
		end
	end,
})

local EffectsBox = VisualsTab:AddRightGroupbox("Effects", "zap")

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")

local LocalPlayer = Players.LocalPlayer

local HigherSightEnabled = false
local TargetZoom = 27
local DefaultMax = 10
local ConstantMin = 0.5

local function MaintainZoom()
    local CurrentMax = HigherSightEnabled and TargetZoom or DefaultMax
    
    if LocalPlayer.CameraMaxZoomDistance ~= CurrentMax then
        LocalPlayer.CameraMaxZoomDistance = CurrentMax
    end
    
    if LocalPlayer.CameraMinZoomDistance ~= ConstantMin then
        LocalPlayer.CameraMinZoomDistance = ConstantMin
    end
end

RunService.RenderStepped:Connect(MaintainZoom)

local HigherSightToggle = EffectsBox:AddToggle("HigherSightOption", {
    Text = "Higher Sight View",
    Default = false,
    Callback = function(State)
        HigherSightEnabled = State
    end,
})

PlayerTab = Window:AddTab("Player", "users")

local PlayerBox = PlayerTab:AddLeftGroupbox("Main", "user-round-cog")

local AutoBlockBox = PlayerTab:AddLeftGroupbox("Defense", "shield-alert")

local AimbotBox = PlayerTab:AddRightGroupbox("Aimbot", "crosshair")

local PlayerRageBox = PlayerTab:AddRightGroupbox("Rage", "angry")

local Players=game:GetService("Players")
local UserInputService=game:GetService("UserInputService")
local RunService=game:GetService("RunService")

local player=Players.LocalPlayer
local normalSpeed=16
local survivorSprintSpeed=36.8
local killerSprintSpeed=38
local sprintSpeed=0
local sprinting=false
local canSprint=false
local overrideActive=false
local humanoid
local toggleEnabled=false

local function setupCharacter(char)
    humanoid=char:WaitForChild("Humanoid")
    humanoid.WalkSpeed=normalSpeed
end

local function updateSprintSpeed(char)
    if overrideActive or not toggleEnabled then return end
    if char.Parent==workspace.survivors then
        sprintSpeed=survivorSprintSpeed
        canSprint=true
    elseif char.Parent==workspace.killers then
        sprintSpeed=killerSprintSpeed
        canSprint=true
    else
        sprintSpeed=normalSpeed
        canSprint=false
    end
end

player.CharacterAdded:Connect(setupCharacter)
if player.Character then setupCharacter(player.Character) end

UserInputService.InputBegan:Connect(function(i,p)
    if p or not toggleEnabled then return end
    if i.KeyCode==Enum.KeyCode.LeftShift and canSprint and humanoid and not overrideActive then
        sprinting=true
        humanoid.WalkSpeed=sprintSpeed
    end
end)

UserInputService.InputEnded:Connect(function(i)
    if not toggleEnabled then return end
    if i.KeyCode==Enum.KeyCode.LeftShift and humanoid then
        sprinting=false
        if not overrideActive then humanoid.WalkSpeed=normalSpeed end
    end
end)

RunService.RenderStepped:Connect(function()
    if not humanoid or not toggleEnabled then return end
    if humanoid.WalkSpeed>killerSprintSpeed or humanoid.WalkSpeed<normalSpeed then
        overrideActive=true
        return
    elseif overrideActive then
        overrideActive=false
    end
    updateSprintSpeed(humanoid.Parent)
    if sprinting and canSprint then
        humanoid.WalkSpeed=sprintSpeed
    else
        humanoid.WalkSpeed=normalSpeed
    end
end)

local InfStam=PlayerBox:AddToggle("InfStam",{
    Text="Infinite Stamina",
    Default=false,
    Callback=function(v) toggleEnabled=v end
})

local WalkSlider=PlayerBox:AddSlider("WalkSpeedSlider",{
    Text="Walk Speed",
    Default=16,
    Min=16,
    Max=50,
    Rounding=1,
    Callback=function(v)
        normalSpeed=v
        if humanoid then humanoid.WalkSpeed=normalSpeed end
    end
})

local SurvivorSprintSlider=PlayerBox:AddSlider("SurvivorSprintSlider",{
    Text="Survivor Sprint Speed",
    Default=36.8,
    Min=35,
    Max=60,
    Rounding=1,
    Callback=function(v) survivorSprintSpeed=v end
})

local KillerSprintSlider=PlayerBox:AddSlider("KillerSprintSlider",{
    Text="Killer Sprint Speed",
    Default=38,
    Min=38,
    Max=60,
    Rounding=1,
    Callback=function(v) killerSprintSpeed=v end
})

local players = game:GetService("Players")
local runservice = game:GetService("RunService")
local replicatedstorage = game:GetService("ReplicatedStorage")
local workspace = game:GetService("Workspace")
local userinputservice = game:GetService("UserInputService")

local localplayer = players.LocalPlayer
local camera = workspace.CurrentCamera
local renderconnection
local characterconnection
local inputconnection

local keywords = {"liverblow", "corrodedwave", "slash", "spear", "shotgun", "syringe", "flloop", "m1", "m1-1", "m1-2", "m2", "sand", "m11", "m12", "m13", "grab"}
local keywordids = {}
local locktarget = nil
local islockonactive = false
local togglestate = false

local function collectids(folder)
	for _, child in ipairs(folder:GetChildren()) do
		if child:IsA("Animation") then
			local name = child.Name:lower()
			for _, key in ipairs(keywords) do
				if name == key then
					table.insert(keywordids, child.AnimationId)
				end
			end
		end
		if #child:GetChildren() > 0 then
			collectids(child)
		end
	end
end

collectids(replicatedstorage)

local function getnearesttarget(origin)
	local hrp = origin:FindFirstChild("HumanoidRootPart")
	if not hrp then return nil end
	local survivors = workspace:FindFirstChild("survivors")
	local killers = workspace:FindFirstChild("killers")
	if not survivors or not killers then return nil end

	local targetcontainer = origin:IsDescendantOf(survivors) and killers or survivors
	local closest, shortest = nil, math.huge
	for _, target in ipairs(targetcontainer:GetChildren()) do
		local thrp = target:FindFirstChild("HumanoidRootPart")
		local health = target:FindFirstChildOfClass("Humanoid")
		if thrp and health and health.Health > 0 then
			local distance = (thrp.Position - hrp.Position).Magnitude
			if distance < shortest then
				shortest = distance
				closest = target
			end
		end
	end
	return closest
end

local function isattackplaying(humanoid)
	for _, track in ipairs(humanoid:GetPlayingAnimationTracks()) do
		for _, id in ipairs(keywordids) do
			if track.Animation.AnimationId == id then
				return true
			end
		end
	end
	return false
end

local function updatecamera(character)
	if not character or not character.Parent then return end
	local humanoid = character:FindFirstChildOfClass("Humanoid")
	if not humanoid then return end

	local target = nil

	if islockonactive and locktarget and locktarget.Parent and locktarget:FindFirstChild("Humanoid") and locktarget.Humanoid.Health > 0 then
		target = locktarget
	elseif isattackplaying(humanoid) then
		target = getnearesttarget(character)
	end

	if target then
		local thrp = target:FindFirstChild("HumanoidRootPart")
		if thrp then
			camera.CFrame = CFrame.lookAt(camera.CFrame.Position, thrp.Position)
		end
	end
end

local function handleinput(input, processed)
	if processed or not togglestate then return end
	if input.KeyCode == Enum.KeyCode.Z then
		local char = localplayer.Character
		if char and char:IsDescendantOf(workspace:FindFirstChild("killers")) then
			islockonactive = not islockonactive
			if islockonactive then
				locktarget = getnearesttarget(char)
				if not locktarget then islockonactive = false end
			else
				locktarget = nil
			end
		end
	end
end

local function startsystem(character)
	if renderconnection then renderconnection:Disconnect() end
	renderconnection = runservice.RenderStepped:Connect(function()
		updatecamera(character)
	end)
end

local function stopsystem()
	if renderconnection then renderconnection:Disconnect() renderconnection = nil end
	if characterconnection then characterconnection:Disconnect() characterconnection = nil end
	if inputconnection then inputconnection:Disconnect() inputconnection = nil end
	islockonactive = false
	locktarget = nil
end

AimbotBox:AddToggle("camrotate", {
	Text = "Survivor & Killer",
	Default = false,
	Callback = function(state)
		togglestate = state
		if state then
			if localplayer.Character then startsystem(localplayer.Character) end
			characterconnection = localplayer.CharacterAdded:Connect(startsystem)
			inputconnection = userinputservice.InputBegan:Connect(handleinput)
		else
			stopsystem()
		end
	end,
})

local players = game:GetService("Players")
local runservice = game:GetService("RunService")
local replicatedstorage = game:GetService("ReplicatedStorage")

local localplayer = players.LocalPlayer
local sounds = {"m11","m1s","m12","fist swing","kagune swing"}
local detected = {}

local sounddetect_connection
local shared_value = 0.6
local distance_value = 17
local facecheck_enabled = true

local function trigger_skill_cast()
    local args = {
        buffer.fromstring("\018\006\000skille\001\001"),
        { {} }
    }
    replicatedstorage:WaitForChild("ByteNetReliable"):FireServer(unpack(args))
end

local function strict_face_check(myhrp, targethrp, threshold)
    if not facecheck_enabled then
        return true
    end
    local dir_to_me = (myhrp.Position - targethrp.Position).Unit
    local look = targethrp.CFrame.LookVector.Unit
    return look:Dot(dir_to_me) > threshold
end

local function run_sound_detection()
    local mychar = localplayer.Character
    if not mychar or not mychar:FindFirstChild("HumanoidRootPart") then return end
    local myhrp = mychar.HumanoidRootPart
    local mypos = myhrp.Position
    for _, player in ipairs(players:GetPlayers()) do
        if player ~= localplayer and player.Character then
            local hrp = player.Character:FindFirstChild("HumanoidRootPart")
            if hrp then
                for _, sound in ipairs(hrp:GetChildren()) do
                    if sound:IsA("Sound") then
                        for _, k in ipairs(sounds) do
                            if sound.Name:lower() == k and sound.IsPlaying then
                                if not detected[sound] then
                                    detected[sound] = true
                                    sound.Stopped:Connect(function()
                                        detected[sound] = nil
                                    end)
                                    task.delay(shared_value, function()
                                        if sound.IsPlaying and (hrp.Position - mypos).Magnitude <= distance_value and strict_face_check(myhrp, hrp, shared_value) then
                                            trigger_skill_cast()
                                        end
                                    end)
                                end
                            end
                        end
                    end
                end
            end
        end
    end
end

local sounddetect_toggle = AutoBlockBox:AddToggle("sounddetect_toggle", {
    Text = "Survivor Autoblock",
    Default = false,
    Callback = function(state)
        if state then
            if not sounddetect_connection then
                sounddetect_connection = runservice.RenderStepped:Connect(run_sound_detection)
            end
        else
            if sounddetect_connection then
                sounddetect_connection:Disconnect()
                sounddetect_connection = nil
            end
        end
    end
})

local sharedslider = AutoBlockBox:AddSlider("shared_delay", {
    Text = "Face-Check & Block Delay",
    Default = 0.06,
    Min = 0,
    Max = 0.1,
    Rounding = 3,
    Callback = function(val)
        shared_value = val
    end
})

local distanceslider = AutoBlockBox:AddSlider("distance_slider", {
    Text = "Block Distance",
    Default = 17,
    Min = 5,
    Max = 50,
    Rounding = 0,
    Callback = function(val)
        distance_value = val
    end
})

local facecheck_toggle = AutoBlockBox:AddCheckbox("facecheck_toggle", {
    Text = "Face Check",
    Default = true,
    Callback = function(state)
        facecheck_enabled = state
    end
})

local Plr = game.Players.LocalPlayer

local function SetupFakePosition(Char)
    local Hrp = Char:WaitForChild("HumanoidRootPart")

    local FakeRoot = Instance.new("Part")
    FakeRoot.Size = Hrp.Size
    FakeRoot.CFrame = Hrp.CFrame * CFrame.new(0,0,10)
    FakeRoot.Transparency = 1
    FakeRoot.CanCollide = false
    FakeRoot.Anchored = true
    FakeRoot.Name = "FakeRoot"
    FakeRoot.Parent = Char

    local Attachment1 = Instance.new("Attachment", Hrp)
    local Attachment2 = Instance.new("Attachment", FakeRoot)

    local AlignPos = Instance.new("AlignPosition")
    AlignPos.Attachment0 = Attachment1
    AlignPos.Attachment1 = Attachment2
    AlignPos.RigidityEnabled = false
    AlignPos.MaxForce = math.huge
    AlignPos.Responsiveness = 200
    AlignPos.Parent = Hrp
end

PlayerRageBox:AddButton({
    Text = "Fake Position",
    Func = function()
        local Char = Plr.Character
        if Char then
            SetupFakePosition(Char)
        end
    end
})

local Tabs = {
	["UI Settings"] = Window:AddTab("Settings", "folder-cog"),
}

local MenuGroup = Tabs["UI Settings"]:AddLeftGroupbox("Menu", "wrench")

MenuGroup:AddToggle("KeybindMenuOpen", {
	Default = Library.KeybindFrame.Visible,
	Text = "Open Keybind Menu",
	Callback = function(value)
		Library.KeybindFrame.Visible = value
	end,
})

MenuGroup:AddToggle("ShowCustomCursor", {
	Text = "Custom Cursor",
	Default = true,
	Callback = function(Value)
		Library.ShowCustomCursor = Value
	end,
})

MenuGroup:AddDropdown("NotificationSide", {
	Values = { "Left", "Right" },
	Default = "Right",
	Text = "Notification Side",
	Callback = function(Value)
		Library:SetNotifySide(Value)
	end,
})

MenuGroup:AddDropdown("DPIDropdown", {
	Values = { "50%", "75%", "100%", "125%", "150%", "175%", "200%" },
	Default = "100%",
	Text = "DPI Scale",
	Callback = function(Value)
		Value = Value:gsub("%%", "")
		local DPI = tonumber(Value)
		Library:SetDPIScale(DPI)
	end,
})

MenuGroup:AddDivider()
MenuGroup:AddLabel("Menu bind")
	:AddKeyPicker("MenuKeybind", { Default = "RightAlt", NoUI = true, Text = "Menu keybind" })

MenuGroup:AddButton("Unload", function()
	Library:Unload()
end)

Library.ToggleKeybind = Options.MenuKeybind

ThemeManager:SetLibrary(Library)
SaveManager:SetLibrary(Library)

SaveManager:IgnoreThemeSettings()
SaveManager:SetIgnoreIndexes({ "MenuKeybind" })

ThemeManager:SetFolder("ScrewedByFate/Themes")
SaveManager:SetFolder("ScrewedByFate/Configs")

SaveManager:BuildConfigSection(Tabs["UI Settings"])
ThemeManager:ApplyToTab(Tabs["UI Settings"])
SaveManager:LoadAutoloadConfig()
