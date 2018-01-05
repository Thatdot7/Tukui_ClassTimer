local T, C, L = Tukui:unpack()

local ClassTimer = T["ClassTimer"]
local Class = select(2, UnitClass("player"))

if (Class ~= "DEATHKNIGHT") then
	return
end

ClassTimer.Filter["DEATHKNIGHT"] = {
  target = {

  },
  player = {

  },
  procs = {

  }
}
