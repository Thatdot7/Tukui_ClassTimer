local T, C, L = Tukui:unpack()

local ClassTimer = T["ClassTimer"]
local Class = select(2, UnitClass("player"))

if (Class ~= "SHAMAN") then
	return
end

ClassTimer.Filter["SHAMAN"] = {
	target = {

	},
	player = {

	},
	procs = {

	},
}
