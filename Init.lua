local T, C, L = Tukui:unpack();

local ClassTimerAPI = CreateFrame("Frame")

function ClassTimerAPI:CreateSpellEntry( id, castByAnyone, color, unitType, castSpellId )
	return { id = id, castByAnyone = castByAnyone, color = color, unitType = unitType or 0, castSpellId = castSpellId };
end

ClassTimerAPI.Filter = {}

T["ClassTimer"] = ClassTimerAPI
