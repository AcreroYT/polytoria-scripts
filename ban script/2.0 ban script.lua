-- UID GOES HERE
local banList = {123, 456, 789}

-- KILL THEM
Players.PlayerAdded:Connect(function(plr)
  for i, v in banList do
    if plr.UserID == v then
      player:kick("You've been a bad boy!")
    end
  end
end)