local T, C, L = Tukui:unpack()

local ClassTimer = T["ClassTimer"]
local Class = select(2, UnitClass("player"))

if (Class ~= "WARLOCK") then
	return
end

ClassTimer.Filter["WARLOCK"] = {
	target = {

	},
	player = {

	},
	procs = {

	},
}
