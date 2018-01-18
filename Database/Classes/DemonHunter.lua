local T, C, L = Tukui:unpack()

local ClassTimer = T["ClassTimer"]
local Class = select(2, UnitClass("player"))

if (Class ~= "DEMONHUNTER") then
	return
end

ClassTimer.Filter["DEMONHUNTER"] = {
	target = {
		ClassTimer:CreateSpellEntry(179057),	-- Chaos Nova
		ClassTimer:CreateSpellEntry(207744),	-- Fiery Brand
		ClassTimer:CreateSpellEntry(217832),	-- Imprison
		ClassTimer:CreateSpellEntry(202137),	-- Sigil of Silence
		ClassTimer:CreateSpellEntry(206491),	-- Nemesis
	},
	player = {
		ClassTimer:CreateSpellEntry(188501), 	-- Spectral Sight
		ClassTimer:CreateSpellEntry(203551),
		ClassTimer:CreateSpellEntry(191427),	-- Metamorphosis
		ClassTimer:CreateSpellEntry(206476),
		ClassTimer:CreateSpellEntry(212800),	-- Blur
		ClassTimer:CreateSpellEntry(196555),
		ClassTimer:CreateSpellEntry(211048),
		ClassTimer:CreateSpellEntry(203720),
		ClassTimer:CreateSpellEntry(218256),	-- Empower Wards
		ClassTimer:CreateSpellEntry(204021),
		ClassTimer:CreateSpellEntry(178740),	-- Immolation Aura
		ClassTimer:CreateSpellEntry(217832),
		ClassTimer:CreateSpellEntry(187827),
		ClassTimer:CreateSpellEntry(203819),	-- Demon Spikes
		ClassTimer:CreateSpellEntry(227225),	-- Soul Barrier

	},
	procs = {

	},
}
