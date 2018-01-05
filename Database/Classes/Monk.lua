local T, C, L = Tukui:unpack()

local ClassTimer = T["ClassTimer"]
local Class = select(2, UnitClass("player"))

if (Class ~= "MONK") then
	return
end

ClassTimer.Filter["MONK"] = {
	target = {

	},
	player = {

	},
	procs = {

	},
}
