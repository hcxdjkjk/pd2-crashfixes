local id = ModPath .. "\t" .. RequiredScript
if _G[id] then return else _G[id] = true end

--[string "lib/tweak_data/groupaitweakdata.lua"]:3469: attempt to index local 'lvl_tweak_data' (a nil value)
local __read_mission_preset = GroupAITweakData._read_mission_preset
function GroupAITweakData:_read_mission_preset(tweak_data)
    local lvls = tweak_data and tweak_data.levels
    if not lvls then
        return
    end
    local ggs = Global.game_settings.level_id
    if not (lvls[ggs] and lvls[ggs].group_ai_preset) then
        return
    end
	return __read_mission_preset(self, tweak_data)
end
