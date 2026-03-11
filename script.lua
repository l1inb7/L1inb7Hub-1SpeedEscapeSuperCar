repeat task.wait() until game:IsLoaded()

local Rayfield = loadstring(game:HttpGet("https://sirius.menu/rayfield"))()

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")

local player = Players.LocalPlayer

local Window = Rayfield:CreateWindow({
   Name = "🚗 +1 Speed Escape Supercar [BEST & FREE]",
   LoadingTitle = "🎲 L1inb7 Hub",
   LoadingSubtitle = "by l1inb7",
   Theme = " Amethyst",
   ConfigurationSaving = {
      Enabled = false,
      FileName = "L1inb7Hub"
   },
   KeySystem = false
})

----------------------------------------------------
-- MAIN TAB
----------------------------------------------------

local MainTab = Window:CreateTab("🏠 Main", nil)

Rayfield:Notify({
   Title = "You executed the script",
   Content = "Thanks for using L1inb7 Hub!",
   Duration = 5
})

----------------------------------------------------
-- AUTO WIN
----------------------------------------------------

local autowin = false

MainTab:CreateToggle({
   Name = "Auto Farm Wins & Money",
   CurrentValue = false,
   Callback = function(Value)
      autowin = Value
   end,
})

MainTab:CreateParagraph({
   Title = "🎲 Information",
   Content = "• Automatically farm wins and money.\n• You can be kicked from the game for afk for 20 minutes!"
})

task.spawn(function()
   while true do
      if autowin then

         local args = {
            [1] = "Free",
            [2] = Vector3.new(9914.46875, 6.3058, -5766.1577)
         }

         ReplicatedStorage.Remote.Event.Player.ClaimWins:FireServer(unpack(args))
      end

      task.wait(1)
   end
end)

----------------------------------------------------
-- EQUIP SKATEBOARD
----------------------------------------------------

MainTab:CreateDropdown({
   Name = "Equip Supercar",
   Options = {
"Basic",
"Abstract",
"Blossom",
"Doodle",
"Tropical",
"Cabin",
"Purple Prism",
"Hardware",
"Rainbow Cloud",
"VIP",
"Red Ufo",
"Bat",
"Blue Prism",
"Blue Ripstick",
"Red Ripstick",
"Golden Ripstick",
"Golden",
"White Surf Board",
"Rocket",
"Like Board",
"Checkers",
"RainbowSwirl",
"Orange Surf Board",
"Rover",
"Shark",
"Floral",
"Tiger",
"Red Surf Board",
"Cyber",
"Blackbird",
"Polar",
"Snowy",
"White Snowboard",
"Snowflake",
"Northern Star",
"Autumn Leaf",
"Turkey Leg",
"Spring Egg",
"Sky Blue Egg",
"Mushroom Egg",
"Galaxy Egg",
"The Hatch Egg"
      }
   },
   CurrentOption = {"Basic"},
   MultipleOptions = false,
   Callback = function(Option)

      ReplicatedStorage.Remote.Event.UI.EquipBoard:FireServer(Option[1])

      Rayfield:Notify({
         Title = "L1inb7 Hub",
         Content = Option[1].." equipped!",
         Duration = 4
      })

   end,
})

MainTab:CreateParagraph({
   Title = "🎲 Information",
   Content = "• Equip selected car instantly and absolutely free!\n‼️ WARNING: Some of them may not work cuz im lazy to check it now"
})

----------------------------------------------------
-- OPEN EGGS
----------------------------------------------------

MainTab:CreateDropdown({
   Name = "Open Egg",
   Options = {
   "Egg1 (100$)","Egg2 (500$)","Egg3 (1K$)","Egg4 (10K$)", "Egg5 (20K$)", "Egg6 (100K$)"
   },
   CurrentOption = {"Egg1 (100$)"},
   MultipleOptions = false,
   Callback = function(Option)

      local egg = Option[1]:match("Egg%d")

      ReplicatedStorage.Remote.Function.Eggs.OpenEgg:InvokeServer(egg)

      Rayfield:Notify({
         Title = "L1inb7 Hub",
         Content = egg.." opened!",
         Duration = 4
      })

   end,
})

MainTab:CreateParagraph({
   Title = "🎲 Information",
   Content = "• You must have enough money\n• Inventory must have free space!"
})

----------------------------------------------------
-- TELEPORT WORLDS
----------------------------------------------------

MainTab:CreateDropdown({
   Name = "Teleport World",
   Options = {
   "World 1",
   "World 2 (must be unlocked)"
   },
   CurrentOption = {"World 1"},
   MultipleOptions = false,
   Callback = function(Option)

      local world = "World 1"

      if Option[1] == "World 2 (must be unlocked)" then
         world = "World 2"
      end

      ReplicatedStorage.Modules.RbxNet.net._NetManaged.TeleportToWorld:FireServer(world)

      Rayfield:Notify({
         Title = "L1inb7 Hub",
         Content = "Teleporting to "..world,
         Duration = 4
      })

   end,
})

MainTab:CreateParagraph({
   Title = "🎲 Information",
   Content = "• The world must be unlocked in the game or teleport will fail."
})

----------------------------------------------------
-- SPEED SYSTEM
----------------------------------------------------

getgenv().CustomSpeed = 50

local PhysicsUtils = require(
ReplicatedStorage.Modules.Util.PhysicsUtils
)

MainTab:CreateInput({
   Name = "Set Speed (0 - 5000)",
   PlaceholderText = "Enter Speed...",
   RemoveTextAfterFocusLost = false,
   Callback = function(Text)

      local num = tonumber(Text)

      if num then
         getgenv().CustomSpeed = math.clamp(num,0,5000)

         Rayfield:Notify({
            Title = "L1inb7 Hub",
            Content = "Speed set to "..getgenv().CustomSpeed,
            Duration = 4
         })
      end

   end,
})

MainTab:CreateParagraph({
   Title = "🎲 Information",
   Content = "• Changes your speed.\n• Extremely high speed will cause loud skateboard sound and physics glitches, also its very laggy"
})

RunService.RenderStepped:Connect(function()

   local target = getgenv().CustomSpeed

   if PhysicsUtils and PhysicsUtils.CurrentSpeed then
      PhysicsUtils.CurrentSpeed =
      PhysicsUtils.CurrentSpeed + (target - PhysicsUtils.CurrentSpeed) * 0.25
   end

   if PhysicsUtils and PhysicsUtils.BoardStats then
      PhysicsUtils.BoardStats.MaxSpeed =
      math.max(target, PhysicsUtils.BoardStats.MaxSpeed)
   end

end)

----------------------------------------------------
-- MESSAGE TAB
----------------------------------------------------

local InfoTab = Window:CreateTab("🎲 Info", nil)

InfoTab:CreateParagraph({
   Title = "🎲 Information",
   Content = "\n‼️ Script Version\nv0.9 PRE-RELEASE\n\n‼️ Script created by l1inb7\nYouTube: l1inb7_scriptss\n\n💬 Message From l1inb7\nwhile writing the script, I was amused that the developers were too lazy to change the scripts for their game, they didn’t even change the names of the supercars in the scripts, seriously"
})

InfoTab:CreateButton({
   Name = "Copy YouTube Channel",
   Callback = function()

     setclipboard("https://www.youtube.com/@l1inb7_scriptss")

      Rayfield:Notify({
         Title = "L1inb7 Hub",
         Content = "YouTube link copied!",
         Duration = 4
      })

   end,
})
