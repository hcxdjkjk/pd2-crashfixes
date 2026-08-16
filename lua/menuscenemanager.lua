--[string "lib/managers/menu/menuscenemanager.lua"]:1708: attempt to index local 'unit' (a nil value)
Hooks:PreHook(MenuSceneManager, "change_lobby_character", "dfsklfjsdlkfjl", function(self, peer_id, character_id, preferred_character)
	if not self._lobby_characters[peer_id] then
        if not character_id then
            character_id = "russian"
        end
		local unit_name = tweak_data.blackmarket.characters[character_id].menu_unit
		local unit = World:spawn_unit(Idstring(unit_name), Vector3(0, 0, 0), Rotation())

		self:_init_character(unit, peer_id)

		self._lobby_characters[peer_id] = unit
	end
end)

--[string "lib/managers/menu/menuscenemanager.lua"]:712: attempt to index field '_environments' (a nil value)
Hooks:PostHook(MenuSceneManager, "_set_up_environments", "jdhskjdhsk", function(self)
	self._environments = self._environments or {}
end)
