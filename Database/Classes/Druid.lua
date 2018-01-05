local T, C, L = Tukui:unpack()

local ClassTimer = T["ClassTimer"]
local Class = select(2, UnitClass("player"))

if (Class ~= "DRUID") then
	return
end

ClassTimer.Filter["DRUID"] = {
	target = {
		ClassTimer:CreateSpellEntry(339), -- Entangling Roots
		ClassTimer:CreateSpellEntry(2637), -- Hibernate
		ClassTimer:CreateSpellEntry(164815), -- Sunfire
		ClassTimer:CreateSpellEntry(115798), -- Weakened Blows
		ClassTimer:CreateSpellEntry(202347), -- Stellar Flare
		ClassTimer:CreateSpellEntry(164812), -- Moonfire
		ClassTimer:CreateSpellEntry(50334), -- Berserk
		ClassTimer:CreateSpellEntry(16857), -- Faerie Fire (Feral)
		ClassTimer:CreateSpellEntry(16979), -- Feral Charge - Bear
		ClassTimer:CreateSpellEntry(33831), -- Force of Nature
		ClassTimer:CreateSpellEntry(33878), -- Mangle (Bear)
		ClassTimer:CreateSpellEntry(33876), -- Mangle (Cat)
		ClassTimer:CreateSpellEntry(48438), -- Wild Growth
		ClassTimer:CreateSpellEntry(69369), -- Predator's Swiftness
		ClassTimer:CreateSpellEntry(124974), -- Nature's Vigil
		ClassTimer:CreateSpellEntry(106922), -- Might of Ursoc
		ClassTimer:CreateSpellEntry(102558), -- Incarnation: Sun of Ursoc
		ClassTimer:CreateSpellEntry(102543), -- Incarnation: King of the Jungle
		ClassTimer:CreateSpellEntry(102560), -- Incarnation: Chosen of Elune
		ClassTimer:CreateSpellEntry(117679), -- Incarnation   (this is the one used for Tree of Life)
		ClassTimer:CreateSpellEntry(16689), -- Nature's Grasp
		ClassTimer:CreateSpellEntry(33786), -- Cyclone
		ClassTimer:CreateSpellEntry(770), -- Faerie Fire
		ClassTimer:CreateSpellEntry(2637), -- Hibernate
	},
	player = {
		ClassTimer:CreateSpellEntry(22812), -- Barkskin
		ClassTimer:CreateSpellEntry(12536), -- Clearcasting
		ClassTimer:CreateSpellEntry(29166), -- Innervate
		ClassTimer:CreateSpellEntry(33763), -- Lifebloom
		ClassTimer:CreateSpellEntry(8936), -- Regrowth
		ClassTimer:CreateSpellEntry(100977), -- Harmony
		ClassTimer:CreateSpellEntry(158792), -- Pulverize
		ClassTimer:CreateSpellEntry(155777), -- Rejuv (Germination)
		ClassTimer:CreateSpellEntry(191034), -- Starfall
		ClassTimer:CreateSpellEntry(774), -- Rejuvenation
	},
	procs = {

	},
}
