local mvec1 = Vector3()
local mvec2 = Vector3()
local mvec3 = Vector3()
local material_defaults = {
	diffuse_layer1_texture = Idstring("units/payday2_cash/safes/default/base_gradient/base_default_df"),
	diffuse_layer2_texture = Idstring("units/payday2_cash/safes/default/pattern_gradient/gradient_default_df"),
	diffuse_layer0_texture = Idstring("units/payday2_cash/safes/default/pattern/pattern_default_df"),
	diffuse_layer3_texture = Idstring("units/payday2_cash/safes/default/sticker/sticker_default_df")
}
local material_textures = {
	pattern = "diffuse_layer0_texture",
	sticker = "diffuse_layer3_texture",
	pattern_gradient = "diffuse_layer2_texture",
	base_gradient = "diffuse_layer1_texture"
}
local material_variables = {
	cubemap_pattern_control = "cubemap_pattern_control",
	pattern_pos = "pattern_pos",
	uv_scale = "uv_scale",
	uv_offset_rot = "uv_offset_rot",
	pattern_tweak = "pattern_tweak",
	wear_and_tear = (managers.blackmarket and managers.blackmarket:skin_editor() and managers.blackmarket:skin_editor():active() or Application:production_build()) and "wear_tear_value" or nil
}

function NewRaycastWeaponBase:set_cosmetics_data(cosmetics)
	
  if not cosmetics or type(cosmetics) ~= "table" then
		self._cosmetics_id = nil
		self._cosmetics_quality = nil
		self._cosmetics_bonus = nil
		self._cosmetics_color_index = nil
		self._cosmetics_pattern_scale = nil
		self._cosmetics_data = nil
		return nil
	end
	
	self._cosmetics = cosmetics
	self._cosmetics_id = cosmetics and cosmetics.id
	self._cosmetics_quality = cosmetics and cosmetics.quality
	self._cosmetics_bonus = cosmetics and cosmetics.bonus
	self._cosmetics_data = self._cosmetics_id and tweak_data.blackmarket.weapon_skins[self._cosmetics_id]
	self._cosmetics_color_index = cosmetics and cosmetics.color_index
	self._cosmetics_pattern_scale = cosmetics and cosmetics.pattern_scale or tweak_data.blackmarket.weapon_color_pattern_scale_default

	if self._cosmetics_color_index and self._cosmetics_data and self._cosmetics_data.color_skin_data then
		local color_skin_data = self._cosmetics_data.color_skin_data
		local variation_template = tweak_data.blackmarket.weapon_color_templates.color_variation[self._cosmetics_color_index]

		if not variation_template then
			self._cosmetics_id = nil
			self._cosmetics_quality = nil
			self._cosmetics_bonus = nil
			self._cosmetics_color_index = nil
			self._cosmetics_pattern_scale = nil
			self._cosmetics_data = nil
			return nil
		end

		local variation_data = {
			base_none = material_defaults.diffuse_layer1_texture,
			pattern_none = material_defaults.diffuse_layer0_texture,
			gradient_none = material_defaults.diffuse_layer2_texture
		}

		for key, value in pairs(variation_template) do
			variation_data[key] = color_skin_data[value]
		end

		local weapon_color_data = {}

		tweak_data.blackmarket:populate_weapon_color_skin(weapon_color_data, variation_data, self._name_id)

		for k, v in pairs(self._cosmetics_data) do
			weapon_color_data[k] = v
		end

		self._cosmetics_data = weapon_color_data
	end
end
