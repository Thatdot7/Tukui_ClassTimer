local T, C, L = Tukui:unpack();

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
		self.sortDirection = false;
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



T["ClassTimer"] = ClassTimerAPI
