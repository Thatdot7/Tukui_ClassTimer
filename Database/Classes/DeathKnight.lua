local T, C, L = Tukui:unpack()

local ClassTimer = T["ClassTimer"]
local Class = select(2, UnitClass("player"))

if (Class ~= "DEATHKNIGHT") then
	return
end

ClassTimer.Filter["DEATHKNIGHT"] = {
  target = {
		ClassTimer:CreateSpellEntry("Virulent Plague"), -- Virulent Plague
		ClassTimer:CreateSpellEntry("Festering Wound"), -- Festering Wound
		ClassTimer:CreateSpellEntry("Weakened Blows"), -- Weakened Blows
  },
	player = {
		ClassTimer:CreateSpellEntry("Unbreakable Armor"), -- Unbreakable Armor
		ClassTimer:CreateSpellEntry("Icebound Fortitude"), -- Icebound Fortitude
		ClassTimer:CreateSpellEntry("Frost Fever"), -- Frost Fever
		ClassTimer:CreateSpellEntry("Scarlet Fever"), -- Scarlet Fever
		ClassTimer:CreateSpellEntry("Unholy Blight"), -- Unholy Blight
		ClassTimer:CreateSpellEntry("Chains of Ice"), -- Chains of Ice
		ClassTimer:CreateSpellEntry("Blood Plague"), -- Blood Plague
		ClassTimer:CreateSpellEntry("Ebon Plague"), -- Ebon Plague
		ClassTimer:CreateSpellEntry("Freezing Fog"), -- Freezing Fog
		ClassTimer:CreateSpellEntry("Killing Machine"), -- Killing Machine
		ClassTimer:CreateSpellEntry("Blade Barrier"), -- Blade Barrier
		ClassTimer:CreateSpellEntry("Vampiric Blood"), -- Vampiric Blood
		ClassTimer:CreateSpellEntry("Ghoul Frenzy"), -- Ghoul Frenzy (Pet)
		ClassTimer:CreateSpellEntry("Dark Transformation"), -- Dark Transformation (Pet)
		ClassTimer:CreateSpellEntry("Bone Shield"), -- Bone Shield
  },
  procs = {

  }
}
