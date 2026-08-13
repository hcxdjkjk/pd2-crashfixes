--[string "lib/managers/menu/menuscenemanager.lua"]:1708: attempt to index local 'unit' (a nil value)
local _change_lobby_character = MenuSceneManager.change_lobby_character
function MenuSceneManager:change_lobby_character(peer_id, character_id, preferred_character)
    if not peer_id then
        return
    end
    _change_lobby_character(self, peer_id, character_id, preferred_character)
end

--[string "lib/managers/menu/menuscenemanager.lua"]:712: attempt to index field '_environments' (a nil value)
Hooks:PostHook(MenuSceneManager, "_set_up_environments", "jdhskjdhsk", function(self)
	self._environments = self._environments or {}
end)
