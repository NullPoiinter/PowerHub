repeat wait() until game:IsLoaded()

function join()
    local args = {
        [1] = "_lobbytemplategreen6"
    }
    game:GetService("ReplicatedStorage").endpoints.client_to_server.request_join_lobby:InvokeServer(unpack(args))
end

function Create()
    local args = {
        [1] = "_lobbytemplategreen6",
        [2] = "namek_infinite",
        [3] = true,
        [4] = "Hard"
    }
    game:GetService("ReplicatedStorage").endpoints.client_to_server.request_lock_level:InvokeServer(unpack(args))
end

function start()
    local args = {
        [1] = "_lobbytemplategreen6"
    }
    game:GetService("ReplicatedStorage").endpoints.client_to_server.request_start_game:InvokeServer(unpack(args))
end

function startWave()
    while true do
        if game:GetService("Workspace")["_wave_num"].Value < 1 then
            game:GetService("ReplicatedStorage").endpoints.client_to_server.vote_start:InvokeServer()
        end
    wait()
    end
end 

function AutoUpgrade()
	while true do
		for i, v in next, game:GetService("Workspace")["_UNITS"]:GetChildren() do
			if game:GetService("Workspace")["_wave_num"].Value > 4 then
				if v._stats.upgrade.Value < 20 then 
					local args = {
						[1] = v
					}
					game:GetService("ReplicatedStorage").endpoints.client_to_server.upgrade_unit_ingame:InvokeServer(unpack(args))
				end
			end
		end
    wait()
	end
end


function autoPlace()
	while true do
        if game:GetService("Workspace")["_wave_num"].Value < 80 then
            local args = {
                [1] = getgenv().id,
                [2] = CFrame.new(-2949.064453125, 91.80620574951172, -698.9860229492188) * CFrame.Angles(0, -0, -0)
                }
            game:GetService("ReplicatedStorage").endpoints.client_to_server.spawn_unit:InvokeServer(unpack(args))
        end
  	wait()
	end
end

game.Players.LocalPlayer.PlayerGui.MessageGui.Enabled = false


function webhook()
    local data = {
       ["content"] = "",
       ["embeds"] = {
           {
               ["title"] = "**Anime Adventures Inf**",
               ["description"] = "Lost on wave: " .. game:GetService("Workspace")["_wave_num"].Value .. ".  Amount of Gems Earned: " ..game.Players.LocalPlayer.PlayerGui.ResultsUI.Holder.GoldGemXP.GemReward.Main.Amount.Text.. ". Time Taken: " ..game.Players.LocalPlayer.PlayerGui.ResultsUI.Holder.Middle.Timer.Text.. " ",
                                   
               ["type"] = "rich",
               ["color"] = tonumber(0x7269da),
               
           }
       }
    }
    local newdata = game:GetService("HttpService"):JSONEncode(data)
    local headers = {
       ["content-type"] = "application/json"
    }
    request = http_request or request or HttpPost or syn.request
    local abcdef = {Url = "https://discordapp.com/api/webhooks/994916019292344340/nDnHIgmRk88TwunMg3jixtqXciQ0Z4GuNpjkgdZ7gV0WigUtz08v82Qjbhwcaule5WfX", Body = newdata, Method = "POST", Headers = headers}
    request(abcdef)
end

function teleport()
    while true do
        if game:GetService("Workspace")["_DATA"].GameFinished.Value == true then
            webhook()
            game:GetService("ReplicatedStorage").endpoints.client_to_server.teleport_back_to_lobby:InvokeServer()
        end
    wait()
    end
end


if game.PlaceId == 8304191830 then
    while true do
        join()
        task.wait(1)
        Create()
        task.wait(1)
        start()
        task.wait()
    end
elseif game.PlaceId == 8349889591 then
    task.wait(20)
    startWave()
    autoPlace()
    AutoUpgrade()
    teleport()
end
