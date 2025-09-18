local _setup_panel = SocialHubLobbyItem.setup_panel
function SocialHubLobbyItem:setup_panel()
	self.data.DIFFICULTY = type(self.data.DIFFICULTY) == "number" and self.data.DIFFICULTY or 0
	_setup_panel(self)
end
