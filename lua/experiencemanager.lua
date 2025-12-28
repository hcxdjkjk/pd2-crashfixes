local _get_xp_by_params = ExperienceManager.get_xp_by_params
function ExperienceManager:get_xp_by_params(params)
	if params and params.mission_xp and type(params.mission_xp) ~= "number" then
		params.mission_xp = 0
	end
	return _get_xp_by_params(self, params)
end

local _get_contract_xp_by_stars = ExperienceManager.get_contract_xp_by_stars
function ExperienceManager:get_contract_xp_by_stars(job_id, job_stars, risk_stars, professional, job_days, extra_params)
	if extra_params and extra_params.mission_xp and type(extra_params.mission_xp) ~= "number" then
		extra_params.mission_xp = 0
	end
	return _get_contract_xp_by_stars(self, job_id, job_stars, risk_stars, professional, job_days, extra_params)
end
