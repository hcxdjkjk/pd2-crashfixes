--[string "lib/tweak_data/groupaitweakdata.lua"]:3469: attempt to index local 'lvl_tweak_data' (a nil value)
local __read_mission_preset = GroupAITweakData._read_mission_preset
function GroupAITweakData:_read_mission_preset(tweak_data)
	if 
		( tweak_data and tweak_data.levels ) and
		( Global.game_settings and Global.game_settings.level_id ) and
		tweak_data.levels[Global.game_settings.level_id].group_ai_preset
	then
		return __read_mission_preset(self, tweak_data)
	end
end
