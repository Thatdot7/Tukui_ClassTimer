local T, C, L = Tukui:unpack();

local Config = C["ClassTimer"]
local ClassTimerAPI = CreateFrame("Frame")

--[[ Configuration functions - DO NOT TOUCH
id - spell id
castByAnyone - show if aura wasn't created by player
color - bar color (nil for default color)
unitType - 0 all, 1 friendly, 2 enemy
castSpellId - fill only if you want to see line on bar that indicates if its safe to start casting spell and not clip the last tick, also note that this can be different from aura id
]]--
function ClassTimerAPI:CreateSpellEntry( id, castByAnyone, color, unitType, castSpellId )
	return { id = id, castByAnyone = castByAnyone, color = color, unitType = unitType or 0, castSpellId = castSpellId };
end

ClassTimerAPI.Filter = {}
ClassTimerAPI.Colors = {}
ClassTimerAPI.TimerFrames = {}
ClassTimerAPI.AddClassPosition = {}

function ClassTimerAPI:CreateUnitAuraDataSource(unit)

	local result = {  };
	local auraTypes = { "HELPFUL", "HARMFUL" };

	-- private
	local CheckFilter = function( self, id, caster, filter )
		if ( filter == nil ) then return false; end

		local byPlayer = caster == "player" or caster == "pet" or caster == "vehicle";

		for _, v in ipairs( filter ) do
			if ( v.id == id and ( v.castByAnyone or byPlayer ) ) then return v; end
		end

		return false;
	end

	local CheckUnit = function( self, unit, filter, result )
		if ( not UnitExists( unit ) ) then return 0; end

		local unitIsFriend = UnitIsFriend( "player", unit );

		for _, auraType in ipairs( auraTypes ) do
			local isDebuff = auraType == "HARMFUL";

			for index = 1, 40 do
				local name, _, texture, stacks, _, duration, expirationTime, caster, _, _, spellId = UnitAura( unit, index, auraType );
				if ( name == nil ) then
					break;
				end

				local filterInfo = CheckFilter( self, spellId, caster, filter );
				if ( filterInfo and ( filterInfo.unitType ~= 1 or unitIsFriend ) and ( filterInfo.unitType ~= 2 or not unitIsFriend ) ) then
					filterInfo.name = name;
					filterInfo.texture = texture;
					filterInfo.duration = duration;
					filterInfo.expirationTime = expirationTime;
					filterInfo.stacks = stacks;
					filterInfo.unit = unit;
					filterInfo.isDebuff = isDebuff;
					table.insert( result, filterInfo );
				end
			end
		end
	end

	-- public
	local Update = function( self )
		local result = self.table;

		for index = 1, #result do
			table.remove( result );
		end

		CheckUnit( self, self.unit, self.filter, result );
		if ( self.includePlayer ) then
			CheckUnit( self, "player", self.playerFilter, result );
		end

		self.table = result;
	end

	local Sort = function( self )
		self.sortDirection = C["ClassTimer"]["SORT_DIRECTION"]["Value"];
		local direction = self.sortDirection;
		local time = GetTime();

		local sorted;
		repeat
			sorted = true;
			for key, value in pairs( self.table ) do
				local nextKey = key + 1;
				local nextValue = self.table[ nextKey ];
				if ( nextValue == nil ) then break; end

				local currentRemaining = value.expirationTime == 0 and 4294967295 or math.max( value.expirationTime - time, 0 );
				local nextRemaining = nextValue.expirationTime == 0 and 4294967295 or math.max( nextValue.expirationTime - time, 0 );

				if ( ( direction and currentRemaining < nextRemaining ) or ( not direction and currentRemaining > nextRemaining ) ) then
					self.table[ key ] = nextValue;
					self.table[ nextKey ] = value;
					sorted = false;
				end
			end
		until ( sorted == true )
	end

	local Get = function( self )
		return self.table;
	end

	local Count = function( self )
		return #self.table;
	end

	local AddFilter = function( self, filter, defaultColor, debuffColor )
		if ( filter == nil ) then return; end

		for _, v in pairs( filter ) do
			local clone = { };

			clone.id = v.id;
			clone.castByAnyone = v.castByAnyone;
			clone.color = v.color;
			clone.unitType = v.unitType;
			clone.castSpellId = v.castSpellId;

			clone.defaultColor = defaultColor;
			clone.debuffColor = debuffColor;

			table.insert( self.filter, clone );
		end
	end

	local AddPlayerFilter = function( self, filter, defaultColor, debuffColor )
		if ( filter == nil ) then return; end

		for _, v in pairs( filter ) do
			local clone = { };

			clone.id = v.id;
			clone.castByAnyone = v.castByAnyone;
			clone.color = v.color;
			clone.unitType = v.unitType;
			clone.castSpellId = v.castSpellId;

			clone.defaultColor = defaultColor;
			clone.debuffColor = debuffColor;

			table.insert( self.playerFilter, clone );
		end
	end

	local GetUnit = function( self )
		return self.unit;
	end

	local GetIncludePlayer = function( self )
		return self.includePlayer;
	end

	local SetIncludePlayer = function( self, value )
		self.includePlayer = value;
	end

	result.Sort = Sort;
	result.Update = Update;
	result.Get = Get;
	result.Count = Count;
	result.AddFilter = AddFilter;
	result.AddPlayerFilter = AddPlayerFilter;
	result.GetUnit = GetUnit;
	result.SetIncludePlayer = SetIncludePlayer;
	result.GetIncludePlayer = GetIncludePlayer;

	result.unit = unit;
	result.includePlayer = false;
	result.filter = { };
	result.playerFilter = { };
	result.table = { };

	return result;
end

function ClassTimerAPI:CreateFramedTexture(parent)

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

function ClassTimerAPI:CreateAuraBarFrame(dataSource, parent)
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

				if ( self.spark ) then
					self.spark:Hide();
				end
			else
				local remaining = self.expirationTime - time;
				self.bar:SetValue( remaining );

				local timeText = "";
				if ( remaining >= 3600 ) then
					timeText = tostring( math.floor( remaining / 3600 ) ) .. "h";
				elseif ( remaining >= 60 ) then
					timeText = tostring( math.floor( remaining / 60 ) ) .. "m";
				elseif ( remaining > Config["TENTHS_TRESHOLD"] ) then
					timeText = tostring( math.floor( remaining ) );
				elseif ( remaining > 0 ) then
					timeText = tostring( math.floor( remaining * 10 ) / 10 );
				end
				self.time:SetText( timeText );

				local barWidth = self.bar:GetWidth();

				if ( self.spark ) then
					self.spark:SetPoint( "CENTER", self.bar, "LEFT", barWidth * remaining / self.duration, 0 );
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

				if ( self.spark ) then
					self.spark:Show();
				end

				self:SetScript( "OnUpdate", OnUpdate );
			else
				self.bar:SetMinMaxValues( 0, 1 );
				self.bar:SetValue( Config["PERMANENT_AURA_VALUE"] );
				self.time:SetText( "" );

				if ( self.spark ) then
					self.spark:Hide();
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

			if ( bit.band( Config["ICON_POSITION"], 4 ) == 0 ) then
				local icon = ClassTimerAPI:CreateFramedTexture( result, "ARTWORK" );
				icon:SetTexCoord( 0.15, 0.85, 0.15, 0.85 );
				icon:SetBorderColor( unpack( T["ClassTimer"]["Colors"]["ICON_COLOR"] ) );

				local iconAnchor1;
				local iconAnchor2;
				local iconOffset;
				if ( bit.band( Config["ICON_POSITION"], 1 ) == 1 ) then
					iconAnchor1 = "TOPLEFT";
					iconAnchor2 = "TOPRIGHT";
					iconOffset = 1;
				else
					iconAnchor1 = "TOPRIGHT";
					iconAnchor2 = "TOPLEFT";
					iconOffset = -1;
				end

				if ( bit.band( Config["ICON_POSITION"], 2 ) == 2 ) then
					icon:SetPoint( iconAnchor1, result, iconAnchor2, iconOffset * 6, 1 );
				else
					icon:SetPoint( iconAnchor1, result, iconAnchor2, iconOffset * ( -Config["BAR_HEIGHT"] - 1 ), 1 );
				end
				icon:SetWidth( Config["BAR_HEIGHT"] + 2 );
				icon:SetHeight( Config["BAR_HEIGHT"] + 2 );

				result.icon = icon;

				local stacks = result:CreateFontString( nil, "OVERLAY", nil );
				stacks:SetFont( C.Medias.Font, 11, "" );
				stacks:SetShadowColor( 0, 0, 0 );
				stacks:SetShadowOffset( 1.25, -1.25 );
				stacks:SetJustifyH( "RIGHT" );
				stacks:SetJustifyV( "BOTTOM" );
				stacks:SetPoint( "TOPLEFT", icon, "TOPLEFT", 0, 0 );
				stacks:SetPoint( "BOTTOMRIGHT", icon, "BOTTOMRIGHT", 0, 3 );
				result.stacks = stacks;
			end

			local bar = CreateFrame( "StatusBar", nil, result, nil );
			bar:SetStatusBarTexture( C["Medias"]["Normal"] );
			if ( bit.band( Config["ICON_POSITION"], 2 ) == 2 or bit.band( Config["ICON_POSITION"], 4 ) == 4 ) then
				bar:SetPoint( "TOPLEFT", result, "TOPLEFT", 0, 0 );
				bar:SetPoint( "BOTTOMRIGHT", result, "BOTTOMRIGHT", 0, 0 );
			else
				if ( bit.band( Config["ICON_POSITION"], 1 ) == 1 ) then
					bar:SetPoint( "TOPLEFT", result, "TOPLEFT", 0, 0 );
					bar:SetPoint( "BOTTOMRIGHT", result, "BOTTOMRIGHT", -Config["BAR_HEIGHT"] - 1, 0 );
				else
					bar:SetPoint( "TOPLEFT", result, "TOPLEFT", Config["BAR_HEIGHT"] + 1, 0 );
					bar:SetPoint( "BOTTOMRIGHT", result, "BOTTOMRIGHT", 0, 0 );
				end
			end
			result.bar = bar;

			if ( Config["SPARK"] ) then
				local spark = bar:CreateTexture( nil, "OVERLAY", nil );
				spark:SetTexture( [[Interface\CastingBar\UI-CastingBar-Spark]] );
				spark:SetWidth( 12 );
				spark:SetBlendMode( "ADD" );
				spark:Show();
				result.spark = spark;
			end

			if ( Config["CAST_SEPARATOR"] ) then
				local castSeparator = bar:CreateTexture( nil, "OVERLAY", nil );
				castSeparator:SetTexture( unpack( T["ClassTimer"]["Colors"]["CAST_SEPARATOR_COLOR"] ) );
				castSeparator:SetWidth( 1 );
				castSeparator:SetHeight( Config["BAR_HEIGHT"] );
				castSeparator:Show();
				result.castSeparator = castSeparator;
			end

			local name = bar:CreateFontString( nil, "OVERLAY", nil );
			name:SetFont( C.Medias.Font, 12, "" );
			name:SetJustifyH( "LEFT" );
			name:SetJustifyV( "CENTER" );
			name:SetShadowColor( 0, 0, 0 );
			name:SetShadowOffset( 1.25, -1.25 );
			name:SetPoint( "TOPLEFT", bar, "TOPLEFT", Config["TEXT_MARGIN"], -1 );
			name:SetPoint( "BOTTOMRIGHT", bar, "BOTTOMRIGHT", -45, 0 );
			result.name = name;

			local time = bar:CreateFontString( nil, "OVERLAY", nil );
			time:SetFont( C.Medias.Font, 12, "" );
			time:SetJustifyH( "RIGHT" );
			time:SetJustifyV( "CENTER" );
			time:SetShadowColor( 0, 0, 0 );
			time:SetShadowOffset( 1.25, -1.25 );
			time:SetPoint( "TOPLEFT", name, "TOPRIGHT", 0, 0 );
			time:SetPoint( "BOTTOMRIGHT", bar, "BOTTOMRIGHT", -Config["TEXT_MARGIN"], 0 );
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
				line:SetPoint( "TOPLEFT", self, "BOTTOMLEFT", 0, Config["BAR_HEIGHT"] );
				line:SetPoint( "BOTTOMRIGHT", self, "BOTTOMRIGHT", 0, 0 );
			else
				local anchor = self.lines[ index - 1 ];
				line:SetPoint( "TOPLEFT", anchor, "TOPLEFT", 0, Config["BAR_HEIGHT"] + Config["BAR_SPACING"] );
				line:SetPoint( "BOTTOMRIGHT", anchor, "TOPRIGHT", 0, Config["BAR_SPACING"] );
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
			self:SetHeight( ( Config["BAR_HEIGHT"] + Config["BAR_SPACING"] ) * count - Config["BAR_SPACING"] );
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
	local result = CreateFrame( "Frame", nil, parent, nil );
	local unit = dataSource:GetUnit();

	result.unit = unit;

	result.lines = { };
	result.dataSource = dataSource;

	local background = result:CreateTexture( nil, "BACKGROUND", nil );
	background:SetAlpha( Config["BACKGROUND_ALPHA"] );
	background:SetTexture( C["Medias"]["Normal"] );
	background:SetPoint( "TOPLEFT", result, "TOPLEFT", 0, 0 );
	background:SetPoint( "BOTTOMRIGHT", result, "BOTTOMRIGHT", 0, 0 );
	background:SetVertexColor( 0.15, 0.15, 0.15 );
	result.background = background;

	local border = CreateFrame( "Frame", nil, result, nil );
	border:SetAlpha( Config["BACKGROUND_ALPHA"] );
	border:SetFrameStrata( "BACKGROUND" );
	border:SetBackdrop( {
		edgeFile = C["Medias"]["Glow"],
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

	return result;
end

T["ClassTimer"] = ClassTimerAPI
