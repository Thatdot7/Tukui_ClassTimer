local T, C, L = Tukui:unpack()

local ClassTimer = T["ClassTimer"]
local Class = select(2, UnitClass("player"))

if (Class ~= "WARLOCK") then
	return
end

ClassTimer.Filter["WARLOCK"] = {
	target = {
		ClassTimer:CreateSpellEntry("Agony"),
		ClassTimer:CreateSpellEntry("Doom"),
		ClassTimer:CreateSpellEntry("Corruption"),
		ClassTimer:CreateSpellEntry("Immolate"),
		ClassTimer:CreateSpellEntry("Shadowflame"),
		ClassTimer:CreateSpellEntry("Seed of Corruption"),
		ClassTimer:CreateSpellEntry("Haunt"),
		ClassTimer:CreateSpellEntry("Conflagrate"),
		ClassTimer:CreateSpellEntry("Havoc"),
		ClassTimer:CreateSpellEntry("Unstable Affliction"),
		ClassTimer:CreateSpellEntry("Banish"),
		ClassTimer:CreateSpellEntry("Mortal Coil"),
		ClassTimer:CreateSpellEntry("Fear"),
		ClassTimer:CreateSpellEntry("Howl of Terror"),
		ClassTimer:CreateSpellEntry("Enslave Demon"),
		ClassTimer:CreateSpellEntry("Seduction"),
		ClassTimer:CreateSpellEntry("Shadowburn"),
	},
	player = {
		ClassTimer:CreateSpellEntry("Backdraft"),

	},
	procs = {

	},
}
