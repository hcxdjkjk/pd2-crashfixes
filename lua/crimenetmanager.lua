local _add_server_job = CrimeNetGui.add_server_job
function CrimeNetGui:add_server_job(data)
	if data.mutators and type(data.mutators) == "table" and table.empty(data.mutators) then
	  data.mutators = false
	end
	if not (tonumber(data.difficulty_id)) then
		data.difficulty_id = 0
	end
	if tonumber(data.num_players) == 4 then
		return
	end
	if #data.owner_id ~= 32 then
		return
	end
	_add_server_job(self, data)
end
