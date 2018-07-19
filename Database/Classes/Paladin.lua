local T, C, L = Tukui:unpack()

local ClassTimer = T["ClassTimer"]
local Class = select(2, UnitClass("player"))

if (Class ~= "PALADIN") then
	return
end

ClassTimer.Filter["PALADIN"] = {
	target = {
		ClassTimer:CreateSpellEntry(183218), -- Hand of Hindrance
		ClassTimer:CreateSpellEntry(197277), -- Judgment
		ClassTimer:CreateSpellEntry(196941), -- Judgment of the Light
		ClassTimer:CreateSpellEntry(204242), -- Consecration (Holy, Protection)
		ClassTimer:CreateSpellEntry(205228), -- Consecration (Retribution)
		ClassTimer:CreateSpellEntry(1044), -- Blessing of Freedom
		ClassTimer:CreateSpellEntry(204013), -- Blessing of Salvation
		ClassTimer:CreateSpellEntry(204018), -- Blessing of Spellwarding
		ClassTimer:CreateSpellEntry(6940), -- Blessing of Sacrifice
		ClassTimer:CreateSpellEntry(1022), -- Blessing of Protection
		ClassTimer:CreateSpellEntry(213757), -- Execution Sentence
		ClassTimer:CreateSpellEntry(853), -- Hammer of Justice
		ClassTimer:CreateSpellEntry(20066), -- Repentance
		ClassTimer:CreateSpellEntry(105421), -- Blinding Light
	},
	player = {
		ClassTimer:CreateSpellEntry(184092), -- Light of the Protector
		ClassTimer:CreateSpellEntry(210191), -- Word of Glory
		ClassTimer:CreateSpellEntry(205191), -- Eye for an Eye
		ClassTimer:CreateSpellEntry(1044), -- Blessing of Freedom
		ClassTimer:CreateSpellEntry(204013), -- Blessing of Salvation
		ClassTimer:CreateSpellEntry(204018), -- Blessing of Spellwarding
		ClassTimer:CreateSpellEntry(6940), -- Blessing of Sacrifice
		ClassTimer:CreateSpellEntry(1022), -- Blessing of Protection
		ClassTimer:CreateSpellEntry(86659), -- Guardian of Ancient Kings
		ClassTimer:CreateSpellEntry(105809), -- Holy Avenger
		ClassTimer:CreateSpellEntry(31884), -- Avenging Wrath
		ClassTimer:CreateSpellEntry(31842), -- Avenging Wrath (Holy)
		ClassTimer:CreateSpellEntry(31850), -- Ardent defender
		ClassTimer:CreateSpellEntry(6940), -- Blessing of Sacrifice
		ClassTimer:CreateSpellEntry(132403), -- Shield of the Righteous
		ClassTimer:CreateSpellEntry(642), -- Divine Shield
		ClassTimer:CreateSpellEntry(184662), -- Shield of Vengeance
		ClassTimer:CreateSpellEntry(204150), -- Aegis of Light
		ClassTimer:CreateSpellEntry(202273), -- Seal of Light
		ClassTimer:CreateSpellEntry(224668), -- Crusade
		ClassTimer:CreateSpellEntry(498), -- Divine Protection
		ClassTimer:CreateSpellEntry(221883), -- Divine Steed
		ClassTimer:CreateSpellEntry(31821), -- Aura Mastery
		ClassTimer:CreateSpellEntry(115750), --Blinding Light
		ClassTimer:CreateSpellEntry(223819), -- Divine Purpose
		ClassTimer:CreateSpellEntry(105809), -- Holy Avenger
		ClassTimer:CreateSpellEntry(204150), -- Aegis of Light
		ClassTimer:CreateSpellEntry(53380), -- Righteous Vengeance
		ClassTimer:CreateSpellEntry(31935), -- Avenger's Shield
		ClassTimer:CreateSpellEntry(26573), -- Consecration
		ClassTimer:CreateSpellEntry(31842), -- Divine Illumination
		ClassTimer:CreateSpellEntry(64205), -- Divine Sacrifice
		ClassTimer:CreateSpellEntry(53563), -- Beacon of Light
		ClassTimer:CreateSpellEntry(31833), -- Light's Grace
		ClassTimer:CreateSpellEntry(53672), -- Infusion of Light
		ClassTimer:CreateSpellEntry(20049), -- Vengeance
		ClassTimer:CreateSpellEntry(20335), -- Heart of the Crusader
		ClassTimer:CreateSpellEntry(53380), -- Righteous Vengeance
		ClassTimer:CreateSpellEntry(9452), -- Vindication
	},
	procs = {
		ClassTimer:CreateSpellEntry(152262), -- Seraphim
	},
}
