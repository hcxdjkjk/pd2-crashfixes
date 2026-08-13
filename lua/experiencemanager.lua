--[string "lib/managers/experiencemanager.lua"]:813: attempt to perform arithmetic on local 'mission_xp_dissect' (a table value)
local _get_xp_by_params = ExperienceManager.get_xp_by_params
function ExperienceManager:get_xp_by_params(params)
	if params and type(params.mission_xp) ~= "number" then
		params.mission_xp = nil
	end
	return _get_xp_by_params(self, params)
end

local _mission_xp = ExperienceManager.mission_xp
function ExperienceManager:mission_xp(...)
	local xp = _mission_xp(self, ...)
	if type(xp) ~= "number" then
		return 0
	end
	return xp
end
