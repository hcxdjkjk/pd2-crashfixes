-- [string "lib/managers/group_ai_states/groupaistatebesi..."]:1572: attempt to index local 'spawned_unit' (a nil value)
local __perform_group_spawning = GroupAIStateBesiege._perform_group_spawning
function GroupAIStateBesiege:_perform_group_spawning(spawn_task, force, use_last)
    local spawn_points = spawn_task.spawn_group.spawn_pts
    for i = #spawn_points, 1, -1 do
        local sp_data = spawn_points[i]
        local data = sp_data and sp_data.mission_element
        if not (data and data.produce) then
            table.remove(spawn_points, i)
        end
    end
    return __perform_group_spawning(self, spawn_task, force, use_last)
end
