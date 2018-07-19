local T, C, L = Tukui:unpack()

local ClassTimer = T["ClassTimer"]
local Class = select(2, UnitClass("player"))

if (Class ~= "MONK") then
	return
end

ClassTimer.Filter["MONK"] = {
	target = {

		ClassTimer:CreateSpellEntry("Mortal Wounds"), -- Mortal Wounds
		ClassTimer:CreateSpellEntry("Blackout Kick"), -- Blackout Kick
		ClassTimer:CreateSpellEntry("Rising Sun Kick"), -- Rising Sun Kick
		ClassTimer:CreateSpellEntry("Dizzying Haze"), -- Dizzying Haze
		ClassTimer:CreateSpellEntry("Disable"), -- Disable
		ClassTimer:CreateSpellEntry("Leg Sweep"), -- Leg Sweep
		ClassTimer:CreateSpellEntry("Paralysis"), -- Paralysis
	},
	player = {
		ClassTimer:CreateSpellEntry("Dampen Harm"), -- Dampen Harm
		ClassTimer:CreateSpellEntry(" Avert Harm"), -- Avert Harm
		ClassTimer:CreateSpellEntry("Touch of Karma"), -- Touch of Karma
		ClassTimer:CreateSpellEntry("Elusive Brew"), -- Elusive Brew
		ClassTimer:CreateSpellEntry("Fortifying Brew"), -- Fortifying Brew
		ClassTimer:CreateSpellEntry("Enveloping Mist"), -- Enveloping Mist
		ClassTimer:CreateSpellEntry("Renewing Mist"), -- Renewing Mist
		ClassTimer:CreateSpellEntry("Soothing Mist"), -- Soothing Mist
		ClassTimer:CreateSpellEntry("Shuffle"), -- Shuffle
		ClassTimer:CreateSpellEntry("Tiger Strikes"), -- Tiger Strikes
		ClassTimer:CreateSpellEntry("Power Guard"), -- Power Guard
		ClassTimer:CreateSpellEntry("Death Note"), -- Death Note
		ClassTimer:CreateSpellEntry("Tiger Power"), -- Tiger Power
		ClassTimer:CreateSpellEntry("Energizing Brew"), -- Energizing Brew
		ClassTimer:CreateSpellEntry("Guard"), -- Guard
		ClassTimer:CreateSpellEntry("Combo Breaker: Blackout Kick"), -- Combo Breaker: Blackout Kick
		ClassTimer:CreateSpellEntry("Combo Breaker: Tiger Palm"), -- Combo Breaker: Tiger Palm
		ClassTimer:CreateSpellEntry("Spinning Crane Kick"), -- Spinning Crane Kick
		ClassTimer:CreateSpellEntry("Tigereye Brew"), -- Tigereye Brew
		ClassTimer:CreateSpellEntry(" Diffuse Magic"), -- Diffuse Magic
	},
	procs = {

	},
}
