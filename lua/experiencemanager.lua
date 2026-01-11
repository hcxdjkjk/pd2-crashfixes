local _get_xp_by_params = ExperienceManager.get_xp_by_params
local _get_contract_xp_by_stars = ExperienceManager.get_contract_xp_by_stars

function ExperienceManager:get_xp_by_params(params)
	params.mission_xp = tonumber(params.mission_xp)
	return _get_xp_by_params(self, params)
end

function ExperienceManager:get_contract_xp_by_stars(job_id, job_stars, risk_stars, professional, job_days, extra_params)
	extra_params.mission_xp = tonumber(extra_params.mission_xp)
	return _get_contract_xp_by_stars(self, job_id, job_stars, risk_stars, professional, job_days, extra_params)
end
