-- Load Rayfield
local Rayfield = loadstring(game:HttpGet("https://sirius.menu/rayfield"))()

-- Copy Discord Invite
setclipboard("https://discord.gg/tykfEtde") -- updated Discord invite

-- Helper: Notify
local function notify(title, text)
    pcall(function()
        game:GetService("StarterGui"):SetCore("SendNotification", {
            Title = title,
            Text = text,
            Duration = 5
        })
    end)
end

-- Window with Key System
local Window = Rayfield:CreateWindow({
    Name = "🌌 4str0 Hub",
    LoadingTitle = "Loading 4str0 Hub...",
    LoadingSubtitle = "by Astro",
    ConfigurationSaving = {
        Enabled = true,
        FolderName = nil,
        FileName = "4str0HubSettings"
    },
    KeySystem = true,
    KeySettings = {
        Title = "Authentication Required",
        Subtitle = "Get key from Discord",
        Note = "Copied Discord invite to clipboard.",
        FileName = "4str0Key",
        SaveKey = true,
        GrabKeyFromSite = false,
        Key = {"Astroishungry122131twyehnfgrdfsaawad1223333344444"} -- updated key
    }
})

-- Universal Tab
local Universal = Window:CreateTab("🌐 Universal", 4483362458)
Universal:CreateButton({
    Name = "Nameless Admin",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/ltseverydayyou/Nameless-Admin/main/Source.lua"))()
        notify("Universal", "Nameless Admin loaded.")
    end
})

Universal:CreateButton({
    Name = "Anti-AFK",
    Callback = function()
        local vu = game:GetService("VirtualUser")
        game:GetService("Players").LocalPlayer.Idled:Connect(function()
            vu:Button2Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
            task.wait(1)
            vu:Button2Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
        end)
        notify("Universal", "Anti-AFK activated.")
    end
})

Universal:CreateButton({
    Name = "Rejoin Server",
    Callback = function()
        game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, game.JobId)
    end
})

Universal:CreateButton({
    Name = "Server Hop",
    Callback = function()
        loadstring(game:HttpGet("https://pastebin.com/raw/F5VfJFxZ"))()
    end
})

Universal:CreateButton({
    Name = "FPS Boost",
    Callback = function()
        for _, v in pairs(game:GetDescendants()) do
            if v:IsA("BasePart") then
                v.Material = Enum.Material.SmoothPlastic
                v.Reflectance = 0
            elseif v:IsA("Decal") then
                v.Transparency = 1
            end
        end
        sethiddenproperty(game.Lighting, "Technology", Enum.Technology.Compatibility)
        game.Lighting.GlobalShadows = false
        notify("Universal", "FPS Boost applied.")
    end
})

-- Supported Games List
local Supported = {
    [6403373529] = "SlapBattle",
    [17574618959] = "Just a Baseplate",
    [17625359962] = "Rivals",
    [18687417158] = "Forsaken",
    [286090429] = "Arsenal",
    [2753915549] = "Bloxfruits",
    [13772394625] = "Blade Ball",
    [10449761463] = "The Strongest Battlegrounds",

}

-- Game Tab Generator
local function createGameTab(name, iconId, buttons)
    local tab = Window:CreateTab("🎮 "..name, iconId or 4483362458)
    for _, btn in ipairs(buttons) do
        tab:CreateButton({
            Name = btn.name,
            Callback = btn.callback
        })
    end
end

-- Game-Specific Logic
local id = game.PlaceId

-- Then below, in the logic area:
elseif Supported[id] == "The Strongest Battlegrounds" then
    createGameTab("Strongest BG", nil, {
        {
            name = "Load DevHub",
            callback = function()
                loadstring(game:HttpGet("https://raw.githubusercontent.com/Emerson2-creator/Scripts-Roblox/refs/heads/main/XDevHubBeta.lua"))()
                notify("Strongest BG", "Script loaded.")
            end
        }
    })


if Supported[id] == "Forsaken" then
    createGameTab("Forsaken", nil, {
        {
            name = "Load B0bbyHub",
            callback = function()
                loadstring(game:HttpGet("https://raw.githubusercontent.com/BobJunior1/ForsakenBoi/refs/heads/main/B0bbyHub"))()
                notify("Forsaken", "B0bbyHub loaded.")
            end
        },
        {
            name = "Load EIF Loader",
            callback = function()
                loadstring(game:HttpGet("https://cdn.exploitingis.fun/loader", true))()
                notify("Forsaken", "EIF loaded.")
            end
        },
        {
            name = "Load YARHM Script",
            callback = function()
                local src = ""
                pcall(function()
                    src = game:HttpGet("https://yarhm.mhi.im/scr", false)
                end)
                if src == "" then
                    notify("YARHM", "YARHM Online is down, using fallback.")
                    src = game:HttpGet("https://raw.githubusercontent.com/Joystickplays/psychic-octo-invention/main/source/yarhm/1.19/yarhm.lua", false)
                end
                loadstring(src)()
            end
        }
    })

elseif Supported[id] == "Just a Baseplate" then
    createGameTab("Just a Baseplate", nil, {
        {
            name = "Load Hat Hub",
            callback = function()
                loadstring(game:HttpGet("https://raw.githubusercontent.com/inkdupe/hat-scripts/refs/heads/main/updatedhathub.lua"))()
                notify("Baseplate", "Hat script loaded.")
            end
        }
    })

elseif Supported[id] == "Rivals" then
    createGameTab("Rivals", nil, {
        {
            name = "Coming Soon",
            callback = function()
                notify("Rivals", "Scripts are in development.")
            end
        },
        {
            name = "Load ZYPHERION",
            callback = function()
                loadstring(game:HttpGet("https://raw.githubusercontent.com/blackowl1231/ZYPHERION/refs/heads/main/main.lua"))()
                notify("Rivals", "ZYPHERION loaded.")
            end
        }
    })

elseif Supported[id] == "Bloxfruits" then
    createGameTab("Bloxfruits", nil, {
        {
            name = "Load JonnyCheeseHub",
            callback = function()
                loadstring(game:HttpGet("https://raw.githubusercontent.com/JonnyCheeser/rbw4/main/JonnyCheeseHub"))()
                notify("Bloxfruits", "JonnyCheeseHub loaded.")
            end
        },
        {
            name = "Load Bloxfruit Script",
            callback = function()
                _G.Key = "" -- set your key if required
                loadstring(game:HttpGet("https://pi-hub.pages.dev/scripts/bloxfruit.lua"))()
                notify("Bloxfruits", "Bloxfruit script loaded.")
            end
        }
    })

elseif Supported[id] then
    createGameTab(Supported[id], nil, {
        {
            name = "Coming Soon",
            callback = function()
                notify(Supported[id], "Scripts coming soon.")
            end
        }
    })
else
    createGameTab("Unsupported Game", nil, {
        {
            name = "You're in an unsupported game",
            callback = function()
                notify("Unsupported", "No scripts available for this game.")
            end
        }
    })
end





