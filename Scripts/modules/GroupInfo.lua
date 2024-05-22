package.path = ".\\Scripts\\?.lua;.\\Scripts\\exp\\?.lua;.\\Scripts\\modifiers\\?.lua;.\\Scripts\\modifiers\\drawing\\?.lua;.\\Scripts\\modifiers\\items\\?.lua;.\\Scripts\\modifiers\\leaderMods\\?.lua;.\\Scripts\\modifiers\\perks\\?.lua;.\\Scripts\\modifiers\\smns\\?.lua;.\\Scripts\\modifiers\\smns\\items\\?.lua;.\\Scripts\\modifiers\\smns\\perks\\?.lua;.\\Scripts\\modifiers\\smns\\spells\\?.lua;.\\Scripts\\modifiers\\smns\\units\\?.lua;.\\Scripts\\modifiers\\spells\\?.lua;.\\Scripts\\modifiers\\units\\?.lua;.\\Scripts\\modifiers\\units\\bloodsorcerer\\?.lua;.\\Scripts\\modifiers\\units\\multiplicative_stats\\?.lua;.\\Scripts\\modifiers\\units\\torhoth\\?.lua;.\\Scripts\\modules\\?.lua;.\\Scripts\\modules\\smns\\?.lua;.\\Scripts\\workshop\\?.lua;.\\Scripts\\workshop\\classes\\?.lua"
require('smallEnthInfo')
require('RangeInfo')
require('common')

_terrainToPlayerRace = {}
_terrainToPlayerRace[Terrain.Human] = Race.Human
_terrainToPlayerRace[Terrain.Dwarf] = Race.Dwarf
_terrainToPlayerRace[Terrain.Heretic] = Race.Heretic
_terrainToPlayerRace[Terrain.Undead] = Race.Undead
_terrainToPlayerRace[Terrain.Neutral] = Race.Neutral
_terrainToPlayerRace[Terrain.Elf] = Race.Elf

unitGroup      = nil
unitOwner      = nil
unitOwnerType  = nil
groupMods      = nil
groupMods_Dead = nil
local scenario = nil
unitModifiersChanged = {}
function _GroupInfo_SetScenario(scen)
	scenario = scen
	return 0
end

-- unit - ����, ��� �������� ����� �������� �����
-- modID ������. �������� G000UM3004
function _GroupInfo_stackHasModifier(modID)
	return groupMods[modID] ~= nil
end
function _GroupInfo_stackHasModifier_Dead(modID)
	return groupMods_Dead[modID] ~= nil
end

-- unit - ����, ��� �������� ����� �������� �����
-- modID ������. �������� G000UM3004
function _GroupInfo_stackHasModifierAmount(modID)
	if groupMods[modID] == nil then
		return 0
	end
	return groupMods[modID]
end
function _GroupInfo_stackHasModifierAmount_Dead(modID)
	if groupMods_Dead[modID] == nil then
		return 0
	end
	return groupMods_Dead[modID]
end

function _GroupInfo_checkWard(unit, prev, alwaysMod, OnceMod, callGetGroup)
	if callGetGroup then
		_get_Group_and_Mods(unit)
	end
	
	if prev == Immune.Always then
		return prev
	end
	if alwaysMod ~= nil then
		if _GroupInfo_stackHasModifier(alwaysMod) then
			return Immune.Always
		end
	end
	
	if prev == Immune.Once then
		return prev
	end
	if OnceMod ~= nil then
		if _GroupInfo_stackHasModifier(OnceMod) then
			return Immune.Once
		end
	end
	
	return prev
end


calls = 0
function _get_Group_and_Mods(unit)
--calls = calls + 1
--log('calls '..calls)

	unitGroup = _GroupInfo_getUnitGroup(unit)
	groupMods, groupMods_Dead = _GroupInfo_GroupModifires(unitGroup, unit)
	
	return 0
end

function _GroupInfo_GroupModifires(group, gUnit)
	local result  = {}
	local resultD = {}
	
	if group == nil then
		return result, resultD
	end
	
	local u
	local mods
	local unitValue
	local gUnitValue = gUnit.id.value
	local units = group.units
	local cg = cachedTickUnitGroup[gUnitValue]
	
	if cg ~= nil and #units == #cg then
		local m
		local cacheGroupMods = false
		for i = 1, #units do
			u = units[i]
			if u.hp > 0 then
				m = 1
			else
				m = -1
			end
			if cg[i] ~= m * cachedTickUnit[u.id.value] then
				cacheGroupMods = true
				break
			end
		end
		if not cacheGroupMods and cachedGroupMods[gUnitValue] ~= nil then
			return cachedGroupMods[gUnitValue], cachedGroupMods_Dead[gUnitValue]
		end
	end
	
	cachedTickUnitGroup[gUnitValue] = {}
	for i = 1, #units do
		u = units[i]
		unitValue = u.id.value
		if unitModifiersChanged[unitValue] then
			_GroupInfo_cacheModifiers(u, unitValue)
		end
		mods = cachedUnitModsValue[unitValue]
		if mods == nil then
			_GroupInfo_cacheModifiers(u, unitValue)
			mods = cachedUnitModsValue[unitValue]			
		end
		if u.hp > 0 then
			for k = 2, #mods do
				if result[mods[k]] == nil then
					result[mods[k]] = 1
				else
					result[mods[k]] = result[mods[k]] + 1
				end
			end
			cachedTickUnitGroup[gUnitValue][i] = cachedTickUnit[unitValue]
		else
			for k = 2, #mods do
				if resultD[mods[k]] == nil then
					resultD[mods[k]] = 1
				else
					resultD[mods[k]] = resultD[mods[k]] + 1
				end
			end
			cachedTickUnitGroup[gUnitValue][i] = -cachedTickUnit[unitValue]
		end
	end
	
	if result == nil then
		error("group mods is nil")
	end
	cachedGroupMods[gUnitValue]  = result
	cachedGroupMods_Dead[gUnitValue] = resultD
	return result, resultD
end

G040UM0064 = Id.new('g040um0064').value
G040UM0106 = Id.new('g040um0106').value
function _GroupInfo_UnitIsRangedWithoutBow(unit)
	local r = unit.leveledImpl.attack1.reach
	if r == _RangeInfo_changeToRanged(r) then
		return true
	end
	local mods = _GroupInfo_UnitModifiers(unit)
	if _GroupInfo_UnitModifierAmount(mods, G040UM0064) > 0 then
		return true
	end
	if _GroupInfo_UnitModifierAmount(mods, G040UM0106) > 0 then
		r = _smallEnthInfo_aReach(unit)
		if r == _RangeInfo_changeToRanged(r) then
			return true
		end
	end
	
	if r == 26 or r == 33 then
		local uid = unit.id
		local unitSlot    = nil
		local alliesSlots = {}
		local slots = _GroupInfo_getUnitGroup(unit).slots
		local n = 1
		for i = 1, #slots do
			u = slots[i].unit
			if u ~= nil then
				if u.id == uid then
					if unitSlot == nil then
						unitSlot = slots[i]
					end
				elseif u.hp > 0 then
					alliesSlots[n] = slots[i]
					n = n +1
				end
			end
		end
		if _common_IsOnFrontline(unitSlot, alliesSlots) then
			return true
		end
	end
	return false
end

cachedUnitModsValue = {}
cachedUnitModsDictionaryValueAmount = {}
cacheTick = 1
cachedTickUnit = {}
cachedTickUnitGroup = {}
cachedGroupMods = {}
cachedGroupMods_Dead = {}
function _GroupInfo_cacheModifiers(unit, unitValue)
	_unitAura_SetNewClear(unitValue)
	local mods
	--if unit.original == nil then
		mods = unit.modifiers
	--else
	--	mods = unit.original.modifiers
	--end
	local i
	local v
	unitModifiersChanged[unitValue] = false
	cachedUnitModsValue[unitValue]  = {}
	local dv = {}
	for k = 1, #mods do
		v = mods[k].id.value
		cachedUnitModsValue[unitValue][k] = v
		if dv[v] == nil then
			dv[v] = 1
		else
			dv[v] = dv[v] + 1
		end
	end
	cachedUnitModsDictionaryValueAmount[unitValue] = dv
	cacheTick = cacheTick + 1
	cachedTickUnit[unitValue] = cacheTick
	cachedTickUnitGroup[unitValue] = {}
	return 0
end

function _GroupInfo_UnitHasModifierValue(unit, modID)
	local unitValue = unit.id.value
	if unitModifiersChanged[unitValue] then
		_GroupInfo_cacheModifiers(unit, unitValue)
	end
 	local mods = cachedUnitModsDictionaryValueAmount[unitValue]
	return mods[modID] ~= nil
end

function _GroupInfo_UnitModifiers(unit)
	local unitValue = unit.id.value
	if unitModifiersChanged[unitValue] then
		_GroupInfo_cacheModifiers(unit, unitValue)
	end
	return cachedUnitModsDictionaryValueAmount[unitValue]
end

function _GroupInfo_UnitModifierAmount(mods, modID)
	if mods[modID] == nil then
		return 0
	end
	return mods[modID]
end

-- 1 - stack
-- 2 - city
-- 3 - ruin
groupSearchResultType = {}
groupSearchResult = {}
unitGroupPos = {}

searches = 0
function _GroupInfo_getUnitStack(unit)
	local uidb = unit.id
	local uidv = uidb.value
	local ownerID = groupSearchResult[uidv]
	local owner = nil
	if ownerID ~= nil then
		local gtype = groupSearchResultType[uidv]
		if gtype == 1 then
			owner = scenario:getStack(ownerID)
			if owner ~= nil then
				if not stackContainsUnit(owner, uidb, uidv) then
					owner = nil
				end
			end
		end
	end
	if owner == nil then
		owner = scenario:findStackByUnit(unit)
		if owner ~= nil then
			makeUnitStackLink(owner)
		end
	end
	return owner
end
function _GroupInfo_getUnitOwner_Fast(unit)
	return unitOwner, unitOwnerType
end

function _GroupInfo_getUnitGroup(unit)
	local uidb = unit.id
	local uidv = uidb.value
	local ownerID = groupSearchResult[uidv]
	local owner = nil
	if ownerID ~= nil then
		local gtype = groupSearchResultType[uidv]
		if gtype == 1 then
			owner = scenario:getStack(ownerID)
			if owner ~= nil then
				if not stackContainsUnit(owner, uidb, uidv) then
					owner = nil
				end
			end
		elseif gtype == 2 then
			owner = scenario:getFort(ownerID)
			if owner ~= nil then
				if not cityContainsUnit(owner, uidb, uidv) then
					owner = nil
				end
			end
		elseif gtype == 3 then
			owner = scenario:getRuin(ownerID)
			if owner ~= nil then
				if not ruinContainsUnit(owner, uidb, uidv) then
					owner = nil
				end
			end
		end
	end
	if owner == nil then
		owner = scenario:findStackByUnit(unit)
		if owner ~= nil then
			makeUnitStackLink(owner)
		else
			owner = scenario:findFortByUnit(unit)
			if owner ~= nil then
				makeUnitCityLink(owner)
			else
				owner = scenario:findRuinByUnit(unit)
				if owner ~= nil then
					makeUnitRuinLink(owner)
				end
			end
		end
	end
	unitOwner     = owner
	unitOwnerType = groupSearchResultType[uidv]
	if owner ~= nil then
		return owner.group, owner, groupSearchResultType[uidv]
	else
		return nil, nil, nil
	end
end

function _GroupInfo_getUnitPlayer(unit)
	local g = _GroupInfo_getUnitGroup(unit)
	return _GroupInfo_getLastFoundGroupPlayer()
end
function _GroupInfo_getLastFoundGroupPlayer()
	return _GroupInfo_getPlayer(unitOwnerType, unitOwner)
end
function _GroupInfo_getPlayer(uOwType, uOw)
	if (uOwType == 1 or uOwType == 2) and uOw ~= nil then
		return uOw.owner
	end
	return nil
end

function makeUnitStackLink(stack)
	local id = stack.id
	local group = stack.group
	return makeUnitGroupLink(group, id, 1)
end
function makeUnitCityLink(city)
	local id = city.id
	local group = city.group
	return makeUnitGroupLink(group, id, 2)
end
function makeUnitRuinLink(ruin)
	local id = ruin.id
	local group = ruin.group
	return makeUnitGroupLink(group, id, 3)
end

function makeUnitGroupLink(group, ownerID, ownerType)
	local slots = group.slots
	local u
	local uidv
	for i = 1, #slots do
		u = slots[i].unit
		if u ~= nil then
			uidv = u.id.value
			groupSearchResult[uidv] = ownerID
			groupSearchResultType[uidv] = ownerType
			unitGroupPos[uidv] = i
		end
	end
	return 0
end

function stackContainsUnit(stack, unitUniqID, unitUniqIDVal)
	local group = stack.group
	return groupContainsUnit(group, unitUniqID, unitUniqIDVal)
end
function cityContainsUnit(city, unitUniqID, unitUniqIDVal)
	local group = city.group
	return groupContainsUnit(group, unitUniqID, unitUniqIDVal)
end
function ruinContainsUnit(ruin, unitUniqID, unitUniqIDVal)
	local group = ruin.group
	return groupContainsUnit(group, unitUniqID, unitUniqIDVal)
end

function groupContainsUnit(group, unitUniqID, unitUniqIDVal)
	local expectedSlot = unitGroupPos[unitUniqIDVal]
	local slots = group.slots
	local slot
	local u
	local uidv
	if expectedSlot ~= nil then
		slot = slots[expectedSlot]
		if slot ~= nil then
			u = slot.unit
			if u ~= nil then
				if unitUniqID == u.id then
					return true
				end
			end
		end
	end
	local result = false
	for i = 1, #slots do
		u = slots[i].unit
		if u ~= nil then
			uidv = u.id.value
			unitGroupPos[uidv] = i
			if uidv == unitUniqIDVal then
				result = true
			end
		end
	end
	return result
end

function _GroupInfo_getCoveringUnit(unit, gotGroup)
	return _GroupInfo_getSameColumnUnitWithPositionCondition(unit, gotGroup, 0, -1, true)
end
function _GroupInfo_getCoveredUnit(unit, gotGroup)
	return _GroupInfo_getSameColumnUnitWithPositionCondition(unit, gotGroup, 1, 1, true)
end
function _GroupInfo_getCoveringUnitCorpse(unit, gotGroup)
	return _GroupInfo_getSameColumnUnitWithPositionCondition(unit, gotGroup, 0, -1, false)
end
function _GroupInfo_getCoveredUnitCorpse(unit, gotGroup)
	return _GroupInfo_getSameColumnUnitWithPositionCondition(unit, gotGroup, 1, 1, false)
end
function _GroupInfo_getSameColumnUnitWithPositionCondition(unit, gotGroup, breakConditionUnitLine, lineDelta, returnAliveUnit)

	if not unit.impl.small then
		return nil
	end
	
	local g
	if gotGroup then
		g = unitGroup
	else
		g = _GroupInfo_getUnitGroup(unit)	
	end
	if g == nil then
		return nil
	end
	
	local myColumn = nil
	local myLine   = nil
	local unitIndex = unit.id.value
	local slots = g.slots
	local slot
	local u
	local upos = {}
	upos[0] = {}
	upos[1] = {}
	for i = 1, #slots do
		slot = slots[i]
		u = slot.unit
		if u ~= nil then
			if u.id.value == unitIndex then
				myLine = slot.line
				if myLine == breakConditionUnitLine then
					return nil
				end
				myColumn = slot.column
			else
				upos[slot.line][slot.column] = u
			end
		end
	end
	u = upos[myLine + lineDelta][myColumn]
	if u ~= nil then
		if returnAliveUnit then
			if u.hp > 0 then
				return u
			end
		else
			if u.hp == 0 then
				return u
			end
		end
	end
	return nil
end

function _GroupInfo_getSameColumnUnit(unit, gotGroup)

	return _GroupInfo_getSameColumnUnitWithCondition(unit, gotGroup, true)
end
function _GroupInfo_getSameColumnUnitCorpse(unit, gotGroup)
	return _GroupInfo_getSameColumnUnitWithCondition(unit, gotGroup, false)
end
function _GroupInfo_getSameColumnUnitWithCondition(unit, gotGroup, returnAliveUnit)
	if not unit.impl.small then
		return nil
	end
	
	local g
	if gotGroup then
		g = unitGroup
	else
		g = _GroupInfo_getUnitGroup(unit)	
	end
	if g == nil then
		return nil
	end
	
	local myColumn = nil
	local myLine   = nil
	local unitIndex = unit.id.value
	local slots = g.slots
	local slot
	local u
	local upos = {}
	upos[0] = {}
	upos[1] = {}
	for i = 1, #slots do
		slot = slots[i]
		u = slot.unit
		if u ~= nil then
			if u.id.value == unitIndex then
				myLine = slot.line
				myColumn = slot.column
			else
				upos[slot.line][slot.column] = u
			end
		end
	end
	u = nil
	if upos[myLine - 1] ~= nil then
		u = upos[myLine - 1][myColumn]
	end
	if u == nil and upos[myLine + 1] ~= nil then
		u = upos[myLine + 1][myColumn]
	end
	if u ~= nil then
		if returnAliveUnit then
			if u.hp > 0 then
				return u
			end
		else
			if u.hp == 0 then
				return u
			end
		end
	end
	return nil
end

function _GroupInfo_getLeftAndRightNearestUnits(unit, gotGroup)
	return _GroupInfo_getLeftAndRightNearestUnitsWithCondition(unit, gotGroup, true)
end
function _GroupInfo_getLeftAndRightNearestUnitsCorpse(unit, gotGroup)
	return _GroupInfo_getLeftAndRightNearestUnitsWithCondition(unit, gotGroup, false)
end
function _GroupInfo_getLeftAndRightNearestUnitsWithCondition(unit, gotGroup, returnAliveUnit)
	local g
	if gotGroup then
		g = unitGroup
	else
		g = _GroupInfo_getUnitGroup(unit)	
	end
	local result = {}
	if g == nil then
		return result
	end
	local myColumn = nil
	local myLine   = nil
	local unitIndex = unit.id.value
	local slots = g.slots
	local slot
	local u
	local upos = {}
	upos[0] = {}
	upos[1] = {}
	for i = 1, #slots do
		slot = slots[i]
		u = slot.unit
		if u ~= nil then
			if u.id.value == unitIndex then
				myLine = slot.line
				myColumn = slot.column
			else
				upos[slot.line][slot.column] = u
			end
		end
	end
	if unit.impl.small then
		for i = -1, 1, 2 do
			if upos[myLine][myColumn + i] ~= nil then
				if returnAliveUnit then
					if upos[myLine][myColumn + i].hp > 0 then
						table.insert(result, upos[myLine][myColumn + i])
					end
				else
					if upos[myLine][myColumn + i].hp == 0 then
						table.insert(result, upos[myLine][myColumn + i])
					end
				end
			end
		end
	else
		for j = 0, 1, 1 do
			for i = -1, 1, 2 do
				if upos[j][myColumn + i] ~= nil then
					if j == 0 or upos[j][myColumn + i].impl.small then
						if returnAliveUnit then
							if upos[j][myColumn + i].hp > 0 then
								table.insert(result, upos[j][myColumn + i])
							end
						else
							if upos[j][myColumn + i].hp == 0 then
								table.insert(result, upos[j][myColumn + i])
							end
						end
					end
				end
			end
		end
	end
	return result
end

function _GroupInfo_getCurrentGroup()
	return unitGroup
end

function _GroupInfo_getCurrentGroupLeader()
	return _GroupInfo_getGroupLeader(unitGroup)
end

function _GroupInfo_getGroupLeader(group)
	local units = group.units
	local u
	for i = 1, #units do
		u = units[i]
		if u.original ~= nil then
			if u.original.impl.leaderType > -1 then
				return u.original
			end
		elseif u.impl.leaderType > -1 then
			return u
		end
	end
	return nil
end

function _GroupInfo_getGroupUnits(group)
	local units = group.units
	local result = {}
	local u
	for i = 1, #units do
		u = units[i]
		if u.original ~= nil then
			table.insert(result, u.original)
		else
			table.insert(result, u)
		end
	end
	return result
end

function _GroupInfo_getFrontlineBonusMultiplier(group)
	local slots = group.slots
	local s
	local u
	local result = 0
	for i = 1, #slots do
		s = slots[i]
		u = s.unit
		if u ~= nil and u.hp > 0 and s.line == 0 then
			result = result + 1
		end
	end
	return result
end

function _GroupInfo_canUseFastRetreat(unit, gotGroup)
	if unit.impl.leaderType == Leader.Noble then
		return true
	end
	
	local g
	if gotGroup then
		g = unitGroup
	else
		g = _GroupInfo_getUnitGroup(unit)	
	end
	
	local units = g.units
	local n = 0
	for i = 1, #units do
		if units[i].hp > 0 then
			n = n + 1
		end
	end
	return n > 1
end

T15Modifiers = {Id.new('g000um4104'), Id.new('g000um4105'), Id.new('g000um4106'),
		Id.new('g006um0034'), Id.new('g200um0001'), Id.new('g200um0004'),
                Id.new('g200um0005'), Id.new('g200um0006'), Id.new('g200um0007'),
                Id.new('g200um0010'), Id.new('g200um0011'), Id.new('g200um0012'),
                Id.new('g200um0013'), Id.new('g200um0014'), Id.new('g200um0015')}
function _GroupInfo_CanTakeUberperk(unitImpl, callerModValue)
	local T15ModifiersCount = 0
	local mod
	for i = 1, #T15Modifiers do
		mod = T15Modifiers[i]
		if unitImpl:hasModifier(mod) then
			if callerModValue == mod.value then
				return true
			end
			T15ModifiersCount = T15ModifiersCount + 1
		end
	end
	if T15ModifiersCount == 1 then
		return unitImpl.level >= 20
	elseif T15ModifiersCount == 2 then
		return false
	else
		return true
	end
end

function _GroupInfo_GetObjectsWithGroups(minX, maxX, minY, maxY)
	local stacks = {}
	local ruins = {}
	local forts = {}
	local stack
	local ruin
	local fort
	local addedStacks = {}
	local addedForts  = {}
	local addedRuins  = {}
	local id
	
	local minX = math.max(minX, 0)
	local maxX = math.min(maxX, scenario.size - 1)
	local minY = math.max(minY, 0)
	local maxY = math.min(maxY, scenario.size - 1)
	
	for j = minY, maxY do
		for i = minX, maxX do
			fort = scenario:getFort(i, j)
			if fort ~= nil then
				id = fort.id.value
				if addedForts[id] == nil then
					addedForts[id] = true
					table.insert(forts, fort)
					stack = fort.visitor
					if stack ~= nil then
						id = stack.id.value
						if addedStacks[id] == nil then
							addedStacks[id] = true
							table.insert(stacks, stack)
						end
					end
				end
			else
				stack = scenario:getStack(i, j)
				if stack ~= nil then
					id = stack.id.value
					if addedStacks[id] == nil then
						addedStacks[id] = true
						table.insert(stacks, stack)
					end
				else
					ruin = scenario:getRuin(i, j)
					if ruin ~= nil and ruin.looter == nil then
						id = ruin.id.value
						if addedRuins[id] == nil then
							addedRuins[id] = true
							table.insert(ruins, ruin)
						end
					end
				end
			end
		end
	end
	return stacks, ruins, forts
end

function _GroupInfo_CanTakeUseTalismans(unitImpl)
	if unitImpl.global:hasAbility(Ability.TalismanUse) then
		return false
	else
		return true
	end
end

function _GroupInfo_CanTakeUseScrolls(unitImpl)
	if unitImpl.global:hasAbility(Ability.WandScrollUse) then
		return false
	else
		return true
	end
end

function _GroupInfo_printUnitStackInfo(unit)
	_get_Group_and_Mods(unit)
	local group = _GroupInfo_getCurrentGroup()
	local player = _GroupInfo_getLastFoundGroupPlayer()
	local units = _GroupInfo_getGroupUnits(group)
	local leader = _GroupInfo_getCurrentGroupLeader()
	
	local owner = scenario:findStackByUnit(unit)
	if owner == nil then
		owner = scenario:findFortByUnit(unit)
		if owner == nil then
			owner = scenario:findRuinByUnit(unit)
		end
	end
	
	log('--------------------------------')
	if player ~= nil then
		log('player: '..tostring(player.race))
	else
		log('player: nil')
	end
	log('unit: id '..tostring(unit.id)..' base id '..tostring(unit.baseImpl.id))
	log('position: X '..tostring(owner.position.x)..' Y '..tostring(owner.position.y))
	if leader ~= nil then
		log('stack leader: '..tostring(leader.id)..' base id '..tostring(leader.baseImpl.id))
	else
		log('stack leader: nil')
	end
	
	for i = 1, #units do
		log('stack unit '..i..': id '..tostring(units[i].id)..' base id '..tostring(units[i].baseImpl.id)..' hp '..tostring(units[i].hp))
	end
	return 0
end

