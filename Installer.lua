local Repo="https://raw.githubusercontent.com/0xf1c40f/localhook.win/refs/heads/main/"

local IsFile= isfile or function(File)
	local Success, Result = pcall(function() return readfile(File) end)
	return Success and Result~=nil and Result~=''
end

local DelFile= delfile or function(File)
	writefile(File,'')
end

local function DownloadFile(Path)
	if not IsFile(Path) then
		local Success, Result= pcall(function()
			return game:HttpGet(Repo..Path,true)
		end)
		if not Success or Result=='404: Not Found' then error(Result) end
		writefile(Path,Result)
	end
	return Path
end

local function WipeFolder(Path)
	if not isfolder(Path) then return end
	for _, File in listfiles(Path) do
		if File:find('loader') then continue end
		if IsFile(File) then DelFile(File) end
	end
end

for _, Folder in {"localhook","localhook/modules","localhook/configs"} do
	if not isfolder(Folder) then makefolder(Folder) end
end

local MainPath= DownloadFile("Installer.lua")
return loadfile(MainPath)()
