-- ══════════════════════════════════════════════════════
-- SPECTRUM SOBER — Game Router
-- ══════════════════════════════════════════════════════

loadstring(game:HttpGet("https://raw.githubusercontent.com/Spectrum-Trash/Storage/main/Gamelist.lua"))()

local Games     = getgenv().Games
local supported = false

local function spectrum_console(status, message)
    local icon = status == "OK"   and "✅" or
                 status == "WARN" and "⚠️" or
                 status == "ERR"  and "❌" or "🔹"
    warn("╔══════════════════════════════════════════╗")
    warn("║         SPECTRUM ASSISTANT  🤖           ║")
    warn("╚══════════════════════════════════════════╝")
    warn("  " .. icon .. "  " .. message)
    warn("  ══════════════════════════════════════════")
end

-- ══════════════════════════════════════════════════════
-- GAME DETECTION
-- ══════════════════════════════════════════════════════

spectrum_console("OK", "Detecting game...  [ PlaceId: " .. tostring(game.PlaceId) .. " ]")

if type(Games) == "table" then
    for PlaceID, Execute in pairs(Games) do
        if PlaceID == game.PlaceId then
            supported = true
            spectrum_console("OK", "Game Supported! Routing to script...")
            task.wait(0.1)
            loadstring(game:HttpGet(Execute))()
            break
        end
    end
end

if not supported then
    spectrum_console("ERR", "Game Not Supported — Ejecting...")
    task.wait(0.5)
    game.Players.LocalPlayer:Kick(
        "[ SPECTRUM ASSISTANT ]\n" ..
        "━━━━━━━━━━━━━━━━━━━━━━━━\n" ..
        "❌  This game is not supported yet.\n" ..
        "Join our Discord for updates!\n" ..
        "🌐  https://discord.gg/C3MpUNwsDU"
    )
end
