local T, C, L = Tukui:unpack()

local ClassTimer = T["ClassTimer"]
local Class = select(2, UnitClass("player"))

if (Class ~= "DRUID") then
	return
end

ClassTimer.Filter["DRUID"] = {
	target = {

	},
	player = {

	},
	procs = {

	},
}
