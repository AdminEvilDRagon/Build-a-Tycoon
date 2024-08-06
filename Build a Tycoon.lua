local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()
local Window = OrionLib:MakeWindow({Name = "Build a Tycoon!", HidePremium = false, SaveConfig = true, ConfigFolder = "MyConfig"})

-- Tabs
local MoneyTab = Window:MakeTab({Name = "Money", Icon = "rbxassetid://4483345998", PremiumOnly = false})
local RebirthTab = Window:MakeTab({Name = "Rebirth", Icon = "rbxassetid://4483345998", PremiumOnly = false})
local DropperTab = Window:MakeTab({Name = "Dropper", Icon = "rbxassetid://4483345998", PremiumOnly = false})
local SpotTab = Window:MakeTab({Name = "Spots", Icon = "rbxassetid://4483345998", PremiumOnly = false})
local UpgradeTab = Window:MakeTab({Name = "Upgrades", Icon = "rbxassetid://4483345998", PremiumOnly = false})
local TitleTab = Window:MakeTab({Name = "Title", Icon = "rbxassetid://4483345998", PremiumOnly = false})
local CreditsTab = Window:MakeTab({Name = "Credits", Icon = "rbxassetid://4483345998", PremiumOnly = false})

-- Functions
local function getMoney(amount)
    local args = {[1] = amount, [2] = "StarterGui"}
    game:GetService("ReplicatedStorage").EventuaIly.GetMoney:FireServer(unpack(args))
end

local function rebirth()
    local args = {[1] = 10000, [2] = true, [3] = "StarterGui"}
    game:GetService("ReplicatedStorage"):WaitForChild("EventuaIly"):WaitForChild("Rebirth"):FireServer(unpack(args))
end

local function placeDropperOnAllSpots()
    for i = 1, 15 do
        local args = {[1] = 0, [2] = i, [3] = "Silly Dropper"}
        workspace:WaitForChild("MainScripts"):WaitForChild("RemoteScripts"):WaitForChild("BuyStructure"):FireServer(unpack(args))
    end
end

local function buyAllSpots()
    for i = 1, 15 do
        local args = {[1] = 0, [2] = i}
        workspace:WaitForChild("MainScripts"):WaitForChild("RemoteScripts"):WaitForChild("BuySpot"):FireServer(unpack(args))
    end
end

local function upgradeTime(amount)
    local args = {[1] = -amount, [2] = 1, [3] = "Multi"}
    workspace:WaitForChild("MainScripts"):WaitForChild("RemoteScripts"):WaitForChild("TimeUpgrade"):FireServer(unpack(args))
end

local function changeTitle(title)
    local args = {[1] = title}
    workspace:WaitForChild("MainScripts"):WaitForChild("RemoteScripts"):WaitForChild("ChangeTitle"):FireServer(unpack(args))
end

-- UI Elements
MoneyTab:AddTextbox({
    Name = "Money Amount",
    Default = "",
    TextDisappear = true,
    Callback = function(value)
        getMoney(tonumber(value))
    end
})

RebirthTab:AddButton({
    Name = "Add 10K Rebirth",
    Callback = function()
        rebirth()
    end
})

DropperTab:AddButton({
    Name = "Place Best Dropper on All Spots",
    Callback = function()
        placeDropperOnAllSpots()
    end
})

SpotTab:AddButton({
    Name = "Buy All Spots",
    Callback = function()
        buyAllSpots()
    end
})

UpgradeTab:AddTextbox({
    Name = "Time Upgrade Amount",
    Default = "",
    TextDisappear = true,
    Callback = function(value)
        upgradeTime(tonumber(value))
    end
})

TitleTab:AddDropdown({
    Name = "Select Title",
    Default = "CREATOR",
    Options = {"CREATOR", "VIP", "DEV", "MILLIONAIRE", "BILLIONAIRE", "TRILLIONAIRE", "OBBYIST", "QUADRILLIONAIRE", "QUINTILLIONAIRE", "MEOW", "BOLLY", "CONTRIBUTOR", "OUT OF BOUNDS", "SILLY", "ASTRONAUT", "ALIEN", "MODERATOR", "TITLEIST", "METEOROLOGIST", "HI", "VOID"},
    Callback = function(value)
        changeTitle(value)
    end
})

-- Credits
CreditsTab:AddParagraph("Creator", "Evildragon")
CreditsTab:AddParagraph("Thanks", "@Sillyfrfr for finding the Title remote, follow him on scriptblox.com")

-- Infinite Yield
local InfiniteYieldTab = Window:MakeTab({Name = "Infinite Yield", Icon = "rbxassetid://4483345998", PremiumOnly = false})
InfiniteYieldTab:AddButton({
    Name = "Load Infinite Yield",
    Callback = function()
        loadstring(game:HttpGet('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'))()
    end
})

OrionLib:Init()
