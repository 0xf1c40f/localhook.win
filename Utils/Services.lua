local GameServices = {}
local GetService = game.GetService

for _, v in ipairs({ "Players","RunService","ReplicatedStorage","StarterGui","Lighting","ServerScriptService","ServerStorage","SoundService","Teams","Workspace","HttpService","TeleportService","TweenService","MarketplaceService","UserInputService","ContextActionService","PathfindingService","CollectionService","Debris" }) do
	GameServices[v] = GetService(game, v)
end
shared.Service = GameServices
return GameServices
