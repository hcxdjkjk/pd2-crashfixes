local _add_server_job = CrimeNetGui.add_server_job
function CrimeNetGui:add_server_job(data)
	if not (tonumber(data.difficulty_id)) then
		data.difficulty_id = -1
	end
	_add_server_job(self, data)
end
