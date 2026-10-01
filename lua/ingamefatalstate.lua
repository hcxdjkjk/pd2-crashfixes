--[string "lib/states/ingamefatalstate.lua"]:13: attempt to index local 'player' (a nil value)
local _on_local_player_dead = IngameFatalState.on_local_player_dead
function IngameFatalState.on_local_player_dead()
	if not (managers.player and managers.player.player_unit and managers.player:player_unit()) then
        return
    end
	return _on_local_player_dead()
end
