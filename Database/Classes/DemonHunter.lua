local T, C, L = Tukui:unpack()

local ClassTimer = T["ClassTimer"]
local Class = select(2, UnitClass("player"))

if (Class ~= "DEMONHUNTER") then
	return
end

ClassTimer.Filter["DEMONHUNTER"] = {
	target = {
		ClassTimer:CreateSpellEntry("Chaos Nova"),	-- Chaos Nova
		ClassTimer:CreateSpellEntry("Fiery Brand"),	-- Fiery Brand
		ClassTimer:CreateSpellEntry("Imprison"),	-- Imprison
		ClassTimer:CreateSpellEntry("Sigil of Silence"),	-- Sigil of Silence
		ClassTimer:CreateSpellEntry("Nemesis"),	-- Nemesis
	},
	player = {
		ClassTimer:CreateSpellEntry("Spectral Sight"), 	-- Spectral Sight
		ClassTimer:CreateSpellEntry("Metamorphosis"),	-- Metamorphosis
		ClassTimer:CreateSpellEntry("Blur"),	-- Blur
		ClassTimer:CreateSpellEntry("Empower Wards"),	-- Empower Wards
		ClassTimer:CreateSpellEntry("Immolation Aura"),	-- Immolation Aura
		ClassTimer:CreateSpellEntry("Demon Spikes"),	-- Demon Spikes
		ClassTimer:CreateSpellEntry("Soul Barrier"),	-- Soul Barrier

	},
	procs = {

	},
}
