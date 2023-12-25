local TextChatService = game:GetService("TextChatService")
local Players = game:GetService("Players")
player = Players.LocalPlayer

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local DivisionChatEvent = ReplicatedStorage:WaitForChild("DivisionChatEvent")
local DivisionChat = TextChatService:WaitForChild("TextChannels"):WaitForChild("DivisionChat")


DivisionChatEvent.OnClientEvent:Connect(function(message, originUserId)
	if originUserId == player.UserId then
		DivisionChat:SendAsync(message)
	else
		local originPlayer = Players:GetPlayerByUserId(originUserId)
		if originPlayer then
			local formattedMessage = "[Division] " .. originPlayer.Name .. ": " .. message
			game.StarterGui:SetCore("ChatMakeSystemMessage", {
				Text = formattedMessage,
				Color = Color3.new(0.5, 0.5, 1)
			})
		end
	end
end)
