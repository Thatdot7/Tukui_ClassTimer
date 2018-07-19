local T, C, L = Tukui:unpack()

local ClassTimer = T["ClassTimer"]
local Class = select(2, UnitClass("player"))

if (Class ~= "ROGUE") then
	return
end

ClassTimer.Filter["ROGUE"] = {
	target = {
		ClassTimer:CreateSpellEntry("Garrote"), -- Garrote
		ClassTimer:CreateSpellEntry("Vendetta"), -- Vendetta
		ClassTimer:CreateSpellEntry("Deadly Poison"), -- Deadly Poison
		ClassTimer:CreateSpellEntry("Wound Poison"), -- -- Wound Poison
		ClassTimer:CreateSpellEntry("Crippling Poison"), -- Crippling Poison
		ClassTimer:CreateSpellEntry("Instant Poison"), -- Instant Poison
		ClassTimer:CreateSpellEntry("Internal Bleeding"), -- Internal Bleeding
		ClassTimer:CreateSpellEntry("Ghostly Strike"), -- Ghostly Strike
		ClassTimer:CreateSpellEntry("Rupture"), -- Rupture
		ClassTimer:CreateSpellEntry("Blind"), -- Blind
		ClassTimer:CreateSpellEntry("Cheap Shot"), -- Cheap Shot
		ClassTimer:CreateSpellEntry("Gouge"), -- Gouge
		ClassTimer:CreateSpellEntry("Kidney Shot"), -- Kidney Shot
		ClassTimer:CreateSpellEntry("Sap"), -- Sap
		ClassTimer:CreateSpellEntry("Garrote"), -- Garrote - Silence
		ClassTimer:CreateSpellEntry("Kick"), -- Kick - Silenced
		ClassTimer:CreateSpellEntry("Deadly Throw"), -- Deadly Throw
		ClassTimer:CreateSpellEntry("Hemorrhage"), -- Hemorrhage
	},
	player = {
		ClassTimer:CreateSpellEntry("Adrenaline Rush"), -- Adrenaline Rush
		ClassTimer:CreateSpellEntry("Envenom"), -- Envenom
		ClassTimer:CreateSpellEntry("Blade Flurry"), -- Blade Flurry
		ClassTimer:CreateSpellEntry("Feint"), -- Feint
		ClassTimer:CreateSpellEntry("Cloak of Shadows"), -- Cloak of Shadows
		ClassTimer:CreateSpellEntry("Combat Readiness"), -- Combat Readiness
		ClassTimer:CreateSpellEntry("Evasion"), -- Evasion
		ClassTimer:CreateSpellEntry("Recuperate"), -- Recuperate
		ClassTimer:CreateSpellEntry("Shadowstep"), -- Shadowstep
		ClassTimer:CreateSpellEntry("Slice and Dice"), -- Slice and Dice
		ClassTimer:CreateSpellEntry("Sprint"), -- Sprint
		ClassTimer:CreateSpellEntry("Shadow Dance"), -- Shadow Dance
		ClassTimer:CreateSpellEntry("Shadow Blades"), -- Shadow Blades
		ClassTimer:CreateSpellEntry("Overkill"), -- Overkill
		ClassTimer:CreateSpellEntry("Killing Spree"), -- Killing Spree
		ClassTimer:CreateSpellEntry("Anticipation"), -- Anticipation
		ClassTimer:CreateSpellEntry("Shadow Reflection"), -- Shadow Reflection
		ClassTimer:CreateSpellEntry("Jolly Roger"), -- Jolly Roger
		ClassTimer:CreateSpellEntry("Grand Melee"), -- Grand Melee
		ClassTimer:CreateSpellEntry("Shark Infested Waters"), -- Shark Infested Waters
		ClassTimer:CreateSpellEntry("True Bearing"), -- True Bearing
		ClassTimer:CreateSpellEntry("Buried Treasure"), -- Buried Treasure
		ClassTimer:CreateSpellEntry("Broadsides"), -- Broadsides
		ClassTimer:CreateSpellEntry("Opportunity"), -- Opportunity
		ClassTimer:CreateSpellEntry("Riposte"), -- Riposte
		ClassTimer:CreateSpellEntry("Crimson Vial"), -- Crimson Vial
		ClassTimer:CreateSpellEntry("Vanish"), -- Vanish
		ClassTimer:CreateSpellEntry("Crippling Poison"), -- Crippling Poison
		ClassTimer:CreateSpellEntry("Deadly Poison"), -- Deadly Poison
		ClassTimer:CreateSpellEntry("Instant Poison"), -- Instant Poison
		ClassTimer:CreateSpellEntry("Leeching Poison"), -- Leeching Poison
		ClassTimer:CreateSpellEntry("Wound Poison"), -- Wound Poison
	},
	procs = {

	},
}
