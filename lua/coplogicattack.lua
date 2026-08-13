--[string "lib/units/enemies/cop/logics/coplogicattack.lua"]:147: attempt to index field 'team' (a nil value)
local _update = CopLogicAttack.update
function CopLogicAttack.update(data)
	if not data.team then
        return
    end
	
    return _update(data)
end
