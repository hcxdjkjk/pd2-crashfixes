local __verify_sender       = BaseNetworkHandler._verify_sender
function BaseNetworkHandler._verify_sender(rpc)
    if managers.network and type(rpc) == "userdata" and rpc.ip_at_index and rpc:ip_at_index(0) then
        return __verify_sender(rpc)
    end
end

local __verify_character    = BaseNetworkHandler._verify_character
function BaseNetworkHandler._verify_character(unit)
    if alive(unit) and (unit.character_damage and type(unit:character_damage()) == "table") then
        return __verify_character(unit)
    end
end
