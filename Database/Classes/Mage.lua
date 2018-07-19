local T, C, L = Tukui:unpack()

local ClassTimer = T["ClassTimer"]
local Class = select(2, UnitClass("player"))

if (Class ~= "MAGE") then
	return
end

ClassTimer.Filter["MAGE"] = {
	target = {
		ClassTimer:CreateSpellEntry("Fireball"), -- Fireball
		ClassTimer:CreateSpellEntry("Flamestrike"), -- Flamestrike
		ClassTimer:CreateSpellEntry("Ignite"), -- Ignite
		ClassTimer:CreateSpellEntry("Pyroblast"), -- Pyroblast
		ClassTimer:CreateSpellEntry("Pyromaniac"), -- Pyromaniac
		ClassTimer:CreateSpellEntry("Nether Tempest"), -- Nether Tempest
		ClassTimer:CreateSpellEntry("Frost Bomb"), -- Frost Bomb
		ClassTimer:CreateSpellEntry("Living Bomb"), -- Living Bomb
		ClassTimer:CreateSpellEntry("Winter's Chill"), -- Winter's Chill
		ClassTimer:CreateSpellEntry("Cone of Cold"), -- Cone of Cold
		ClassTimer:CreateSpellEntry("Dragon's Breath"), -- Dragon's Breath
		ClassTimer:CreateSpellEntry("Frost Armor"), -- Frost Armor
		ClassTimer:CreateSpellEntry("Frost Nova"), -- Frost Nova
		ClassTimer:CreateSpellEntry("Frostbite"), -- Frostbite
		ClassTimer:CreateSpellEntry("Frostbolt"), -- Frostbolt
		ClassTimer:CreateSpellEntry("Permafrost"), -- Permafrost
		ClassTimer:CreateSpellEntry("Polymorph"), -- Polymorph
		ClassTimer:CreateSpellEntry("Counterspell"), -- Counterspell

	},
	player = {
		ClassTimer:CreateSpellEntry("Combustion"), -- Combustion

		ClassTimer:CreateSpellEntry("Invisiblity"), -- Invisiblity
		ClassTimer:CreateSpellEntry("Greater Invisiblity"), -- Greater Invisiblity

		ClassTimer:CreateSpellEntry("Presence of Mind"), -- Presence of Mind
		ClassTimer:CreateSpellEntry("Invoker's Energy"), -- Invoker's Energy
		ClassTimer:CreateSpellEntry("Rune of Power"), -- Rune of Power
		ClassTimer:CreateSpellEntry("Incanter's Ward"), -- Incanter's Ward
		ClassTimer:CreateSpellEntry("Incanter's Absorbtion"), -- Incanter's Absorbtion
		ClassTimer:CreateSpellEntry("Molten Armor"), -- Molten Armor
		ClassTimer:CreateSpellEntry("Blazing Speed"), -- Blazing Speed
		ClassTimer:CreateSpellEntry("Ice Barrier"), -- Ice Barrier
		ClassTimer:CreateSpellEntry("Ice Block"), -- Ice Block

		ClassTimer:CreateSpellEntry("Slow Fall"), -- Slow Fall
		ClassTimer:CreateSpellEntry("Arcane Power"), -- Arcane Power
		ClassTimer:CreateSpellEntry("Icy Veins"), -- Icy Veins
		ClassTimer:CreateSpellEntry("Hot Streak"), -- Hot Streak
		ClassTimer:CreateSpellEntry("Impact"), -- Impact
		ClassTimer:CreateSpellEntry("Missile Barrage"), -- Missile Barrage
		ClassTimer:CreateSpellEntry("Fingers of Frost"), -- Fingers of Frost
		ClassTimer:CreateSpellEntry("Slow"), -- Slow
		ClassTimer:CreateSpellEntry("Mirror Image"), -- Mirror Image
		ClassTimer:CreateSpellEntry("Improved Counterspell"), -- Improved Counterspell
	},
	procs = {
		ClassTimer:CreateSpellEntry("Icicles"), -- Icicles

	},
}
