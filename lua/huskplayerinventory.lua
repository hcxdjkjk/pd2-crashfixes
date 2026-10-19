local id = ModPath .. "\t" .. RequiredScript
if _G[id] then return else _G[id] = true end

local verify_weapon = function(fname) 
    local tw = tweak_data.weapon
    local tf = tw and tw.factory
    return not not (fname and tf and tf[fname]) 
end

local _add_unit_by_factory_name = HuskPlayerInventory.add_unit_by_factory_name
function HuskPlayerInventory:add_unit_by_factory_name(factory_name, ...)
    if not verify_weapon(factory_name) then return end
    return _add_unit_by_factory_name(self, factory_name, ...)
end

local _add_unit_by_factory_blueprint = HuskPlayerInventory.add_unit_by_factory_blueprint
function HuskPlayerInventory:add_unit_by_factory_blueprint(factory_name, ...)
    if not verify_weapon(factory_name) then return end
    return _add_unit_by_factory_blueprint(self, factory_name, ...)
end
