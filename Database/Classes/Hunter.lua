local T, C, L = Tukui:unpack()

local ClassTimer = T["ClassTimer"]
local Class = select(2, UnitClass("player"))

if (Class ~= "HUNTER") then
	return
end

ClassTimer.Filter["HUNTER"] = {
	target = {
		ClassTimer:CreateSpellEntry(3043), -- Scorpid Sting
		ClassTimer:CreateSpellEntry(1978), -- Serpent Sting
		ClassTimer:CreateSpellEntry(3034), -- Viper Sting
		ClassTimer:CreateSpellEntry(19386), -- Wyvern Sting
		ClassTimer:CreateSpellEntry(3385), -- Boar Charge
		ClassTimer:CreateSpellEntry(61685), -- Charge
		ClassTimer:CreateSpellEntry(35100), -- Concussive Barrage
		ClassTimer:CreateSpellEntry(5116), -- Concussive Shot
		ClassTimer:CreateSpellEntry(19407), -- Improved Concussive Shot
		ClassTimer:CreateSpellEntry(19228), -- Improved Wing Clip
		ClassTimer:CreateSpellEntry(19577), -- Intimidation
		ClassTimer:CreateSpellEntry(117526), -- Binding Shot
		ClassTimer:CreateSpellEntry(2974), -- Wing Clip
		ClassTimer:CreateSpellEntry(34500), -- Expose Weakness
		ClassTimer:CreateSpellEntry(1543), -- Flare
		ClassTimer:CreateSpellEntry(82692), -- Focus Fire
		ClassTimer:CreateSpellEntry(1130), -- Hunter's Mark
		ClassTimer:CreateSpellEntry(53243), -- Marked for Death
		ClassTimer:CreateSpellEntry(53480), -- Roar of Sacrifice
		ClassTimer:CreateSpellEntry(6150), -- Quick Shots
		ClassTimer:CreateSpellEntry(168809), -- ST. Recently Moved
		ClassTimer:CreateSpellEntry(1513), -- Scare Beast
		ClassTimer:CreateSpellEntry(131894), -- A Murder of Crows
		ClassTimer:CreateSpellEntry(3674), -- Black Arrow
		ClassTimer:CreateSpellEntry(187131), -- Vulnerable
		ClassTimer:CreateSpellEntry(34490), -- Silencing Shot
		ClassTimer:CreateSpellEntry(63668), -- Black Arrow
		ClassTimer:CreateSpellEntry(13812), -- Explosive Trap Effect
		ClassTimer:CreateSpellEntry(3355), -- Freezing Trap Effect
		ClassTimer:CreateSpellEntry(13810), -- Frost Trap Aura
		ClassTimer:CreateSpellEntry(13797), -- Immolation Trap Effect
	},
	player = {
		ClassTimer:CreateSpellEntry(19263), -- Deterrence
		ClassTimer:CreateSpellEntry(1539), -- Feed Pet Effect
		ClassTimer:CreateSpellEntry(53517), -- Roar of Recovery
		ClassTimer:CreateSpellEntry(34506), -- Master Tactician
		ClassTimer:CreateSpellEntry(136), -- Mend Pet
		ClassTimer:CreateSpellEntry(168811), -- Sniper Training
		ClassTimer:CreateSpellEntry(3045), -- Rapid Fire

	},
	procs = {

	},
}
