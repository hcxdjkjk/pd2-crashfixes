local id = ModPath .. "\t" .. RequiredScript
if _G[id] then return else _G[id] = true end

local __verify_sender       = BaseNetworkHandler._verify_sender
function BaseNetworkHandler._verify_sender(rpc)
    if not managers.network then
        return
    end
    if not (
        ( rpc and type(rpc) == "userdata" ) 
        and ( rpc.ip_at_index and rpc:ip_at_index(0) )
    ) 
    then
        return
    end
    return __verify_sender(rpc)
end
