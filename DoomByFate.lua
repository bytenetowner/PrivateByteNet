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

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local Camera = workspace.CurrentCamera
local survivors = workspace:WaitForChild("survivors")

local LocalPlayer = Players.LocalPlayer
local ESP = {}
local connection

local function createESP(player)
    if player == LocalPlayer then return end
    if ESP[player] then return end

    local name = Drawing.new("Text")
    name.Center = true
    name.Outline = true
    name.Size = 16
    name.Visible = false

    local distText = Drawing.new("Text")
    distText.Center = true
    distText.Outline = true
    distText.Size = 16
    distText.Visible = false

    local corners = {}
    for i = 1, 8 do
        local line = Drawing.new("Line")
        line.Thickness = 1
        line.Visible = false
        corners[i] = line
    end

    local healthBar = Drawing.new("Line")
    healthBar.Thickness = 1
    healthBar.Visible = false

    ESP[player] = {
        Name = name,
        Distance = distText,
        Corners = corners,
        HealthBar = healthBar
    }
end

local function removeESP(player)
    if not ESP[player] then return end
    ESP[player].Name:Remove()
    ESP[player].Distance:Remove()
    ESP[player].HealthBar:Remove()
    for _, c in ipairs(ESP[player].Corners) do c:Remove() end
    ESP[player] = nil
end

Players.PlayerAdded:Connect(function(player)
    if player ~= LocalPlayer then
        createESP(player)
    end
end)

Players.PlayerRemoving:Connect(removeESP)

for _, p in ipairs(Players:GetPlayers()) do
    if p ~= LocalPlayer then
        createESP(p)
    end
end

local function StartESP()
    if connection then connection:Disconnect() end
    connection = RunService.RenderStepped:Connect(function()
        for _, player in ipairs(Players:GetPlayers()) do
            if player == LocalPlayer then continue end
            local data = ESP[player]
            if not data then continue end

            local char = player.Character
            local hum = char and char:FindFirstChild("Humanoid")
            local hrp = char and char:FindFirstChild("HumanoidRootPart")
            if not char or not hum or not hrp then
                data.Name.Visible = false
                data.Distance.Visible = false
                data.HealthBar.Visible = false
                for _, c in ipairs(data.Corners) do c.Visible = false end
                continue
            end

            local pos, onScreen = Camera:WorldToViewportPoint(hrp.Position)
            if not onScreen then
                data.Name.Visible = false
                data.Distance.Visible = false
                data.HealthBar.Visible = false
                for _, c in ipairs(data.Corners) do c.Visible = false end
                continue
            end

            local distance = (Camera.CFrame.Position - hrp.Position).Magnitude
            if distance > 2000 then
                data.Name.Visible = false
                data.Distance.Visible = false
                data.HealthBar.Visible = false
                for _, c in ipairs(data.Corners) do c.Visible = false end
                continue
            end

            local color = survivors:FindFirstChild(player.Name)
                and Color3.fromRGB(0,255,0)
                or Color3.fromRGB(255,0,0)

            local size = math.clamp(3000 / distance, 20, 300)
            local w = size
            local h = size * 1.8

            local topLeft = Vector2.new(pos.X - w/2, pos.Y - h/2)
            local topRight = Vector2.new(pos.X + w/2, pos.Y - h/2)
            local bottomLeft = Vector2.new(pos.X - w/2, pos.Y + h/2)
            local bottomRight = Vector2.new(pos.X + w/2, pos.Y + h/2)

            local len = w * 0.25
            local c = data.Corners

            c[1].From = topLeft;     c[1].To = topLeft + Vector2.new(len, 0)
            c[2].From = topLeft;     c[2].To = topLeft + Vector2.new(0, len)
            c[3].From = topRight;    c[3].To = topRight - Vector2.new(len, 0)
            c[4].From = topRight;    c[4].To = topRight + Vector2.new(0, len)
            c[5].From = bottomLeft;  c[5].To = bottomLeft + Vector2.new(len, 0)
            c[6].From = bottomLeft;  c[6].To = bottomLeft + Vector2.new(0, -len)
            c[7].From = bottomRight; c[7].To = bottomRight - Vector2.new(len, 0)
            c[8].From = bottomRight; c[8].To = bottomRight - Vector2.new(0, len)

            for _, ln in ipairs(c) do
                ln.Color = color
                ln.Visible = true
            end

            local hpPercent = hum.Health / hum.MaxHealth
            local barHeight = h * hpPercent
            local barColor = hum.Health <= (hum.MaxHealth / 2)
                and Color3.fromRGB(255,0,0)
                or Color3.fromRGB(0,255,0)

            data.HealthBar.From = bottomLeft + Vector2.new(-6, 0)
            data.HealthBar.To   = bottomLeft + Vector2.new(-6, -barHeight)
            data.HealthBar.Color = barColor
            data.HealthBar.Visible = true

            data.Name.Text = player.DisplayName
            data.Name.Position = Vector2.new(pos.X, topLeft.Y - 16)
            data.Name.Color = color
            data.Name.Visible = true

            data.Distance.Text = math.floor(distance).."m"
            data.Distance.Position = Vector2.new(pos.X, bottomLeft.Y + 5)
            data.Distance.Color = color
            data.Distance.Visible = true
        end
    end)
end

local function StopESP()
    if connection then
        connection:Disconnect()
        connection = nil
    end
    for _, data in pairs(ESP) do
        data.Name.Visible = false
        data.Distance.Visible = false
        data.HealthBar.Visible = false
        for _, c in ipairs(data.Corners) do c.Visible = false end
    end
end

local ToggleESP = ESPBox:AddToggle("PlayersESP", {
    Text = "Players",
    Default = false,
    Callback = function(state)
        if state then
            StartESP()
        else
            StopESP()
        end
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
local DefaultMin = 0.5
local DefaultMax = 10

local function MaintainZoom()
	if HigherSightEnabled then
		if LocalPlayer.CameraMaxZoomDistance ~= TargetZoom then
			LocalPlayer.CameraMaxZoomDistance = TargetZoom
		end
		if LocalPlayer.CameraMinZoomDistance ~= TargetZoom then
			LocalPlayer.CameraMinZoomDistance = TargetZoom
		end
	else
		if LocalPlayer.CameraMaxZoomDistance ~= DefaultMax then
			LocalPlayer.CameraMaxZoomDistance = DefaultMax
		end
		if LocalPlayer.CameraMinZoomDistance ~= DefaultMin then
			LocalPlayer.CameraMinZoomDistance = DefaultMin
		end
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

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local LocalPlayer = Players.LocalPlayer
local RenderConnection
local CharacterConnection

local Keywords = {"liverblow", "corrodedwave", "slash", "spear", "shotgun", "syringe", "flloop", "m1", "m1-1", "m1-2", "m2", "sand"}
local KeywordIds = {}

local RotationSpeedSlider = AimbotBox:AddSlider("RotationSmoothing", {
	Text = "Rotation Speed",
	Default = 0.15,
	Min = 0.01,
	Max = 1,
	Rounding = 2,
})

local function CollectIds(Folder)
	for _, Child in ipairs(Folder:GetChildren()) do
		if Child:IsA("Animation") then
			local Name = Child.Name:lower()
			for _, Key in ipairs(Keywords) do
				if Name == Key then
					table.insert(KeywordIds, Child.AnimationId)
				end
			end
		end
		if #Child:GetChildren() > 0 then
			CollectIds(Child)
		end
	end
end

CollectIds(ReplicatedStorage)

local function GetNearestTarget(Origin, Container)
	local Hrp = Origin:FindFirstChild("HumanoidRootPart")
	if not Hrp then return nil end
	
	local Closest, Shortest = nil, math.huge
	for _, Target in ipairs(Container:GetChildren()) do
		local Thrp = Target:FindFirstChild("HumanoidRootPart")
		if Thrp then
			local Distance = (Thrp.Position - Hrp.Position).Magnitude
			if Distance < Shortest then
				Shortest = Distance
				closest = Target
			end
		end
	end
	return closest
end

local function IsAttackPlaying(Humanoid)
	for _, Track in ipairs(Humanoid:GetPlayingAnimationTracks()) do
		for _, Id in ipairs(KeywordIds) do
			if Track.Animation.AnimationId == Id then
				return true
			end
		end
	end
	return false
end

local function FaceTargetSmoothly(Character)
	local Humanoid = Character:FindFirstChildOfClass("Humanoid")
	local Hrp = Character:FindFirstChild("HumanoidRootPart")
	if not Humanoid or not Hrp then return end
	if not IsAttackPlaying(Humanoid) then return end
	
	local TargetContainer = Character:IsDescendantOf(workspace.survivors) and workspace.killers or workspace.survivors
	local Target = GetNearestTarget(Character, TargetContainer)
	if not Target then return end
	
	local Thrp = Target:FindFirstChild("HumanoidRootPart")
	if not Thrp then return end
	
	local TargetLook = Vector3.new(Thrp.Position.X, Hrp.Position.Y, Thrp.Position.Z)
	local TargetCFrame = CFrame.new(Hrp.Position, TargetLook)
	
	Hrp.CFrame = Hrp.CFrame:Lerp(TargetCFrame, RotationSpeedSlider.Value)
end

local function StartAutoRotate(Character)
	if RenderConnection then RenderConnection:Disconnect() end
	RenderConnection = RunService.RenderStepped:Connect(function()
		if not Character:IsDescendantOf(workspace) then return end
		FaceTargetSmoothly(Character)
	end)
end

local function StopAutoRotate()
	if RenderConnection then RenderConnection:Disconnect() RenderConnection = nil end
	if CharacterConnection then CharacterConnection:Disconnect() CharacterConnection = nil end
end

AimbotBox:AddToggle("autorotate", {
	Text = "Survivor & Killer",
	Default = false,
	Callback = function(State)
		if State then
			if LocalPlayer.Character then
				StartAutoRotate(LocalPlayer.Character)
			end
			if CharacterConnection then CharacterConnection:Disconnect() end
			CharacterConnection = LocalPlayer.CharacterAdded:Connect(function(Char)
				StartAutoRotate(Char)
			end)
		else
			StopAutoRotate()
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
