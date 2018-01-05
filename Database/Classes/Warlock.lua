local T, C, L = Tukui:unpack()

local ClassTimer = T["ClassTimer"]
local Class = select(2, UnitClass("player"))

if (Class ~= "WARLOCK") then
	return
end

ClassTimer.Filter["WARLOCK"] = {
	target = {
		ClassTimer:CreateSpellEntry(980), -- Agony
		ClassTimer:CreateSpellEntry(603), -- Doom
		ClassTimer:CreateSpellEntry(172), -- Corruption
		ClassTimer:CreateSpellEntry(44518), -- Immolate
		ClassTimer:CreateSpellEntry(61290), -- Shadowflame
		ClassTimer:CreateSpellEntry(27243), -- Seed of Corruption
		ClassTimer:CreateSpellEntry(48181), -- Haunt
		ClassTimer:CreateSpellEntry(47960), -- Shadowflame
		ClassTimer:CreateSpellEntry(17962), -- Conflagrate
		ClassTimer:CreateSpellEntry(124480), -- Conflag, green
		ClassTimer:CreateSpellEntry(124481), -- Conflag, green, ae
		ClassTimer:CreateSpellEntry(689), -- Drain Life
		ClassTimer:CreateSpellEntry(80240), -- Havoc
		ClassTimer:CreateSpellEntry(30108), -- Unstable Affliction
		ClassTimer:CreateSpellEntry(710), -- Banish
		ClassTimer:CreateSpellEntry(48184), --Haunt
		ClassTimer:CreateSpellEntry(6789), -- Mortal Coil
		ClassTimer:CreateSpellEntry(5782), -- Fear
		ClassTimer:CreateSpellEntry(5484), -- Howl of Terror
		ClassTimer:CreateSpellEntry(29893), -- Ritual of Souls
		ClassTimer:CreateSpellEntry(6358), -- Seduction
		ClassTimer:CreateSpellEntry(17877), -- Shadowburn
		ClassTimer:CreateSpellEntry(20707), -- Soulstone Resurrection
	},
	player = {
		ClassTimer:CreateSpellEntry(1098), -- Enslave Demon
		ClassTimer:CreateSpellEntry(1122), -- Summon Infernal
		ClassTimer:CreateSpellEntry(17941), -- Nightfall
		ClassTimer:CreateSpellEntry(140074), -- Molten Core
		ClassTimer:CreateSpellEntry(17794), -- Shadow Vulnerability
	},
	procs = {

	},
}
