-- loader/installer hhhhh :joy:
local get   = game.HttpGet
local id    = game.PlaceId
local dir   = 'localhook.win'
local repo  = 'https://raw.githubusercontent.com/0xf1c40f/localhook.win/main/Games/'

if not isfolder(dir) then
makefolder(dir)
end

local file = dir .. '/' .. id .. '.lua'
local ok, src = pcall(get, repo .. id .. '.lua')

if ok and src and #src > 0 then
  if not isfile(file) then 
    writefile(file, src) 
  end
    loadfile(file)()
end
