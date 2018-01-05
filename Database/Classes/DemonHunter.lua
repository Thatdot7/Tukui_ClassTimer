local T, C, L = Tukui:unpack()

local ClassTimer = T["ClassTimer"]
local Class = select(2, UnitClass("player"))

if (Class ~= "DEMONHUNTER") then
	return
end

ClassTimer.Filter["DEMONHUNTER"] = {
	target = {
		ClassTimer:CreateSpellEntry(179057),	-- Chaos Nova
	},
	player = {
		ClassTimer:CreateSpellEntry(188501), -- Spectral Sight
		ClassTimer:CreateSpellEntry(203551),
		ClassTimer:CreateSpellEntry(191427),
		ClassTimer:CreateSpellEntry(206476),
		ClassTimer:CreateSpellEntry(206491),
		ClassTimer:CreateSpellEntry(198589),
		ClassTimer:CreateSpellEntry(196555),
		ClassTimer:CreateSpellEntry(211048),
		ClassTimer:CreateSpellEntry(203720),
		ClassTimer:CreateSpellEntry(218256),
		ClassTimer:CreateSpellEntry(204021),
		ClassTimer:CreateSpellEntry(178740),
		ClassTimer:CreateSpellEntry(217832),
		ClassTimer:CreateSpellEntry(187827),
	},
	procs = {

	},
}
