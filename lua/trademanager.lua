--[string "lib/managers/trademanager.lua"]:694: attempt to index a nil value
local __send_begin_trade = TradeManager._send_begin_trade
function TradeManager:_send_begin_trade(criminal)
	if criminal then
		return __send_begin_trade(self, criminal)
	end
end

local __send_cancel_trade = TradeManager._send_cancel_trade
function TradeManager:_send_cancel_trade(criminal)
	if criminal then
		return __send_cancel_trade(self, criminal)
	end
end
