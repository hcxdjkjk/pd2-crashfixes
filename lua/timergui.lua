-- [string "lib/units/props/timergui.lua"]:655: bad argument #1 to 'floor' (number expected, got nil)
-- [string "lib/units/props/timergui.lua"]:534: attempt to perform arithmetic on field '_current_timer' (a nil value)

local __set_jammed = TimerGui._set_jammed
function TimerGui:_set_jammed(jammed)
    self._current_timer = self._current_timer or 5
    self._time_left     = self._time_left or 5
    return __set_jammed(self, jammed)
end

local _update = TimerGui.update
function TimerGui:update(unit, t, dt)
    self._current_timer = self._current_timer or 5
    self._time_left     = self._time_left or 5
    self._timer         = self._timer or 5
    return _update(self, unit, t, dt)
end
