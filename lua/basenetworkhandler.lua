--[string "lib/network/base/handlers/basenetworkhandler.lua"]:46: attempt to index local 'rpc' (a nil value)
local __verify_sender = BaseNetworkHandler._verify_sender
function BaseNetworkHandler._verify_sender(rpc)
    if managers.network and type(rpc) == "userdata" and rpc.ip_at_index and rpc:ip_at_index(0) then
        return __verify_sender(rpc)
    end
end

function BaseNetworkHandler._verify_character(unit)
    if unit and type(unit) == "userdata" and alive(unit) then
        local cd = unit:character_damage()
        if cd and type(cd) == "table" and not cd:dead() then
            return true
        end
    end
    return false
end
