local verify_weapon = function(fname) return not not (fname and tweak_data.weapon and tweak_data.weapon.factory and tweak_data.weapon.factory[fname]) end

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
