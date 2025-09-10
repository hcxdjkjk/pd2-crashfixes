--[string "lib/units/cameras/fpcameraplayerbase.lua"]:286: bad argument #1 to 'abs' (number expected, got nil)
function FPCameraPlayerBase:stop_shooting(wait)
	self._recoil_kick.to_reduce = self._recoil_kick.accumulated or 0
	self._recoil_kick.h.to_reduce = self._recoil_kick.h.accumulated or 0
	self._recoil_wait = wait or 0
end

local _recoil_kick = FPCameraPlayerBase.recoil_kick
function FPCameraPlayerBase:recoil_kick(up, down, left, right)
	if self._recoil_kick.accumulated and up and down and left and right then
		_recoil_kick(self, up, down, left, right)
	end
end

local __vertical_recoil_kick = FPCameraPlayerBase._vertical_recoil_kick
function FPCameraPlayerBase:_vertical_recoil_kick(t, dt)
	self._recoil_kick.accumulated = self._recoil_kick.accumulated or 0 
	return __vertical_recoil_kick(self, t, dt)
end

local __horizonatal_recoil_kick = FPCameraPlayerBase._horizonatal_recoil_kick
function FPCameraPlayerBase:_horizonatal_recoil_kick(t, dt)
	self._recoil_kick.accumulated = self._recoil_kick.accumulated or 0 
	return __horizonatal_recoil_kick(self, t, dt)
end
