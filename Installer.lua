-- // LocalHook.win loader \\ --
local fetch = (syn and syn.request) or http_request or (fluxus and fluxus.request) or request
local id    = game.PlaceId
local dir   = 'localhook.win'
local repo  = 'https://raw.githubusercontent.com/0xf1c40f/localhook.win/main/Games/'

if not isfolder(dir) then
  makefolder(dir)
end

local file = dir .. '/' .. id .. '.lua'
local head = fetch({Url = repo .. id .. '.lua', Method = 'HEAD'})

if head.StatusCode == 200 then
    if not isfile(file) then
        writefile(file, fetch({Url = repo .. id .. '.lua'}).Body)
    end
    loadfile(file)()
end
