function autoSkill()
	while true do task.wait()
	      pcall(function()
	               for i, v in next, game:GetService("Workspace")["_UNITS"]:GetChildren() do
	                	if v:IsA("Model") and v._stats.player.Value == game.Players.LocalPlayer then
		                   local args = {
		                     [1] = v
		                  }
		                 game:GetService("ReplicatedStorage").endpoints.client_to_server.use_active_attack:InvokeServer(unpack(args))
	              end
	          end
	      end)
	 end
end

function webhook()
	local data = {
	["content"] = "",
	["embeds"] = {
		{
			["title"] = ":video_game: **Anime Adventures Infinito - Namek**",
			["description"] = ":small_blue_diamond:  Wave: " .. game:GetService("Workspace")["_wave_num"].Value .. ".\n <:diamond:991077028331667476> Gemas ganhas: " .. game.Players.LocalPlayer.PlayerGui.ResultsUI.Holder.GoldGemXP.GemReward.Main.Amount.Text .. "\n :bank: Total: " .. game.Players.LocalPlayer._stats.gem_amount.Value .. "\n :hourglass_flowing_sand: " .. game.Players.LocalPlayer.PlayerGui.ResultsUI.Holder.Middle.Timer.Text .. " ",
							
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
	local abcdef = {Url = "https://discord.com/api/webhooks/994916019292344340/nDnHIgmRk88TwunMg3jixtqXciQ0Z4GuNpjkgdZ7gV0WigUtz08v82Qjbhwcaule5WfX", Body = newdata, Method = "POST", Headers = headers}
	request(abcdef)
end

function sendWebHook()
	while true do task.wait()
		if game:GetService("Workspace")["_DATA"].GameFinished.Value == true then
			task.wait(4)
			webhook()
		end
	end
end

local vu = game:GetService("VirtualUser")
game:GetService("Players").LocalPlayer.Idled:connect(function()
vu:Button2Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
wait(1)
vu:Button2Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
end)

if game.Players.LocalPlayer.Character.Head:FindFirstChild("_overhead") then
	workspace[game.Players.LocalPlayer.Name].Head["_overhead"]:Destroy()
end



if game.PlaceId == 8349889591 then
	repeat wait() until game:IsLoaded()
	task.wait(20)
	-- Made by RIP#6666
_G.Settings = {
    Players = {
        ["Ignore Me"] = true, -- Ignore your Character
        ["Ignore Others"] = true -- Ignore other Characters
    },
    Meshes = {
        Destroy = false, -- Destroy Meshes
        LowDetail = true -- Low detail meshes (NOT SURE IT DOES ANYTHING)
    },
    Images = {
        Invisible = true, -- Invisible Images
        LowDetail = false, -- Low detail images (NOT SURE IT DOES ANYTHING)
        Destroy = false, -- Destroy Images
    },
    Other = {
        ["No Particles"] = true, -- Disables all ParticleEmitter, Trail, Smoke, Fire and Sparkles
        ["No Camera Effects"] = true, -- Disables all PostEffect's (Camera/Lighting Effects)
        ["No Explosions"] = true, -- Makes Explosion's invisible
        ["No Clothes"] = true, -- Removes Clothing from the game
        ["Low Water Graphics"] = true, -- Removes Water Quality
        ["No Shadows"] = true, -- Remove Shadows
        ["Low Rendering"] = true, -- Lower Rendering
        ["Low Quality Parts"] = true -- Lower quality parts
    }
}
loadstring(game:HttpGet("https://raw.githubusercontent.com/CasperFlyModz/discord.gg-rips/main/FPSBooster.lua"))()
	_G.a = true 
	while _G.a do
		task.wait()
		autoSkill()
		sendWebHook()
	end
end
