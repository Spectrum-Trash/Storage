loadstring(game:HttpGet("https://raw.githubusercontent.com/Spectrum-Trash/Storage/main/Gamelist.lua"))()

local Games = getgenv().Games
local supported = false

local function spectrum_console(message)
    print("================================")
    print("[SPECTRUM ASSISTANT]: " .. message)
    print("================================")
end

if type(Games) == "table" then
    for PlaceID, Execute in pairs(Games) do
        if PlaceID == game.PlaceId then
            supported = true
            spectrum_console("Game Supported! Loading Script...")
            loadstring(game:HttpGet(Execute))()
            break
        end
    end
end

if not supported then
    spectrum_console("Game Not Supported!")
    task.wait(0.5)
    game.Players.LocalPlayer:Kick("[SPECTRUM ASSISTANT]: Game Not Supported ❌\nhttps://discord.gg/C3MpUNwsDU")
end
