local T, C, L = Tukui:unpack()

local ClassTimer = T["ClassTimer"]
local Class = select(2, UnitClass("player"))

if (Class ~= "DEATHKNIGHT") then
	return
end

ClassTimer.Filter["DEATHKNIGHT"] = {
  target = {
		ClassTimer:CreateSpellEntry(191587), -- Virulent Plague
		ClassTimer:CreateSpellEntry(197147), -- Festering Wound
		ClassTimer:CreateSpellEntry(115798), -- Weakened Blows
  },
	player = {
		ClassTimer:CreateSpellEntry(51271), -- Unbreakable Armor
		ClassTimer:CreateSpellEntry(48792), -- Icebound Fortitude
		ClassTimer:CreateSpellEntry(55095), -- Frost Fever
		ClassTimer:CreateSpellEntry(81131), -- Scarlet Fever
		ClassTimer:CreateSpellEntry(49194), -- Unholy Blight
		ClassTimer:CreateSpellEntry(22744), -- Chains of Ice
		ClassTimer:CreateSpellEntry(55078), -- Blood Plague
		ClassTimer:CreateSpellEntry(51726), -- Ebon Plague
		ClassTimer:CreateSpellEntry(59052), -- Freezing Fog
		ClassTimer:CreateSpellEntry(51123), -- Killing Machine
		ClassTimer:CreateSpellEntry(49182), -- Blade Barrier
		ClassTimer:CreateSpellEntry(55233), -- Vampiric Blood
		ClassTimer:CreateSpellEntry(63560), -- Ghoul Frenzy (Pet)
		ClassTimer:CreateSpellEntry(63560), -- Dark Transformation (Pet)
		ClassTimer:CreateSpellEntry(49222), -- Bone Shield
  },
  procs = {

  }
}

ClassTimer.AddClassPosition["DEATHKNIGHT"] = function (self)
	-- Offset the frame higher by 8px to accommodate the rune bar
	self:SetPoint( "BOTTOMLEFT", oUF_TukuiPlayer, "TOPLEFT", 0, 14 );
	self:SetPoint( "BOTTOMRIGHT", oUF_TukuiPlayer, "TOPRIGHT", 0, 14 );
end
