local RunService = game:GetService("RunService")
local Connections = {}
local ModuleReturn = {}

function ModuleReturn:Start(func)
	table.insert(Connections, RunService.Heartbeat:Connect(func))
end

function ModuleReturn:End(func)
	for i, v in ipairs(Connections) do
		v:Disconnect()
	end
	table.clear(Connections)
	if func then
		task.spawn(func)
	end
end

shared.Task = ModuleReturn
return ModuleReturn
