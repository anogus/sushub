
local games = {
    [7540891731] ="Red Light Green Light",
    [2693023319] = "Expedition Antarctica",
    [2098516465] = "Roblox High School 2",
    [3840352284] = "Volleyball 4 2",
    [7546582874] = "Fish Game",
    [2768379856] = "3008",
    [5611648039] = "Murder Party",
    [7551121821] = "Decaying Winter",
    [7393403076] ="Anime Artifacts Sim",
    [7549229959] = "Squid Game",
    [4851363266] ="My Park",
    [662417684] ="Lucky Blocks"
}

for i,v in next, games do
    games[i] = table.concat(v:split(' '), '_')
end
local name = nil
name = games[game.PlaceId] or games[game.GameId]

if name then
    return loadstring(game:HttpGet("https://raw.githubusercontent.com/anogus/sushub/main/scripts/" .. name .. ".lua"))()
end
