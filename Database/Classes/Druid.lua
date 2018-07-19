local T, C, L = Tukui:unpack()

local ClassTimer = T["ClassTimer"]
local Class = select(2, UnitClass("player"))

if (Class ~= "DRUID") then
	return
end

ClassTimer.Filter["DRUID"] = {
	target = {
		ClassTimer:CreateSpellEntry("Entangling Roots"), -- Entangling Roots
		ClassTimer:CreateSpellEntry("Hibernate"), -- Hibernate
		ClassTimer:CreateSpellEntry("Sunfire"), -- Sunfire
		ClassTimer:CreateSpellEntry("Weakened Blows"), -- Weakened Blows
		ClassTimer:CreateSpellEntry("Stellar Flare"), -- Stellar Flare
		ClassTimer:CreateSpellEntry("Moonfire"), -- Moonfire
		ClassTimer:CreateSpellEntry("Berserk"), -- Berserk
		ClassTimer:CreateSpellEntry("Faerie Fire"), -- Faerie Fire (Feral)
		ClassTimer:CreateSpellEntry("Feral Charge"), -- Feral Charge - Bear
		ClassTimer:CreateSpellEntry("Force of Nature"), -- Force of Nature
		ClassTimer:CreateSpellEntry("Mangle"), -- Mangle (Bear)
		ClassTimer:CreateSpellEntry("Wild Growth"), -- Wild Growth
		ClassTimer:CreateSpellEntry("Predator's Swiftness"), -- Predator's Swiftness
		ClassTimer:CreateSpellEntry("Nature's Vigil"), -- Nature's Vigil
		ClassTimer:CreateSpellEntry("Might of Ursoc"), -- Might of Ursoc
		ClassTimer:CreateSpellEntry("Incarnation: Sun of Ursoc"), -- Incarnation: Sun of Ursoc
		ClassTimer:CreateSpellEntry("Incarnation: King of the Jungle"), -- Incarnation: King of the Jungle
		ClassTimer:CreateSpellEntry("Incarnation: Chosen of Elune"), -- Incarnation: Chosen of Elune
		ClassTimer:CreateSpellEntry("Incarnation"), -- Incarnation   (this is the one used for Tree of Life)
		ClassTimer:CreateSpellEntry("Nature's Grasp"), -- Nature's Grasp
		ClassTimer:CreateSpellEntry("Cyclone"), -- Cyclone
		ClassTimer:CreateSpellEntry("Hibernate"), -- Hibernate
	},
	player = {
		ClassTimer:CreateSpellEntry("Barkskin"), -- Barkskin
		ClassTimer:CreateSpellEntry("Clearcasting"), -- Clearcasting
		ClassTimer:CreateSpellEntry("Innervate"), -- Innervate
		ClassTimer:CreateSpellEntry("Lifebloom"), -- Lifebloom
		ClassTimer:CreateSpellEntry("Regrowth"), -- Regrowth
		ClassTimer:CreateSpellEntry("Harmony"), -- Harmony
		ClassTimer:CreateSpellEntry("Pulverize"), -- Pulverize
		ClassTimer:CreateSpellEntry("Rejuvenation"), -- Rejuv (Germination)
		ClassTimer:CreateSpellEntry("Starfall"), -- Starfall
	},
	procs = {

	},
}
