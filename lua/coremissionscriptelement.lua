local id = ModPath .. "\t" .. RequiredScript
if _G[id] then return else _G[id] = true end

core:module("CoreMissionScriptElement")
core:import("CoreXml")
core:import("CoreCode")
core:import("CoreClass")

--[string "core/lib/managers/mission/coremissionscriptel..."]:336: attempt to index local 'params' (a number value)
local _execute_on_executed = MissionScriptElement.execute_on_executed
function MissionScriptElement:execute_on_executed(execute_params)
	if type(execute_params) ~= "table" then
		return
	end

	if self._values and self._values.on_executed then
		local list = self._values.on_executed

		for i = #list, 1, -1 do
			if type(list[i]) ~= "table" then
				table.remove(list, i)
			end
		end
	end

	return _execute_on_executed(self, execute_params)
end
