-- UID GOES HERE
local banList = {123, 456, 789}

-- KILL THEM
game["Players"].PlayerAdded:Connect(function(player)
  for i, v in banList do
    if player.UserID == i then
      player:kick("You've been a bad boy!")
    end
  end
end)
