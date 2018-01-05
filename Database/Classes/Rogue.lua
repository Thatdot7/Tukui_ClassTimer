local T, C, L = Tukui:unpack()

local ClassTimer = T["ClassTimer"]
local Class = select(2, UnitClass("player"))

if (Class ~= "ROGUE") then
	return
end

ClassTimer.Filter["ROGUE"] = {
	target = {

	},
	player = {

	},
	procs = {

	},
}
