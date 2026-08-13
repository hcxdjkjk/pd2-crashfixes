--[string "lib/units/enemies/cop/actions/upper_body/copa..."]:402: attempt to index field '_weapon_base' (a nil value)
local _update = CopActionShoot.update
function CopActionShoot:update(...)
    if self._weapon_base then
        _update(self, ...)
    end
end

--[string "lib/units/enemies/cop/actions/upper_body/copa..."]:674: attempt to index local 'w_tweak' (a number value)
local __get_unit_shoot_pos = CopActionShoot._get_unit_shoot_pos
function CopActionShoot:_get_unit_shoot_pos(t, pos, dis, w_tweak, ...)
    if type(w_tweak) == "table" then
        return __get_unit_shoot_pos(self, t, pos, dis, w_tweak, ...)
    end
end
