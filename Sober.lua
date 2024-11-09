loadstring(game:HttpGet("https://raw.githubusercontent.com/Spectrum-Trash/Storage/main/Gamelist.lua"))()
for PlaceID, Execute in pairs(Games) do
    if PlaceID == game.PlaceId then
        loadstring(game:HttpGet(Execute))()
    end
end
