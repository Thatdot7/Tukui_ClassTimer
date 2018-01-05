local T, C, L = Tukui:unpack()

local ClassTimer = T["ClassTimer"]
local Class = select(2, UnitClass("player"))

if (Class ~= "DEMONHUNTER") then
	return
end

ClassTimer.Filter["DEMONHUNTER"] = {
	target = {

	},
	player = {

	},
	procs = {

	},
}
