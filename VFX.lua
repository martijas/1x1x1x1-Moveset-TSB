local plr = game.Players.LocalPlayer

task.wait(4)
local char = plr.Character or plr.CharacterAdded:Wait()
local humanoid = char:FindFirstChildOfClass("Humanoid")
local rootPart = char:WaitForChild("HumanoidRootPart") -- Ensure HumanoidRootPart exists
local emitter = Instance.new("ParticleEmitter")
emitter.Parent=rootPart
emitter.Texture = "http://www.roblox.com/asset/?id=13283439452"
emitter.SpreadAngle = Vector2.new(360,360)
emitter.Color = ColorSequence.new(Color3.fromRGB(0, 255, 0), Color3.fromRGB(0, 171, 71))
emitter.Rate = 0
emitter.Size = NumberSequence.new(0.4)

task.spawn(function()
	game["Run Service"].RenderStepped:Connect(function()
		if rootPart then
			-- Generate a random small rotation (±2 degrees)
			local randomRotation = CFrame.Angles(
				math.rad(math.random(-2, 2)), 
				math.rad(math.random(-2, 2)), 
				math.rad(math.random(-2, 2))
			)

			-- Apply the rotation to the current CFrame
			emitter:Emit(math.random(1, 2))
			rootPart.CFrame = rootPart.CFrame * randomRotation
		end
	end)
end)


-- Get the torso (supports both R6 and R15)
local Torso = char:FindFirstChild("Torso") or char:FindFirstChild("UpperTorso")
if not Torso then
	warn("Torso not found!")
	return
end

-- Apply mesh to torso
local TorsoMesh = Instance.new("SpecialMesh")
TorsoMesh.MeshType = Enum.MeshType.FileMesh
TorsoMesh.MeshId = "http://www.roblox.com/asset/?id=36780113"
TorsoMesh.Scale = Vector3.new(0.9, 0.9, 0.9) -- Adjust if needed
TorsoMesh.Parent = Torso
Torso.Color = Color3.new(0, 0, 0)

-- Create and configure the box
local box = Instance.new("Part")
local charMesh = Instance.new("CharacterMesh")
local light = Instance.new("PointLight")
light.Brightness = 6
light.Color = Color3.fromRGB(0,255,0)
light.Range = 6

charMesh.Parent = box
charMesh.BodyPart = Enum.BodyPart.Torso
box.Size = Torso.Size + Vector3.new(0.05,0.05,0.05)
box.Anchored = false -- Set before welding
box.Material = Enum.Material.Neon
box.Transparency = 0.25
box.Color = Color3.new(0, 0.6, 0)
box.CanCollide = false -- Ensure it doesn't block movement
box.Parent = char
light.Parent = box
-- Position and weld the box to the torso
box.CFrame = Torso.CFrame
local wc = Instance.new("WeldConstraint")
wc.Parent = box
wc.Part0 = box
wc.Part1 = Torso
