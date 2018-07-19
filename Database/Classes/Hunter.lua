local T, C, L = Tukui:unpack()

local ClassTimer = T["ClassTimer"]
local Class = select(2, UnitClass("player"))

if (Class ~= "HUNTER") then
	return
end

ClassTimer.Filter["HUNTER"] = {
	target = {
		ClassTimer:CreateSpellEntry("Scorpid Sting"), -- Scorpid Sting
		ClassTimer:CreateSpellEntry("Serpent Sting"), -- Serpent Sting
		ClassTimer:CreateSpellEntry("Viper Sting"), -- Viper Sting
		ClassTimer:CreateSpellEntry("Wyvern Sting"), -- Wyvern Sting
		ClassTimer:CreateSpellEntry("Boar Charge"), -- Boar Charge
		ClassTimer:CreateSpellEntry("Charge"), -- Charge
		ClassTimer:CreateSpellEntry("Concussive Barrage"), -- Concussive Barrage
		ClassTimer:CreateSpellEntry("Concussive Shot"), -- Concussive Shot
		ClassTimer:CreateSpellEntry("Improved Concussive Shot"), -- Improved Concussive Shot
		ClassTimer:CreateSpellEntry("Improved Wing Clip"), -- Improved Wing Clip
		ClassTimer:CreateSpellEntry("Intimidation"), -- Intimidation
		ClassTimer:CreateSpellEntry("Binding Shot"), -- Binding Shot
		ClassTimer:CreateSpellEntry("Wing Clip"), -- Wing Clip
		ClassTimer:CreateSpellEntry("Expose Weakness"), -- Expose Weakness
		ClassTimer:CreateSpellEntry("Flare"), -- Flare
		ClassTimer:CreateSpellEntry("Focus Fire"), -- Focus Fire
		ClassTimer:CreateSpellEntry("Hunter's Mark"), -- Hunter's Mark
		ClassTimer:CreateSpellEntry("Marked for Death"), -- Marked for Death
		ClassTimer:CreateSpellEntry("Roar of Sacrifice"), -- Roar of Sacrifice
		ClassTimer:CreateSpellEntry("Quick Shots"), -- Quick Shots
		ClassTimer:CreateSpellEntry("Scare Beast"), -- Scare Beast
		ClassTimer:CreateSpellEntry("A Murder of Crows"), -- A Murder of Crows
		ClassTimer:CreateSpellEntry(" Black Arrow"), -- Black Arrow
		ClassTimer:CreateSpellEntry("Vulnerable"), -- Vulnerable
		ClassTimer:CreateSpellEntry("Silencing Shot"), -- Silencing Shot
		ClassTimer:CreateSpellEntry("Explosive Trap"), -- Explosive Trap Effect
		ClassTimer:CreateSpellEntry("Freezing Trap"), -- Freezing Trap Effect
		ClassTimer:CreateSpellEntry("Frost Trap"), -- Frost Trap Aura
		ClassTimer:CreateSpellEntry("Immolation Trap"), -- Immolation Trap Effect
	},
	player = {
		ClassTimer:CreateSpellEntry("Deterrence"), -- Deterrence
		ClassTimer:CreateSpellEntry("Feed Pet"), -- Feed Pet Effect
		ClassTimer:CreateSpellEntry("Roar of Recovery"), -- Roar of Recovery
		ClassTimer:CreateSpellEntry("Master Tactician"), -- Master Tactician
		ClassTimer:CreateSpellEntry("Mend Pet"), -- Mend Pet
		ClassTimer:CreateSpellEntry("Sniper Training"), -- Sniper Training
		ClassTimer:CreateSpellEntry("Rapid Fire"), -- Rapid Fire

	},
	procs = {

	},
}
