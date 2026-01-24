local Players = game:GetService("Players")

local LocalPlayer = Players.LocalPlayer
local IngameFolder = workspace:WaitForChild("Map"):WaitForChild("Ingame")
local ActionDuration = 2.5

local ActiveSession = false
local ScriptEnabled = false
local GeneratorSignalConnections = {}
local CurrentMap = IngameFolder:FindFirstChild("Map")

local function GetCurrentMap()
	if not CurrentMap or not CurrentMap.Parent then
		CurrentMap = IngameFolder:FindFirstChild("Map")
	end
	return CurrentMap
end

local function GetNearestGenerator()
	local ClosestGenerator = nil
	local ShortestDistance = math.huge
	local Character = LocalPlayer.Character

	if not Character or not Character:FindFirstChild("HumanoidRootPart") then 
		return nil 
	end
	
	local RootPosition = Character.HumanoidRootPart.Position
	local Map = GetCurrentMap()
	
	if not Map then return nil end

	for _, Object in ipairs(Map:GetChildren()) do
		if Object.Name == "Generator" then
			local TargetPart = Object:FindFirstChild("Main") or Object:FindFirstChildWhichIsA("BasePart")
			if TargetPart then
				local Distance = (RootPosition - TargetPart.Position).Magnitude
				if Distance < ShortestDistance then
					ShortestDistance = Distance
					ClosestGenerator = Object
				end
			end
		end
	end

	return ClosestGenerator
end

local function StartGenerationLoop()
	task.spawn(function()
		while ActiveSession and ScriptEnabled do
			task.wait(ActionDuration)
			
			if not ActiveSession or not ScriptEnabled then break end

			local NearestGenerator = GetNearestGenerator()
			if NearestGenerator then
				local Remotes = NearestGenerator:FindFirstChild("Remotes")
				local RemoteEvent = Remotes and Remotes:FindFirstChild("RE")
				
				if RemoteEvent then
					RemoteEvent:FireServer()
				end
			end
		end
	end)
end

local function StopSession()
	ActiveSession = false
end

local function MonitorCharacter(Character)
	local Humanoid = Character:WaitForChild("Humanoid", 10)
	if Humanoid then
		table.insert(GeneratorSignalConnections, Humanoid.Died:Connect(StopSession))
	end
end

function StartAutoGenerator()
	if ScriptEnabled then return end
	ScriptEnabled = true

	table.insert(GeneratorSignalConnections, IngameFolder.ChildAdded:Connect(function(Child)
		if Child.Name == "Map" then
			CurrentMap = Child
			StopSession()
		end
	end))

	table.insert(GeneratorSignalConnections, LocalPlayer.CharacterAdded:Connect(function(Character)
		StopSession()
		MonitorCharacter(Character)
	end))

	if LocalPlayer.Character then
		MonitorCharacter(LocalPlayer.Character)
	end

	local RawMetatable = getrawmetatable(game)
	local OldNamecall = RawMetatable.__namecall
	setreadonly(RawMetatable, false)

	RawMetatable.__namecall = newcclosure(function(Self, ...)
		if not ScriptEnabled then
			return OldNamecall(Self, ...)
		end

		local Method = getnamecallmethod()
		local Args = {...}

		if Method == "InvokeServer" and Self.Name == "RF" then
			if Args[1] == "Enter" then
				if not ActiveSession then
					ActiveSession = true
					StartGenerationLoop()
				end
			elseif Args[1] == "Leave" then
				StopSession()
			end
		end

		return OldNamecall(Self, ...)
	end)

	setreadonly(RawMetatable, true)
end

function StopAutoGenerator()
	ScriptEnabled = false
	ActiveSession = false
	
	for _, Connection in ipairs(GeneratorSignalConnections) do
		if Connection then
			Connection:Disconnect()
		end
	end
	table.clear(GeneratorSignalConnections)
end
