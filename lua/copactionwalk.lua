--[string "lib/units/enemies/cop/actions/lower_body/copa..."]:341: attempt to index field '_nav_path' (a nil value)
local _init = CopActionWalk.init
function CopActionWalk:init(action_desc, common_data)
	if action_desc and not action_desc.nav_path and common_data and common_data.pos then
		action_desc.nav_path = { mvector3.copy(common_data.pos) }
	end
    return _init(self, action_desc, common_data)
end
