local T, C, L = Tukui:unpack()

local ClassTimer = T["ClassTimer"]
local Class = select(2, UnitClass("player"))

if (Class ~= "WARRIOR") then
	return
end

ClassTimer.Filter["WARRIOR"] = {
	target = {
		ClassTimer:CreateSpellEntry("Colossus Smash"), -- Colossus Smash
		ClassTimer:CreateSpellEntry("Deep Wounds"), --
		ClassTimer:CreateSpellEntry("Demoralizing Shout"), --
		ClassTimer:CreateSpellEntry("Hamstring"), -- Hamstring
		ClassTimer:CreateSpellEntry("Mortal Strike"), -- Mortal Strike
		ClassTimer:CreateSpellEntry("Shattering Throw"), -- Shattering Throw
		ClassTimer:CreateSpellEntry("Rend"), -- Rend
		ClassTimer:CreateSpellEntry("Pummel"), -- Pummel
		ClassTimer:CreateSpellEntry("Weakened Blows"), -- Weakened Blows
		ClassTimer:CreateSpellEntry("Warbringer"), -- Warbringer
		ClassTimer:CreateSpellEntry("Shockwave"), -- Shockwave
		ClassTimer:CreateSpellEntry("Dragon Roar"), -- Dragon Roar
		ClassTimer:CreateSpellEntry("Piercing Howl"), -- Piercing Howl
	},
	player = {
		ClassTimer:CreateSpellEntry("Battle Shout"), -- Battle Shout
		ClassTimer:CreateSpellEntry("Berserker Rage"), -- Berserker Rage
		ClassTimer:CreateSpellEntry("Commanding Shout"), -- Commanding Shout
		ClassTimer:CreateSpellEntry("Recklessness"), -- Recklessness
		ClassTimer:CreateSpellEntry("Die by the Sword"), -- Die by the Sword
		ClassTimer:CreateSpellEntry(" Demoralizing Shout"), -- Demoralizing Shout
		ClassTimer:CreateSpellEntry("Second Wind"), -- Second Wind
		ClassTimer:CreateSpellEntry("Shield Block"), -- Shield Block
		ClassTimer:CreateSpellEntry("Last Stand"), -- Last Stand
		ClassTimer:CreateSpellEntry("Enrage"), -- Enrage
		ClassTimer:CreateSpellEntry("Sword and Board"), -- Sword and Board
		ClassTimer:CreateSpellEntry("Taste for Blood"), -- Taste for Blood
		ClassTimer:CreateSpellEntry("Trauma"), -- Trauma
		ClassTimer:CreateSpellEntry("Meat Cleaver"), -- Meat Cleaver
		ClassTimer:CreateSpellEntry("Avatar"), -- Avatar
		ClassTimer:CreateSpellEntry("Bloodbath"), -- Bloodbath
		(ClassTimer:CreateSpellEntry("Shield Wall"), -- Shield Wall
		ClassTimer:CreateSpellEntry("Bladestorm"), --Bladestorm
		ClassTimer:CreateSpellEntry("Intimidating Shout"), -- Intimidating Shout
		ClassTimer:CreateSpellEntry("Revenge"), -- Revenge
	},
	procs = {

	},
}
