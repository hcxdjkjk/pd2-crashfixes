--update()  lib/units/enemies/cop/actions/lower_body/copactionwalk.lua:2390  
--_upd_actions()  lib/units/enemies/cop/copmovement.lua:840
--lib/units/enemies/cop/copmovement.lua:768
function CopActionWalk._nav_point_pos(nav_point)
    if nav_point and nav_point.x then
        return nav_point
    end
    if nav_point.element and nav_point.element.value and nav_point.element:value("position") then
        return nav_point.element:value("position")
    end
    return Vector3()
end
