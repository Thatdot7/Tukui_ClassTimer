local T, C, L = Tukui:unpack();

local ClassTimerAPI = T["ClassTimer"];
local Colors = CreateFrame("Frame");

Colors = {
  ["ICON_COLOR"]            = {0.47, 0.47, 0.47, 1},
  ["CAST_SEPARATOR_COLOR"]  = {0, 0, 0, 0.5},
  ["PLAYER_BAR_COLOR"]      = {0.27, 0.27, 0.59, 1},
  ["TARGET_BAR_COLOR"]      = {0.27, 0.27, 0.59, 1},
  ["TARGET_DEBUFF_COLOR"]   = {0.59, 0.27, 0.27, 1},
  ["TRINKET_BAR_COLOR"]     = {0.59, 0.59, 0.27, 1},
  ["PLAYER_DEBUFF_COLOR"]   = nil,
}

ClassTimerAPI["Colors"] = Colors
