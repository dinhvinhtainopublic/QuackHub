--[[
    ████████╗ ██████╗ ██████╗ ███████╗ ██████╗ ██╗  ██╗██╗  ██╗███████╗██╗     ██╗   ██╗ █████╗
    ╚══██╔══╝██╔═══██╗██╔══██╗██╔════╝██╔═══██╗██║  ██║██║  ██║██╔════╝██║     ██║   ██║██╔══██╗
       ██║   ██║   ██║██████╔╝█████╗  ██║   ██║███████║███████║█████╗  ██║     ██║   ██║███████║
       ██║   ██║   ██║██╔══██╗██╔══╝  ██║   ██║██╔══██║██╔══██║██╔══╝  ██║     ██║   ██║██╔══██║
       ██║   ╚██████╔╝██║  ██║██║     ╚██████╔╝██║  ██║██║  ██║██║     ███████╗╚██████╔╝██║  ██║
       ╚═╝    ╚═════╝ ╚═╝  ╚═╝╚═╝      ╚═════╝ ╚═╝  ╚═╝╚═╝  ╚═╝╚═╝     ╚══════╝ ╚═════╝ ╚═╝  ╚═╝
    
    Quack Hub: Blox Fruits
    Full Feature Hub - Redz Hub Style GUI
    Supports Sea 1, 2, 3
]]

--=============================================================================
-- SERVICES & VARIABLES
--=============================================================================
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Workspace = game:GetService("Workspace")
local VirtualUser = game:GetService("VirtualUser")
local RunService = game:GetService("RunService")
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local HttpService = game:GetService("HttpService")
local Lighting = game:GetService("Lighting")
local StarterGui = game:GetService("StarterGui")

local LocalPlayer = Players.LocalPlayer
local Camera = Workspace.CurrentCamera

if not Workspace:FindFirstChild("World3") then
    pcall(function()
        game:GetService("Workspace"):WaitForChild("World3", 10)
    end)
end

--=============================================================================
-- SEA DETECTION
--=============================================================================
local PlaceId = game.PlaceId
local Sea = 1
if PlaceId == 2753915549 then
    Sea = 1
elseif PlaceId == 4442272183 then
    Sea = 2
elseif PlaceId == 7449423635 then
    Sea = 3
else
    Sea = 1 -- fallback
end

local function GetSeaName()
    if Sea == 1 then return "Sea 1" elseif Sea == 2 then return "Sea 2" else return "Sea 3" end
end

--=============================================================================
-- UTILITY FUNCTIONS
--=============================================================================
local function GetLocalLevel()
    local lvl = LocalPlayer.Data and LocalPlayer.Data:FindFirstChild("Level")
    if lvl then return lvl.Value end
    return 1
end

local function GetStat(statName)
    local stats = LocalPlayer.Data and LocalPlayer.Data:FindFirstChild("Stats")
    if stats and stats:FindFirstChild(statName) then
        return stats[statName].Value
    end
    return 0
end

local function GetStatPoints()
    local pts = LocalPlayer.Data and LocalPlayer.Data:FindFirstChild("Points")
    if pts then return pts.Value end
    return 0
end

local function TeleportTo(CFramePos)
    if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
        LocalPlayer.Character.HumanoidRootPart.CFrame = CFramePos
    end
end

local function TweenTo(CFramePos, Speed)
    Speed = Speed or 350
    pcall(function()
        if not LocalPlayer.Character or not LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then return end
        local Distance = (LocalPlayer.Character.HumanoidRootPart.Position - CFramePos.Position).Magnitude
        if Distance < 3 then return end
        local TweenInfo = TweenInfo.new(Distance / Speed, Enum.EasingStyle.Linear)
        local tween = TweenService:Create(LocalPlayer.Character.HumanoidRootPart, TweenInfo, {CFrame = CFramePos})
        tween:Play()
        tween.Completed:Wait()
    end)
end

local function GetNearestMonster(MobName, MaxDistance)
    MaxDistance = MaxDistance or 5000
    local nearest = nil
    local minDist = MaxDistance
    pcall(function()
        for _, v in pairs(Workspace.Enemies:GetChildren()) do
            if v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 then
                if (MobName == nil or string.find(v.Name:lower(), MobName:lower())) then
                    local dist = (v.HumanoidRootPart.Position - LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
                    if dist < minDist then
                        minDist = dist
                        nearest = v
                    end
                end
            end
        end
    end)
    return nearest, minDist
end

local function GetNearestBoss(BossName, MaxDistance)
    MaxDistance = MaxDistance or 10000
    local nearest = nil
    local minDist = MaxDistance
    pcall(function()
        for _, v in pairs(Workspace.Enemies:GetChildren()) do
            if v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 then
                if string.find(v.Name:lower(), BossName:lower()) then
                    local dist = (v.HumanoidRootPart.Position - LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
                    if dist < minDist then
                        minDist = dist
                        nearest = v
                    end
                end
            end
        end
    end)
    return nearest, minDist
end

local function BringMob(mob)
    pcall(function()
        if mob and mob:FindFirstChild("HumanoidRootPart") then
            local hrp = LocalPlayer.Character.HumanoidRootPart
            mob.HumanoidRootPart.CFrame = hrp.CFrame * CFrame.new(0, 0, -5)
            mob.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
            if mob:FindFirstChild("Head") then
                mob.Head.Size = Vector3.new(60, 60, 60)
            end
        end
    end)
end

local function EquipWeapon(weaponName)
    pcall(function()
        for _, v in pairs(LocalPlayer.Backpack:GetChildren()) do
            if v:IsA("Tool") and string.find(v.Name:lower(), weaponName:lower()) then
                LocalPlayer.Character.Humanoid:EquipTool(v)
                return true
            end
        end
        for _, v in pairs(LocalPlayer.Character:GetChildren()) do
            if v:IsA("Tool") and string.find(v.Name:lower(), weaponName:lower()) then
                return true
            end
        end
    end)
    return false
end

local function UseBuso()
    pcall(function()
        if not LocalPlayer.Character:FindFirstChild("HasBuso") then
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Buso")
        end
    end)
end

local function AcceptQuest()
    pcall(function()
        local questData = GetCurrentQuestData()
        if questData then
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StartQuest", questData.QuestName, questData.QuestLevel)
        end
    end)
end

local function QuestCompleted()
    local questInfo = LocalPlayer.PlayerGui.Main.Quest
    if questInfo and questInfo:FindFirstChild("Container") then
        local hasQuest = questInfo.Container:FindFirstChild("Mission")
        if hasQuest then
            local progress = hasQuest:FindFirstChild("Bar")
            if progress then
                local progressText = hasQuest:FindFirstChild("Title") and hasQuest.Title.Text or ""
                local barValue = progress:FindFirstChild("Bar1")
                if barValue and barValue.Size and barValue.Size.X.Scale >= 0.95 then
                    return true
                end
            end
        end
    end
    return false
end

local function HasQuest()
    pcall(function()
        if LocalPlayer.PlayerGui:FindFirstChild("Main") and LocalPlayer.PlayerGui.Main:FindFirstChild("Quest") then
            local q = LocalPlayer.PlayerGui.Main.Quest.Container:FindFirstChild("Mission")
            if q then return true end
        end
    end)
    return false
end

local function FastAttack()
    pcall(function()
        local CombatFramework = require(ReplicatedStorage.CombatFramework)
        local CFS = CombatFramework.activeController
        if CFS then
            for i = 1, 3 do
                pcall(function()
                    CFS:Attack()
                end)
            end
        end
    end)
end

local function NoClipLoop(on)
    if on then
        RunService.Stepped:Connect(function()
            pcall(function()
                if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
                    LocalPlayer.Character.HumanoidRootPart.CanCollide = false
                end
                if LocalPlayer.Character then
                    for _, part in pairs(LocalPlayer.Character:GetDescendants()) do
                        if part:IsA("BasePart") then
                            part.CanCollide = false
                        end
                    end
                end
            end)
        end)
    end
end

-- Anti AFK
LocalPlayer.Idled:Connect(function()
    VirtualUser:CaptureController()
    VirtualUser:ClickButton2(Vector2.new())
end)

--=============================================================================
-- QUEST DATA (ALL SEAS)
--=============================================================================
local QuestData = {}

-- SEA 1
QuestData.Sea1 = {
    {LevelReq = 1, MaxLevel = 9, Mob = "Bandit", QuestName = "JungleQuest", QuestLevel = 1},
    {LevelReq = 10, MaxLevel = 14, Mob = "Monkey", QuestName = "JungleQuest", QuestLevel = 1},
    {LevelReq = 15, MaxLevel = 29, Mob = "Gorilla", QuestName = "JungleQuest", QuestLevel = 2},
    {LevelReq = 30, MaxLevel = 39, Mob = "Pirate", QuestName = "BuggyQuest1", QuestLevel = 1},
    {LevelReq = 40, MaxLevel = 59, Mob = "Brute", QuestName = "BuggyQuest1", QuestLevel = 2},
    {LevelReq = 60, MaxLevel = 74, Mob = "Desert Bandit", QuestName = "DesertQuest", QuestLevel = 1},
    {LevelReq = 75, MaxLevel = 89, Mob = "Desert Officer", QuestName = "DesertQuest", QuestLevel = 2},
    {LevelReq = 90, MaxLevel = 99, Mob = "Snow Bandit", QuestName = "SnowQuest", QuestLevel = 1},
    {LevelReq = 100, MaxLevel = 119, Mob = "Snowman", QuestName = "SnowQuest", QuestLevel = 2},
    {LevelReq = 120, MaxLevel = 149, Mob = "Chief Petty Officer", QuestName = "MarineQuest2", QuestLevel = 1},
    {LevelReq = 150, MaxLevel = 174, Mob = "Sky Bandit", QuestName = "SkyQuest", QuestLevel = 1},
    {LevelReq = 175, MaxLevel = 189, Mob = "Dark Master", QuestName = "SkyQuest", QuestLevel = 2},
    {LevelReq = 190, MaxLevel = 209, Mob = "Prisoner", QuestName = "PrisonerQuest", QuestLevel = 1},
    {LevelReq = 210, MaxLevel = 249, Mob = "Dangerous Prisoner", QuestName = "PrisonerQuest", QuestLevel = 2},
    {LevelReq = 250, MaxLevel = 274, Mob = "Toga Warrior", QuestName = "ColosseumQuest", QuestLevel = 1},
    {LevelReq = 275, MaxLevel = 299, Mob = "Gladiator", QuestName = "ColosseumQuest", QuestLevel = 2},
    {LevelReq = 300, MaxLevel = 324, Mob = "Military Soldier", QuestName = "MagmaQuest", QuestLevel = 1},
    {LevelReq = 325, MaxLevel = 374, Mob = "Military Spy", QuestName = "MagmaQuest", QuestLevel = 2},
    {LevelReq = 375, MaxLevel = 399, Mob = "Fishman Warrior", QuestName = "FishmanQuest", QuestLevel = 1},
    {LevelReq = 400, MaxLevel = 449, Mob = "Fishman Commando", QuestName = "FishmanQuest", QuestLevel = 2},
    {LevelReq = 450, MaxLevel = 474, Mob = "God's Guard", QuestName = "SkyExp1Quest", QuestLevel = 1},
    {LevelReq = 475, MaxLevel = 524, Mob = "Shanda", QuestName = "SkyExp1Quest", QuestLevel = 2},
    {LevelReq = 525, MaxLevel = 549, Mob = "Royal Squad", QuestName = "SkyExp2Quest", QuestLevel = 1},
    {LevelReq = 550, MaxLevel = 624, Mob = "Royal Soldier", QuestName = "SkyExp2Quest", QuestLevel = 2},
    {LevelReq = 625, MaxLevel = 649, Mob = "Galley Pirate", QuestName = "FountainQuest", QuestLevel = 1},
    {LevelReq = 650, MaxLevel = 700, Mob = "Galley Captain", QuestName = "FountainQuest", QuestLevel = 2},
}

-- SEA 2
QuestData.Sea2 = {
    {LevelReq = 700, MaxLevel = 724, Mob = "Raider", QuestName = "Area1Quest", QuestLevel = 1},
    {LevelReq = 725, MaxLevel = 774, Mob = "Mercenary", QuestName = "Area1Quest", QuestLevel = 2},
    {LevelReq = 775, MaxLevel = 799, Mob = "Swan Pirate", QuestName = "Area2Quest", QuestLevel = 1},
    {LevelReq = 800, MaxLevel = 874, Mob = "Factory Staff", QuestName = "Area2Quest", QuestLevel = 2},
    {LevelReq = 875, MaxLevel = 899, Mob = "Marine Lieutenant", QuestName = "MarineQuest3", QuestLevel = 1},
    {LevelReq = 900, MaxLevel = 949, Mob = "Marine Captain", QuestName = "MarineQuest3", QuestLevel = 2},
    {LevelReq = 950, MaxLevel = 974, Mob = "Zombie", QuestName = "ZombieQuest", QuestLevel = 1},
    {LevelReq = 975, MaxLevel = 999, Mob = "Vampire", QuestName = "ZombieQuest", QuestLevel = 2},
    {LevelReq = 1000, MaxLevel = 1049, Mob = "Snow Trooper", QuestName = "SnowMountainQuest", QuestLevel = 1},
    {LevelReq = 1050, MaxLevel = 1099, Mob = "Winter Warrior", QuestName = "SnowMountainQuest", QuestLevel = 2},
    {LevelReq = 1100, MaxLevel = 1124, Mob = "Lab Subordinate", QuestName = "IceSideQuest", QuestLevel = 1},
    {LevelReq = 1125, MaxLevel = 1174, Mob = "Horned Warrior", QuestName = "IceSideQuest", QuestLevel = 2},
    {LevelReq = 1175, MaxLevel = 1199, Mob = "Magma Ninja", QuestName = "FireSideQuest", QuestLevel = 1},
    {LevelReq = 1200, MaxLevel = 1249, Mob = "Lava Pirate", QuestName = "FireSideQuest", QuestLevel = 2},
    {LevelReq = 1250, MaxLevel = 1274, Mob = "Ship Deckhand", QuestName = "ShipQuest1", QuestLevel = 1},
    {LevelReq = 1275, MaxLevel = 1299, Mob = "Ship Engineer", QuestName = "ShipQuest1", QuestLevel = 2},
    {LevelReq = 1300, MaxLevel = 1324, Mob = "Ship Steward", QuestName = "ShipQuest2", QuestLevel = 1},
    {LevelReq = 1325, MaxLevel = 1349, Mob = "Ship Officer", QuestName = "ShipQuest2", QuestLevel = 2},
    {LevelReq = 1350, MaxLevel = 1374, Mob = "Arctic Warrior", QuestName = "FrostQuest", QuestLevel = 1},
    {LevelReq = 1375, MaxLevel = 1424, Mob = "Snow Lurker", QuestName = "FrostQuest", QuestLevel = 2},
    {LevelReq = 1425, MaxLevel = 1449, Mob = "Sea Soldier", QuestName = "ForgottenQuest", QuestLevel = 1},
    {LevelReq = 1450, MaxLevel = 1500, Mob = "Water Fighter", QuestName = "ForgottenQuest", QuestLevel = 2},
}

-- SEA 3
QuestData.Sea3 = {
    {LevelReq = 1500, MaxLevel = 1524, Mob = "Pirate Millionaire", QuestName = "PiratePortQuest", QuestLevel = 1},
    {LevelReq = 1525, MaxLevel = 1574, Mob = "Pistol Billionaire", QuestName = "PiratePortQuest", QuestLevel = 2},
    {LevelReq = 1575, MaxLevel = 1599, Mob = "Dragon Crew Warrior", QuestName = "DragonCrewQuest", QuestLevel = 1},
    {LevelReq = 1600, MaxLevel = 1624, Mob = "Dragon Crew Archer", QuestName = "DragonCrewQuest", QuestLevel = 2},
    {LevelReq = 1625, MaxLevel = 1649, Mob = "Hydra Enforcer", QuestName = "VenomCrewQuest", QuestLevel = 1},
    {LevelReq = 1650, MaxLevel = 1699, Mob = "Venomous Assailant", QuestName = "VenomCrewQuest", QuestLevel = 2},
    {LevelReq = 1700, MaxLevel = 1724, Mob = "Marine Commodore", QuestName = "MarineTreeIsland", QuestLevel = 1},
    {LevelReq = 1725, MaxLevel = 1774, Mob = "Marine Rear Admiral", QuestName = "MarineTreeIsland", QuestLevel = 2},
    {LevelReq = 1775, MaxLevel = 1799, Mob = "Fishman Raider", QuestName = "DeepForestIsland3", QuestLevel = 1},
    {LevelReq = 1800, MaxLevel = 1824, Mob = "Fishman Captain", QuestName = "DeepForestIsland3", QuestLevel = 2},
    {LevelReq = 1825, MaxLevel = 1849, Mob = "Forest Pirate", QuestName = "DeepForestIsland", QuestLevel = 1},
    {LevelReq = 1850, MaxLevel = 1899, Mob = "Mythological Pirate", QuestName = "DeepForestIsland", QuestLevel = 2},
    {LevelReq = 1900, MaxLevel = 1924, Mob = "Jungle Pirate", QuestName = "DeepForestIsland2", QuestLevel = 1},
    {LevelReq = 1925, MaxLevel = 1974, Mob = "Musketeer Pirate", QuestName = "DeepForestIsland2", QuestLevel = 2},
    {LevelReq = 1975, MaxLevel = 1999, Mob = "Reborn Skeleton", QuestName = "HauntedQuest1", QuestLevel = 1},
    {LevelReq = 2000, MaxLevel = 2024, Mob = "Living Zombie", QuestName = "HauntedQuest1", QuestLevel = 2},
    {LevelReq = 2025, MaxLevel = 2049, Mob = "Demonic Soul", QuestName = "HauntedQuest2", QuestLevel = 1},
    {LevelReq = 2050, MaxLevel = 2074, Mob = "Posessed Mummy", QuestName = "HauntedQuest2", QuestLevel = 2},
    {LevelReq = 2075, MaxLevel = 2099, Mob = "Peanut Scout", QuestName = "NutsIslandQuest", QuestLevel = 1},
    {LevelReq = 2100, MaxLevel = 2124, Mob = "Peanut President", QuestName = "NutsIslandQuest", QuestLevel = 2},
    {LevelReq = 2125, MaxLevel = 2149, Mob = "Ice Cream Chef", QuestName = "IceCreamIslandQuest", QuestLevel = 1},
    {LevelReq = 2150, MaxLevel = 2199, Mob = "Ice Cream Commander", QuestName = "IceCreamIslandQuest", QuestLevel = 2},
    {LevelReq = 2200, MaxLevel = 2224, Mob = "Cookie Crafter", QuestName = "CakeQuest1", QuestLevel = 1},
    {LevelReq = 2225, MaxLevel = 2249, Mob = "Cake Guard", QuestName = "CakeQuest1", QuestLevel = 2},
    {LevelReq = 2250, MaxLevel = 2274, Mob = "Baking Staff", QuestName = "CakeQuest2", QuestLevel = 1},
    {LevelReq = 2275, MaxLevel = 2299, Mob = "Head Baker", QuestName = "CakeQuest2", QuestLevel = 2},
    {LevelReq = 2300, MaxLevel = 2324, Mob = "Cocoa Warrior", QuestName = "ChocQuest1", QuestLevel = 1},
    {LevelReq = 2325, MaxLevel = 2349, Mob = "Chocolate Bar Battler", QuestName = "ChocQuest1", QuestLevel = 2},
    {LevelReq = 2350, MaxLevel = 2374, Mob = "Sweet Thief", QuestName = "ChocQuest2", QuestLevel = 1},
    {LevelReq = 2375, MaxLevel = 2400, Mob = "Candy Rebel", QuestName = "ChocQuest2", QuestLevel = 2},
    {LevelReq = 2400, MaxLevel = 2424, Mob = "Candy Pirate", QuestName = "CandyQuest1", QuestLevel = 1},
    {LevelReq = 2425, MaxLevel = 2449, Mob = "Snow Demon", QuestName = "CandyQuest1", QuestLevel = 2},
    {LevelReq = 2450, MaxLevel = 2474, Mob = "Isle Outlaw", QuestName = "TikiQuest1", QuestLevel = 1},
    {LevelReq = 2475, MaxLevel = 2499, Mob = "Island Boy", QuestName = "TikiQuest1", QuestLevel = 2},
    {LevelReq = 2500, MaxLevel = 2524, Mob = "Sun-kissed Warrior", QuestName = "TikiQuest2", QuestLevel = 1},
    {LevelReq = 2525, MaxLevel = 2549, Mob = "Isle Champion", QuestName = "TikiQuest2", QuestLevel = 2},
    {LevelReq = 2550, MaxLevel = 2574, Mob = "Serpent Hunter", QuestName = "TikiQuest3", QuestLevel = 1},
    {LevelReq = 2575, MaxLevel = 2600, Mob = "Skull Slayer", QuestName = "TikiQuest3", QuestLevel = 2},
}

-- Quest NPC positions for each quest giver
local QuestPositions = {
    Sea1 = {
        JungleQuest = CFrame.new(-1601.6, 36.9, 153.1),
        BuggyQuest1 = CFrame.new(-1141.5, 4.7, 3852.6),
        DesertQuest = CFrame.new(894.5, 5.5, 2628.3),
        SnowQuest = CFrame.new(1383.3, 87.3, -1297.8),
        MarineQuest2 = CFrame.new(-2441.4, 73.1, -3216.7),
        SkyQuest = CFrame.new(-4720.7, 852.4, -1952.7),
        PrisonerQuest = CFrame.new(5074.6, 25.2, 48.8),
        ColosseumQuest = CFrame.new(-157.4, 7.4, -44.6),
        MagmaQuest = CFrame.new(-5033.8, 28.7, -4823.4),
        FishmanQuest = CFrame.new(61122.7, 18.5, 1565.8),
        SkyExp1Quest = CFrame.new(-7861.1, 554.8, -321.7),
        SkyExp2Quest = CFrame.new(-7902.7, 554.8, -558.4),
        FountainQuest = CFrame.new(-115.1, 91.2, -11727.1),
    },
    Sea2 = {
        Area1Quest = CFrame.new(-429.2, 73.0, 2849.6),
        Area2Quest = CFrame.new(634.6, 73.4, 918.7),
        MarineQuest3 = CFrame.new(-2440.2, 73.2, -3217.0),
        ZombieQuest = CFrame.new(-5493.7, 48.6, -793.8),
        SnowMountainQuest = CFrame.new(5350.7, 681.4, -6264.9),
        IceSideQuest = CFrame.new(6059.5, 22.0, -1525.5),
        FireSideQuest = CFrame.new(-5431.5, 15.9, -5521.9),
        ShipQuest1 = CFrame.new(1034.7, 126.1, 3290.2),
        ShipQuest2 = CFrame.new(978.5, 126.1, 3312.5),
        FrostQuest = CFrame.new(5669.6, 28.4, 6494.4),
        ForgottenQuest = CFrame.new(-3046.9, 238.4, -3313.8),
    },
    Sea3 = {
        PiratePortQuest = CFrame.new(-289.6, 43.2, 5583.5),
        DragonCrewQuest = CFrame.new(5782.5, 782.1, -403.1),
        VenomCrewQuest = CFrame.new(-10382.6, 389.8, -914.0),
        MarineTreeIsland = CFrame.new(2178.3, 28.7, -6738.6),
        DeepForestIsland3 = CFrame.new(-10519.4, 331.0, -8751.6),
        DeepForestIsland = CFrame.new(-10436.0, 331.5, -8554.1),
        DeepForestIsland2 = CFrame.new(-12681.2, 390.0, -9902.2),
        HauntedQuest1 = CFrame.new(-9514.7, 6.6, 6.0),
        HauntedQuest2 = CFrame.new(-9513.2, 6.6, 6.1),
        NutsIslandQuest = CFrame.new(-10601.8, 14.7, -9313.7),
        IceCreamIslandQuest = CFrame.new(-689.9, 84.7, 10967.7),
        CakeQuest1 = CFrame.new(-2022.7, 37.8, -12022.6),
        CakeQuest2 = CFrame.new(-1885.1, 41.7, -12210.9),
        ChocQuest1 = CFrame.new(209.4, 38.0, -12137.5),
        ChocQuest2 = CFrame.new(146.4, 38.0, -12251.0),
        CandyQuest1 = CFrame.new(-1158.1, 12.1, -14438.2),
        TikiQuest1 = CFrame.new(-16545.5, 11.8, 1.2),
        TikiQuest2 = CFrame.new(-16544.8, 36.1, 6.4),
        TikiQuest3 = CFrame.new(-16880.0, 14.3, 760.4),
    },
}

-- Dungeon entrance calls
local DungeonEntrances = {
    ["Fishman Cave"] = function() game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(61122.7, 18.5, 1565.8)) end,
    ["Sky Island"] = function() game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(-4720.7, 852.4, -1952.7)) end,
    ["Ship"] = function() game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(921.5, 126.1, 32900.3)) end,
    ["Frozen Dimension"] = function() game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(-6059.7, 15.0, -1535.4)) end,
}

-- Get current quest data based on level and sea
local CurrentFarmMob = nil
function GetCurrentQuestData()
    local level = GetLocalLevel()
    local seaKey = "Sea" .. Sea
    local data = QuestData[seaKey]
    if not data then return nil end
    for _, q in pairs(data) do
        if level >= q.LevelReq and level <= q.MaxLevel then
            CurrentFarmMob = q.Mob
            return q
        end
    end
    -- Return last quest if level exceeds max
    CurrentFarmMob = data[#data].Mob
    return data[#data]
end

--=============================================================================
-- BOSS DATA
--=============================================================================
local BossData = {
    Sea1 = {
        {Name = "The Gorilla King", Level = 25, Position = CFrame.new(-1238.6, 18.0, -4022.3)},
        {Name = "Bobby", Level = 55, Position = CFrame.new(493.2, 26.5, -25.3)},
        {Name = "The Saw", Level = 100, Position = CFrame.new(783.6, 34.2, -198.1)},
        {Name = "Yeti", Level = 110, Position = CFrame.new(1086.2, 20.4, -1247.4)},
        {Name = "Vice Admiral", Level = 150, Position = CFrame.new(-4850.3, 21.7, -833.2)},
        {Name = "Warden", Level = 200, Position = CFrame.new(5161.0, 25.0, 72.0)},
        {Name = "Chief Warden", Level = 210, Position = CFrame.new(5161.0, 25.0, 72.0)},
        {Name = "Swan", Level = 240, Position = CFrame.new(2263.1, 24.8, -6567.3)},
        {Name = "Magma Admiral", Level = 350, Position = CFrame.new(-5312.5, 16.5, -5951.8)},
        {Name = "Fishman Lord", Level = 425, Position = CFrame.new(61372.6, 18.4, 1124.7)},
        {Name = "Wysper", Level = 500, Position = CFrame.new(-7721.6, 484.4, -450.2)},
        {Name = "Thunder God", Level = 575, Position = CFrame.new(-11447.1, 885.7, -6388.4)},
        {Name = "Cyborg", Level = 675, Position = CFrame.new(6166.1, 332.1, -530.4)},
    },
    Sea2 = {
        {Name = "Diamond", Level = 750, Position = CFrame.new(1748.1, 24.7, -6215.8)},
        {Name = "Jeremy", Level = 850, Position = CFrame.new(-2911.6, 4.6, -8261.8)},
        {Name = "Fajita", Level = 935, Position = CFrame.new(-124.6, 23.9, 13449.5)},
        {Name = "Don Swan", Level = 1000, Position = CFrame.new(2276.0, 16.0, -8957.1)},
        {Name = "Smoke Admiral", Level = 1100, Position = CFrame.new(-4486.0, 28.3, -7087.9)},
        {Name = "Awakened Ice Admiral", Level = 1250, Position = CFrame.new(1483.5, 115.4, -6398.5)},
        {Name = "Tide Keeper", Level = 1325, Position = CFrame.new(-7242.6, 7.6, -2503.8)},
        {Name = "Darkbeard", Level = 1500, Position = CFrame.new(3810.0, 5.1, -1925.0)},
    },
    Sea3 = {
        {Name = "Cursed Captain", Level = 1325, Position = CFrame.new(923.1, 38.4, -12551.8)},
        {Name = "Stone", Level = 1550, Position = CFrame.new(-662.7, 18.8, 12310.1)},
        {Name = "Hydra Leader", Level = 1575, Position = CFrame.new(5842.4, 291.7, -169.2)},
        {Name = "Kilo Admiral", Level = 1700, Position = CFrame.new(2677.8, 22.3, -7347.7)},
        {Name = "Captain Elephant", Level = 1875, Position = CFrame.new(-13217.2, 390.9, -9843.1)},
        {Name = "Beautiful Pirate", Level = 1950, Position = CFrame.new(-12556.7, 335.4, -7641.5)},
        {Name = "Cake Queen", Level = 2175, Position = CFrame.new(-1884.6, 55.9, -12574.5)},
        {Name = "Longma", Level = 2300, Position = CFrame.new(-12359.3, 331.2, -8596.9)},
        {Name = "Soul Reaper", Level = 2100, Position = CFrame.new(-9516.0, 6.1, 2.5)},
        {Name = "rip_indra True Form", Level = 2400, Position = CFrame.new(-12355.2, 331.3, -8975.7)},
    },
}

--=============================================================================
-- TELEPORT DATA (ISLANDS)
--=============================================================================
local TeleportIslands = {
    Sea1 = {
        "Pirate Village", "Jungle", "Marine Fortress", "Desert", "Snow Mountain",
        "Skylands", "Prison", "Colosseum", "Magma Village", "Underwater City",
        "Upper Skylands", "Skylands Port", "Fountain City", "Shell's Town",
    },
    Sea2 = {
        "The Cafe", "Kingdom of Rose", "Green Zone", "Graveyard", "Snow Mountain",
        "Mansion", "Ice Castle", "Fire Factory", "Colosseum", "Floating Turtle",
        "Hydra Island", "Great Tree", "Castle on the Sea", "Sea of Treats",
    },
    Sea3 = {
        "Port Town", "Hydra Island", "Great Tree", "Peanut Island", "Ice Cream Island",
        "Cake Island", "Chocolate Island", "Candy Island", "Tiki Outpost", "Mansion",
        "Ghost Ship", "Sea Beast Lair", "Tiki Island", "Mystic Island",
    },
}

local IslandPositions = {
    Sea1 = {
        ["Pirate Village"] = CFrame.new(923.5, 16.9, 4326.8),
        ["Jungle"] = CFrame.new(-1048.9, 3.8, 33.4),
        ["Marine Fortress"] = CFrame.new(-2442.6, 73.1, -3217.4),
        ["Desert"] = CFrame.new(926.1, 6.5, 4371.8),
        ["Snow Mountain"] = CFrame.new(1200.8, 38.5, -1444.2),
        ["Skylands"] = CFrame.new(-4906.1, 791.3, -2667.4),
        ["Prison"] = CFrame.new(4867.4, 5.7, 816.2),
        ["Colosseum"] = CFrame.new(-160.3, 7.1, -11.8),
        ["Magma Village"] = CFrame.new(-5243.9, 12.2, -8534.6),
        ["Underwater City"] = CFrame.new(61163.9, 11.8, 1819.1),
        ["Upper Skylands"] = CFrame.new(-7768.2, 798.7, -2421.3),
        ["Skylands Port"] = CFrame.new(-7902.4, 554.0, -559.7),
        ["Fountain City"] = CFrame.new(107.2, 5.0, 11685.7),
        ["Shell's Town"] = CFrame.new(2948.1, 5.6, -2251.4),
    },
    Sea2 = {
        ["The Cafe"] = CFrame.new(-380.4, 16.8, 222.1),
        ["Kingdom of Rose"] = CFrame.new(-1225.3, 13.0, -3915.9),
        ["Green Zone"] = CFrame.new(-2442.5, 73.1, -3216.5),
        ["Graveyard"] = CFrame.new(-5444.7, 81.6, -755.1),
        ["Snow Mountain"] = CFrame.new(5355.7, 681.4, -6265.3),
        ["Mansion"] = CFrame.new(-12471.1, 374.6, -5966.0),
        ["Ice Castle"] = CFrame.new(6402.3, 341.3, -6978.1),
        ["Fire Factory"] = CFrame.new(6517.8, 7.5, -229.7),
        ["Colosseum"] = CFrame.new(-158.3, 6.6, -7.4),
        ["Floating Turtle"] = CFrame.new(-4970.1, 714.8, -2802.1),
        ["Hydra Island"] = CFrame.new(-4916.3, 335.9, -7434.4),
        ["Great Tree"] = CFrame.new(2076.7, 25.4, -3909.7),
        ["Castle on the Sea"] = CFrame.new(-12463.1, 378.2, -5889.2),
        ["Sea of Treats"] = CFrame.new(860.4, 84.3, 10979.7),
    },
    Sea3 = {
        ["Port Town"] = CFrame.new(-290.5, 42.8, 5354.2),
        ["Hydra Island"] = CFrame.new(5749.3, 609.1, -286.7),
        ["Great Tree"] = CFrame.new(2066.4, 28.7, -6586.4),
        ["Peanut Island"] = CFrame.new(-10143.1, 14.7, -9282.2),
        ["Ice Cream Island"] = CFrame.new(-714.2, 84.1, 10981.2),
        ["Cake Island"] = CFrame.new(-1884.4, 16.8, -12256.7),
        ["Chocolate Island"] = CFrame.new(243.8, 37.8, -12316.7),
        ["Candy Island"] = CFrame.new(-1148.9, 12.1, -14438.9),
        ["Tiki Outpost"] = CFrame.new(-16545.3, 11.8, 2.1),
        ["Mansion"] = CFrame.new(-12471.5, 374.2, -5965.1),
        ["Ghost Ship"] = CFrame.new(923.1, 38.3, -12551.1),
        ["Sea Beast Lair"] = CFrame.new(2126.8, 18.8, 5422.9),
        ["Tiki Island"] = CFrame.new(-17083.8, 34.2, 3923.1),
        ["Mystic Island"] = CFrame.new(-14000.5, 318.7, -9500.2),
    },
}

--=============================================================================
-- MATERIAL DATA
--=============================================================================
local MaterialData = {
    Sea1 = {
        {Name = "Angel Wings", Mob = "Dark Master", Position = CFrame.new(-6777.1, 3.4, -2567.4)},
        {Name = "Leather", Mob = "Brute", Position = CFrame.new(-1142.1, 14.2, 4357.1)},
        {Name = "Scrap Metal", Mob = "Pirate", Position = CFrame.new(-716.8, 5.2, 2153.3)},
        {Name = "Fish Tail", Mob = "Fishman Warrior", Position = CFrame.new(61122.7, 18.5, 1565.8)},
        {Name = "Magma Ore", Mob = "Military Spy", Position = CFrame.new(-5312.5, 16.5, -5951.8)},
        {Name = "Dragon Scale", Mob = "Shanda", Position = CFrame.new(-7861.1, 554.8, -321.7)},
        {Name = "Conjured Cocoa", Mob = "Royal Soldier", Position = CFrame.new(-7902.7, 554.8, -558.4)},
    },
    Sea2 = {
        {Name = "Demonic Wisp", Mob = "Vampire", Position = CFrame.new(-5511.6, 48.6, -795.1)},
        {Name = "Mystic Droplet", Mob = "Water Fighter", Position = CFrame.new(-3046.9, 238.4, -3313.8)},
        {Name = "Electric Wing", Mob = "Marine Captain", Position = CFrame.new(-2440.2, 73.2, -3217.0)},
        {Name = "Candle Fragment", Mob = "Zombie", Position = CFrame.new(-5493.7, 48.6, -793.8)},
        {Name = "Venomous Fang", Mob = "Arctic Warrior", Position = CFrame.new(5669.6, 28.4, 6494.4)},
        {Name = "Frozen Fang", Mob = "Snow Lurker", Position = CFrame.new(5669.6, 28.4, 6494.4)},
    },
    Sea3 = {
        {Name = "Radioactive Material", Mob = "Pistol Billionaire", Position = CFrame.new(-289.6, 43.2, 5583.5)},
        {Name = "Magnetic Ore", Mob = "Jungle Pirate", Position = CFrame.new(-12681.2, 390.0, -9902.2)},
        {Name = "Aurora Oil", Mob = "Ice Cream Commander", Position = CFrame.new(-714.2, 84.1, 10981.2)},
        {Name = "Green Crystal", Mob = "Dragon Crew Archer", Position = CFrame.new(5782.5, 782.1, -403.1)},
        {Name = "Colosseum Fragment", Mob = "Musketeer Pirate", Position = CFrame.new(-12681.2, 390.0, -9902.2)},
        {Name = "Ectoplasm", Mob = "Living Zombie", Position = CFrame.new(-9514.7, 6.6, 6.0)},
    },
}

--=============================================================================
-- SETTINGS TABLE
--=============================================================================
local Settings = {
    AutoFarm = false,
    AutoFarmNearest = false,
    AutoBoss = false,
    SelectedBoss = "",
    BringMob = true,
    FastAttack = false,
    AutoBuso = true,
    AutoStats = false,
    StatPriority = "Melee",
    StatPoints = 1,
    AutoChest = false,
    AutoLootFruit = false,
    FruitESP = false,
    WalkSpeed = 16,
    JumpPower = 50,
    NoClip = false,
    AntiAFK = true,
    -- ESP
    PlayerESP = false,
    ChestESP = false,
    MobESP = false,
    SeaBeastESP = false,
    IslandESP = false,
    MirageESP = false,
    FlowerESP = false,
    DevilFruitESP = false,
    -- Sea
    AutoFactory = false,
    AutoGhostShip = false,
    AutoAdvance = false,
    -- Material
    AutoMaterial = false,
    SelectedMaterial = "",
    -- Bot Detection
    AutoDetectBots = true,
    AvoidBots = false,
    FarmNearBots = false,
    FastAttackRate = 1,
}

-- Bot Detection System
local DetectedBots = {}
local PlayerTrackData = {}

--=============================================================================
-- BUILD GUI
--=============================================================================
local QuackHub = {}

-- ScreenGui
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "QuackHub"
ScreenGui.ResetOnSpawn = false
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
ScreenGui.Parent = game:GetService("CoreGui")

-- Main Frame
local MainFrame = Instance.new("Frame")
MainFrame.Name = "MainFrame"
MainFrame.Size = UDim2.new(0, 650, 0, 420)
MainFrame.Position = UDim2.new(0.5, -325, 0.5, -210)
MainFrame.BackgroundColor3 = Color3.fromRGB(26, 26, 26)
MainFrame.BorderSizePixel = 0
MainFrame.ClipsDescendants = true
MainFrame.Parent = ScreenGui

local MainCorner = Instance.new("UICorner")
MainCorner.CornerRadius = UDim.new(0, 8)
MainCorner.Parent = MainFrame

local MainStroke = Instance.new("UIStroke")
MainStroke.Color = Color3.fromRGB(50, 50, 50)
MainStroke.Thickness = 1
MainStroke.Parent = MainFrame

-- Header / Title Bar
local HeaderBar = Instance.new("Frame")
HeaderBar.Name = "HeaderBar"
HeaderBar.Size = UDim2.new(1, 0, 0, 35)
HeaderBar.BackgroundColor3 = Color3.fromRGB(18, 18, 18)
HeaderBar.BorderSizePixel = 0
HeaderBar.Parent = MainFrame

local HeaderCorner = Instance.new("UICorner")
HeaderCorner.CornerRadius = UDim.new(0, 8)
HeaderCorner.Parent = HeaderBar

-- Fix bottom corners of header
local HeaderFix = Instance.new("Frame")
HeaderFix.Size = UDim2.new(1, 0, 0, 10)
HeaderFix.Position = UDim2.new(0, 0, 1, -10)
HeaderFix.BackgroundColor3 = Color3.fromRGB(18, 18, 18)
HeaderFix.BorderSizePixel = 0
HeaderFix.Parent = HeaderBar

local TitleLabel = Instance.new("TextLabel")
TitleLabel.Name = "TitleLabel"
TitleLabel.Size = UDim2.new(0, 300, 1, 0)
TitleLabel.Position = UDim2.new(0, 12, 0, 0)
TitleLabel.BackgroundTransparency = 1
TitleLabel.Text = "🦆 Quack Hub: Blox Fruits"
TitleLabel.TextColor3 = Color3.fromRGB(0, 255, 0)
TitleLabel.TextSize = 14
TitleLabel.Font = Enum.Font.GothamBold
TitleLabel.TextXAlignment = Enum.TextXAlignment.Left
TitleLabel.Parent = HeaderBar

local SeaLabel = Instance.new("TextLabel")
SeaLabel.Name = "SeaLabel"
SeaLabel.Size = UDim2.new(0, 120, 1, 0)
SeaLabel.Position = UDim2.new(0, 310, 0, 0)
SeaLabel.BackgroundTransparency = 1
SeaLabel.Text = "[ " .. GetSeaName() .. " | Lv." .. GetLocalLevel() .. " ]"
SeaLabel.TextColor3 = Color3.fromRGB(180, 180, 180)
SeaLabel.TextSize = 12
SeaLabel.Font = Enum.Font.Gotham
SeaLabel.TextXAlignment = Enum.TextXAlignment.Left
SeaLabel.Parent = HeaderBar

local CloseBtn = Instance.new("TextButton")
CloseBtn.Name = "CloseBtn"
CloseBtn.Size = UDim2.new(0, 30, 0, 25)
CloseBtn.Position = UDim2.new(1, -38, 0, 5)
CloseBtn.BackgroundColor3 = Color3.fromRGB(255, 50, 50)
CloseBtn.BorderSizePixel = 0
CloseBtn.Text = "X"
CloseBtn.TextColor3 = Color3.new(1, 1, 1)
CloseBtn.TextSize = 12
CloseBtn.Font = Enum.Font.GothamBold
CloseBtn.Parent = HeaderBar

local CloseCorner = Instance.new("UICorner")
CloseCorner.CornerRadius = UDim.new(0, 4)
CloseCorner.Parent = CloseBtn

local MinimizeBtn = Instance.new("TextButton")
MinimizeBtn.Name = "MinimizeBtn"
MinimizeBtn.Size = UDim2.new(0, 30, 0, 25)
MinimizeBtn.Position = UDim2.new(1, -72, 0, 5)
MinimizeBtn.BackgroundColor3 = Color3.fromRGB(255, 165, 0)
MinimizeBtn.BorderSizePixel = 0
MinimizeBtn.Text = "—"
MinimizeBtn.TextColor3 = Color3.new(1, 1, 1)
MinimizeBtn.TextSize = 12
MinimizeBtn.Font = Enum.Font.GothamBold
MinimizeBtn.Parent = HeaderBar

local MinCorner = Instance.new("UICorner")
MinCorner.CornerRadius = UDim.new(0, 4)
MinCorner.Parent = MinimizeBtn

-- Content Frame (sidebar + pages)
local ContentFrame = Instance.new("Frame")
ContentFrame.Name = "ContentFrame"
ContentFrame.Size = UDim2.new(1, 0, 1, -35)
ContentFrame.Position = UDim2.new(0, 0, 0, 35)
ContentFrame.BackgroundTransparency = 1
ContentFrame.Parent = MainFrame

--=============================================================================
-- SIDEBAR
--=============================================================================
local Sidebar = Instance.new("Frame")
Sidebar.Name = "Sidebar"
Sidebar.Size = UDim2.new(0, 120, 1, 0)
Sidebar.BackgroundColor3 = Color3.fromRGB(18, 18, 18)
Sidebar.BorderSizePixel = 0
Sidebar.Parent = ContentFrame

local SidebarCorner = Instance.new("UICorner")
SidebarCorner.CornerRadius = UDim.new(0, 6)
SidebarCorner.Parent = Sidebar

local SidebarLayout = Instance.new("UIListLayout")
SidebarLayout.Padding = UDim.new(0, 2)
SidebarLayout.SortOrder = Enum.SortOrder.LayoutOrder
SidebarLayout.Parent = Sidebar

local SidebarPadding = Instance.new("UIPadding")
SidebarPadding.PaddingTop = UDim.new(0, 4)
SidebarPadding.PaddingBottom = UDim.new(0, 4)
SidebarPadding.Parent = Sidebar

local TabButtons = {}
local TabPages = {}

local TabData = {
    {Name = "Farm", Icon = "⚔", Order = 1},
    {Name = "Boss", Icon = "👑", Order = 2},
    {Name = "Stats", Icon = "📊", Order = 3},
    {Name = "Items", Icon = "📦", Order = 4},
    {Name = "Fruit", Icon = "🍇", Order = 5},
    {Name = "Teleport", Icon = "📍", Order = 6},
    {Name = "ESP", Icon = "👁", Order = 7},
    {Name = "Sea", Icon = "🌊", Order = 8},
    {Name = "Misc", Icon = "⚙", Order = 9},
}

-- Bot Detection Panel (special section in sidebar bottom)
local BotPanel = Instance.new("Frame")
BotPanel.Name = "BotPanel"
BotPanel.Size = UDim2.new(0, 120, 0, 80)
BotPanel.BackgroundColor3 = Color3.fromRGB(12, 12, 12)
BotPanel.BorderSizePixel = 0
BotPanel.LayoutOrder = 100
BotPanel.Parent = Sidebar

local BotPanelCorner = Instance.new("UICorner")
BotPanelCorner.CornerRadius = UDim.new(0, 4)
BotPanelCorner.Parent = BotPanel

local BotPanelLabel = Instance.new("TextLabel")
BotPanelLabel.Size = UDim2.new(1, 0, 0, 18)
BotPanelLabel.BackgroundTransparency = 1
BotPanelLabel.Text = "🤖 Bot Scan"
BotPanelLabel.TextColor3 = Color3.fromRGB(0, 255, 0)
BotPanelLabel.TextSize = 10
BotPanelLabel.Font = Enum.Font.GothamBold
BotPanelLabel.Parent = BotPanel

local BotCountLabel = Instance.new("TextLabel")
BotCountLabel.Name = "BotCountLabel"
BotCountLabel.Size = UDim2.new(1, -8, 0, 14)
BotCountLabel.Position = UDim2.new(0, 4, 0, 18)
BotCountLabel.BackgroundTransparency = 1
BotCountLabel.Text = "Bots: 0"
BotCountLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
BotCountLabel.TextSize = 9
BotPanelLabel.Font = Enum.Font.Gotham
BotCountLabel.TextXAlignment = Enum.TextXAlignment.Left
BotCountLabel.Parent = BotPanel

local BotAvoidToggle = CreateMiniToggle(BotPanel, "Tránh Bot", 0, 34, function(v) Settings.AvoidBots = v end)
local BotFarmToggle = CreateMiniToggle(BotPanel, "Farm Gần Bot", 0, 56, function(v) Settings.FarmNearBots = v end)

function CreateMiniToggle(parent, label, x, y, callback)
    local frame = Instance.new("Frame")
    frame.Size = UDim2.new(0, 116, 0, 18)
    frame.Position = UDim2.new(0, 2, 0, y)
    frame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    frame.Parent = parent

    local lbl = Instance.new("TextLabel")
    lbl.Size = UDim2.new(0, 76, 1, 0)
    lbl.Position = UDim2.new(0, 4, 0, 0)
    lbl.BackgroundTransparency = 1
    lbl.Text = label
    lbl.TextColor3 = Color3.fromRGB(180, 180, 180)
    lbl.TextSize = 8
    lbl.Font = Enum.Font.Gotham
    lbl.TextXAlignment = Enum.TextXAlignment.Left
    lbl.Parent = frame

    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(0, 28, 0, 14)
    btn.Position = UDim2.new(1, -32, 0.5, -7)
    btn.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
    btn.Text = ""
    btn.BorderSizePixel = 0
    btn.Parent = frame

    local btnCorner = Instance.new("UICorner")
    btnCorner.CornerRadius = UDim.new(0, 7)
    btnCorner.Parent = btn

    local indicator = Instance.new("Frame")
    indicator.Size = UDim2.new(0, 12, 0, 12)
    indicator.Position = UDim2.new(0, 1, 0.5, -6)
    indicator.BackgroundColor3 = Color3.fromRGB(150, 150, 150)
    indicator.BorderSizePixel = 0
    indicator.Parent = btn

    local indCorner = Instance.new("UICorner")
    indCorner.CornerRadius = UDim.new(0, 6)
    indCorner.Parent = indicator

    local toggled = false
    btn.MouseButton1Click:Connect(function()
        toggled = not toggled
        if toggled then
            TweenService:Create(btn, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(0, 180, 0)}):Play()
            TweenService:Create(indicator, TweenInfo.new(0.2), {Position = UDim2.new(0, 15, 0.5, -6), BackgroundColor3 = Color3.new(1, 1, 1)}):Play()
        else
            TweenService:Create(btn, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(60, 60, 60)}):Play()
            TweenService:Create(indicator, TweenInfo.new(0.2), {Position = UDim2.new(0, 1, 0.5, -6), BackgroundColor3 = Color3.fromRGB(150, 150, 150)}):Play()
        end
        callback(toggled)
    end)
    return btn
end

-- Build sidebar buttons
for _, tab in pairs(TabData) do
    local btn = Instance.new("TextButton")
    btn.Name = tab.Name .. "Tab"
    btn.Size = UDim2.new(1, -8, 0, 34)
    btn.Position = UDim2.new(0, 4, 0, 0)
    btn.BackgroundColor3 = Color3.fromRGB(18, 18, 18)
    btn.BorderSizePixel = 0
    btn.Text = tab.Icon .. " " .. tab.Name
    btn.TextColor3 = Color3.fromRGB(160, 160, 160)
    btn.TextSize = 11
    btn.Font = Enum.Font.Gotham
    btn.LayoutOrder = tab.Order
    btn.Parent = Sidebar

    local btnCorner = Instance.new("UICorner")
    btnCorner.CornerRadius = UDim.new(0, 5)
    btnCorner.Parent = btn

    TabButtons[tab.Name] = btn

    btn.MouseButton1Click:Connect(function()
        for name, b in pairs(TabButtons) do
            TweenService:Create(b, TweenInfo.new(0.15), {BackgroundColor3 = Color3.fromRGB(18, 18, 18), TextColor3 = Color3.fromRGB(160, 160, 160)}):Play()
        end
        TweenService:Create(btn, TweenInfo.new(0.15), {BackgroundColor3 = Color3.fromRGB(0, 100, 0), TextColor3 = Color3.fromRGB(0, 255, 0)}):Play()
        for name, page in pairs(TabPages) do
            page.Visible = (name == tab.Name)
        end
    end)
end

-- Pages Container
local PagesContainer = Instance.new("Frame")
PagesContainer.Name = "PagesContainer"
PagesContainer.Size = UDim2.new(1, -124, 1, 0)
PagesContainer.Position = UDim2.new(0, 124, 0, 0)
PagesContainer.BackgroundTransparency = 1
PagesContainer.ClipsDescendants = true
PagesContainer.Parent = ContentFrame

--=============================================================================
-- GUI HELPER FUNCTIONS
--=============================================================================
function CreateScrollFrame(parent, name)
    local scroll = Instance.new("ScrollingFrame")
    scroll.Name = name or "ScrollFrame"
    scroll.Size = UDim2.new(1, -12, 1, -8)
    scroll.Position = UDim2.new(0, 6, 0, 4)
    scroll.BackgroundTransparency = 1
    scroll.ScrollBarThickness = 4
    scroll.ScrollBarImageColor3 = Color3.fromRGB(0, 255, 0)
    scroll.BorderSizePixel = 0
    scroll.AutomaticCanvasSize = Enum.AutomaticSize.Y
    scroll.CanvasSize = UDim2.new(0, 0, 0, 0)
    scroll.Parent = parent

    local listLayout = Instance.new("UIListLayout")
    listLayout.Padding = UDim.new(0, 6)
    listLayout.SortOrder = Enum.SortOrder.LayoutOrder
    listLayout.Parent = scroll

    return scroll
end

function CreateSection(parent, title, order)
    local section = Instance.new("Frame")
    section.Name = title
    section.Size = UDim2.new(1, 0, 0, 30)
    section.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    section.BorderSizePixel = 0
    section.LayoutOrder = order or 1
    section.AutomaticSize = Enum.AutomaticSize.Y
    section.Parent = parent

    local secCorner = Instance.new("UICorner")
    secCorner.CornerRadius = UDim.new(0, 6)
    secCorner.Parent = section

    local header = Instance.new("Frame")
    header.Name = "Header"
    header.Size = UDim2.new(1, 0, 0, 28)
    header.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
    header.BorderSizePixel = 0
    header.Parent = section

    local hCorner = Instance.new("UICorner")
    hCorner.CornerRadius = UDim.new(0, 6)
    hCorner.Parent = header

    local hLabel = Instance.new("TextLabel")
    hLabel.Size = UDim2.new(1, -30, 1, 0)
    hLabel.Position = UDim2.new(0, 10, 0, 0)
    hLabel.BackgroundTransparency = 1
    hLabel.Text = "▸ " .. title
    hLabel.TextColor3 = Color3.fromRGB(0, 255, 0)
    hLabel.TextSize = 12
    hLabel.Font = Enum.Font.GothamBold
    hLabel.TextXAlignment = Enum.TextXAlignment.Left
    hLabel.Parent = header

    local contentFrame = Instance.new("Frame")
    contentFrame.Name = "Content"
    contentFrame.Size = UDim2.new(1, -12, 0, 0)
    contentFrame.Position = UDim2.new(0, 6, 0, 30)
    contentFrame.BackgroundTransparency = 1
    contentFrame.AutomaticSize = Enum.AutomaticSize.Y
    contentFrame.Parent = section

    local contentLayout = Instance.new("UIListLayout")
    contentLayout.Padding = UDim.new(0, 3)
    contentLayout.Parent = contentFrame

    local collapsed = false
    header.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            collapsed = not collapsed
            if collapsed then
                hLabel.Text = "▸ " .. title
                contentFrame.Visible = false
            else
                hLabel.Text = "▾ " .. title
                contentFrame.Visible = true
            end
            section.Size = UDim2.new(1, 0, 0, collapsed and 28 or 30)
            section.AutomaticSize = collapsed and Enum.AutomaticSize.None or Enum.AutomaticSize.Y
        end
    end)

    hLabel.Text = "▾ " .. title
    return contentFrame
end

function CreateToggle(parent, label, default, callback, order)
    local toggleFrame = Instance.new("Frame")
    toggleFrame.Size = UDim2.new(1, 0, 0, 26)
    toggleFrame.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
    toggleFrame.BorderSizePixel = 0
    toggleFrame.LayoutOrder = order or 1
    toggleFrame.Parent = parent

    local tCorner = Instance.new("UICorner")
    tCorner.CornerRadius = UDim.new(0, 4)
    tCorner.Parent = toggleFrame

    local tLabel = Instance.new("TextLabel")
    tLabel.Size = UDim2.new(0, 260, 1, 0)
    tLabel.Position = UDim2.new(0, 10, 0, 0)
    tLabel.BackgroundTransparency = 1
    tLabel.Text = label
    tLabel.TextColor3 = Color3.fromRGB(220, 220, 220)
    tLabel.TextSize = 11
    tLabel.Font = Enum.Font.Gotham
    tLabel.TextXAlignment = Enum.TextXAlignment.Left
    tLabel.Parent = toggleFrame

    local tBtn = Instance.new("TextButton")
    tBtn.Size = UDim2.new(0, 40, 0, 18)
    tBtn.Position = UDim2.new(1, -50, 0.5, -9)
    tBtn.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
    tBtn.Text = ""
    tBtn.BorderSizePixel = 0
    tBtn.Parent = toggleFrame

    local tBtnCorner = Instance.new("UICorner")
    tBtnCorner.CornerRadius = UDim.new(0, 9)
    tBtnCorner.Parent = tBtn

    local tInd = Instance.new("Frame")
    tInd.Size = UDim2.new(0, 14, 0, 14)
    tInd.Position = UDim2.new(0, 2, 0.5, -7)
    tInd.BackgroundColor3 = Color3.fromRGB(150, 150, 150)
    tInd.BorderSizePixel = 0
    tInd.Parent = tBtn

    local tIndCorner = Instance.new("UICorner")
    tIndCorner.CornerRadius = UDim.new(0, 7)
    tIndCorner.Parent = tInd

    local toggled = default or false
    if toggled then
        tBtn.BackgroundColor3 = Color3.fromRGB(0, 180, 0)
        tInd.Position = UDim2.new(0, 24, 0.5, -7)
        tInd.BackgroundColor3 = Color3.new(1, 1, 1)
    end

    tBtn.MouseButton1Click:Connect(function()
        toggled = not toggled
        if toggled then
            TweenService:Create(tBtn, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(0, 180, 0)}):Play()
            TweenService:Create(tInd, TweenInfo.new(0.2), {Position = UDim2.new(0, 24, 0.5, -7), BackgroundColor3 = Color3.new(1, 1, 1)}):Play()
        else
            TweenService:Create(tBtn, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(60, 60, 60)}):Play()
            TweenService:Create(tInd, TweenInfo.new(0.2), {Position = UDim2.new(0, 2, 0.5, -7), BackgroundColor3 = Color3.fromRGB(150, 150, 150)}):Play()
        end
        if callback then callback(toggled) end
    end)

    return toggleFrame, tBtn
end

function CreateButton(parent, label, callback, order)
    local btnFrame = Instance.new("TextButton")
    btnFrame.Size = UDim2.new(1, 0, 0, 28)
    btnFrame.BackgroundColor3 = Color3.fromRGB(0, 120, 0)
    btnFrame.BorderSizePixel = 0
    btnFrame.Text = label
    btnFrame.TextColor3 = Color3.new(1, 1, 1)
    btnFrame.TextSize = 11
    btnFrame.Font = Enum.Font.GothamBold
    btnFrame.LayoutOrder = order or 1
    btnFrame.Parent = parent

    local bCorner = Instance.new("UICorner")
    bCorner.CornerRadius = UDim.new(0, 4)
    bCorner.Parent = btnFrame

    btnFrame.MouseButton1Click:Connect(function()
        if callback then callback() end
    end)

    return btnFrame
end

function CreateDropdown(parent, label, options, defaultIdx, callback, order)
    local ddFrame = Instance.new("Frame")
    ddFrame.Size = UDim2.new(1, 0, 0, 42)
    ddFrame.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
    ddFrame.BorderSizePixel = 0
    ddFrame.LayoutOrder = order or 1
    ddFrame.Parent = parent

    local ddCorner = Instance.new("UICorner")
    ddCorner.CornerRadius = UDim.new(0, 4)
    ddCorner.Parent = ddFrame

    local ddLabel = Instance.new("TextLabel")
    ddLabel.Size = UDim2.new(1, -10, 0, 16)
    ddLabel.Position = UDim2.new(0, 10, 0, 2)
    ddLabel.BackgroundTransparency = 1
    ddLabel.Text = label
    ddLabel.TextColor3 = Color3.fromRGB(0, 255, 0)
    ddLabel.TextSize = 10
    ddLabel.Font = Enum.Font.GothamBold
    ddLabel.TextXAlignment = Enum.TextXAlignment.Left
    ddLabel.Parent = ddFrame

    local ddBtn = Instance.new("TextButton")
    ddBtn.Size = UDim2.new(1, -16, 0, 20)
    ddBtn.Position = UDim2.new(0, 8, 0, 19)
    ddBtn.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
    ddBtn.BorderSizePixel = 0
    ddBtn.Text = options[defaultIdx or 1] or "Select..."
    ddBtn.TextColor3 = Color3.fromRGB(220, 220, 220)
    ddBtn.TextSize = 10
    ddBtn.Font = Enum.Font.Gotham
    ddBtn.Parent = ddFrame

    local ddBtnCorner = Instance.new("UICorner")
    ddBtnCorner.CornerRadius = UDim.new(0, 3)
    ddBtnCorner.Parent = ddBtn

    local ddOpen = false
    local ddList = Instance.new("Frame")
    ddList.Size = UDim2.new(1, -16, 0, 0)
    ddList.Position = UDim2.new(0, 8, 1, -22)
    ddList.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    ddList.BorderSizePixel = 0
    ddList.Visible = false
    ddList.ClipsDescendants = true
    ddList.ZIndex = 10
    ddList.Parent = ddFrame

    local ddListCorner = Instance.new("UICorner")
    ddListCorner.CornerRadius = UDim.new(0, 3)
    ddListCorner.Parent = ddList

    local ddScroll = Instance.new("ScrollingFrame")
    ddScroll.Size = UDim2.new(1, -4, 1, -4)
    ddScroll.Position = UDim2.new(0, 2, 0, 2)
    ddScroll.BackgroundTransparency = 1
    ddScroll.ScrollBarThickness = 3
    ddScroll.AutomaticCanvasSize = Enum.AutomaticSize.Y
    ddScroll.ZIndex = 11
    ddScroll.Parent = ddList

    local ddListLayout = Instance.new("UIListLayout")
    ddListLayout.Padding = UDim.new(0, 1)
    ddListLayout.SortOrder = Enum.SortOrder.LayoutOrder
    ddListLayout.Parent = ddScroll

    for i, opt in pairs(options) do
        local optBtn = Instance.new("TextButton")
        optBtn.Size = UDim2.new(1, 0, 0, 20)
        optBtn.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
        optBtn.BorderSizePixel = 0
        optBtn.Text = opt
        optBtn.TextColor3 = Color3.fromRGB(220, 220, 220)
        optBtn.TextSize = 10
        optBtn.Font = Enum.Font.Gotham
        optBtn.LayoutOrder = i
        optBtn.ZIndex = 12
        optBtn.Parent = ddScroll

        optBtn.MouseButton1Click:Connect(function()
            ddBtn.Text = opt
            ddOpen = false
            ddList.Visible = false
            ddFrame.Size = UDim2.new(1, 0, 0, 42)
            if callback then callback(opt, i) end
        end)
    end

    ddBtn.MouseButton1Click:Connect(function()
        ddOpen = not ddOpen
        if ddOpen then
            ddList.Visible = true
            ddList.Size = UDim2.new(1, -16, 0, math.min(#options * 21, 150))
            ddFrame.Size = UDim2.new(1, 0, 0, 42 + math.min(#options * 21, 150))
        else
            ddList.Visible = false
            ddFrame.Size = UDim2.new(1, 0, 0, 42)
        end
    end)

    return ddFrame, ddBtn
end

function CreateSlider(parent, label, min, max, default, callback, order)
    local sFrame = Instance.new("Frame")
    sFrame.Size = UDim2.new(1, 0, 0, 38)
    sFrame.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
    sFrame.BorderSizePixel = 0
    sFrame.LayoutOrder = order or 1
    sFrame.Parent = parent

    local sCorner = Instance.new("UICorner")
    sCorner.CornerRadius = UDim.new(0, 4)
    sCorner.Parent = sFrame

    local sLabel = Instance.new("TextLabel")
    sLabel.Size = UDim2.new(0.5, -10, 0, 16)
    sLabel.Position = UDim2.new(0, 10, 0, 2)
    sLabel.BackgroundTransparency = 1
    sLabel.Text = label
    sLabel.TextColor3 = Color3.fromRGB(0, 255, 0)
    sLabel.TextSize = 10
    sLabel.Font = Enum.Font.GothamBold
    sLabel.TextXAlignment = Enum.TextXAlignment.Left
    sLabel.Parent = sFrame

    local sValLabel = Instance.new("TextLabel")
    sValLabel.Size = UDim2.new(0.3, -10, 0, 16)
    sValLabel.Position = UDim2.new(0.65, 0, 0, 2)
    sValLabel.BackgroundTransparency = 1
    sValLabel.Text = tostring(default)
    sValLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    sValLabel.TextSize = 10
    sValLabel.Font = Enum.Font.Gotham
    sValLabel.TextXAlignment = Enum.TextXAlignment.Right
    sValLabel.Parent = sFrame

    local sBarBg = Instance.new("Frame")
    sBarBg.Size = UDim2.new(1, -20, 0, 12)
    sBarBg.Position = UDim2.new(0, 10, 0, 22)
    sBarBg.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
    sBarBg.BorderSizePixel = 0
    sBarBg.Parent = sFrame

    local sBarCorner = Instance.new("UICorner")
    sBarCorner.CornerRadius = UDim.new(0, 6)
    sBarCorner.Parent = sBarBg

    local percent = (default - min) / (max - min)
    local sBarFill = Instance.new("Frame")
    sBarFill.Size = UDim2.new(percent, 0, 1, 0)
    sBarFill.BackgroundColor3 = Color3.fromRGB(0, 200, 0)
    sBarFill.BorderSizePixel = 0
    sBarFill.Parent = sBarBg

    local sFillCorner = Instance.new("UICorner")
    sFillCorner.CornerRadius = UDim.new(0, 6)
    sFillCorner.Parent = sBarFill

    local dragging = false
    sBarBg.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            dragging = true
        end
    end)

    sBarBg.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            dragging = false
        end
    end)

    UserInputService.InputChanged:Connect(function(input)
        if dragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
            local relX = math.clamp((input.Position.X - sBarBg.AbsolutePosition.X) / sBarBg.AbsoluteSize.X, 0, 1)
            local val = math.floor(min + (max - min) * relX)
            sBarFill.Size = UDim2.new(relX, 0, 1, 0)
            sValLabel.Text = tostring(val)
            if callback then callback(val) end
        end
    end)

    return sFrame
end

function CreateLabel(parent, text, order)
    local lFrame = Instance.new("Frame")
    lFrame.Size = UDim2.new(1, 0, 0, 20)
    lFrame.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
    lFrame.BorderSizePixel = 0
    lFrame.LayoutOrder = order or 1
    lFrame.Parent = parent

    local lCorner = Instance.new("UICorner")
    lCorner.CornerRadius = UDim.new(0, 4)
    lCorner.Parent = lFrame

    local lbl = Instance.new("TextLabel")
    lbl.Size = UDim2.new(1, -10, 1, 0)
    lbl.Position = UDim2.new(0, 10, 0, 0)
    lbl.BackgroundTransparency = 1
    lbl.Text = text
    lbl.TextColor3 = Color3.fromRGB(200, 200, 200)
    lbl.TextSize = 10
    lbl.Font = Enum.Font.Gotham
    lbl.TextXAlignment = Enum.TextXAlignment.Left
    lbl.TextWrapped = true
    lbl.Parent = lFrame

    return lFrame, lbl
end

--=============================================================================
-- CREATE PAGES
--=============================================================================

-- ==================== FARM PAGE ====================
local FarmPage = Instance.new("Frame")
FarmPage.Name = "FarmPage"
FarmPage.Size = UDim2.new(1, 0, 1, 0)
FarmPage.BackgroundTransparency = 1
FarmPage.Visible = true
FarmPage.Parent = PagesContainer
TabPages["Farm"] = FarmPage

local FarmScroll = CreateScrollFrame(FarmPage, "FarmScroll")

local FarmAutoFarmSection = CreateSection(FarmScroll, "Auto Farm Level", 1)
CreateToggle(FarmAutoFarmSection, "Auto Farm (Tự động farm level)", false, function(v) Settings.AutoFarm = v end, 1)
CreateToggle(FarmAutoFarmSection, "Bring Mob (Kéo mob lại)", true, function(v) Settings.BringMob = v end, 2)
CreateToggle(FarmAutoFarmSection, "Auto Buso Haki", true, function(v) Settings.AutoBuso = v end, 3)

local FarmMobAuraSection = CreateSection(FarmScroll, "Mob Aura (Farm Gần Nhất)", 2)
CreateToggle(FarmMobAuraSection, "Auto Farm Nearest (Farm mob gần nhất)", false, function(v) Settings.AutoFarmNearest = v end, 1)
CreateToggle(FarmMobAuraSection, "Bring Mob (Kéo mob lại)", true, function(v) end, 2)

local FarmFastSection = CreateSection(FarmScroll, "Fast Attack (Tấn Công Nhanh)", 3)
CreateToggle(FarmFastSection, "Fast Attack (Không cooldown)", false, function(v) Settings.FastAttack = v end, 1)
CreateSlider(FarmFastSection, "Attack Rate (Tốc độ)", 1, 5, 1, function(v) Settings.FastAttackRate = v end, 2)

local FarmChestSection = CreateSection(FarmScroll, "Auto Chest (Rương)", 4)
CreateToggle(FarmChestSection, "Auto Collect Chest (Tự nhặt rương)", false, function(v) Settings.AutoChest = v end, 1)

-- Bot Detection section on Farm page
local FarmBotSection = CreateSection(FarmScroll, "🤖 Bot Detection (Nhận Diện Bot)", 5)
local botDetLabel = CreateLabel(FarmBotSection, "Detected Bots: 0 | Tự động cập nhật tên bot mới để farm", 1)
CreateToggle(FarmBotSection, "Auto Detect Bots (Tự động quét bot)", true, function(v) Settings.AutoDetectBots = v end, 2)
CreateToggle(FarmBotSection, "Avoid Bots (Tránh bot)", false, function(v) Settings.AvoidBots = v end, 3)
CreateToggle(FarmBotSection, "Farm Near Bots (Farm gần bot)", false, function(v) Settings.FarmNearBots = v end, 4)

local botListLabel = CreateLabel(FarmBotSection, "Bot List: Scanning...", 5)

-- ==================== BOSS PAGE ====================
local BossPage = Instance.new("Frame")
BossPage.Name = "BossPage"
BossPage.Size = UDim2.new(1, 0, 1, 0)
BossPage.BackgroundTransparency = 1
BossPage.Visible = false
BossPage.Parent = PagesContainer
TabPages["Boss"] = BossPage

local BossScroll = CreateScrollFrame(BossPage, "BossScroll")

local BossAutoSection = CreateSection(BossScroll, "Auto Boss Farm", 1)
CreateToggle(BossAutoSection, "Auto Farm Boss", false, function(v) Settings.AutoBoss = v end, 1)
CreateToggle(BossAutoSection, "Bring Boss", true, function(v) end, 2)

local bossOptions = {}
if Sea == 1 then
    for _, b in pairs(BossData.Sea1) do table.insert(bossOptions, b.Name) end
elseif Sea == 2 then
    for _, b in pairs(BossData.Sea2) do table.insert(bossOptions, b.Name) end
else
    for _, b in pairs(BossData.Sea3) do table.insert(bossOptions, b.Name) end
end

CreateDropdown(BossAutoSection, "Select Boss (Chọn Boss)", bossOptions, 1, function(v) Settings.SelectedBoss = v end, 3)

local BossListSection = CreateSection(BossScroll, "Boss List", 2)
for _, b in pairs(BossData["Sea" .. Sea]) do
    CreateLabel(BossListSection, b.Name .. " [Lv." .. b.Level .. "]", _)
end

-- ==================== STATS PAGE ====================
local StatsPage = Instance.new("Frame")
StatsPage.Name = "StatsPage"
StatsPage.Size = UDim2.new(1, 0, 1, 0)
StatsPage.BackgroundTransparency = 1
StatsPage.Visible = false
StatsPage.Parent = PagesContainer
TabPages["Stats"] = StatsPage

local StatsScroll = CreateScrollFrame(StatsPage, "StatsScroll")

local StatsAutoSection = CreateSection(StatsScroll, "Auto Stats (Tự Động Stats)", 1)
CreateToggle(StatsAutoSection, "Auto Stats", false, function(v) Settings.AutoStats = v end, 1)
CreateDropdown(StatsAutoSection, "Stat Priority (Ưu Tiên)", {"Melee", "Defense", "Sword", "Gun", "Devil Fruit"}, 1, function(v) Settings.StatPriority = v end, 2)
CreateSlider(StatsAutoSection, "Points Per Step", 1, 50, 1, function(v) Settings.StatPoints = v end, 3)

local StatsInfoSection = CreateSection(StatsScroll, "Current Stats", 2)
local statsInfoLabel = CreateLabel(StatsInfoSection, "Loading stats...", 1)

-- ==================== ITEMS PAGE ====================
local ItemsPage = Instance.new("Frame")
ItemsPage.Name = "ItemsPage"
ItemsPage.Size = UDim2.new(1, 0, 1, 0)
ItemsPage.BackgroundTransparency = 1
ItemsPage.Visible = false
ItemsPage.Parent = PagesContainer
TabPages["Items"] = ItemsPage

local ItemsScroll = CreateScrollFrame(ItemsPage, "ItemsScroll")

local ItemsMaterialSection = CreateSection(ItemsScroll, "Material Farm (Farm Nguyên Liệu)", 1)
CreateToggle(ItemsMaterialSection, "Auto Farm Material", false, function(v) Settings.AutoMaterial = v end, 1)

local matOptions = {}
local matData = MaterialData["Sea" .. Sea]
for _, m in pairs(matData) do table.insert(matOptions, m.Name) end
CreateDropdown(ItemsMaterialSection, "Select Material", matOptions, 1, function(v) Settings.SelectedMaterial = v end, 2)

-- ==================== FRUIT PAGE ====================
local FruitPage = Instance.new("Frame")
FruitPage.Name = "FruitPage"
FruitPage.Size = UDim2.new(1, 0, 1, 0)
FruitPage.BackgroundTransparency = 1
FruitPage.Visible = false
FruitPage.Parent = PagesContainer
TabPages["Fruit"] = FruitPage

local FruitScroll = CreateScrollFrame(FruitPage, "FruitScroll")

local FruitAutoSection = CreateSection(FruitScroll, "Devil Fruit (Trái Ác Quỷ)", 1)
CreateToggle(FruitAutoSection, "Auto Loot Fruit (Tự nhặt trái)", false, function(v) Settings.AutoLootFruit = v end, 1)
CreateToggle(FruitAutoSection, "Fruit ESP", false, function(v) Settings.FruitESP = v end, 2)
CreateToggle(FruitAutoSection, "Devil Fruit ESP", false, function(v) Settings.DevilFruitESP = v end, 3)

CreateButton(FruitAutoSection, "Store Fruit (Cất trái vào kho)", function()
    pcall(function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit")
    end)
end, 4)

CreateButton(FruitAutoSection, "Inventory Fruit (Lấy trái ra)", function()
    pcall(function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("GetInventoryFruits")
    end)
end, 5)

-- ==================== TELEPORT PAGE ====================
local TeleportPage = Instance.new("Frame")
TeleportPage.Name = "TeleportPage"
TeleportPage.Size = UDim2.new(1, 0, 1, 0)
TeleportPage.BackgroundTransparency = 1
TeleportPage.Visible = false
TeleportPage.Parent = PagesContainer
TabPages["Teleport"] = TeleportPage

local TeleportScroll = CreateScrollFrame(TeleportPage, "TeleportScroll")

local TeleportSection = CreateSection(TeleportScroll, "Teleport (Dịch Chuyển) - " .. GetSeaName(), 1)
local islandPositions = IslandPositions["Sea" .. Sea]
local islandNames = TeleportIslands["Sea" .. Sea]
for i, islandName in pairs(islandNames) do
    local pos = islandPositions[islandName]
    if pos then
        CreateButton(TeleportSection, "📍 " .. islandName, function()
            TeleportTo(pos)
        end, i)
    end
end

local DungeonSection = CreateSection(TeleportScroll, "Dungeons (Đi Hầm Ngục)", 10)
for name, func in pairs(DungeonEntrances) do
    CreateButton(DungeonSection, "🔓 " .. name, function()
        pcall(func)
    end, 10)
end

-- ==================== ESP PAGE ====================
local ESPPage = Instance.new("Frame")
ESPPage.Name = "ESPPage"
ESPPage.Size = UDim2.new(1, 0, 1, 0)
ESPPage.BackgroundTransparency = 1
ESPPage.Visible = false
ESPPage.Parent = PagesContainer
TabPages["ESP"] = ESPPage

local ESPScroll = CreateScrollFrame(ESPPage, "ESPScroll")

local ESPSection = CreateSection(ESPScroll, "ESP Features", 1)
CreateToggle(ESPSection, "Player ESP", false, function(v) Settings.PlayerESP = v end, 1)
CreateToggle(ESPSection, "Chest ESP", false, function(v) Settings.ChestESP = v end, 2)
CreateToggle(ESPSection, "Devil Fruit ESP", false, function(v) Settings.DevilFruitESP = v end, 3)
CreateToggle(ESPSection, "Flower ESP (Hoa)", false, function(v) Settings.FlowerESP = v end, 4)
CreateToggle(ESPSection, "Mob ESP", false, function(v) Settings.MobESP = v end, 5)
CreateToggle(ESPSection, "Sea Beast ESP", false, function(v) Settings.SeaBeastESP = v end, 6)
CreateToggle(ESPSection, "Island ESP", false, function(v) Settings.IslandESP = v end, 7)
CreateToggle(ESPSection, "Mirage Island ESP", false, function(v) Settings.MirageESP = v end, 8)

-- ==================== SEA PAGE ====================
local SeaPage = Instance.new("Frame")
SeaPage.Name = "SeaPage"
SeaPage.Size = UDim2.new(1, 0, 1, 0)
SeaPage.BackgroundTransparency = 1
SeaPage.Visible = false
SeaPage.Parent = PagesContainer
TabPages["Sea"] = SeaPage

local SeaScroll = CreateScrollFrame(SeaPage, "SeaScroll")

local SeaAutoSection = CreateSection(SeaScroll, "Sea Events (Sự Kiện Biển)", 1)
CreateToggle(SeaAutoSection, "Auto Advance Sea (Đổi sea)", false, function(v) Settings.AutoAdvance = v end, 1)
CreateToggle(SeaAutoSection, "Auto Factory (Nhà Máy)", false, function(v) Settings.AutoFactory = v end, 2)
CreateToggle(SeaAutoSection, "Auto Ghost Ship (Tàu Ma)", false, function(v) Settings.AutoGhostShip = v end, 3)

-- ==================== MISC PAGE ====================
local MiscPage = Instance.new("Frame")
MiscPage.Name = "MiscPage"
MiscPage.Size = UDim2.new(1, 0, 1, 0)
MiscPage.BackgroundTransparency = 1
MiscPage.Visible = false
MiscPage.Parent = PagesContainer
TabPages["Misc"] = MiscPage

local MiscScroll = CreateScrollFrame(MiscPage, "MiscScroll")

local MiscCharSection = CreateSection(MiscScroll, "Character (Nhân Vật)", 1)
CreateSlider(MiscCharSection, "Walk Speed", 16, 300, 16, function(v)
    Settings.WalkSpeed = v
    pcall(function()
        LocalPlayer.Character.Humanoid.WalkSpeed = v
    end)
end, 1)
CreateSlider(MiscCharSection, "Jump Power", 50, 300, 50, function(v)
    Settings.JumpPower = v
    pcall(function()
        LocalPlayer.Character.Humanoid.JumpPower = v
    end)
end, 2)
CreateToggle(MiscCharSection, "No Clip (Xuyên Tường)", false, function(v)
    Settings.NoClip = v
    if v then NoClipLoop(true) end
end, 3)
CreateToggle(MiscCharSection, "Anti-AFK", true, function(v) Settings.AntiAFK = v end, 4)

local MiscActionSection = CreateSection(MiscScroll, "Actions (Hành Động)", 2)
CreateButton(MiscActionSection, "🔄 Reset Character (Đổi nhân vật)", function()
    pcall(function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("SetTeam", "Pirates")
    end)
end, 1)
CreateButton(MiscActionSection, "🔀 Server Hop (Đổi Server)", function()
    pcall(function()
        local jobId = game.JobId
        local servers = {}
        local ht = game:GetService("HttpService")
        local url = "https://games.roblox.com/v1/games/" .. game.PlaceId .. "/servers/Public?limit=100"
        local success, response = pcall(function() return game:HttpGet(url) end)
        if success then
            local data = ht:JSONDecode(response)
            for _, server in pairs(data.data) do
                if server.id ~= jobId and server.playing < server.maxPlayers then
                    table.insert(servers, server.id)
                end
            end
            if #servers > 0 then
                game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, servers[math.random(1, #servers)])
            end
        end
    end)
end, 2)
CreateButton(MiscActionSection, "⏹ Stop All Scripts (Dừng tất cả)", function()
    Settings.AutoFarm = false
    Settings.AutoFarmNearest = false
    Settings.AutoBoss = false
    Settings.FastAttack = false
    Settings.AutoStats = false
    Settings.AutoChest = false
    Settings.AutoLootFruit = false
    Settings.AutoFactory = false
    Settings.AutoGhostShip = false
    Settings.AutoMaterial = false
end, 3)

-- Highlight first tab
TabButtons["Farm"].BackgroundColor3 = Color3.fromRGB(0, 100, 0)
TabButtons["Farm"].TextColor3 = Color3.fromRGB(0, 255, 0)

--=============================================================================
-- DRAG SYSTEM
--=============================================================================
local dragging = false
local dragInput
local dragStart
local startPos

HeaderBar.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = true
        dragStart = input.Position
        startPos = MainFrame.Position
    end
end)

HeaderBar.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = false
    end
end)

UserInputService.InputChanged:Connect(function(input)
    if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
        local delta = input.Position - dragStart
        MainFrame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
    end
end)

--=============================================================================
-- CLOSE / MINIMIZE
--=============================================================================
local minimized = false

CloseBtn.MouseButton1Click:Connect(function()
    ScreenGui:Destroy()
end)

MinimizeBtn.MouseButton1Click:Connect(function()
    minimized = not minimized
    if minimized then
        TweenService:Create(MainFrame, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Size = UDim2.new(0, 200, 0, 35)}):Play()
        ContentFrame.Visible = false
    else
        ContentFrame.Visible = true
        TweenService:Create(MainFrame, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Size = UDim2.new(0, 650, 0, 420)}):Play()
    end
end)

-- Minimize key: RightShift
UserInputService.InputBegan:Connect(function(input, gameProcessed)
    if gameProcessed then return end
    if input.KeyCode == Enum.KeyCode.RightShift then
        ScreenGui.Enabled = not ScreenGui.Enabled
    end
end)

--=============================================================================
-- BOT DETECTION SYSTEM
--=============================================================================
local function IsBotPlayer(player)
    if not player.Character or not player.Character:FindFirstChild("HumanoidRootPart") then return false end
    local name = player.Name

    -- Check name patterns: random chars, lots of numbers
    if string.match(name, "^%a%d%d%d%d") then return true end
    if string.match(name, "^%d+") then return true end
    if #name > 20 then return true end
    if string.match(name, "^[a-zA-Z]*%d+[a-zA-Z]*%d+[a-zA-Z]*%d+") then return true end

    -- Check if avatar is default (no body colors changed)
    pcall(function()
        local desc = Players:GetHumanoidDescriptionFromUserId(player.UserId)
        if desc then
            local bc = player.Character:FindFirstChild("Body Colors")
            if bc then
                if bc.TorsoColor3 == Color3.fromRGB(64, 64, 64) and
                   bc.LeftArmColor3 == Color3.fromRGB(194, 166, 132) then
                    return true
                end
            end
        end
    end)

    return false
end

local function DetectBots()
    if not Settings.AutoDetectBots then return end

    DetectedBots = {}

    for _, player in pairs(Players:GetPlayers()) do
        if player ~= LocalPlayer then
            local trackKey = player.Name
            if not PlayerTrackData[trackKey] then
                PlayerTrackData[trackKey] = {
                    Positions = {},
                    LastMoveTime = tick(),
                    SameTargetCount = 0,
                    LastTarget = nil,
                    Checks = 0,
                    BotScore = 0,
                }
            end

            local track = PlayerTrackData[trackKey]
            track.Checks = (track.Checks or 0) + 1

            -- Check position stability (not moving)
            pcall(function()
                if player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
                    local pos = player.Character.HumanoidRootPart.Position
                    table.insert(track.Positions, pos)
                    if #track.Positions > 10 then table.remove(track.Positions, 1) end

                    if #track.Positions >= 5 then
                        local totalDist = 0
                        for i = 2, #track.Positions do
                            totalDist = totalDist + (track.Positions[i] - track.Positions[i-1]).Magnitude
                        end
                        if totalDist < 5 then
                            track.BotScore = (track.BotScore or 0) + 1
                            track.LastMoveTime = tick()
                        else
                            track.LastMoveTime = tick()
                        end
                    end
                end
            end)

            -- Check if player hasn't moved for 30+ seconds
            if tick() - (track.LastMoveTime or tick()) > 30 then
                track.BotScore = (track.BotScore or 0) + 3
            end

            -- Name pattern check
            if IsBotPlayer(player) then
                track.BotScore = (track.BotScore or 0) + 5
            end

            -- Final determination
            if (track.BotScore or 0) >= 4 then
                DetectedBots[player.Name] = true
            end
        end
    end

    -- Update GUI
    local botCount = 0
    local botNames = {}
    for name, _ in pairs(DetectedBots) do
        botCount = botCount + 1
        table.insert(botNames, name)
    end

    pcall(function()
        botDetLabel[2].Text = "Detected Bots: " .. botCount .. " | Tự động cập nhật tên của những bot mới để farm"
        BotCountLabel.Text = "Bots: " .. botCount

        local listText = "Bot List: "
        if #botNames > 0 then
            listText = listText .. table.concat(botNames, ", ")
        else
            listText = listText .. "Không phát hiện bot"
        end
        botListLabel[2].Text = listText
    end)
end

task.spawn(function()
    while task.wait(5) do
        if Settings.AutoDetectBots then
            pcall(DetectBots)
        end
    end
end)

--=============================================================================
-- AUTO FARM LEVEL LOOP
--=============================================================================
local function AutoFarmLoop()
    while task.wait(0.1) do
        if Settings.AutoFarm then
        pcall(function()
            if not LocalPlayer.Character or not LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then return end
            if LocalPlayer.Character.Humanoid.Health <= 0 then return end

            if Settings.AutoBuso then UseBuso() end

            local questData = GetCurrentQuestData()
            if not questData then return end

            local seaKey = "Sea" .. Sea
            local questPos = QuestPositions[seaKey] and QuestPositions[seaKey][questData.QuestName]
            if not questPos then return end

            -- Check if we need to accept quest
            if not HasQuest() or QuestCompleted() then
                TweenTo(questPos, 400)
                task.wait(0.5)
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StartQuest", questData.QuestName, questData.QuestLevel)
                task.wait(1)
            end

            -- Find mob
            local mob, dist = GetNearestMonster(questData.Mob, 3000)

            if mob and mob:FindFirstChild("HumanoidRootPart") and mob.Humanoid.Health > 0 then
                if Settings.BringMob then
                    BringMob(mob)
                else
                    TweenTo(mob.HumanoidRootPart.CFrame * CFrame.new(0, 0, -5), 350)
                end

                -- Attack
                if not LocalPlayer.Character:FindFirstChildOfClass("Tool") then
                    for _, tool in pairs(LocalPlayer.Backpack:GetChildren()) do
                        if tool:IsA("Tool") then
                            LocalPlayer.Character.Humanoid:EquipTool(tool)
                            break
                        end
                    end
                end

                if Settings.FastAttack then
                    for i = 1, Settings.FastAttackRate do
                        FastAttack()
                    end
                end

                -- Select mob
                local humanoid = mob:FindFirstChild("Humanoid")
                if humanoid then
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("SetSpawnPoint")
                end
            else
                -- No mob found, go to quest area
                TweenTo(questPos, 400)
                task.wait(2)
            end
        end)
        else
            task.wait(0.5)
        end
    end
end

--=============================================================================
-- AUTO FARM NEAREST (MOB AURA) LOOP
--=============================================================================
local function AutoFarmNearestLoop()
    while task.wait(0.1) do
        if Settings.AutoFarmNearest then
        pcall(function()
            if not LocalPlayer.Character or not LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then return end

            if Settings.AutoBuso then UseBuso() end

            local mob, dist = GetNearestMonster(nil, 500)

            if mob and mob:FindFirstChild("HumanoidRootPart") and mob.Humanoid.Health > 0 then
                if Settings.BringMob then
                    BringMob(mob)
                end

                -- Equip weapon if not holding one
                if not LocalPlayer.Character:FindFirstChildOfClass("Tool") then
                    for _, tool in pairs(LocalPlayer.Backpack:GetChildren()) do
                        if tool:IsA("Tool") then
                            LocalPlayer.Character.Humanoid:EquipTool(tool)
                            break
                        end
                    end
                end

                if Settings.FastAttack then
                    for i = 1, Settings.FastAttackRate do
                        FastAttack()
                    end
                end
            end
        end)
        else
            task.wait(0.5)
        end
    end
end

--=============================================================================
-- AUTO BOSS FARM LOOP
--=============================================================================
local function AutoBossLoop()
    while task.wait(0.1) do
        if Settings.AutoBoss and Settings.SelectedBoss ~= "" then
        pcall(function()
            if not LocalPlayer.Character or not LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then return end

            if Settings.AutoBuso then UseBuso() end

            local allBosses = BossData["Sea" .. Sea]
            local bossInfo = nil
            for _, b in pairs(allBosses) do
                if b.Name == Settings.SelectedBoss then
                    bossInfo = b
                    break
                end
            end

            if not bossInfo then return end

            -- Check if boss is spawned
            local boss, dist = GetNearestBoss(Settings.SelectedBoss, 10000)

            if boss and boss:FindFirstChild("HumanoidRootPart") and boss.Humanoid.Health > 0 then
                BringMob(boss)

                if not LocalPlayer.Character:FindFirstChildOfClass("Tool") then
                    for _, tool in pairs(LocalPlayer.Backpack:GetChildren()) do
                        if tool:IsA("Tool") then
                            LocalPlayer.Character.Humanoid:EquipTool(tool)
                            break
                        end
                    end
                end

                if Settings.FastAttack then
                    for i = 1, Settings.FastAttackRate do
                        FastAttack()
                    end
                end
            else
                -- Teleport to boss position and wait for spawn
                TweenTo(bossInfo.Position, 400)
                task.wait(3)
            end
        end)
        else
            task.wait(0.5)
        end
    end
end

--=============================================================================
-- FAST ATTACK HOOK
--=============================================================================
local function HookFastAttack()
    pcall(function()
        local CombatFramework = require(ReplicatedStorage.CombatFramework)
        local oldAttack = CombatFramework.activeController.attack

        local __index
        __index = hookmetamethod(CombatFramework.activeController, "__index", newcclosure(function(self, key)
            if key == "attack" and Settings.FastAttack then
                return function()
                    pcall(function()
                        for i = 1, Settings.FastAttackRate do
                            oldAttack(self)
                        end
                    end)
                end
            end
            return __index(self, key)
        end))
    end)
end

task.spawn(HookFastAttack)

--=============================================================================
-- AUTO STATS LOOP
--=============================================================================
local function AutoStatsLoop()
    while task.wait(0.5) do
        if Settings.AutoStats then
        pcall(function()
            local points = GetStatPoints()
            if points > 0 then
                local statMap = {
                    ["Melee"] = "Melee",
                    ["Defense"] = "Defense",
                    ["Sword"] = "Sword",
                    ["Gun"] = "Gun",
                    ["Devil Fruit"] = "Devil Fruit",
                }

                local statToAlloc = statMap[Settings.StatPriority] or "Melee"
                local amount = math.min(Settings.StatPoints, points)

                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(
                    "AddPoint",
                    statToAlloc,
                    amount
                )
            else
                task.wait(2)
                -- Update stats display
                pcall(function()
                    local me = GetStat("Melee")
                    local de = GetStat("Defense")
                    local sw = GetStat("Sword")
                    local gu = GetStat("Gun")
                    local df = GetStat("Devil Fruit")
                    statsInfoLabel[2].Text = "Melee: " .. me .. " | Def: " .. de .. " | Sword: " .. sw .. " | Gun: " .. gu .. " | DF: " .. df
                end)
            end

            pcall(function()
                local me = GetStat("Melee")
                local de = GetStat("Defense")
                local sw = GetStat("Sword")
                local gu = GetStat("Gun")
                local df = GetStat("Devil Fruit")
                statsInfoLabel[2].Text = "Melee: " .. me .. " | Def: " .. de .. " | Sword: " .. sw .. " | Gun: " .. gu .. " | DF: " .. df
            end)
        end)
        else
            task.wait(1)
        end
    end
end

--=============================================================================
-- AUTO CHEST LOOP
--=============================================================================
local function AutoChestLoop()
    while task.wait(0.5) do
        if Settings.AutoChest then
        pcall(function()
            if not LocalPlayer.Character or not LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then return end

            local chests = {}
            for _, v in pairs(Workspace:GetChildren()) do
                if string.find(v.Name, "Chest") then
                    table.insert(chests, v)
                end
            end

            for _, v in pairs(Workspace.Enemies:GetChildren()) do
                for _, item in pairs(v:GetChildren()) do
                    if string.find(item.Name, "Chest") then
                        table.insert(chests, item)
                    end
                end
            end

            local nearest = nil
            local minDist = 3000
            for _, chest in pairs(chests) do
                if chest:IsA("BasePart") or chest:FindFirstChild("HumanoidRootPart") then
                    local pos = chest:IsA("BasePart") and chest.Position or chest.HumanoidRootPart.Position
                    local dist = (pos - LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
                    if dist < minDist then
                        minDist = dist
                        nearest = chest
                    end
                end
            end

            if nearest then
                local pos = nearest:IsA("BasePart") and nearest.Position or nearest.HumanoidRootPart.Position
                TweenTo(CFrame.new(pos), 350)
            end
        end)
        else
            task.wait(1)
        end
    end
end

--=============================================================================
-- AUTO LOOT FRUIT LOOP
--=============================================================================
local function AutoLootFruitLoop()
    while task.wait(0.5) do
        if Settings.AutoLootFruit then
        pcall(function()
            if not LocalPlayer.Character or not LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then return end

            for _, v in pairs(Workspace:GetChildren()) do
                if v:IsA("Part") or v:IsA("MeshPart") then
                    if v:FindFirstChild("TouchInterest") then
                        local pos = v.Position
                        local dist = (pos - LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
                        if dist < 200 then
                            TweenTo(v.CFrame, 400)
                        end
                    end
                end
            end
        end)
        else
            task.wait(1)
        end
    end
end

--=============================================================================
-- MATERIAL FARM LOOP
--=============================================================================
local function AutoMaterialLoop()
    while task.wait(0.1) do
        if Settings.AutoMaterial and Settings.SelectedMaterial ~= "" then
        pcall(function()
            if not LocalPlayer.Character or not LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then return end

            local matDataList = MaterialData["Sea" .. Sea]
            local matInfo = nil
            for _, m in pairs(matDataList) do
                if m.Name == Settings.SelectedMaterial then
                    matInfo = m
                    break
                end
            end

            if not matInfo then return end

            if Settings.AutoBuso then UseBuso() end

            local mob, dist = GetNearestMonster(matInfo.Mob, 3000)

            if mob and mob:FindFirstChild("HumanoidRootPart") and mob.Humanoid.Health > 0 then
                BringMob(mob)

                if not LocalPlayer.Character:FindFirstChildOfClass("Tool") then
                    for _, tool in pairs(LocalPlayer.Backpack:GetChildren()) do
                        if tool:IsA("Tool") then
                            LocalPlayer.Character.Humanoid:EquipTool(tool)
                            break
                        end
                    end
                end

                if Settings.FastAttack then
                    for i = 1, Settings.FastAttackRate do
                        FastAttack()
                    end
                end
            else
                TweenTo(matInfo.Position, 400)
                task.wait(2)
            end
        end)
        else
            task.wait(1)
        end
    end
end

--=============================================================================
-- AUTO FACTORY LOOP
--=============================================================================
local function AutoFactoryLoop()
    while task.wait(1) do
        if Settings.AutoFactory then
        pcall(function()
            local factory = Workspace:FindFirstChild("Map") and Workspace.Map:FindFirstChild("Factory")
            if factory then
                TeleportTo(CFrame.new(420.7, 80.1, -419.8))
            end
        end)
        else
            task.wait(2)
        end
    end
end

--=============================================================================
-- AUTO GHOST SHIP LOOP
--=============================================================================
local function AutoGhostShipLoop()
    while task.wait(2) do
        if Settings.AutoGhostShip then
        pcall(function()
            for _, v in pairs(Workspace:GetChildren()) do
                if string.find(v.Name:lower(), "ghost") then
                    TeleportTo(v.CFrame + Vector3.new(0, 50, 0))
                    task.wait(10)
                    break
                end
            end
        end)
        else
            task.wait(3)
        end
    end
end

--=============================================================================
-- ESP SYSTEM
--=============================================================================
local ESPObjects = {}

local function ClearESP(tag)
    if ESPObjects[tag] then
        for _, obj in pairs(ESPObjects[tag]) do
            if obj and obj.Parent then obj:Destroy() end
        end
        ESPObjects[tag] = {}
    end
end

local function CreateHighlight(parent, color, name)
    local bb = Instance.new("BillboardGui")
    bb.Name = name or "ESP"
    bb.Adornee = parent
    bb.Size = UDim2.new(0, 200, 0, 50)
    bb.StudsOffset = Vector3.new(0, 3, 0)
    bb.AlwaysOnTop = true
    bb.Parent = parent

    local lbl = Instance.new("TextLabel")
    lbl.Size = UDim2.new(1, 0, 1, 0)
    lbl.BackgroundTransparency = 1
    lbl.TextColor3 = color
    lbl.TextStrokeTransparency = 0.5
    lbl.TextScaled = true
    lbl.Font = Enum.Font.GothamBold
    lbl.Text = name or "ESP"
    lbl.Parent = bb

    return bb
end

local function PlayerESP()
    ClearESP("PlayerESP")
    while task.wait(0.5) do
        ClearESP("PlayerESP")
        if Settings.PlayerESP then
        pcall(function()
            ESPObjects["PlayerESP"] = ESPObjects["PlayerESP"] or {}
            for _, player in pairs(Players:GetPlayers()) do
                if player ~= LocalPlayer and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
                    local dist = math.floor((player.Character.HumanoidRootPart.Position - LocalPlayer.Character.HumanoidRootPart.Position).Magnitude)
                    local hp = player.Character:FindFirstChild("Humanoid") and math.floor(player.Character.Humanoid.Health) or 0
                    local color = Color3.fromRGB(255, 255, 255)
                    if player.Team then
                        color = player.TeamColor.Color
                    end
                    local bb = Instance.new("BillboardGui")
                    bb.Name = "PlayerESP"
                    bb.Adornee = player.Character.HumanoidRootPart
                    bb.Size = UDim2.new(0, 200, 0, 80)
                    bb.StudsOffset = Vector3.new(0, 4, 0)
                    bb.AlwaysOnTop = true
                    bb.Parent = player.Character.HumanoidRootPart

                    local lbl = Instance.new("TextLabel")
                    lbl.Size = UDim2.new(1, 0, 0.5, 0)
                    lbl.Position = UDim2.new(0, 0, 0, 0)
                    lbl.BackgroundTransparency = 0.5
                    lbl.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
                    lbl.TextColor3 = color
                    lbl.Text = player.Name .. "\nHP: " .. hp .. " | " .. dist .. "m"
                    lbl.TextScaled = true
                    lbl.Font = Enum.Font.GothamBold
                    lbl.Parent = bb

                    table.insert(ESPObjects["PlayerESP"], bb)
                end
            end
        end)
        else
            task.wait(1)
        end
    end
end

local function ChestESP()
    ClearESP("ChestESP")
    while task.wait(1) do
        ClearESP("ChestESP")
        if Settings.ChestESP then
        pcall(function()
            ESPObjects["ChestESP"] = ESPObjects["ChestESP"] or {}
            local chestColors = {
                ["Chest1"] = Color3.fromRGB(255, 215, 0),
                ["Chest2"] = Color3.fromRGB(192, 192, 192),
                ["Chest3"] = Color3.fromRGB(205, 127, 50),
            }
            for _, v in pairs(Workspace:GetChildren()) do
                if chestColors[v.Name] then
                    local bb = Instance.new("BillboardGui")
                    bb.Name = "ChestESP"
                    bb.Adornee = v
                    bb.Size = UDim2.new(0, 100, 0, 40)
                    bb.StudsOffset = Vector3.new(0, 2, 0)
                    bb.AlwaysOnTop = true
                    bb.Parent = v

                    local lbl = Instance.new("TextLabel")
                    lbl.Size = UDim2.new(1, 0, 1, 0)
                    lbl.BackgroundTransparency = 0.5
                    lbl.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
                    lbl.TextColor3 = chestColors[v.Name]
                    lbl.Text = v.Name
                    lbl.TextScaled = true
                    lbl.Font = Enum.Font.GothamBold
                    lbl.Parent = bb

                    table.insert(ESPObjects["ChestESP"], bb)
                end
            end
        end)
        else
            task.wait(2)
        end
    end
end

local function FruitESP()
    ClearESP("FruitESP")
    while task.wait(1) do
        ClearESP("FruitESP")
        if Settings.FruitESP or Settings.DevilFruitESP then
        pcall(function()
            ESPObjects["FruitESP"] = ESPObjects["FruitESP"] or {}
            for _, v in pairs(Workspace:GetChildren()) do
                if (v:IsA("Part") or v:IsA("MeshPart")) and v:FindFirstChild("TouchInterest") then
                    local bb = Instance.new("BillboardGui")
                    bb.Name = "FruitESP"
                    bb.Adornee = v
                    bb.Size = UDim2.new(0, 150, 0, 40)
                    bb.StudsOffset = Vector3.new(0, 3, 0)
                    bb.AlwaysOnTop = true
                    bb.Parent = v

                    local lbl = Instance.new("TextLabel")
                    lbl.Size = UDim2.new(1, 0, 1, 0)
                    lbl.BackgroundTransparency = 0.5
                    lbl.BackgroundColor3 = Color3.fromRGB(128, 0, 128)
                    lbl.TextColor3 = Color3.fromRGB(255, 0, 255)
                    lbl.Text = "🍇 " .. v.Name
                    lbl.TextScaled = true
                    lbl.Font = Enum.Font.GothamBold
                    lbl.Parent = bb

                    table.insert(ESPObjects["FruitESP"], bb)
                end
            end
        end)
        else
            task.wait(2)
        end
    end
end

local function FlowerESP()
    ClearESP("FlowerESP")
    while task.wait(1) do
        ClearESP("FlowerESP")
        if Settings.FlowerESP then
        pcall(function()
            ESPObjects["FlowerESP"] = ESPObjects["FlowerESP"] or {}
            local flowerData = {
                ["Blue Flower"] = Color3.fromRGB(0, 150, 255),
                ["Red Flower"] = Color3.fromRGB(255, 50, 50),
            }
            for _, island in pairs(Workspace:GetChildren()) do
                for _, flower in pairs(island:GetDescendants()) do
                    if flowerData[flower.Name] then
                        local bb = Instance.new("BillboardGui")
                        bb.Name = "FlowerESP"
                        bb.Adornee = flower
                        bb.Size = UDim2.new(0, 100, 0, 40)
                        bb.StudsOffset = Vector3.new(0, 2, 0)
                        bb.AlwaysOnTop = true
                        bb.Parent = flower

                        local lbl = Instance.new("TextLabel")
                        lbl.Size = UDim2.new(1, 0, 1, 0)
                        lbl.BackgroundTransparency = 0.5
                        lbl.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
                        lbl.TextColor3 = flowerData[flower.Name]
                        lbl.Text = "🌸 " .. flower.Name
                        lbl.TextScaled = true
                        lbl.Font = Enum.Font.GothamBold
                        lbl.Parent = bb

                        table.insert(ESPObjects["FlowerESP"], bb)
                    end
                end
            end
        end)
        else
            task.wait(2)
        end
    end
end

local function MobESP()
    ClearESP("MobESP")
    while task.wait(1) do
        ClearESP("MobESP")
        if Settings.MobESP then
        pcall(function()
            ESPObjects["MobESP"] = ESPObjects["MobESP"] or {}
            for _, v in pairs(Workspace.Enemies:GetChildren()) do
                if v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 then
                    local hp = math.floor(v.Humanoid.Health)
                    local maxHp = math.floor(v.Humanoid.MaxHealth)
                    local bb = Instance.new("BillboardGui")
                    bb.Name = "MobESP"
                    bb.Adornee = v.HumanoidRootPart
                    bb.Size = UDim2.new(0, 150, 0, 40)
                    bb.StudsOffset = Vector3.new(0, 3, 0)
                    bb.AlwaysOnTop = true
                    bb.Parent = v.HumanoidRootPart

                    local lbl = Instance.new("TextLabel")
                    lbl.Size = UDim2.new(1, 0, 1, 0)
                    lbl.BackgroundTransparency = 0.5
                    lbl.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
                    lbl.TextColor3 = Color3.fromRGB(255, 100, 100)
                    lbl.Text = v.Name .. " [" .. hp .. "/" .. maxHp .. "]"
                    lbl.TextScaled = true
                    lbl.Font = Enum.Font.GothamBold
                    lbl.Parent = bb

                    table.insert(ESPObjects["MobESP"], bb)
                end
            end
        end)
        else
            task.wait(2)
        end
    end
end

local function SeaBeastESP()
    ClearESP("SeaBeastESP")
    while task.wait(2) do
        ClearESP("SeaBeastESP")
        if Settings.SeaBeastESP then
        pcall(function()
            ESPObjects["SeaBeastESP"] = ESPObjects["SeaBeastESP"] or {}
            for _, v in pairs(Workspace.SeaBeasts:GetChildren()) do
                if v:FindFirstChild("HumanoidRootPart") then
                    local bb = Instance.new("BillboardGui")
                    bb.Name = "SeaBeastESP"
                    bb.Adornee = v.HumanoidRootPart
                    bb.Size = UDim2.new(0, 300, 0, 60)
                    bb.StudsOffset = Vector3.new(0, 5, 0)
                    bb.AlwaysOnTop = true
                    bb.Parent = v.HumanoidRootPart

                    local lbl = Instance.new("TextLabel")
                    lbl.Size = UDim2.new(1, 0, 1, 0)
                    lbl.BackgroundTransparency = 0.5
                    lbl.BackgroundColor3 = Color3.fromRGB(100, 0, 0)
                    lbl.TextColor3 = Color3.fromRGB(255, 50, 50)
                    lbl.Text = "🐉 SEA BEAST"
                    lbl.TextScaled = true
                    lbl.Font = Enum.Font.GothamBold
                    lbl.Parent = bb

                    table.insert(ESPObjects["SeaBeastESP"], bb)
                end
            end
        end)
        else
            task.wait(3)
        end
    end
end

local function IslandESP()
    ClearESP("IslandESP")
    while task.wait(3) do
        ClearESP("IslandESP")
        if Settings.IslandESP then
        pcall(function()
            ESPObjects["IslandESP"] = ESPObjects["IslandESP"] or {}
            for _, v in pairs(Workspace._WorldOrigin.Locations:GetChildren()) do
                if v:IsA("Part") then
                    local bb = Instance.new("BillboardGui")
                    bb.Name = "IslandESP"
                    bb.Adornee = v
                    bb.Size = UDim2.new(0, 200, 0, 50)
                    bb.StudsOffset = Vector3.new(0, 10, 0)
                    bb.AlwaysOnTop = true
                    bb.Parent = v

                    local lbl = Instance.new("TextLabel")
                    lbl.Size = UDim2.new(1, 0, 1, 0)
                    lbl.BackgroundTransparency = 0.5
                    lbl.BackgroundColor3 = Color3.fromRGB(0, 0, 100)
                    lbl.TextColor3 = Color3.fromRGB(100, 200, 255)
                    lbl.Text = "🏝️ " .. v.Name
                    lbl.TextScaled = true
                    lbl.Font = Enum.Font.GothamBold
                    lbl.Parent = bb

                    table.insert(ESPObjects["IslandESP"], bb)
                end
            end
        end)
        else
            task.wait(4)
        end
    end
end

local function MirageESP()
    ClearESP("MirageESP")
    while task.wait(2) do
        ClearESP("MirageESP")
        if Settings.MirageESP then
        pcall(function()
            ESPObjects["MirageESP"] = ESPObjects["MirageESP"] or {}
            for _, v in pairs(Workspace:GetChildren()) do
                if string.find(v.Name:lower(), "mirage") then
                    local bb = Instance.new("BillboardGui")
                    bb.Name = "MirageESP"
                    bb.Adornee = v:FindFirstChild("HumanoidRootPart") or v
                    bb.Size = UDim2.new(0, 300, 0, 60)
                    bb.StudsOffset = Vector3.new(0, 10, 0)
                    bb.AlwaysOnTop = true
                    bb.Parent = v

                    local lbl = Instance.new("TextLabel")
                    lbl.Size = UDim2.new(1, 0, 1, 0)
                    lbl.BackgroundTransparency = 0.5
                    lbl.BackgroundColor3 = Color3.fromRGB(150, 0, 200)
                    lbl.TextColor3 = Color3.fromRGB(255, 100, 255)
                    lbl.Text = "✨ MIRAGE ISLAND"
                    lbl.TextScaled = true
                    lbl.Font = Enum.Font.GothamBold
                    lbl.Parent = bb

                    table.insert(ESPObjects["MirageESP"], bb)
                end
            end
        end)
        else
            task.wait(3)
        end
    end
end

--=============================================================================
-- AUTO ADVANCE SEA LOOP
--=============================================================================
local function AutoAdvanceLoop()
    while task.wait(2) do
        if Settings.AutoAdvance then
        pcall(function()
            if Sea == 1 and GetLocalLevel() >= 700 then
                -- Go to Impel Down / Upper Yard and do advance quest
                local advancePos = CFrame.new(4848.9, 5.7, 726.3)
                TweenTo(advancePos, 400)
                task.wait(1)
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("TravelDressrosa")
            elseif Sea == 2 and GetLocalLevel() >= 1500 then
                local advancePos = CFrame.new(-288.4, 43.3, 5393.3)
                TweenTo(advancePos, 400)
                task.wait(1)
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("TravelZou")
            end
        end)
        else
            task.wait(3)
        end
    end
end

--=============================================================================
-- LEVEL / SEA LABEL UPDATE
--=============================================================================
task.spawn(function()
    while task.wait(1) do
        pcall(function()
            SeaLabel.Text = "[ " .. GetSeaName() .. " | Lv." .. GetLocalLevel() .. " ]"
        end)
    end
end)

--=============================================================================
-- WALK SPEED / JUMP POWER KEEP
--=============================================================================
task.spawn(function()
    while task.wait(0.5) do
        pcall(function()
            if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
                if Settings.WalkSpeed ~= 16 then
                    LocalPlayer.Character.Humanoid.WalkSpeed = Settings.WalkSpeed
                end
                if Settings.JumpPower ~= 50 then
                    LocalPlayer.Character.Humanoid.JumpPower = Settings.JumpPower
                end
            end
        end)
    end
end)

--=============================================================================
-- NO CLIP SYSTEM
--=============================================================================
if Settings.NoClip then
    NoClipLoop(true)
end

-- NoClip connection
RunService.Stepped:Connect(function()
    if Settings.NoClip then
        pcall(function()
            if LocalPlayer.Character then
                for _, part in pairs(LocalPlayer.Character:GetDescendants()) do
                    if part:IsA("BasePart") then
                        part.CanCollide = false
                    end
                end
            end
        end)
    end
end)

--=============================================================================
-- STUN REMOVE
--=============================================================================
task.spawn(function()
    while task.wait(0.1) do
        pcall(function()
            if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
                if LocalPlayer.Character.Humanoid.PlatformStand == true then
                    LocalPlayer.Character.Humanoid.PlatformStand = false
                end
            end
        end)
    end
end)

--=============================================================================
-- ANTI AFK
--=============================================================================
task.spawn(function()
    while task.wait(60) do
        if Settings.AntiAFK then
            VirtualUser:CaptureController()
            VirtualUser:ClickButton2(Vector2.new())
        end
    end
end)

--=============================================================================
-- START ALL LOOPS
--=============================================================================
task.spawn(AutoFarmLoop)
task.spawn(AutoFarmNearestLoop)
task.spawn(AutoBossLoop)
task.spawn(AutoStatsLoop)
task.spawn(AutoChestLoop)
task.spawn(AutoLootFruitLoop)
task.spawn(AutoMaterialLoop)
task.spawn(AutoFactoryLoop)
task.spawn(AutoGhostShipLoop)
task.spawn(AutoAdvanceLoop)
task.spawn(PlayerESP)
task.spawn(ChestESP)
task.spawn(FruitESP)
task.spawn(FlowerESP)
task.spawn(MobESP)
task.spawn(SeaBeastESP)
task.spawn(IslandESP)
task.spawn(MirageESP)

--=============================================================================
-- NOTIFICATION ON LOAD
--=============================================================================
StarterGui:SetCore("SendNotification", {
    Title = "Quack Hub",
    Text = "Loaded! Sea " .. Sea .. " | RightShift to toggle GUI",
    Duration = 5,
})

print("============================================")
print("  Quack Hub: Blox Fruits - Loaded!")
print("  Sea: " .. GetSeaName())
print("  Level: " .. GetLocalLevel())
print("  RightShift to toggle GUI")
print("  Features: AutoFarm, Boss, Stats, ESP,")
print("  Teleport, Material, Fruit, Sea Events")
print("  Bot Detection: ACTIVE")
print("============================================")
