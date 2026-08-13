--[string "lib/units/enemies/cop/actions/upper_body/copa..."]:88: attempt to index local 'attention' (a nil value)
--[string "lib/units/enemies/cop/actions/upper_body/copa..."]:103: attempt to index local 'attention_unit' (a nil value)
local _on_attention = CopActionTase.on_attention
function CopActionTase:on_attention(attention)
    pcall(_on_attention, self, attention)
end
