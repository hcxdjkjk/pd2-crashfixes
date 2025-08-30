--[[
local _track_listen_start = MusicManager.track_listen_start

function MusicManager:track_listen_start(event, track)
	_track_listen_start(self, event, tostring(track))
end

function MusicManager:track_listen_stop()
	Global.music_manager.source:post_event("stop_all_music")
	self._current_event = nil
	self._current_track = nil
	self._skip_play = nil
end

function MusicManager:stop_listen_all()
	Global.music_manager.source:post_event("stop_all_music")
	self._current_music_ext = nil
	self._current_event = nil
	self._current_track = nil
	self._skip_play = nil
end
]]
