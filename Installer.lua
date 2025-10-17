-- // localhook.win :fire: \\ --
local fetch = (syn and syn.request) or http_request or (fluxus and fluxus.request) or request
local id    = game.PlaceId
local dir   = 'localhook.win'
local repo  = 'https://raw.githubusercontent.com/0xf1c40f/localhook.win/main/Games/'

makefolder(dir)

local file = dir..'/'..id..'.lua'
local resp = fetch({Url = repo..id..'.lua', Method = 'GET'})

if resp and resp.StatusCode == 200 and resp.Body and #resp.Body > 0 then
  if not isfile(file) then 
    writefile(file, resp.Body)
  end
    loadfile(file)()
end
