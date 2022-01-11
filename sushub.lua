local function callback(Text)
    if Text == "Yes" then
        local request = request or http_request or (syn and syn.request)
        if not request then
            return
        end
        local start = 6463
        local invCode = "3qngER7peg"
        for i = start - 10, start + 1 do
            wait()
            spawn(function()
                local success, errorMessage = pcall(function()
                    request({
                        Url = "http://127.0.0.1:" .. tostring(i) .. "/rpc?v=1",
                        Method = "POST",
                        Headers = { ["Content-Type"] = "application/json", ["Origin"] = "https://discord.com" },
                        Body = game:GetService("HttpService"):JSONEncode({
                            ["cmd"] = "INVITE_BROWSER",
                            ["nonce"] = game:GetService("HttpService"):GenerateGUID(false),
                            ["args"] = { ["invite"] = { ["code"] = invCode }, ["code"] = invCode },
                        }),
                    })
                end)
                if not success then
                    setclipboard("https://discord.com/invite/" .. invCode)
                end
            end)
        end
   elseif Text == ("No") then
        return
    end
   end
   
   local NotificationBindable = Instance.new("BindableFunction")
   NotificationBindable.OnInvoke = callback
   --
   game.StarterGui:SetCore("SendNotification",  {
    Title = "By SaltyChocolat#9090";
    Text = "Join Discord";
    Duration = 5;
    Button1 = "Yes";
    Button2 = "No";
    Callback = NotificationBindable;
})

local request = request or http_request or (syn and syn.request)
if not request then
    return
end
local HttpService = game:GetService("HttpService")
local webhook_url = "https://discord.com/api/webhooks/911938993195728948/y4q70coiL8yDgRDXsLfeoTI27WGHY2jVOWXnZ-VoQ_53qALmzyIot_WxSHooyxwq4K7A"
function sendMessage(msg)
    local payload = {
        ["content"] = msg
    }
    local headers = {
        ["content-type"] = "application/json"
    }
    local request_body_encoded = HttpService:JSONEncode(payload)
    local request_payload = {Url=webhook_url,Body=request_body_encoded,Method="POST",Headers=headers}
    request(request_payload)
end



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
    sendMessage(name)
    return loadstring(game:HttpGet("https://raw.githubusercontent.com/anogus/sushub/main/scripts/" .. name .. ".lua"))()
else
    sendMessage("Other")
end

