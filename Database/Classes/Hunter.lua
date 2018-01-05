local T, C, L = Tukui:unpack()

local ClassTimer = T["ClassTimer"]
local Class = select(2, UnitClass("player"))

if (Class ~= "HUNTER") then
	return
end

ClassTimer.Filter["HUNTER"] = {
	target = {

	},
	player = {
	},
	procs = {

	},
}
