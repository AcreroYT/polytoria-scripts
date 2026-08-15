local player = Players.LocalPlayer
local alternate = 0

-- Current backshot count. Each input counts as 1.
local trigger = 0

-- Backshot trigger limit. Each input counts as 1. Default = 6 inputs, W + S + W + S + W + S.
local limit = 8

local function KILL()
	player.Kill()
	trigger = 0
end

Input.KeyDown:Connect(function(key, focus)
	if focus then
		if trigger >= limit then
			print("KILL")
			print(trigger)
			KILL()
			return
		end
		for i, v in ipairs(Players.GetPlayers()) do
			if v ~= player then
				diff = Vector3.New(v.Position.X - player.Position.X, 0, v.Position.Z - player.Position.Z)
				looking = Vector3.New(0, v.Rotation.Y - player.Rotation.Y, 0)
				if diff.X > -6 and diff.X < 6 and diff.Z > -6 and diff.Z < 6 and alternate == 0 then
					if looking.Y > -30 and looking.Y < 30 then
						alternate = 1
					elseif looking.Y > 150 and looking.Y < 210 then
						alternate = 1
					end
					print(diff, looking, trigger)
				end
			end
		end
		if key == Enums.KeyCode.W and alternate == 1 then
			alternate = 2
			trigger += 1
			return
		end
		if key == Enums.KeyCode.S and alternate == 2 then
			alternate = 0
			trigger += 1
			return
		end
	end
end)
