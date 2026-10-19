local id = ModPath .. "\t" .. RequiredScript
if _G[id] then return else _G[id] = true end

--[string "lib/managers/menu/menucomponentmanager.lua"]:4973: attempt to index field '_fullscreen_ws' (a nil value)
local _play_transition = MenuComponentManager.play_transition
function MenuComponentManager:play_transition(...)
    if not self._fullscreen_ws then 
        return 
    end
    return _play_transition(self, ...)
end
