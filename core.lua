if ( Tukui == nil ) then return; end

local T, C, L = Tukui:unpack();



-- Configuration starts here:

-- Bar height
local BAR_HEIGHT = 20;

-- Distance between bars
local BAR_SPACING = 1;

--[[ Layouts
	1 - both player and target auras in one frame right above player frame
	2 - player and target auras separated into two frames above player frame
	3 - player, target and trinket auras separated into three frames above player frame
	4 - player and trinket auras are shown above player frame and target auras are shown above target frame
]]--
local LAYOUT = 3;

-- Background alpha (range from 0 to 1)
local BACKGROUND_ALPHA = 0.75;

--[[ Show icons outside of frame (flags - that means you can combine them - for example 3 means it will be outside the right edge)
	0 - left
	1 - right
	2 - outside
	4 - hide
]]--
local ICON_POSITION = 0;


-- Show spark
local SPARK = false;

-- Show cast separator
local CAST_SEPARATOR = true;

-- Sets distance between right edge of bar and name and left edge of bar and time left
local TEXT_MARGIN = 5;

if ( C and C.Medias and C.Medias.Font ) then
	-- Sets font for all texts
	MASTER_FONT = { C.Medias.Font, 12, "" };

	-- Sets font for stack count
	STACKS_FONT = { C.Medias.Font, 11, "" };

end

--[[ Permanent aura bars
	1 filled
	0 empty
]]--
local PERMANENT_AURA_VALUE = 1;


--[[ Player debuff color
	red, green, blue - range from 0 to 255
	alpha - range from 0 to 1
]]--
local PLAYER_DEBUFF_COLOR = nil;

--[[ Sort direction
	false - ascending
	true - descending
]]--
local SORT_DIRECTION = true;

-- Timer tenths threshold - range from 1 to 60
local TENTHS_TRESHOLD = 1


local CreateFramedTexture;
do
	-- public
	local SetTexture = function( self, ... )
		return self.texture:SetTexture( ... );
	end

	local GetTexture = function( self )
		return self.texture:GetTexture();
	end

	local GetTexCoord = function( self )
		return self.texture:GetTexCoord();
	end

	local SetTexCoord = function( self, ... )
		return self.texture:SetTexCoord( ... );
	end

	local SetBorderColor = function( self, ... )
		return self.border:SetVertexColor( ... );
	end

	-- constructor
	CreateFramedTexture = function( parent )
		local result = parent:CreateTexture( nil, "ARTWORK", nil, -2 );
		local border = parent:CreateTexture( nil, "ARTWORK", nil, -1 );
		local background = parent:CreateTexture( nil, "ARTWORK", nil, 0 );
		local texture = parent:CreateTexture( nil, "ARTWORK", nil, 1 );

		result:SetTexture( 0.1, 0.1, 0.1, 1 );
		border:SetTexture( 0.5, 0.5, 0.5, 1 );
		background:SetTexture( 0.1, 0.1, 0.1, 1 );

		border:SetPoint( "TOPLEFT", result, "TOPLEFT", 1, -1 );
		border:SetPoint( "BOTTOMRIGHT", result, "BOTTOMRIGHT", -1, 1 );

		background:SetPoint( "TOPLEFT", border, "TOPLEFT", 1, -1 );
		background:SetPoint( "BOTTOMRIGHT", border, "BOTTOMRIGHT", -1, 1 );

		texture:SetPoint( "TOPLEFT", background, "TOPLEFT", 1, -1 );
		texture:SetPoint( "BOTTOMRIGHT", background, "BOTTOMRIGHT", -1, 1 );

		result.border = border;
		result.background = background;
		result.texture = texture;

		result.SetBorderColor = SetBorderColor;

		result.SetTexture = SetTexture;
		result.GetTexture = GetTexture;
		result.SetTexCoord = SetTexCoord;
		result.GetTexCoord = GetTexCoord;

		return result;
	end
end

local CreateAuraBarFrame;
do
	-- classes
	local CreateAuraBar;
	do
		-- private
		local OnUpdate = function( self, elapsed )
			local time = GetTime();

			if ( time > self.expirationTime ) then
				self.bar:SetScript( "OnUpdate", nil );
				self.bar:SetValue( 0 );
				self.time:SetText( "" );

				local spark = self.spark;
				if ( spark ) then
					spark:Hide();
				end
			else
				local remaining = self.expirationTime - time;
				self.bar:SetValue( remaining );

				local timeText = "";
				if ( remaining >= 3600 ) then
					timeText = tostring( math.floor( remaining / 3600 ) ) .. "h";
				elseif ( remaining >= 60 ) then
					timeText = tostring( math.floor( remaining / 60 ) ) .. "m";
				elseif ( remaining > TENTHS_TRESHOLD ) then
					timeText = tostring( math.floor( remaining ) );
				elseif ( remaining > 0 ) then
					timeText = tostring( math.floor( remaining * 10 ) / 10 );
				end
				self.time:SetText( timeText );

				local barWidth = self.bar:GetWidth();

				local spark = self.spark;
				if ( spark ) then
					spark:SetPoint( "CENTER", self.bar, "LEFT", barWidth * remaining / self.duration, 0 );
				end

				local castSeparator = self.castSeparator;
				if ( castSeparator and self.castSpellId ) then
					local _, _, _, _, _, _, castTime, _, _ = GetSpellInfo( self.castSpellId );

					castTime = castTime / 1000;
					if ( castTime and remaining > castTime ) then
						castSeparator:SetPoint( "CENTER", self.bar, "LEFT", barWidth * ( remaining - castTime ) / self.duration, 0 );
					else
						castSeparator:Hide();
					end
				end
			end
		end

		-- public
		local SetIcon = function( self, icon )
			if ( not self.icon ) then return; end

			self.icon:SetTexture( icon );
		end

		local SetTime = function( self, expirationTime, duration )
			self.expirationTime = expirationTime;
			self.duration = duration;

			if ( expirationTime > 0 and duration > 0 ) then
				self.bar:SetMinMaxValues( 0, duration );
				OnUpdate( self, 0 );

				local spark = self.spark;
				if ( spark ) then
					spark:Show();
				end

				self:SetScript( "OnUpdate", OnUpdate );
			else
				self.bar:SetMinMaxValues( 0, 1 );
				self.bar:SetValue( PERMANENT_AURA_VALUE );
				self.time:SetText( "" );

				local spark = self.spark;
				if ( spark ) then
					spark:Hide();
				end

				self:SetScript( "OnUpdate", nil );
			end
		end

		local SetName = function( self, name )
			self.name:SetText( name );
		end

		local SetStacks = function( self, stacks )
			if ( not self.stacks ) then
				if ( stacks ~= nil and stacks > 1 ) then
					local name = self.name;

					name:SetText( tostring( stacks ) .. "  " .. name:GetText() );
				end
			else
				if ( stacks ~= nil and stacks > 1 ) then
					self.stacks:SetText( stacks );
				else
					self.stacks:SetText( "" );
				end
			end
		end

		local SetColor = function( self, color )
			self.bar:SetStatusBarColor( unpack( color ) );
		end

		local SetCastSpellId = function( self, id )
			self.castSpellId = id;

			local castSeparator = self.castSeparator;
			if ( castSeparator ) then
				if ( id ) then
					self.castSeparator:Show();
				else
					self.castSeparator:Hide();
				end
			end
		end

		local SetAuraInfo = function( self, auraInfo )
			self:SetName( auraInfo.name );
			self:SetIcon( auraInfo.texture );
			self:SetTime( auraInfo.expirationTime, auraInfo.duration );
			self:SetStacks( auraInfo.stacks );
			self:SetCastSpellId( auraInfo.castSpellId );
		end

		-- constructor
		CreateAuraBar = function( parent )
			local result = CreateFrame( "Frame", nil, parent, nil );

			if ( bit.band( ICON_POSITION, 4 ) == 0 ) then
				local icon = CreateFramedTexture( result, "ARTWORK" );
				icon:SetTexCoord( 0.15, 0.85, 0.15, 0.85 );
				icon:SetBorderColor( unpack( T["ClassTimer"]["Colors"]["ICON_COLOR"] ) );

				local iconAnchor1;
				local iconAnchor2;
				local iconOffset;
				if ( bit.band( ICON_POSITION, 1 ) == 1 ) then
					iconAnchor1 = "TOPLEFT";
					iconAnchor2 = "TOPRIGHT";
					iconOffset = 1;
				else
					iconAnchor1 = "TOPRIGHT";
					iconAnchor2 = "TOPLEFT";
					iconOffset = -1;
				end

				if ( bit.band( ICON_POSITION, 2 ) == 2 ) then
					icon:SetPoint( iconAnchor1, result, iconAnchor2, iconOffset * 6, 1 );
				else
					icon:SetPoint( iconAnchor1, result, iconAnchor2, iconOffset * ( -BAR_HEIGHT - 1 ), 1 );
				end
				icon:SetWidth( BAR_HEIGHT + 2 );
				icon:SetHeight( BAR_HEIGHT + 2 );

				result.icon = icon;

				local stacks = result:CreateFontString( nil, "OVERLAY", nil );
				stacks:SetFont( unpack( STACKS_FONT ) );
				stacks:SetShadowColor( 0, 0, 0 );
				stacks:SetShadowOffset( 1.25, -1.25 );
				stacks:SetJustifyH( "RIGHT" );
				stacks:SetJustifyV( "BOTTOM" );
				stacks:SetPoint( "TOPLEFT", icon, "TOPLEFT", 0, 0 );
				stacks:SetPoint( "BOTTOMRIGHT", icon, "BOTTOMRIGHT", 0, 3 );
				result.stacks = stacks;
			end

			local bar = CreateFrame( "StatusBar", nil, result, nil );
			bar:SetStatusBarTexture( [=[Interface\Addons\Tukui\Medias\Textures\normTex]=] );
			if ( bit.band( ICON_POSITION, 2 ) == 2 or bit.band( ICON_POSITION, 4 ) == 4 ) then
				bar:SetPoint( "TOPLEFT", result, "TOPLEFT", 0, 0 );
				bar:SetPoint( "BOTTOMRIGHT", result, "BOTTOMRIGHT", 0, 0 );
			else
				if ( bit.band( ICON_POSITION, 1 ) == 1 ) then
					bar:SetPoint( "TOPLEFT", result, "TOPLEFT", 0, 0 );
					bar:SetPoint( "BOTTOMRIGHT", result, "BOTTOMRIGHT", -BAR_HEIGHT - 1, 0 );
				else
					bar:SetPoint( "TOPLEFT", result, "TOPLEFT", BAR_HEIGHT + 1, 0 );
					bar:SetPoint( "BOTTOMRIGHT", result, "BOTTOMRIGHT", 0, 0 );
				end
			end
			result.bar = bar;

			if ( SPARK ) then
				local spark = bar:CreateTexture( nil, "OVERLAY", nil );
				spark:SetTexture( [[Interface\CastingBar\UI-CastingBar-Spark]] );
				spark:SetWidth( 12 );
				spark:SetBlendMode( "ADD" );
				spark:Show();
				result.spark = spark;
			end

			if ( CAST_SEPARATOR ) then
				local castSeparator = bar:CreateTexture( nil, "OVERLAY", nil );
				castSeparator:SetTexture( unpack( T["ClassTimer"]["Colors"]["CAST_SEPARATOR_COLOR"] ) );
				castSeparator:SetWidth( 1 );
				castSeparator:SetHeight( BAR_HEIGHT );
				castSeparator:Show();
				result.castSeparator = castSeparator;
			end

			local name = bar:CreateFontString( nil, "OVERLAY", nil );
			name:SetFont( unpack( MASTER_FONT ) );
			name:SetJustifyH( "LEFT" );
			name:SetJustifyV( "CENTER" );
			name:SetShadowColor( 0, 0, 0 );
			name:SetShadowOffset( 1.25, -1.25 );
			name:SetPoint( "TOPLEFT", bar, "TOPLEFT", TEXT_MARGIN, -1 );
			name:SetPoint( "BOTTOMRIGHT", bar, "BOTTOMRIGHT", -45, 0 );
			result.name = name;

			local time = bar:CreateFontString( nil, "OVERLAY", nil );
			time:SetFont( unpack( MASTER_FONT ) );
			time:SetJustifyH( "RIGHT" );
			time:SetJustifyV( "CENTER" );
			time:SetShadowColor( 0, 0, 0 );
			time:SetShadowOffset( 1.25, -1.25 );
			time:SetPoint( "TOPLEFT", name, "TOPRIGHT", 0, 0 );
			time:SetPoint( "BOTTOMRIGHT", bar, "BOTTOMRIGHT", -TEXT_MARGIN, 0 );
			result.time = time;

			result.SetIcon = SetIcon;
			result.SetTime = SetTime;
			result.SetName = SetName;
			result.SetStacks = SetStacks;
			result.SetAuraInfo = SetAuraInfo;
			result.SetColor = SetColor;
			result.SetCastSpellId = SetCastSpellId;

			return result;
		end
	end

	-- private
	local SetAuraBar = function( self, index, auraInfo )
		local line = self.lines[ index ]
		if ( line == nil ) then
			line = CreateAuraBar( self );
			if ( index == 1 ) then
				line:SetPoint( "TOPLEFT", self, "BOTTOMLEFT", 0, BAR_HEIGHT );
				line:SetPoint( "BOTTOMRIGHT", self, "BOTTOMRIGHT", 0, 0 );
			else
				local anchor = self.lines[ index - 1 ];
				line:SetPoint( "TOPLEFT", anchor, "TOPLEFT", 0, BAR_HEIGHT + BAR_SPACING );
				line:SetPoint( "BOTTOMRIGHT", anchor, "TOPRIGHT", 0, BAR_SPACING );
			end
			tinsert( self.lines, index, line );
		end

		line:SetAuraInfo( auraInfo );
		if ( auraInfo.color ) then
			line:SetColor( auraInfo.color );
		elseif ( auraInfo.debuffColor and auraInfo.isDebuff ) then
			line:SetColor( auraInfo.debuffColor );
		elseif ( auraInfo.defaultColor ) then
			line:SetColor( auraInfo.defaultColor );
		end

		line:Show();
	end

	local function OnUnitAura( self, unit )
		if ( unit ~= self.unit and ( self.dataSource:GetIncludePlayer() == false or unit ~= "player" ) ) then
			return;
		end

		self:Render();
	end

	local function OnPlayerTargetChanged( self, method )
		self:Render();
	end

	local function OnPlayerEnteringWorld( self )
		self:Render();
	end

	local function OnEvent( self, event, ... )
		if ( event == "UNIT_AURA" ) then
			OnUnitAura( self, ... );
		elseif ( event == "PLAYER_TARGET_CHANGED" ) then
			OnPlayerTargetChanged( self, ... );
		elseif ( event == "PLAYER_ENTERING_WORLD" ) then
			OnPlayerEnteringWorld( self );
		else
			error( "Unhandled event " .. event );
		end
	end

	-- public
	local function Render( self )
		local dataSource = self.dataSource;

		dataSource:Update();
		dataSource:Sort();

		local count = dataSource:Count();

		for index, auraInfo in ipairs( dataSource:Get() ) do
			SetAuraBar( self, index, auraInfo );
		end

		for index = count + 1, 80 do
			local line = self.lines[ index ];
			if ( line == nil or not line:IsShown() ) then
				break;
			end
			line:Hide();
		end

		if ( count > 0 ) then
			self:SetHeight( ( BAR_HEIGHT + BAR_SPACING ) * count - BAR_SPACING );
			self:Show();
		else
			self:Hide();
			self:SetHeight( self.hiddenHeight or 1 );
		end
	end

	local function SetHiddenHeight( self, height )
		self.hiddenHeight = height;
	end

	-- constructor
	CreateAuraBarFrame = function( dataSource, parent )
		local result = CreateFrame( "Frame", nil, parent, nil );
		local unit = dataSource:GetUnit();

		result.unit = unit;

		result.lines = { };
		result.dataSource = dataSource;

		local background = result:CreateTexture( nil, "BACKGROUND", nil );
		background:SetAlpha( BACKGROUND_ALPHA );
		background:SetTexture( [=[Interface\Addons\Tukui\Medias\Textures\normTex]=] );
		background:SetPoint( "TOPLEFT", result, "TOPLEFT", 0, 0 );
		background:SetPoint( "BOTTOMRIGHT", result, "BOTTOMRIGHT", 0, 0 );
		background:SetVertexColor( 0.15, 0.15, 0.15 );
		result.background = background;

		local border = CreateFrame( "Frame", nil, result, nil );
		border:SetAlpha( BACKGROUND_ALPHA );
		border:SetFrameStrata( "BACKGROUND" );
		border:SetBackdrop( {
			edgeFile = [=[Interface\Addons\Tukui\Medias\Textures\glowTex]=],
			edgeSize = 5,
			insets = { left = 3, right = 3, top = 3, bottom = 3 }
		} );
		border:SetBackdropColor( 0, 0, 0, 0 );
		border:SetBackdropBorderColor( 0, 0, 0 );
		border:SetPoint( "TOPLEFT", result, "TOPLEFT", -5, 5 );
		border:SetPoint( "BOTTOMRIGHT", result, "BOTTOMRIGHT", 5, -5 );
		result.border = border;

		result:RegisterEvent( "PLAYER_ENTERING_WORLD" );
		result:RegisterEvent( "UNIT_AURA" );
		if ( unit == "target" ) then
			result:RegisterEvent( "PLAYER_TARGET_CHANGED" );
		end

		result:SetScript( "OnEvent", OnEvent );

		result.Render = Render;
		result.SetHiddenHeight = SetHiddenHeight;

		print("AuraBarFrame created")
		return result;
	end
end

local init = function()
	print("Tukui_ClassTimer started")
	local _, playerClass = UnitClass( "player" );
	local classFilter = T["ClassTimer"].Filter[ playerClass ];


	if ( LAYOUT == 1 ) then
		local dataSource = T["ClassTimer"]:CreateUnitAuraDataSource( "target" );

		dataSource:AddPlayerFilter( T["ClassTimer"].Filter["TRINKET"], T["ClassTimer"]["Colors"]["TRINKET_BAR_COLOR"] );

		if ( classFilter ) then
			dataSource:AddFilter( classFilter.target, T["ClassTimer"]["Colors"]["TARGET_BAR_COLOR"], T["ClassTimer"]["Colors"]["TARGET_DEBUFF_COLOR"] );
			dataSource:AddPlayerFilter( classFilter.player, T["ClassTimer"]["Colors"]["PLAYER_BAR_COLOR"], T["ClassTimer"]["Colors"]["PLAYER_DEBUFF_COLOR"] );
			dataSource:AddPlayerFilter( classFilter.procs, T["ClassTimer"]["Colors"]["TRINKET_BAR_COLOR"] );
			dataSource:SetIncludePlayer( classFilter.player ~= nil );
		end

		local frame = CreateAuraBarFrame( dataSource, oUF_TukuiPlayer );
		local yOffset = 1;
		if ( playerClass == "DEATHKNIGHT" or playerClass == "SHAMAN" or playerClass == "PALADIN" ) then
			yOffset = yOffset + 8;
		end
		frame:SetPoint( "BOTTOMLEFT", oUF_TukuiPlayer, "TOPLEFT", 0, yOffset );
		frame:SetPoint( "BOTTOMRIGHT", oUF_TukuiPlayer, "TOPRIGHT", 0, yOffset );
		frame:Show();
	elseif ( LAYOUT == 2 ) then
		local targetDataSource = T["ClassTimer"]:CreateUnitAuraDataSource( "target" );
		local playerDataSource = T["ClassTimer"]:CreateUnitAuraDataSource( "player" );

		playerDataSource:AddFilter( T["ClassTimer"].Filter["TRINKET"], T["ClassTimer"]["Colors"]["TRINKET_BAR_COLOR"] );

		if ( classFilter ) then
			targetDataSource:AddFilter( classFilter.target, T["ClassTimer"]["Colors"]["TARGET_BAR_COLOR"], T["ClassTimer"]["Colors"]["TARGET_DEBUFF_COLOR"] );
			playerDataSource:AddFilter( classFilter.player, T["ClassTimer"]["Colors"]["PLAYER_BAR_COLOR"], T["ClassTimer"]["Colors"]["PLAYER_DEBUFF_COLOR"] );
			playerDataSource:AddFilter( classFilter.procs, T["ClassTimer"]["Colors"]["TRINKET_BAR_COLOR"] );
		end

		local yOffset = 6;

		local playerFrame = CreateAuraBarFrame( playerDataSource, oUF_TukuiPlayer );
		playerFrame:SetHiddenHeight( -yOffset );
		if ( playerClass == "DEATHKNIGHT" or playerClass == "SHAMAN" or playerClass == "PALADIN" ) then
			playerFrame:SetPoint( "BOTTOMLEFT", oUF_TukuiPlayer, "TOPLEFT", 0, yOffset + 8 );
			playerFrame:SetPoint( "BOTTOMRIGHT", oUF_TukuiPlayer, "TOPRIGHT", 0, yOffset + 8 );
		else
			playerFrame:SetPoint( "BOTTOMLEFT", oUF_TukuiPlayer, "TOPLEFT", 0, yOffset );
			playerFrame:SetPoint( "BOTTOMRIGHT", oUF_TukuiPlayer, "TOPRIGHT", 0, yOffset );
		end
		playerFrame:Show();

		local targetFrame = CreateAuraBarFrame( targetDataSource, oUF_TukuiPlayer );
		targetFrame:SetPoint( "BOTTOMLEFT", playerFrame, "TOPLEFT", 0, yOffset );
		targetFrame:SetPoint( "BOTTOMRIGHT", playerFrame, "TOPRIGHT", 0, yOffset );
		targetFrame:Show();
	elseif ( LAYOUT == 3 ) then
		local yOffset = 6;



		local targetDataSource = T["ClassTimer"]:CreateUnitAuraDataSource( "target" );
		local playerDataSource = T["ClassTimer"]:CreateUnitAuraDataSource( "player" );
		local trinketDataSource = T["ClassTimer"]:CreateUnitAuraDataSource( "player" );


		if ( classFilter ) then
			targetDataSource:AddFilter( classFilter.target, T["ClassTimer"]["Colors"]["TARGET_BAR_COLOR"], T["ClassTimer"]["Colors"]["TARGET_DEBUFF_COLOR"] );
			playerDataSource:AddFilter( classFilter.player, T["ClassTimer"]["Colors"]["PLAYER_BAR_COLOR"], T["ClassTimer"]["Colors"]["PLAYER_DEBUFF_COLOR"] );
			trinketDataSource:AddFilter( classFilter.procs, T["ClassTimer"]["Colors"]["TRINKET_BAR_COLOR"] );
		end
		trinketDataSource:AddFilter( T["ClassTimer"].Filter["TRINKET"], T["ClassTimer"]["Colors"]["TRINKET_BAR_COLOR"] );

		local playerFrame = CreateAuraBarFrame( playerDataSource, oUF_TukuiPlayer );
		playerFrame:SetHiddenHeight( -yOffset );
		if ( playerClass == "DEATHKNIGHT" or playerClass == "SHAMAN" or playerClass == "PALADIN" ) then
			playerFrame:SetPoint( "BOTTOMLEFT", oUF_TukuiPlayer, "TOPLEFT", 0, yOffset + 8 );
			playerFrame:SetPoint( "BOTTOMRIGHT", oUF_TukuiPlayer, "TOPRIGHT", 0, yOffset + 8 );
		else
			playerFrame:SetPoint( "BOTTOMLEFT", oUF_TukuiPlayer, "TOPLEFT", 0, yOffset );
			playerFrame:SetPoint( "BOTTOMRIGHT", oUF_TukuiPlayer, "TOPRIGHT", 0, yOffset );
		end
		playerFrame:Show();

		local trinketFrame = CreateAuraBarFrame( trinketDataSource, oUF_TukuiPlayer );
		trinketFrame:SetHiddenHeight( -yOffset );
		trinketFrame:SetPoint( "BOTTOMLEFT", playerFrame, "TOPLEFT", 0, yOffset );
		trinketFrame:SetPoint( "BOTTOMRIGHT", playerFrame, "TOPRIGHT", 0, yOffset );
		trinketFrame:Show();

		local targetFrame = CreateAuraBarFrame( targetDataSource, oUF_TukuiPlayer );
		targetFrame:SetHiddenHeight( -yOffset );
		targetFrame:SetPoint( "BOTTOMLEFT", trinketFrame, "TOPLEFT", 0, yOffset );
		targetFrame:SetPoint( "BOTTOMRIGHT", trinketFrame, "TOPRIGHT", 0, yOffset );
		targetFrame:Show();
	elseif ( LAYOUT == 4 ) then
		local yOffset = 6;

		local targetDataSource = T["ClassTimer"]:CreateUnitAuraDataSource( "target" );
		local playerDataSource = T["ClassTimer"]:CreateUnitAuraDataSource( "player" );
		local trinketDataSource = T["ClassTimer"]:CreateUnitAuraDataSource( "player" );

		if ( classFilter ) then
			targetDataSource:AddFilter( classFilter.target, T["ClassTimer"]["Colors"]["TARGET_BAR_COLOR"], T["ClassTimer"]["Colors"]["TARGET_DEBUFF_COLOR"] );
			playerDataSource:AddFilter( classFilter.player, T["ClassTimer"]["Colors"]["PLAYER_BAR_COLOR"], T["ClassTimer"]["Colors"]["PLAYER_DEBUFF_COLOR"] );
			trinketDataSource:AddFilter( classFilter.procs, T["ClassTimer"]["Colors"]["TRINKET_BAR_COLOR"] );
		end
		trinketDataSource:AddFilter( T["ClassTimer"].Filter["TRINKET"], T["ClassTimer"]["Colors"]["TRINKET_BAR_COLOR"] );

		local playerFrame = CreateAuraBarFrame( playerDataSource, oUF_TukuiPlayer );
		playerFrame:SetHiddenHeight( -yOffset );
		if ( playerClass == "DEATHKNIGHT" or playerClass == "SHAMAN" or playerClass == "PALADIN" ) then
			playerFrame:SetPoint( "BOTTOMLEFT", oUF_TukuiPlayer, "TOPLEFT", 0, yOffset + 8 );
			playerFrame:SetPoint( "BOTTOMRIGHT", oUF_TukuiPlayer, "TOPRIGHT", 0, yOffset + 8 );
		else
			playerFrame:SetPoint( "BOTTOMLEFT", oUF_TukuiPlayer, "TOPLEFT", 0, yOffset );
			playerFrame:SetPoint( "BOTTOMRIGHT", oUF_TukuiPlayer, "TOPRIGHT", 0, yOffset );
		end
		playerFrame:Show();

		local trinketFrame = CreateAuraBarFrame( trinketDataSource, oUF_TukuiPlayer );
		trinketFrame:SetHiddenHeight( -yOffset );
		trinketFrame:SetPoint( "BOTTOMLEFT", playerFrame, "TOPLEFT", 0, yOffset );
		trinketFrame:SetPoint( "BOTTOMRIGHT", playerFrame, "TOPRIGHT", 0, yOffset );
		trinketFrame:Show();

		local targetFrame = CreateAuraBarFrame( targetDataSource, oUF_TukuiTarget );
		targetFrame:SetPoint( "BOTTOMLEFT", oUF_TukuiTarget, "TOPLEFT", 0, 8 + ( 32 * 3 ) );
		targetFrame:SetPoint( "BOTTOMRIGHT", oUF_TukuiTarget, "TOPRIGHT", 0, 8 + ( 32 * 3 ) );
		targetFrame:Show();
	else
		error( "Undefined layout " .. tostring( LAYOUT ) );
	end
end

local setup = CreateFrame( "Frame", nil, UIParent );
setup:RegisterEvent( "PLAYER_ENTERING_WORLD" );
setup:SetScript( "OnEvent", function ( self, event )
	if (event == "PLAYER_ENTERING_WORLD") then
		init();
		setup:SetScript( "OnEvent", nil );
	end
end );
