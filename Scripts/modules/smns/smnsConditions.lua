package.path = ".\\Scripts\\?.lua;.\\Scripts\\exp\\?.lua;.\\Scripts\\modules\\?.lua;.\\Scripts\\modifiers\\?.lua;.\\Scripts\\modules\\smns\\?.lua"
require('GroupInfo')
require('RangeInfo')
require('mRnd')
require('common')
require('statscheck')
require('game_constants')
require('smnsInfo')
require('smns_new_mods_id')

function smnsConditions_GuardShatter(unit)
	if _GroupInfo_UnitHasModifierValue(unit, CapitalGuardian) then
		return true
	end
	return false
end

function smnsConditions_RunekeeperWithLoremaster(unit)
	if _GroupInfo_UnitHasModifierValue(unit, RunekeeperWithLoremaster) and _GroupInfo_stackHasModifierAmount(Loremaster) > 0 then
		return true
	end
	return false
end

function smnsConditions_RunekeeperWithEngineer(unit)
	if _GroupInfo_UnitHasModifierValue(unit, RunekeeperWithEngineer) and _GroupInfo_stackHasModifierAmount(Engineer) > 0 then
		return true
	end
	return false
end

function smnsConditions_LichShatter(unit)
	if _GroupInfo_UnitHasModifierValue(unit, LichShatter) and _GroupInfo_stackHasModifierAmount(LichQueenInParty) > 0 then
        return true
    end
    return false
end

function smnsConditions_ArchLichShatter(unit)
	if _GroupInfo_UnitHasModifierValue(unit, ArchLichShatter) and _GroupInfo_stackHasModifierAmount(LichQueenInParty) > 0 then
        return true
    end
    return false
end

function smnsConditions_ArchdruidStrengthen(unit)
	if _GroupInfo_UnitHasModifierValue(unit, Archdruid) and unit.impl.level - unit.baseImpl.level >= 3 then
		return true
	end
	return false
end

function smnsConditions_DlanMortisResist(unit)
	if _GroupInfo_UnitHasModifierValue(unit, DlanMortis) and unit.impl.level - unit.baseImpl.level >= 3 then
		return true
	end
	return false
end

function smnsConditions_StingerShatter(unit)
	if _GroupInfo_UnitHasModifierValue(unit, StingerShatter) and _GroupInfo_stackHasModifierAmount(Druid) > 0 then
		return true
	end
	return false
end

function smnsConditions_CryomantFrost(unit)
	if _GroupInfo_UnitHasModifierValue(unit, CryoDot) and _GroupInfo_stackHasModifierAmount(IgnarCryo) > 0 then
		return true
	end
	return false
end

function smnsConditions_DetectiveSparePotion(unit)
	if _GroupInfo_UnitHasModifierValue(unit, Detective) and _GroupInfo_stackHasModifierAmount(AssasinJusticiar) > 0 then
		return true
	end
	return false
end

function smnsConditions_EmyssarySparePotion(unit)
	if _GroupInfo_UnitHasModifierValue(unit, Emyssary) and _GroupInfo_stackHasModifierAmount(AssasinJusticiar) > 0 then
		return true
	end
	return false
end



function smnsConditions_getBonusIfGiant(unit, value)
	local group = _GroupInfo_getCurrentGroup()
	if group == nil then
		return 0
	end
	local units = group.units
	local result = 0
	for i = 1, #units do
		u = units[i]
		if not u.baseImpl.small then
			result = result + value
			break
		end
	end
	return result
end

function _getBattleWins(unit)
	local stack = _GroupInfo_getUnitStack(unit)
	return stack.battlesWon
end

function smnsConditions_getCorpseBonus(unit, value)
	_get_Group_and_Mods(unit)
	local group = _GroupInfo_getCurrentGroup()
	local result = 0
	local units = group.units
	for i = 1, #units do
		u = units[i]
		if u.hp == 0 then
			result = result + value
		end
	end
	return result
end

function smnsConditions_stackHasCorpse(unit)
    _get_Group_and_Mods(unit)
    local group = _GroupInfo_getCurrentGroup()
    local units = group.units
    for i = 1, #units do
        u = units[i]
        if u.hp == 0 then
        return true
		end
    end
	
	return false
end

function smnsConditions_allPartyLowerThan50(unit)
	_get_Group_and_Mods(unit)
    local group = _GroupInfo_getCurrentGroup()
    local units = group.units
    for i = 1, #units do
        u = units[i]
        if u.hp / u.hpMax > 0.5 then
			return false
		end
	end
	return true
end

function smnsConditions_isBigUnit(unit)
	if not unit.baseImpl.small then
		return true
	end
	
	return false
end

function smnsConditions_isStackOnItsTerrain(scen, ps)
	if ps == nil then
		return false
	end
	
	local stack_position = ps.position
	local player_race = ps.owner.race

	if _terrainToPlayerRace[scen:getTile(ps.position).terrain] == player_race then
		return true
	end

	return false
end

function smnsConditions_isRodNearToStack(unit, range, scen)
	local stack = _GroupInfo_getUnitStack(unit)
	local player = _GroupInfo_getUnitPlayer(unit)

	if stack ~= nil then
		for x = stack.position.x-range, stack.position.x+range do
			for y = stack.position.y-range, stack.position.y+range do
				local point = Point.new(x, y)
				if scen:getRod(point) ~= nil then
					if _terrainToPlayerRace[scen:getTile(point).terrain] == player.race then
						return true
					end
				end
			end
		end
	end

	return false
end

function smnsConditions_isStackNearToStackWithUnitModifier(unit, range, scen, modifier_id)
	local stack = _GroupInfo_getUnitStack(unit)
	local player = _GroupInfo_getUnitPlayer(unit)

	if stack ~= nil then
		for x = stack.position.x-range, stack.position.x+range do
			for y = stack.position.y-range, stack.position.y+range do
				local get_stack = scen:getStack(Point.new(x, y))
				if get_stack ~= nil and get_stack.id ~= stack.id and not get_stack.inside and get_stack.owner.id == player.id then
					local get_group_units = get_stack.group.units
					for u = 1, #get_group_units do
						if _GroupInfo_UnitHasModifierValue(get_group_units[u], modifier_id) then
							return true
						end
					end
				end
			end
		end
	end

	return false
end

function smnsConditions_isStackNearToEnemyStackWithUnitModifier(unit, range, scen, modifier_id)
	local stack = _GroupInfo_getUnitStack(unit)
	local player = _GroupInfo_getUnitPlayer(unit)

	if stack ~= nil then
		for x = stack.position.x-range, stack.position.x+range do
			for y = stack.position.y-range, stack.position.y+range do
				local get_stack = scen:getStack(Point.new(x, y))
				if get_stack ~= nil and not get_stack.inside and get_stack.owner.id ~= player.id then
					local get_group_units = get_stack.group.units
					for u = 1, #get_group_units do
						if _GroupInfo_UnitHasModifierValue(get_group_units[u], modifier_id) then
							return true
						end
					end
				end
			end
		end
	end

	return false
end

function smnsConditions_getThiefActionBonus(unit, range, scen)
	local stack = _GroupInfo_getUnitStack(unit)
	local player = _GroupInfo_getUnitPlayer(unit)
	local ThiefMod = Id.new('g070um0227').value

	if stack ~= nil then
		for x = stack.position.x-range, stack.position.x+range do
			for y = stack.position.y-range, stack.position.y+range do
				local get_stack = scen:getStack(Point.new(x, y))
				if get_stack ~= nil and get_stack.owner.id ~= player.id and get_stack.owner.lord == Lord.Diplomat and get_stack.owner.race ~= Race.Neutral then
					if smnsConditions_isStackOnItsTerrain(scen, get_stack) then
						local get_group_units = get_stack.group.units
						for u = 1, #get_group_units do
							if _GroupInfo_UnitHasModifierValue(get_group_units[u], ThiefMod) then
								return true
							end
						end
					end
				end
			end
		end
	end

	return false
end