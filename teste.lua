task.wait(2)
repeat task.wait() until game:IsLoaded()

game:GetService("ReplicatedStorage").endpoints.client_to_server.buy_travelling_merchant_item:InvokeServer("star_remnant307129")
if game.PlaceId == 8304191830 then
	game.Players.LocalPlayer.PlayerGui.MessageGui.Enabled = false
	if game.Players.LocalPlayer.Character.Head:FindFirstChild("_overhead") then
		workspace[game.Players.LocalPlayer.Name].Head["_overhead"]:Destroy()
	end
	while wait() do -- buy item merchant
	   game:GetService("ReplicatedStorage").endpoints.client_to_server.buy_travelling_merchant_item:InvokeServer("star_remnant307129")
	end
end
