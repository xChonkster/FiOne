local LuaX = loadstring(game:HttpGet("https://raw.githubusercontent.com/xChonkster/FiOne/main/LuaX", true))()
local LuaY = loadstring(game:HttpGet("https://raw.githubusercontent.com/xChonkster/FiOne/main/LuaY", true))()
local LuaZ = loadstring(game:HttpGet("https://raw.githubusercontent.com/xChonkster/FiOne/main/LuaZ", true))()
local LuaU = loadstring(game:HttpGet("https://raw.githubusercontent.com/xChonkster/FiOne/main/LuaU", true))()
local FiOne = loadstring(game:HttpGet("https://raw.githubusercontent.com/xChonkster/FiOne/main/FiOne", true))()

LuaX:init()
repeat wait() print("Waiting...") until LuaX.enums
print(LuaX.enums)

local LuaState = {}

getfenv().script = nil

return function(str,env)
	local f,writer,buff,name
	local env = env or getfenv(2)
	local name = (env.script and env.script:GetFullName())
	
	local ran,error = pcall(function()
		
		local zio = LuaZ:init(LuaZ:make_getS(str), nil)
		if not zio then return error("Failed to initalize LuaZ") end
		
		local func = LuaY:parser(LuaState, zio, nil, name or "nil")
		writer, buff = LuaU:make_setS()
		LuaU:dump(LuaState, func, writer, buff)
		
		f = FiOne.wrap_lua(FiOne.stm_lua(buff.data), env)
	end)
	
	if ran then
		return f,buff.data
	else
		return nil,error
	end
end
