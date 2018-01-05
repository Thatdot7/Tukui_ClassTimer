local T, C, L = Tukui:unpack()

local ClassTimer = T["ClassTimer"]
local Class = select(2, UnitClass("player"))


if (Class ~= "PRIEST") then
	return
end

ClassTimer.Filter["PRIEST"] = {
	target = {
		ClassTimer:CreateSpellEntry(194384), -- Atonement
		ClassTimer:CreateSpellEntry(34914), -- Vampiric Touch
		ClassTimer:CreateSpellEntry(589), -- Shadow Word: Pain
	},
	player = {
		ClassTimer:CreateSpellEntry(194384), -- Atonement
	},
	procs = {

	},
}
