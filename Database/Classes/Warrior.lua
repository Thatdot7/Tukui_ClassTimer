local T, C, L = Tukui:unpack()

local ClassTimer = T["ClassTimer"]
local Class = select(2, UnitClass("player"))

if (Class ~= "WARRIOR") then
	return
end

ClassTimer.Filter["WARRIOR"] = {
	target = {

	},
	player = {

	},
	procs = {

	},
}
