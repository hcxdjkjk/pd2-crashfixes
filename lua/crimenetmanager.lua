local _add_server_job = CrimeNetGui.add_server_job
function CrimeNetGui:add_server_job(data)
	if not data then return end
	if not (tonumber(data.difficulty_id)) then
		data.difficulty_id = -1
	end
	if data.mutators and type(data.mutators) == "table" and table.empty(data.mutators) then --stealed but idc
    	data.mutators = false
  	end
	_add_server_job(self, data)
end

local _update_server_job = CrimeNetGui.update_server_job
function CrimeNetGui:update_server_job(data, i)
	if not data then return end
	if not (tonumber(data.difficulty_id)) then
		data.difficulty_id = -1
	end
	if data.mutators and type(data.mutators) == "table" and table.empty(data.mutators) then
   		data.mutators = false
	end
	_update_server_job(self, data, i)
end
