if ( Tukui == nil ) then return; end

local T, C, L = Tukui:unpack();
local ClassTimer = T["ClassTimer"]
local Config = C["ClassTimer"]

function ClassTimer:Player()
	local yOffset = 6;
	local _, playerClass = UnitClass( "player" );
	local classFilter = T["ClassTimer"].Filter[ playerClass ];

	local playerDataSource = T["ClassTimer"]:CreateUnitAuraDataSource( "player" );
	playerDataSource:AddFilter( classFilter.player, T["ClassTimer"]["Colors"]["PLAYER_BAR_COLOR"], T["ClassTimer"]["Colors"]["PLAYER_DEBUFF_COLOR"] );

	local playerFrame = ClassTimer:CreateAuraBarFrame( playerDataSource, oUF_TukuiPlayer );
	if ( ClassTimer.AddClassPosition[ playerClass ] ~= nil) then
		ClassTimer.AddClassPosition[ playerClass ](playerFrame)
	else
		playerFrame:SetHiddenHeight( -yOffset );
		playerFrame:SetPoint( "BOTTOMLEFT", oUF_TukuiPlayer, "TOPLEFT", 0, yOffset );
		playerFrame:SetPoint( "BOTTOMRIGHT", oUF_TukuiPlayer, "TOPRIGHT", 0, yOffset );
	end

	ClassTimer.TimerFrames.Player = playerFrame
end

function ClassTimer:Trinket()
	local yOffset = 6;
	local _, playerClass = UnitClass( "player" );
	local classFilter = T["ClassTimer"].Filter[ playerClass ];

	local trinketDataSource = T["ClassTimer"]:CreateUnitAuraDataSource( "player" );
	trinketDataSource:AddFilter( classFilter.procs, T["ClassTimer"]["Colors"]["TRINKET_BAR_COLOR"] );
	trinketDataSource:AddFilter( T["ClassTimer"].Filter["TRINKET"], T["ClassTimer"]["Colors"]["TRINKET_BAR_COLOR"] );


	local trinketFrame = ClassTimer:CreateAuraBarFrame( trinketDataSource, oUF_TukuiPlayer );
	trinketFrame:SetHiddenHeight( -yOffset );
	trinketFrame:SetPoint( "BOTTOMLEFT", ClassTimer.TimerFrames.Player, "TOPLEFT", 0, yOffset );
	trinketFrame:SetPoint( "BOTTOMRIGHT", ClassTimer.TimerFrames.Player, "TOPRIGHT", 0, yOffset );

	ClassTimer.TimerFrames.Trinket = trinketFrame
end

function ClassTimer:Target()
	local yOffset = 6;
	local _, playerClass = UnitClass( "player" );
	local classFilter = T["ClassTimer"].Filter[ playerClass ];

	local targetDataSource = T["ClassTimer"]:CreateUnitAuraDataSource( "target" );
	targetDataSource:AddFilter( classFilter.target, T["ClassTimer"]["Colors"]["TARGET_BAR_COLOR"], T["ClassTimer"]["Colors"]["TARGET_DEBUFF_COLOR"] );

	local frameAnchor;
	do
		if (C["ClassTimer"]["LAYOUT"]["Value"] == 1) then
			frameAnchor = ClassTimer.TimerFrames.Trinket
		else
			frameAnchor = oUF_TukuiTarget
		end
	end

	local targetFrame = ClassTimer:CreateAuraBarFrame( targetDataSource, oUF_TukuiPlayer );
	targetFrame:SetPoint( "BOTTOMLEFT", ClassTimer.TimerFrames.Trinket, "TOPLEFT", 0, yOffset );
	targetFrame:SetPoint( "BOTTOMRIGHT", ClassTimer.TimerFrames.Trinket, "TOPRIGHT", 0, yOffset );

	ClassTimer.TimerFrames.Target = targetFrame
end

local init = function()

	ClassTimer:Player()
	ClassTimer.TimerFrames.Player:Show()

	ClassTimer:Trinket()
	ClassTimer.TimerFrames.Trinket:Show()

	ClassTimer:Target()
	ClassTimer.TimerFrames.Target:Show()

end

-- Main
if (C["ClassTimer"]["ENABLE"] == true) then
	local setup = CreateFrame( "Frame", nil, UIParent );
	setup:RegisterEvent( "PLAYER_ENTERING_WORLD" );
	setup:SetScript( "OnEvent", function ( self, event )
		if (event == "PLAYER_ENTERING_WORLD") then
			init();
			setup:SetScript( "OnEvent", nil );
		end
	end );
end
