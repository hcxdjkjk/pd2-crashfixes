local _setup_panel = SocialHubLobbyItem.setup_panel
function SocialHubLobbyItem:setup_panel()
	if self.data.DIFFICULTY then
		if not tonumber(self.data.DIFFICULTY) then
			self.data.DIFFICULTY = 0
		end
	else
		self.data.DIFFICULTY = 0
	end
	_setup_panel(self)
end
