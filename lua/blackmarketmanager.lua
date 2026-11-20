local id = ModPath .. "\t" .. RequiredScript
if _G[id] then return else _G[id] = true end

--[string "lib/managers/blackmarketmanager.lua"]:1369: attempt to index local 'equipped' (a nil value)
local __outfit_string_mask = BlackMarketManager._outfit_string_mask
function BlackMarketManager:_outfit_string_mask()
    if type(self:equipped_mask()) ~= "table" then
    	return "character_locked nothing no_color_no_material plastic"
    end
    return __outfit_string_mask(self)
end

--[string "lib/managers/blackmarketmanager.lua"]:1572: attempt to index local 'weapon' (a nil value)
local _get_silencer_concealment_modifiers = BlackMarketManager.get_silencer_concealment_modifiers
function BlackMarketManager:get_silencer_concealment_modifiers(weapon)
    if type(weapon) ~= "table" then
        return 0
    end
    local weapon_id = weapon.weapon_id or managers.weapon_factory:get_weapon_id_by_factory_id(weapon.factory_id)
    if not weapon_id then
        return 0
    end
    return _get_silencer_concealment_modifiers(self, weapon)
end

local _set_equipped_armor_skin = BlackMarketManager.set_equipped_armor_skin
function BlackMarketManager:set_equipped_armor_skin(skin_id, loading)
    if not skin_id then
        return
    end
    local armor_skin = tweak_data.economy and tweak_data.economy.armor_skins and tweak_data.economy.armor_skins[skin_id]
    if not armor_skin then
        return
    end
    return _set_equipped_armor_skin(self, skin_id, loading)
end

local _get_weapon_icon_path = BlackMarketManager.get_weapon_icon_path
function BlackMarketManager:get_weapon_icon_path(weapon_id, cosmetics)
    if cosmetics and cosmetics.id and cosmetics.id ~= "nil" then
        local weapon_tweak = tweak_data.blackmarket.weapon_skins[cosmetics.id]

        if weapon_tweak
            and weapon_tweak.global_value == "tam"
            and not weapon_tweak.is_a_color_skin
            and string.match(cosmetics.id, "tam")
        then
            local guis_catalog = "guis/"
            local bundle = weapon_tweak.texture_bundle_folder

            if bundle then
                guis_catalog = guis_catalog .. "dlcs/" .. tostring(bundle) .. "/"
            end

            local texture_name = weapon_tweak.texture_name or cosmetics.id
            local texture_path = guis_catalog .. "weapon_skins/" .. texture_name

            local rarity = weapon_tweak.rarity or "common"
            local rarity_path = tweak_data.economy.rarities[rarity]
                and tweak_data.economy.rarities[rarity].bg_texture

            return texture_path, rarity_path
        end
    end
    return _get_weapon_icon_path(self, weapon_id, cosmetics)
end

--[string "lib/managers/blackmarketmanager.lua"]:766: attempt to index field 'grenades' (a nil value)
local _equipped_grenade = BlackMarketManager.equipped_grenade
function BlackMarketManager:equipped_grenade()
    if not Global.blackmarket_manager.grenades then
        return self._defaults.grenade, 0
    end
    return _equipped_grenade(self)
end

--[string "lib/managers/blackmarketmanager.lua"]:10496: attempt to index local 'equipped_mask' (a nil value)
local _equipped_mask = BlackMarketManager.equipped_mask
function BlackMarketManager:equipped_mask(...)
    local result = _equipped_mask(self, ...)
    if type(result) == "table" then
        return result
    end
    return {
        mask_id         = self._defaults.mask,
        modded          = false,
        equipped        = true,
        global_value    = "normal",
        blueprint       = self:get_mask_default_blueprint(self._defaults.mask)
    }
end
