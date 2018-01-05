local T, C, L = Tukui:unpack()

local ClassTimer = T["ClassTimer"]
local Class = select(2, UnitClass("player"))

if (Class ~= "WARRIOR") then
	return
end

ClassTimer.Filter["WARRIOR"] = {
	target = {
		ClassTimer:CreateSpellEntry(86346), -- Colossus Smash
		ClassTimer:CreateSpellEntry(12721), -- Deep Wounds
		ClassTimer:CreateSpellEntry(1160), -- Demoralizing Shout
		ClassTimer:CreateSpellEntry(1715), -- Hamstring
		ClassTimer:CreateSpellEntry(12294), -- Mortal Strike
		ClassTimer:CreateSpellEntry(64382), -- Shattering Throw
		ClassTimer:CreateSpellEntry(772), -- Rend
		ClassTimer:CreateSpellEntry(6552), -- Pummel
		ClassTimer:CreateSpellEntry(115798), -- Weakened Blows
		ClassTimer:CreateSpellEntry(103828), -- Warbringer
		ClassTimer:CreateSpellEntry(46968), -- Shockwave
		ClassTimer:CreateSpellEntry(118000), -- Dragon Roar
		ClassTimer:CreateSpellEntry(12323), -- Piercing Howl
	},
	player = {
		ClassTimer:CreateSpellEntry(6673), -- Battle Shout
		ClassTimer:CreateSpellEntry(18499), -- Berserker Rage
		ClassTimer:CreateSpellEntry(469), -- Commanding Shout
		ClassTimer:CreateSpellEntry(1719), -- Recklessness
		ClassTimer:CreateSpellEntry(118038), -- Die by the Sword
		ClassTimer:CreateSpellEntry(1160), -- Demoralizing Shout
		ClassTimer:CreateSpellEntry(29834), -- Second Wind
		ClassTimer:CreateSpellEntry(2565), -- Shield Block
		ClassTimer:CreateSpellEntry(12975), -- Last Stand
		ClassTimer:CreateSpellEntry(12880), -- Enrage
		ClassTimer:CreateSpellEntry(46951), -- Sword and Board
		ClassTimer:CreateSpellEntry(56638), -- Taste for Blood
		ClassTimer:CreateSpellEntry(46856), -- Trauma
		ClassTimer:CreateSpellEntry(12329), -- Meat Cleaver
		ClassTimer:CreateSpellEntry(107574), -- Avatar
		ClassTimer:CreateSpellEntry(12292), -- Bloodbath
		(ClassTimer:CreateSpellEntry(871)), -- Shield Wall
		ClassTimer:CreateSpellEntry(46924), --Bladestorm
		ClassTimer:CreateSpellEntry(5246), -- Intimidating Shout
		ClassTimer:CreateSpellEntry(6572), -- Revenge
	},
	procs = {

	},
}
