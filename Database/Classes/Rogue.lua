local T, C, L = Tukui:unpack()

local ClassTimer = T["ClassTimer"]
local Class = select(2, UnitClass("player"))

if (Class ~= "ROGUE") then
	return
end

ClassTimer.Filter["ROGUE"] = {
	target = {
		ClassTimer:CreateSpellEntry(703), -- Garrote
		ClassTimer:CreateSpellEntry(79140), -- Vendetta
		ClassTimer:CreateSpellEntry(2818), -- Deadly Poison
		ClassTimer:CreateSpellEntry(8680), -- -- Wound Poison
		ClassTimer:CreateSpellEntry(3409), -- Crippling Poison
		ClassTimer:CreateSpellEntry(157584), -- Instant Poison
		ClassTimer:CreateSpellEntry(135345), -- Internal Bleeding
		ClassTimer:CreateSpellEntry(196937), -- Ghostly Strike
		ClassTimer:CreateSpellEntry(1943), -- Rupture
		ClassTimer:CreateSpellEntry(2094), -- Blind
		ClassTimer:CreateSpellEntry(1833), -- Cheap Shot
		ClassTimer:CreateSpellEntry(1776), -- Gouge
		ClassTimer:CreateSpellEntry(408), -- Kidney Shot
		ClassTimer:CreateSpellEntry(6770), -- Sap
		ClassTimer:CreateSpellEntry(1330), -- Garrote - Silence
		ClassTimer:CreateSpellEntry(18425), -- Kick - Silenced
		ClassTimer:CreateSpellEntry(26679), -- Deadly Throw
		ClassTimer:CreateSpellEntry(16511), -- Hemorrhage
	},
	player = {
		ClassTimer:CreateSpellEntry(13750), -- Adrenaline Rush
		ClassTimer:CreateSpellEntry(32645), -- Envenom
		ClassTimer:CreateSpellEntry(13877), -- Blade Flurry
		ClassTimer:CreateSpellEntry(1966), -- Feint
		ClassTimer:CreateSpellEntry(31224), -- Cloak of Shadows
		ClassTimer:CreateSpellEntry(74001), -- Combat Readiness
		ClassTimer:CreateSpellEntry(5277), -- Evasion
		ClassTimer:CreateSpellEntry(73651), -- Recuperate
		ClassTimer:CreateSpellEntry(36554), -- Shadowstep
		ClassTimer:CreateSpellEntry(5171), -- Slice and Dice
		ClassTimer:CreateSpellEntry(2983), -- Sprint
		ClassTimer:CreateSpellEntry(51713), -- Shadow Dance
		ClassTimer:CreateSpellEntry(121471), -- Shadow Blades
		ClassTimer:CreateSpellEntry(58426), -- Overkill
		ClassTimer:CreateSpellEntry(51690), -- Killing Spree
		ClassTimer:CreateSpellEntry(114015), -- Anticipation
		ClassTimer:CreateSpellEntry(156744), -- Shadow Reflection
		ClassTimer:CreateSpellEntry(199603), -- Jolly Roger
		ClassTimer:CreateSpellEntry(193358), -- Grand Melee
		ClassTimer:CreateSpellEntry(193357), -- Shark Infested Waters
		ClassTimer:CreateSpellEntry(193359), -- True Bearing
		ClassTimer:CreateSpellEntry(199600), -- Buried Treasure
		ClassTimer:CreateSpellEntry(193356), -- Broadsides
		ClassTimer:CreateSpellEntry(195627), -- Opportunity
		ClassTimer:CreateSpellEntry(199754), -- Riposte
		ClassTimer:CreateSpellEntry(185311), -- Crimson Vial
		ClassTimer:CreateSpellEntry(1856), -- Vanish
		ClassTimer:CreateSpellEntry(3408), -- Crippling Poison
		ClassTimer:CreateSpellEntry(2823), -- Deadly Poison
		ClassTimer:CreateSpellEntry(157584), -- Instant Poison
		ClassTimer:CreateSpellEntry(108211), -- Leeching Poison
		ClassTimer:CreateSpellEntry(8679), -- Wound Poison
	},
	procs = {

	},
}
