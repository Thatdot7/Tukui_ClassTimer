local T, C, L = Tukui:unpack();

C["ClassTimer"] = {
	["ENABLE"] = true,
	["BAR_HEIGHT"] = 20,
	["BAR_SPACING"] = 1,

  --[[ Layouts
  	1 - both player and target auras in one frame right above player frame
  	2 - player and target auras separated into two frames above player frame
  	3 - player, target and trinket auras separated into three frames above player frame
  	4 - player and trinket auras are shown above player frame and target auras are shown above target frame
  ]]--
  ["LAYOUT"] = {
		["Options"] = {
			["DoTs on Player Frame"] = 1,
			["DoTs on Target Frame"] = 2,
		},

		["Value"] = 1,
	},

  ["BACKGROUND_ALPHA"] = 0.75,

  --[[ Show icons outside of frame (flags - that means you can combine them - for example 3 means it will be outside the right edge)
  	0 - left
  	1 - right
  	2 - outside
  	4 - hide
  ]]--
  ["ICON_POSITION"] = 0,

  ["SPARK"] = false,
  ["CAST_SEPARATOR"] = true,
  ["TEXT_MARGIN"] = 5,
  ["PERMANENT_AURA_VALUE"] = 1,

  --[[ Sort direction
  	false - ascending
  	true - descending
		]]--
	["SORT_DIRECTION"] = {

		["Options"] = {
			["Ascending"] = true,
			["Descending"] = false,
		},

		["Value"] = true,
	},

  -- Timer tenths threshold - range from 1 to 60
  ["TENTHS_TRESHOLD"] = 1,
}
