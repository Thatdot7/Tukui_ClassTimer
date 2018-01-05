local T, C, L = Tukui:unpack()

local ClassTimer = T["ClassTimer"]
local Class = select(2, UnitClass("player"))

if (Class ~= "MAGE") then
	return
end

ClassTimer.Filter["MAGE"] = {
	target = {
		ClassTimer:CreateSpellEntry(133), -- Fireball
		ClassTimer:CreateSpellEntry(2120), -- Flamestrike
		ClassTimer:CreateSpellEntry(12654), -- Ignite
		ClassTimer:CreateSpellEntry(11366), -- Pyroblast
		ClassTimer:CreateSpellEntry(92315), -- Pyroblast!
		ClassTimer:CreateSpellEntry(11129), -- Combustion
		ClassTimer:CreateSpellEntry(132209), -- Pyromaniac
		ClassTimer:CreateSpellEntry(114954), -- Nether Tempest
		ClassTimer:CreateSpellEntry(113092), -- Frost Bomb
		ClassTimer:CreateSpellEntry(44457), -- Living Bomb
		ClassTimer:CreateSpellEntry(11180), -- Winter's Chill
		ClassTimer:CreateSpellEntry(120), -- Cone of Cold
		ClassTimer:CreateSpellEntry(31661), -- Dragon's Breath
		ClassTimer:CreateSpellEntry(168), -- Frost Armor
		ClassTimer:CreateSpellEntry(122), -- Frost Nova
		ClassTimer:CreateSpellEntry(11071), -- Frostbite
		ClassTimer:CreateSpellEntry(116), -- Frostbolt
		ClassTimer:CreateSpellEntry(11175), -- Permafrost
		ClassTimer:CreateSpellEntry(118), -- Polymorph
		ClassTimer:CreateSpellEntry(28272), -- Polymorph: Pig
		ClassTimer:CreateSpellEntry(28271), -- Polymorph: Turtle
		ClassTimer:CreateSpellEntry(61305), -- Polymorph: Black Cat
		ClassTimer:CreateSpellEntry(2139), -- Counterspell

	},
	player = {
		ClassTimer:CreateSpellEntry(30451), -- Arcane Blast
		ClassTimer:CreateSpellEntry(66), -- Invisiblity
		ClassTimer:CreateSpellEntry(12043), -- Presence of Mind
		ClassTimer:CreateSpellEntry(116257), -- Invoker's Energy
		ClassTimer:CreateSpellEntry(116011), -- Rune of Power
		ClassTimer:CreateSpellEntry(1463), -- Incanter's Ward
		ClassTimer:CreateSpellEntry(116267), -- Incanter's Absorbtion
		(ClassTimer:CreateSpellEntry(30482)), -- Molten Armor
		ClassTimer:CreateSpellEntry(31641), -- Blazing Speed
		ClassTimer:CreateSpellEntry(11426), -- Ice Barrier
		ClassTimer:CreateSpellEntry(45438), -- Ice Block

		(ClassTimer:CreateSpellEntry(130)), -- Slow Fall
		ClassTimer:CreateSpellEntry(12042), -- Arcane Power
		ClassTimer:CreateSpellEntry(12472), -- Icy Veins
		ClassTimer:CreateSpellEntry(48108), -- Hot Streak
		ClassTimer:CreateSpellEntry(64343), -- Impact
		ClassTimer:CreateSpellEntry(44401), -- Missile Barrage
		ClassTimer:CreateSpellEntry(44543), -- Fingers of Frost
		ClassTimer:CreateSpellEntry(31589), -- Slow
		ClassTimer:CreateSpellEntry(55342), -- Mirror Image
		ClassTimer:CreateSpellEntry(11255), -- Improved Counterspell
	},
	procs = {

	},
}
