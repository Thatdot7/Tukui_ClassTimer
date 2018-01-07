local T, C, L = Tukui:unpack()

local OptionsMenu = {
    ["ENABLE"] = {
      ["Name"] = "Enable",
      ["Desc"] = "Enable/Disable the ClassTimer Addon",
    },
    ["BAR_HEIGHT"] = {
			["Name"] = "Bar Height",
			["Desc"] = "Height of each bar",
		},
  	["BAR_SPACING"] = {
			["Name"] = "Bar Spacing",
			["Desc"] = "Spacing between each bar",
		},

    --[[ Layouts
    	1 - both player and target auras in one frame right above player frame
    	2 - player and target auras separated into two frames above player frame
    	3 - player, target and trinket auras separated into three frames above player frame
    	4 - player and trinket auras are shown above player frame and target auras are shown above target frame
    ]]--
    ["LAYOUT"] = {
			["Name"] = "Layout Options",
			["Desc"] = "Describes where to put the DoT Timers",
		},

    ["BACKGROUND_ALPHA"] = {
			["Name"] = "Background Alpha",
			["Desc"] = "Specify the alpha of the background (between 0-1)",
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
			["Name"] = "Spark",
			["Desc"] = "Enable/Disable Spark",
		},
    ["CAST_SEPARATOR"] = {
			["Name"] = "Cast Separator",
			["Desc"] = "Enable/Disable Cast Seperator",
		},
    ["TEXT_MARGIN"] = {
			["Name"] = "Text Margin",
			["Desc"] = "Specify the text margin",
		},
    ["PERMANENT_AURA_VALUE"] = {
			["Name"] = "Permanent Aura Value",
			["Desc"] = "Permanent Aura Value",
		},


    --[[ Sort direction
    	false - ascending
    	true - descending
    ]]--
    ["SORT_DIRECTION"] = {
			["Name"] = "Sort Direction",
			["Desc"] = "Set Sort Direction",
		},

    -- Timer tenths threshold - range from 1 to 60
    ["TENTHS_TRESHOLD"] = {
			["Name"] = "Timer tenths threshold",
			["Desc"] = "Timer tenths threshold - range from 1 to 60",
		},
	}

TukuiConfig.enUS["ClassTimer"] = OptionsMenu
