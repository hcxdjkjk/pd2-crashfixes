--[string "lib/units/weapons/newnpcraycastweaponbase.lua"]:514: attempt to index a nil value
function NewNPCRaycastWeaponBase:_sound_singleshot()
    if not (
        self._name_id 
        and (self._sound_fire and self._sound_fire.post_event)
        and self._setup
        and self._voice
    )
    then return end

	local tweak_sound = tweak_data and tweak_data.weapon and tweak_data.weapon[self._name_id] and tweak_data.weapon[self._name_id].sounds
	local sound_name = tweak_sound and tweak_sound.prefix .. self._setup.user_sound_variant .. self._voice .. "_1shot"
	local sound = self._sound_fire:post_event(sound_name)

	if not sound then
		sound_name = tweak_sound.prefix .. "1" .. self._voice .. "_1shot"
		sound = self._sound_fire:post_event(sound_name)
	end
end
