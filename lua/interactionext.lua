local id = ModPath .. "\t" .. RequiredScript
if _G[id] then return else _G[id] = true end

--[string lib/units/interactions/interactionext.lua"]:71: attempt to index field '_interact_obj' (a number value)
local __upd_interaction_topology = BaseInteractionExt._upd_interaction_topology
function BaseInteractionExt:_upd_interaction_topology()
	if type(self._unit) ~= "userdata" or type(self._unit.get_object) ~= "function" then
		return nil
	end
	return __upd_interaction_topology(self)
end

local __setup_ray_objects = BaseInteractionExt._setup_ray_objects
function BaseInteractionExt:_setup_ray_objects()
	if self._interact_obj and type(self._interact_obj) ~= "userdata" then
		self._interact_obj = nil
	end
	return __setup_ray_objects(self)
end

local __update_interact_position = BaseInteractionExt._update_interact_position
function BaseInteractionExt:_update_interact_position()
	if self._interact_obj and type(self._interact_obj) ~= "userdata" then
		self._interact_obj = nil
	end
	return __update_interact_position(self)
end

local __update_interact_axis = BaseInteractionExt._update_interact_axis
function BaseInteractionExt:_update_interact_axis()
	if self._interact_obj and type(self._interact_obj) ~= "userdata" then
		self._interact_obj = nil
	end
	return __update_interact_axis(self)
end
