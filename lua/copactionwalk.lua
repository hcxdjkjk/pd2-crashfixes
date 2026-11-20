local id = ModPath .. "\t" .. RequiredScript
if _G[id] then return else _G[id] = true end

--update()  lib/units/enemies/cop/actions/lower_body/copactionwalk.lua:2390  
--_upd_actions()  lib/units/enemies/cop/copmovement.lua:840
--lib/units/enemies/cop/copmovement.lua:768
function CopActionWalk._nav_point_pos(nav_point)
    if nav_point then
        if nav_point.x then
            return nav_point
        end
        local elem = nav_point.element
        local pos = elem and elem.value and elem:value("position")
        if pos then
            return pos
        end
    end
    return Vector3()
end
