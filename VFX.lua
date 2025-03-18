local plr = game.Players.LocalPlayer

task.wait(1)
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

plr.PlayerGui.ScreenGui.MagicHealth.TextLabel.Text = "Ķ̷̭͚͙̝̯̖̫̫̲͔͕̦̠̰͇̲̿͐̓͂̈́̒̉̏̅͊͑̎̆̐̀̄̋͊̾̅̚͘͠į̸̛̱͎̳̝̬̹̱̹͈͎̥̗͈̲̥̄̈̿̓̆ͅn̵̛̛̤̿͐͆̆̆̏͌͋̄͆̅̑͒̒͒͆͑̅͛͠͝g̴̛̛̣͉͔͓̖̳̤̯̩͊̌̀̽̍͗̈̐͊̂́͗̔́͗͝͝͠ ̵̢̡̡̡̞̝̗̟͉̲̗͉͔̞̙̝̗͚͉̞͇̫̥͔̐͗̀͛͗͜ͅƠ̴̢̧̡̨̛͖̫̳̘̳͕̣̯̺̱̺̮̇̈́͐͆̾͋̈̈́̓̑̎̌̂̀̌͂̊̔̉͋̐́͘͘͘f̸̥͓̥̗̹͉̟͔̭͓̠̺̭͑̌̀͆͊͛͌͒̈́ ̴͈̪̓̅̒͂̒͐̓̿̈́͗̈̊͋͊̈͆̓̑̔̍̈́̎̓̾̕͠͠Ę̷̡̡̤͈̼̱͍̗̪̣̮̯̯̞̼͈̻̥͔̜͎̦̱̲͙̀̒̆̂̉̎́̇͜͜x̶̲͍̘͈̯̓̓͗͒̉̉̓̓̓͑͛̚͘͠p̸͎̞̭̏̇̀̏̾̍͋͒͛̇̏̆̌͒͝l̶͇̞̝͎̘̭̫̱̞̆̍́̅͑͛͑̒͂̔̋͋̅̂̓͛ṓ̶̢̢̢̦̱̜̹̲̙̮̩̦̮͇̝͙̭̝̳͉͖̕͜ͅi̶̛̫̫̦̰̘͍̓̊͛̈͆͐̅͑̈̀̏͒͠t̸̛̛͙̙̤͓͇̙̪̠̠̺̼̩̪̻͐͊̋̋̓͂̌̆͑̂̄̌͝ͅs̴̛̟͕̟̮̙̲͈̫̖̮̗͐̀̆̌̂̀̿͊̒̕̕ͅͅ"

task.spawn(function()
	game["Run Service"].RenderStepped:Connect(function()
		if rootPart then
			-- Generate a random small rotation (±2 degrees)
			local randomRotation = CFrame.Angles(
				math.rad(math.random(-1, 1)), 
				math.rad(math.random(-1, 1)), 
				math.rad(math.random(-1, 1))
			)

			-- Apply the rotation to the current CFrame
			emitter:Emit(1)
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
box.Transparency = 0.5
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

game.workspace.Cutscenes.Atoms.sphere.Color = Color3.new(0,0,0)
game.workspace.Cutscenes.Atoms.sphere.Material = Enum.Material.Neon
local gui = game.ReplicatedStorage.Resources.BossHP2:Clone()
gui.Parent = plr.PlayerGui
for i, v in pairs(gui.Frame:GetChildren()) do
	if v.Name == "ImageLabel" then 
		v:Destroy()
	end
	
	if v.Name == "TextLabel" then
		if v.Text == "ONLYTWENTYCHARACTERS" then
			v.Text = string.upper(plr.Name)
			v.TextLabel.Text = string.upper(plr.Name)
		else
			v.Text = "1x1x1x1"
		end
	end
end
gui.Frame.Border.Red.Color = Color3.new(0,1,0)
gui.Frame.Border.Color = Color3.new(0,0,0)

task.spawn(function()
	while task.wait(0.1) do	
		gui.Frame.Border.Red.Size = UDim2.new(humanoid.Health / humanoid.MaxHealth, 0, 1, 0)
	end
end)


for i, orb in pairs(game.workspace.Cutscenes.Atoms.sphere.Model:GetDescendants()) do
	if orb:IsA("BasePart") then
		orb.Color = Color3.new(0,1,0)
		orb.Material = Enum.Material.ForceField
	end
end

