local T, C, L = Tukui:unpack()

local ClassTimer = T["ClassTimer"]
local Class = select(2, UnitClass("player"))

if (Class ~= "MAGE") then
	return
end

ClassTimer.Filter["MAGE"] = {
	target = {

	},
	player = {

	},
	procs = {

	},
}
