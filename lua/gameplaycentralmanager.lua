--[string] "lib/managers/gameplaycentralmanager"]:768: attempt to index a number value
local _mission_disable_unit = GamePlayCentralManager.mission_disable_unit
function GamePlayCentralManager:mission_disable_unit(unit)
	if type(unit) == "userdata" and alive(unit) and unit.base then
		return _mission_disable_unit(self, unit)
	end
end

local _mission_enable_unit = GamePlayCentralManager.mission_enable_unit
function GamePlayCentralManager:mission_enable_unit(unit)
	if type(unit) == "userdata" and alive(unit) and unit.base then
		return _mission_enable_unit(self, unit)
	end
end
