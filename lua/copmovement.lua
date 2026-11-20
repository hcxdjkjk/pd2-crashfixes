local id = ModPath .. "\t" .. RequiredScript
if _G[id] then return else _G[id] = true end

local _set_m_host_stop_pos = CopMovement.set_m_host_stop_pos
function CopMovement:set_m_host_stop_pos(pos)
    if not self._m_host_stop_pos then
        return
    end
    if type(pos) ~= "userdata" then
        pos = Vector3()
    end
    return _set_m_host_stop_pos(self, pos)
end
