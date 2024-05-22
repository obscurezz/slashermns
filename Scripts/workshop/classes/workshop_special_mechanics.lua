-- Â İÒÎÌ ÔÀÉËÅ ÍÈ×ÅÃÎ ÒĞÎÃÀÒÜ ÍÅ ÍÓÆÍÎ
-- ñìîòğè â workshop_commonlib.lua

require('workshop_enums')
require('workshop_get_special_settings')
require('mRnd')
require('statscheck')
require('GroupInfo')
require('targets_filter')
require('named_mods')
require('setValue_Accuracy')

function Workshop_Mechanics_damageUnitsRangeRestriction(scen, methodName, attacker, selected, allies, targets, targetsAreAllies, item, battle, isMarking)
        if CanApply_damageUnitsRangeRestriction(methodName, attacker.unit.impl, targets) then
        	local group, owner, ownerType, player, settings, leaderType = Workshop_getSpecial_getData(scen, attacker.unit, false)
		
		local r = Workshop_getSpecial_damageUnitsRangeRestriction(settings, leaderType)
		if r == RangeRestriction.NoRestriction then
			return targets
		elseif r == RangeRestriction.NearestLine then
			local result = {}
			for i = 1, #targets do
				if _common_IsOnFrontline(targets[i], targets) then
					table.insert(result, targets[i])
				end
			end
			return result
		elseif r == RangeRestriction.NearestLineIfSecondLine then
			if not _common_IsOnFrontline(attacker, allies) then
				local result = {}
				for i = 1, #targets do
					if _common_IsOnFrontline(targets[i], targets) then
						table.insert(result, targets[i])
					end
				end
				return result
			end
		end
	end
	return targets
end
function CanApply_damageUnitsRangeRestriction(methodName, attackerImpl, targets)
        if targets == nil or #targets < 1
        or methodName == "_target_SemgaCatAgility"
        or methodName == "_target_SemgaAdjacentAndUncovered" then
        	return false
        end
        if statsCheck_isDirectDmgUnitImpl(attackerImpl) or statsCheck_isDoTUnitImpl(attackerImpl) then
        	return true
        end
	return false
end

function Workshop_Mechanics_neutralsSelectTargetsRandomly(scen, methodName, attacker, selected, allies, targets, targetsAreAllies, item, battle, isMarking)
        if targetsAreAllies or targets == nil or #targets < 2 then
        	return targets
        end
	local group, owner, ownerType, player, settings, leaderType = Workshop_getSpecial_getData(scen, attacker.unit, false)

	if player ~= nil and player.race ~= Race.Neutral then
        	return targets
	end
	
	local t_group, t_owner, t_ownerType, t_player, t_settings, t_leaderType = Workshop_getSpecial_getData(scen, targets[1].unit, false)
	
	if not Workshop_getSpecial_neutralsSelectTargetsRandomly(t_settings, t_leaderType) then
		return targets
	end
	local result = {targets[_mRnd_RndNum(#targets)]}
	return result
end

function Workshop_Mechanics_DamageSpread(scen, unit, gotGroup, damage, power, attackType, attackN)
	if attackN == 2 or statsCheck_isDirectDmgType(attackType) == false then
		return damage, power, false
	end
	
	local group, owner, ownerType, player, settings, leaderType = Workshop_getSpecial_getData(scen, unit, gotGroup)
	
	local mode = Workshop_getSpecial_damageSpreadMode(settings, leaderType)
	if mode == SpreadMode.NoSpread then
		return damage, power, false
	elseif mode == SpreadMode.Smooth then
		local applyPower = Workshop_getSpecial_damageSpreadApplyPower(settings, leaderType)
		damage = 0.01 * power * damage
		local minDmg
		local maxDmg
		local spreadMultiL = Workshop_getSpecial_damageSpreadLowerMulti(settings, leaderType)
		local spreadMultiU = Workshop_getSpecial_damageSpreadUpperMulti(settings, leaderType)
		if applyPower then
			spreadMultiL = spreadMultiL * 0.01 * (100 - power)
			spreadMultiU = spreadMultiU * 0.01 * (100 - power)
		end
		minDmg = damage * (1 - spreadMultiL)
		maxDmg = damage * (1 + spreadMultiU)
		
		local d = maxDmg - minDmg + 1
		local intPart = _valueCap_GetInt(d)
		local luckDegree = svGetAttackDamageSpreadChanceShift(unit, attackN, scen)
		local r = Workshop_Spread_Gen(intPart, luckDegree)
		return minDmg + r - 1 + d - intPart, 100, true
	elseif mode == SpreadMode.MinMax then
		local applyPower = Workshop_getSpecial_damageSpreadApplyPower(settings, leaderType)
		damage = 0.01 * power * damage
		-- from 1 to 2
		-- local r = _mRnd_RndNum(2)
		local luckDegree = svGetAttackDamageSpreadChanceShift(unit, attackN, scen)
		local r = Workshop_Spread_Gen(2, luckDegree)
		if r == 1 then
			local spreadMulti = Workshop_getSpecial_damageSpreadLowerMulti(settings, leaderType)
			if applyPower then
				spreadMulti = spreadMulti * 0.01 * (100 - power)
			end
			return damage * (1 - spreadMulti), 100, true
		else
			local spreadMulti = Workshop_getSpecial_damageSpreadUpperMulti(settings, leaderType)
			if applyPower then
				spreadMulti = spreadMulti * 0.01 * (100 - power)
			end
			return damage * (1 + spreadMulti), 100, true
		end
	elseif mode == SpreadMode.MinMidMax then
		damage = 0.01 * power * damage
		-- from 1 to 3
		-- local r = _mRnd_RndNum(3)
		local luckDegree = svGetAttackDamageSpreadChanceShift(unit, attackN, scen)
		local r = Workshop_Spread_Gen(3, luckDegree)
		if r == 1 then
			local applyPower = Workshop_getSpecial_damageSpreadApplyPower(settings, leaderType)
			local spreadMulti = Workshop_getSpecial_damageSpreadLowerMulti(settings, leaderType)
			if applyPower then
				spreadMulti = spreadMulti * 0.01 * (100 - power)
			end
			return damage * (1 - spreadMulti), 100, true
		elseif r == 2 then
			return damage, 100, true
		else
			local applyPower = Workshop_getSpecial_damageSpreadApplyPower(settings, leaderType)
			local spreadMulti = Workshop_getSpecial_damageSpreadUpperMulti(settings, leaderType)
			if applyPower then
				spreadMulti = spreadMulti * 0.01 * (100 - power)
			end
			return damage * (1 + spreadMulti), 100, true
		end
	else
		return damage, power, false
	end
end

function Workshop_Mechanics_HealSpread(scen, unit, gotGroup, heal)
	local group, owner, ownerType, player, settings, leaderType = Workshop_getSpecial_getData(scen, unit, gotGroup)
	
	local hitChance = Workshop_getSpecial_healHitChance(settings, leaderType)
	if not _mRnd_simpleRndEvent(hitChance) then
		heal = heal * Workshop_getSpecial_healMissMulti(settings, leaderType)
	end
	if heal == 0 then
		return heal
	end
	
	local mode = Workshop_getSpecial_healSpreadMode(settings, leaderType)
	if mode == SpreadMode.NoSpread then
		return heal
	elseif mode == SpreadMode.Smooth then
		local minHeal = heal * (1 - Workshop_getSpecial_healSpreadLowerMulti(settings, leaderType))
		local maxHeal = heal * (1 + Workshop_getSpecial_healSpreadUpperMulti(settings, leaderType))
		return _mRnd_RndRange(minHeal, maxHeal)
	elseif mode == SpreadMode.MinMax then
		-- from 1 to 2
		local r = _mRnd_RndNum(2)
		if r == 1 then
			return heal * (1 - Workshop_getSpecial_healSpreadLowerMulti(settings, leaderType))
		else
			return heal * (1 + Workshop_getSpecial_healSpreadUpperMulti(settings, leaderType))
		end
	elseif mode == SpreadMode.MinMidMax then
		-- from 1 to 3
		local r = _mRnd_RndNum(3)
		if r == 1 then
			return heal * (1 - Workshop_getSpecial_healSpreadLowerMulti(settings, leaderType))
		elseif r == 2 then
			return heal
		else
			return heal * (1 + Workshop_getSpecial_healSpreadUpperMulti(settings, leaderType))
		end
	else
		return heal
	end
end
