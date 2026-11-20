local id = ModPath .. "\t" .. RequiredScript
if _G[id] then return else _G[id] = true end

local __verify_sender = BaseNetworkHandler._verify_sender
function BaseNetworkHandler._verify_sender(rpc)
    if not managers.network then
        return
    end
    if type(rpc) ~= "userdata" then
        return
    end
    if not rpc.ip_at_index then
        return
    end
    return __verify_sender(rpc)
end
