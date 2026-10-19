local id = ModPath .. "\t" .. RequiredScript
if _G[id] then return else _G[id] = true end

--[string "lib/managers/menu/menuscenemanager.lua"]:1708: attempt to index local 'unit' (a nil value)
local _change_lobby_character = MenuSceneManager.change_lobby_character
function MenuSceneManager:change_lobby_character(peer_id, character_id, preferred_character)
    if not self._lobby_characters[peer_id] then
        local unit_name = tweak_data.blackmarket.characters[character_id].menu_unit
        if unit_name then
            local unit = World:spawn_unit(Idstring(unit_name), Vector3(), Rotation())
            table.insert(self._lobby_characters, unit)
        end
    end
    return _change_lobby_character(self, peer_id, character_id, preferred_character)
end

local _clbk_mask_loaded = MenuSceneManager.clbk_mask_loaded
function MenuSceneManager:clbk_mask_loaded(data, mask_unit)
    if not alive(mask_unit) then
        return
    end
    return _clbk_mask_loaded(self, data, mask_unit)
end
