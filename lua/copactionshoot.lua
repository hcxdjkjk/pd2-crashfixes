-- [string "lib/units/enemies/cop/actions/upper_body/copa..."]:402: attempt to index field '_weapon_base' (a nil value)
local __update = CopActionShoot.update
function CopActionShoot:update(...)
    if self._weapon_base then __update(self, ...) end
end
-- [string "lib/units/enemies/cop/actions/upper_body/copa..."]:658: attempt to perform arithmetic on local 't' (a userdata value)
local __get_unit_shoot_pos = CopActionShoot._get_unit_shoot_pos
function CopActionShoot:_get_unit_shoot_pos(t, pos, ...)
    if type(t) == "userdata" and type(pos) == "number" then
        local save_t = t
        local save_pos = pos
        t = save_pos
        pos = save_t
    end
    return __get_unit_shoot_pos(self, t, pos, ...)
end
