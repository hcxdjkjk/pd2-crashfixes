--[string "lib/network/matchmaking/networkvoicechatsteam..."]:113: attempt to perform arithmetic on field 'time' (a nil value)
local _update = NetworkVoiceChatSTEAM.update
function NetworkVoiceChatSTEAM:update()
    if not self.handler then
        return
    end

    for _, data in pairs(self._users_talking or {}) do
		if type(data) == "table" and type(data.time) ~= "number" then
			data.time = 0
		end
	end

    _update(self)
end
