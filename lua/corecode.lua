core:module("CoreCode")
core:import("CoreTable")
core:import("CoreDebug")
core:import("CoreClass")
core:import("CoreApp")

function alive(obj)
	if (type(obj) == 'userdata' or type(obj) == 'table') and type(obj.alive) == 'function' then
		return obj:alive()
	end
	return false
end
