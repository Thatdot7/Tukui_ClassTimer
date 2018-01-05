local T, C, L = Tukui:unpack()

local ClassTimer = T["ClassTimer"]
local Class = select(2, UnitClass("player"))

if (Class ~= "SHAMAN") then
	return
end

ClassTimer.Filter["SHAMAN"] = {
	target = {

		ClassTimer:CreateSpellEntry(8042), -- Earth Shock
		ClassTimer:CreateSpellEntry(8050), -- Flame Shock
		ClassTimer:CreateSpellEntry(8056), -- Frost Shock
	},
	player = {
		ClassTimer:CreateSpellEntry(16176), -- Ancestral Healing
		ClassTimer:CreateSpellEntry(30160), -- Elemental Devastation
		ClassTimer:CreateSpellEntry(64701), -- Elemental Mastery (Haste + Damage Buff)
		ClassTimer:CreateSpellEntry(16166), -- Elemental Mastery (Instant)
		ClassTimer:CreateSpellEntry(29062), -- Eye of the Storm
		ClassTimer:CreateSpellEntry(29206), -- Healing Way
		ClassTimer:CreateSpellEntry(30823), -- Shamanistic Rage
		ClassTimer:CreateSpellEntry(16246), -- Clearcasting
		ClassTimer:CreateSpellEntry(73683), -- Unleash Flame
		ClassTimer:CreateSpellEntry(73681), -- Unleash Wind
		ClassTimer:CreateSpellEntry(51945), -- Earthliving
		ClassTimer:CreateSpellEntry(55198), -- Tidal Force
		ClassTimer:CreateSpellEntry(79206), -- Spiritwalker's Grace
		ClassTimer:CreateSpellEntry(17364), -- Stormstrike
		ClassTimer:CreateSpellEntry(61295), -- Riptide
		ClassTimer:CreateSpellEntry(51562), -- Tidal Waves
		ClassTimer:CreateSpellEntry(131), -- Water Breathing
		ClassTimer:CreateSpellEntry(546), -- Water Walking
		ClassTimer:CreateSpellEntry(117014), -- Elemental Blast
		ClassTimer:CreateSpellEntry(114050), -- Ascendance (Ele)
		ClassTimer:CreateSpellEntry(114051), -- Ascendance (Enhance)
		ClassTimer:CreateSpellEntry(114052), -- Ascendance (Resto)
		ClassTimer:CreateSpellEntry(30802), -- Unleashed Rage
	},
	procs = {
		ClassTimer:CreateSpellEntry(73684), -- Unleash Earth
		ClassTimer:CreateSpellEntry(73682), -- Unleash Frost
	},
}

ClassTimer.AddClassPosition["SHAMAN"] = function (self)
	-- Offset the frame higher by 8px to accommodate the totem bar
	self:SetPoint( "BOTTOMLEFT", oUF_TukuiPlayer, "TOPLEFT", 0, 14 );
	self:SetPoint( "BOTTOMRIGHT", oUF_TukuiPlayer, "TOPRIGHT", 0, 14 );
end
