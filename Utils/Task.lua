local Connections = {}
local ModuleReturn = {}
function ModuleReturn:Start(func)
  table.insert(Connections, RunService.Heartbeat:Connect(func))
end
  
function ModuleReturn:End(func)
for i,v in Connections do
v:Disconnect()
end
  if func then
  task.spawn(func)
end
end
shared.Task = ModuleReturn
return ModuleReturn
