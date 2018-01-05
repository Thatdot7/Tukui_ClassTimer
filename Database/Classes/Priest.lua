local T, C, L = Tukui:unpack()

local ClassTimer = T["ClassTimer"]
local Class = select(2, UnitClass("player"))


if (Class ~= "PRIEST") then
	return
end

ClassTimer.Filter["PRIEST"] = {
	target = {
		ClassTimer:CreateSpellEntry(33076), -- Prayer of Mending
		ClassTimer:CreateSpellEntry(589), -- Shadow Word: Pain
		ClassTimer:CreateSpellEntry(15487), -- Silence
		ClassTimer:CreateSpellEntry(14914), -- Holy Fire
		ClassTimer:CreateSpellEntry(64044), -- Psychic Horror
		ClassTimer:CreateSpellEntry(204197), -- Purge the Wicked
		ClassTimer:CreateSpellEntry(34914), -- Vampiric Touch
		ClassTimer:CreateSpellEntry(8122), -- Psychic Scream
		ClassTimer:CreateSpellEntry(9484), -- Shackle Undead
	},
	player = {
		ClassTimer:CreateSpellEntry(47585), -- Dispersion
		ClassTimer:CreateSpellEntry(15286), -- Vampiric Embrace
		ClassTimer:CreateSpellEntry(33206), -- Pain Suppression
		ClassTimer:CreateSpellEntry(10060), -- Power Infusion
		ClassTimer:CreateSpellEntry(47753), --Divine Aegis
		ClassTimer:CreateSpellEntry(139), -- Renew
		ClassTimer:CreateSpellEntry(47788), -- Guardian Spirit
		ClassTimer:CreateSpellEntry(20711), -- Spirit of Redemption
		ClassTimer:CreateSpellEntry(6788), -- Weakened Soul
		ClassTimer:CreateSpellEntry(586), -- Fade
		ClassTimer:CreateSpellEntry(1706), -- Levitate
		ClassTimer:CreateSpellEntry(17), -- Power Word: Shield
	},
	procs = {
		ClassTimer:CreateSpellEntry(33150), -- Surge of Light
		ClassTimer:CreateSpellEntry(63735), -- Serendipity
		ClassTimer:CreateSpellEntry(59887), -- Borrowed Time
		ClassTimer:CreateSpellEntry(47930), -- Grace
		ClassTimer:CreateSpellEntry(81662), -- Evangelism


	},
}
