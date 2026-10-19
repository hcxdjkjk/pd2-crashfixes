local id = ModPath .. "\t" .. RequiredScript
if _G[id] then return else _G[id] = true end

--[string "lib/managers/social_hub/socialhubpanels.lua"]:127: bad argument #1 to 'ipairs' (table expected, got nil)
local _mouse_moved = SocialHubUserItem.mouse_moved
function SocialHubUserItem:mouse_moved(...)
    self._buttons = self._buttons or {}
    return _mouse_moved(self, ...)
end

local _mouse_pressed = SocialHubUserItem.mouse_pressed
function SocialHubUserItem:mouse_pressed(...)
    self._buttons = self._buttons or {}
    return _mouse_pressed(self, ...)
end

local _confirm_pressed = SocialHubUserItem.confirm_pressed
function SocialHubUserItem:confirm_pressed(...)
    self._buttons = self._buttons or {}
    return _confirm_pressed(self, ...)
end

local _move_button_selection = SocialHubUserItem.move_button_selection
function SocialHubUserItem:move_button_selection(...)
    self._buttons = self._buttons or {}
    return _move_button_selection(self, ...)
end
