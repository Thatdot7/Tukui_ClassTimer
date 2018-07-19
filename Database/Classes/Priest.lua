local T, C, L = Tukui:unpack()

local ClassTimer = T["ClassTimer"]
local Class = select(2, UnitClass("player"))


if (Class ~= "PRIEST") then
	return
end

ClassTimer.Filter["PRIEST"] = {
	target = {
		ClassTimer:CreateSpellEntry("Prayer of Mending"), -- Prayer of Mending
		ClassTimer:CreateSpellEntry("Shadow Word: Pain"), -- Shadow Word: Pain
		ClassTimer:CreateSpellEntry("Silence"), -- Silence
		ClassTimer:CreateSpellEntry("Holy Fire"), -- Holy Fire
		ClassTimer:CreateSpellEntry("Psychic Horror"), -- Psychic Horror
		ClassTimer:CreateSpellEntry("Purge the Wicked"), -- Purge the Wicked
		ClassTimer:CreateSpellEntry("Vapiric Touch"), -- Vampiric Touch
		ClassTimer:CreateSpellEntry("Psychic Scream"), -- Psychic Scream
		ClassTimer:CreateSpellEntry("Shackle Undead"), -- Shackle Undead
	},
	player = {
		ClassTimer:CreateSpellEntry("Dispension"), -- Dispersion
		ClassTimer:CreateSpellEntry("Vampiric Embrace"), -- Vampiric Embrace
		ClassTimer:CreateSpellEntry("Pain Suppression"), -- Pain Suppression
		ClassTimer:CreateSpellEntry("Power Infusion"), -- Power Infusion
		ClassTimer:CreateSpellEntry("Divine Aegis"), --Divine Aegis
		ClassTimer:CreateSpellEntry("Renew"), -- Renew
		ClassTimer:CreateSpellEntry("Guardian Spirit"), -- Guardian Spirit
		ClassTimer:CreateSpellEntry("Spirit of Redemption"), -- Spirit of Redemption
		ClassTimer:CreateSpellEntry("Weakened Soul"), -- Weakened Soul
		ClassTimer:CreateSpellEntry("Fade"), -- Fade
		ClassTimer:CreateSpellEntry("Levi"), -- Levitate
		ClassTimer:CreateSpellEntry("Power Word: Shield"), -- Power Word: Shield
	},
	procs = {
		ClassTimer:CreateSpellEntry("Surge of Light"), -- Surge of Light
		ClassTimer:CreateSpellEntry("Serendipity"), -- Serendipity
		ClassTimer:CreateSpellEntry("Borrowed Time"), -- Borrowed Time
		ClassTimer:CreateSpellEntry("Grace"), -- Grace
		ClassTimer:CreateSpellEntry("Evangelism"), -- Evangelism
		ClassTimer:CreateSpellEntry("Voidform"), -- Voidform stacks


	},
}
