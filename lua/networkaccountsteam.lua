--[string "lib/network/matchmaking/networkaccountsteam.lua"]:99: attempt to concatenate local 'difficulty' (a nil value)
local _get_win_ratio = NetworkAccountSTEAM.get_win_ratio
function NetworkAccountSTEAM:get_win_ratio(difficulty, level)
    if difficulty and level then
        return _get_win_ratio(self, difficulty, level)
    end
end
