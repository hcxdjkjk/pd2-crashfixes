local id = ModPath .. "\t" .. RequiredScript
if _G[id] then return else _G[id] = true end

--[string "lib/units/weapons/menuraycastweaponbase.lua"]:581: attempt to index field 'unit' (a nil value)
local _tweak_data_anim_play = NewRaycastWeaponBase.tweak_data_anim_play
function NewRaycastWeaponBase:tweak_data_anim_play(...)
    if not alive(self._unit) then
        return
    end

    for _, data in pairs(self._parts or {}) do
        if not alive(data.unit) then
            return
        end
    end

    return _tweak_data_anim_play(self, ...)
end
