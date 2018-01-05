local T, C, L = Tukui:unpack()

local OptionsMenu = {

		["MyOwnOption01"] = {
			["Name"] = "Option 01",
			["Desc"] = "Enable/Disable Option 01",
		},

		["MyOwnOption02"] = {
			["Name"] = "Option 02",
			["Desc"] = "Enable/Disable Option 02",
		},

    ["BAR_HEIGHT"] = {
			["Name"] = "Option 01",
			["Desc"] = "Enable/Disable Option 01",
		},
  	["BAR_SPACING"] = {
			["Name"] = "Option 01",
			["Desc"] = "Enable/Disable Option 01",
		},

    --[[ Layouts
    	1 - both player and target auras in one frame right above player frame
    	2 - player and target auras separated into two frames above player frame
    	3 - player, target and trinket auras separated into three frames above player frame
    	4 - player and trinket auras are shown above player frame and target auras are shown above target frame
    ]]--
    ["LAYOUT"] = {
			["Name"] = "Option 01",
			["Desc"] = "Enable/Disable Option 01",
		},

    ["BACKGROUND_ALPHA"] = {
			["Name"] = "Option 01",
			["Desc"] = "Enable/Disable Option 01",
		},

    --[[ Show icons outside of frame (flags - that means you can combine them - for example 3 means it will be outside the right edge)
    	0 - left
    	1 - right
    	2 - outside
    	4 - hide
    ]]--
    ["ICON_POSITION"] = {
			["Name"] = "Option 01",
			["Desc"] = "Enable/Disable Option 01",
		},

    ["SPARK"] = {
			["Name"] = "Option 01",
			["Desc"] = "Enable/Disable Option 01",
		},
    ["CAST_SEPARATOR"] = {
			["Name"] = "Option 01",
			["Desc"] = "Enable/Disable Option 01",
		},
    ["TEXT_MARGIN"] = {
			["Name"] = "Option 01",
			["Desc"] = "Enable/Disable Option 01",
		},
    ["PERMANENT_AURA_VALUE"] = {
			["Name"] = "Option 01",
			["Desc"] = "Enable/Disable Option 01",
		},


    --[[ Sort direction
    	false - ascending
    	true - descending
    ]]--
    ["SORT_DIRECTION"] = {
			["Name"] = "Option 01",
			["Desc"] = "Enable/Disable Option 01",
		},

    -- Timer tenths threshold - range from 1 to 60
    ["TENTHS_TRESHOLD"] = {
			["Name"] = "Option 01",
			["Desc"] = "Enable/Disable Option 01",
		},
	}

TukuiConfig.enUS["MyOwnOption"] = MyOwnOption
