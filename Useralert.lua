while not game:IsLoaded() do
  wait()
end
local AkaliNotif = loadstring(game:HttpGet("https://raw.githubusercontent.com/Kinlei/Dynissimo/main/Scripts/AkaliNotif.lua"))();
local Notify = AkaliNotif.Notify;
local playerlist = game:GetService("Players"):GetChildren()

if isfile("names.json") then
    print("File found")
else
  Notify({
    Description = "You do not have a names.json file in your workspace one has been made for you";
    Title = "Names file not created";
    Duration = 10;
  });
  writefile("names.json", '{"Roblox",""}')
end

local player_names = loadstring("return "..readfile("names.json"))() --Example of how your blocked players list should look like https://imgur.com/a/nNnhDMw



for _, player in ipairs(playerlist) do
local player_name = player.Name
for _, name in ipairs(player_names) do
  if player_name == name then
      local sound = Instance.new("Sound")
      sound.SoundId = "rbxassetid://5153734608" --You can change the audio to whatever you want from here https://create.roblox.com/marketplace/soundeffects?source=library
      sound.Parent = workspace
      sound:Play() 
      Notify({
              Description = player.name .. " has been detected in this game";
              Title = "UserAlert - Player detected";
              Duration = 10;
          });
      wait(3)
      sound:Destroy()
    break
  end
end
end
Notify({
Description = "Game scan finished monitoring players joining";
Title = "UserAlert - Game scan finished";
Duration = 5;
});

local Players = game:GetService("Players")

Players.ChildAdded:Connect(function(player)
  print(player.Name .. " has joined")
  for _, name in pairs(player_names) do
      if player.Name == name then
          local sound = Instance.new("Sound")
          sound.SoundId = "rbxassetid://5153734608" --You can change the audio to whatever you want from here https://create.roblox.com/marketplace/soundeffects?source=library
          sound.Parent = workspace
          sound:Play()         
          Notify({
              Description = player.name .. " from your blocked list has joined your game";
              Title = "UserAlert - Player detected";
              Duration = 10;
          });
          wait(3)
          sound:Destroy()
          break
      end 
  end
end)