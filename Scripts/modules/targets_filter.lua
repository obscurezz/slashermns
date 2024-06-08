package.path = ".\\Scripts\\?.lua;.\\Scripts\\exp\\?.lua;.\\Scripts\\modifiers\\?.lua;.\\Scripts\\modifiers\\drawing\\?.lua;.\\Scripts\\modifiers\\items\\?.lua;.\\Scripts\\modifiers\\leaderMods\\?.lua;.\\Scripts\\modifiers\\perks\\?.lua;.\\Scripts\\modifiers\\smns\\?.lua;.\\Scripts\\modifiers\\smns\\items\\?.lua;.\\Scripts\\modifiers\\smns\\perks\\?.lua;.\\Scripts\\modifiers\\smns\\spells\\?.lua;.\\Scripts\\modifiers\\smns\\units\\?.lua;.\\Scripts\\modifiers\\spells\\?.lua;.\\Scripts\\modifiers\\units\\?.lua;.\\Scripts\\modifiers\\units\\bloodsorcerer\\?.lua;.\\Scripts\\modifiers\\units\\multiplicative_stats\\?.lua;.\\Scripts\\modifiers\\units\\torhoth\\?.lua;.\\Scripts\\modules\\?.lua;.\\Scripts\\modules\\smns\\?.lua;.\\Scripts\\workshop\\?.lua;.\\Scripts\\workshop\\classes\\?.lua"

targets_filter = {}
require('bloodsorcererInfo')
require('torhothInfo')
require('barrantor_info')
require('GroupInfo')
require('RangeInfo')
require('common')
require('statscheck')
require('named_mods')
require('mRnd')
require('smnsInfo')
if smnsEnabled then
	require('smnsRange')
end

library = library or require('library')

-- ��������� ���
G000UU7605 = Id.new('g000uu7605')

-- ������
G000UU7592 = Id.new('g000uu7592')
G001UU7592 = Id.new('g001uu7592')

-- ����������
G024UM0041 = Id.new('g024um0041').value
G000UU8220 = Id.new('g000uu8220')

-- ������� ������
G024UM0252 = Id.new('g024um0252').value
G000UU7619 = Id.new('g000uu7619')

--buff attractor
G040UM0232 = Id.new('g040um0232').value

--chance to attack all
G040UM0243 = Id.new('g040um0243').value
--chance to attack random per lost HP
G040UM0245 = Id.new('g040um0245').value
--chance to attack random per lost HP x3
G040UM0246 = Id.new('g040um0246').value
--chance to attack random per 2 levels
G040UM0247 = Id.new('g040um0247').value
--chance to attack random per lost HP. Overlevels: 0-4 is x1, 5-9 is x2, 10-99 is x4
G040UM0339 = Id.new('g040um0339').value

--attack units with LowerDamage
G040UM0285 = Id.new('g040um0285').value

--attack units with LowerInitiative
G040UM0303 = Id.new('g040um0303').value

--attack units with Blister
G040UM0283 = Id.new('g040um0283').value
g070um0312 = Id.new('g070um0312').value
--attack units with Frostbite
G040UM0284 = Id.new('g040um0284').value

--attack units with Poison
G040UM0302 = Id.new('g040um0302').value

--new dwarf buffers
G000UU0033 = Id.new('g000uu0033')
G000UU0034 = Id.new('g000uu0034')
G000UU7558 = Id.new('g000uu7558')
G000UU7559 = Id.new('g000uu7559')



function _targets_filter_AttackType(methodName, attacker, selected, allies, targets, targetsAreAllies, item, battle)
	local r = _targets_filter_ModifBuffer(attacker, targets, targetsAreAllies, item, battle)
	r = _targets_filter_Alchemist(attacker, r, targetsAreAllies, item, battle)
	r = _targets_filter_Doppelganger(attacker, r, allies, targetsAreAllies, item, battle)
	-- r = _targets_filter_DoTIsMainAttack(methodName, attacker, selected, allies, r, targetsAreAllies, item, battle)
	return r
end	

function _targets_filter_Alchemist(attacker, targets, targetsAreAllies, item, battle)
	if not targetsAreAllies then
		return targets
	end
	local aunit = attacker.unit
	local aimpl = aunit.impl
	local apply = false
	local a
	local atype = _targets_filter_GetAttack1Type(attacker, item, battle)
	if atype == Attack.GiveAttack then
		apply = true
	else
		atype = _targets_filter_GetAttack2Type(attacker, item, battle)
		if atype ~= nil and atype == Attack.GiveAttack then
			apply = true
		end
	end
	if apply then
		local exclude
		local result = {}
		for i=1, #targets do
			exclude = false
			aimpl = targets[i].unit.impl
			if aimpl.attack1.type == Attack.GiveAttack then
				exclude = true
			else
				a = aimpl.attack2
				if a ~= nil and a.type == Attack.GiveAttack then
					exclude = true
				end
			end
			if not exclude then
				table.insert(result, targets[i])
			end
		end
		return result
	end
	return targets
end

function _targets_filter_Doppelganger(attacker, targets, allies, targetsAreAllies, item, battle)
	if smnsEnabled then
		return targets
	end
	local player = _GroupInfo_getUnitPlayer(attacker.unit)
	if player ~= nil and player.human then
		return targets
	end
	
	local aunit = attacker.unit
	local aimpl = aunit.impl
	local apply = _targets_filter_isDoppelganger(attacker)
	local a
	local atype
	if item then
		a = item.base.attack
		if a ~= nil then
			if a.type == Attack.Doppelganger then
				apply = true
			end
		end
	else
		apply = _targets_filter_isDoppelganger(attacker)
	end
	
	if apply then
		local attackerIsOnFrontline = _common_IsOnFrontline(attacker, allies)
		local meleeAttackers = {}
		local rangeAttackers = {}
		local nonAttackers   = {}
		local result         = {}
		local targetScript
		for i=1, #targets do
			a = targets[i].unit.impl.attack1
			atype = a.type
			if statsCheck_isDirectDmgType(atype)
			or statsCheck_isCurseType(atype)
			or statsCheck_isDoTType(atype) then
				targetScript = _RangeInfo_getTargetScriptName(a.reach)
				if _RangeInfo_isTargetScriptRanged(targetScript) then
					table.insert(rangeAttackers, targets[i])
				else
					table.insert(meleeAttackers, targets[i])
				end
			else
				table.insert(nonAttackers, targets[i])
			end
		end
		if attackerIsOnFrontline then
			if #meleeAttackers > 0 or #rangeAttackers > 0 then
				local t = {meleeAttackers, rangeAttackers}
				local maxhp = 0
				local uimpl
				for k=1, #t do
					for i=1, #t[k] do
						uimpl = t[k][i].unit.baseImpl
						maxhp = math.max(maxhp, uimpl.hp / ( 1 - 0.01 * uimpl.armor ))
					end
				end
				maxhp = maxhp * 0.9
				for k=1, #t do
					for i=1, #t[k] do
						uimpl = t[k][i].unit.baseImpl
						if (uimpl.hp / ( 1 - 0.01 * uimpl.armor )) >= maxhp then
							table.insert(result, t[k][i])
						end
					end
				end
			else
				for i=1, #nonAttackers do
					table.insert(result, nonAttackers[i])
				end
			end
		else
			local stackHasNonAttack = false
			local doppelgangersAmount = 0
			for i=1, #allies do
				if _targets_filter_isDoppelganger(allies[i]) then
					doppelgangersAmount = doppelgangersAmount + 1
				else
					a = allies[i].unit.impl.attack1
					atype = a.type
					if statsCheck_isSummonType(atype)
					or statsCheck_isHealType(atype)
					or statsCheck_isCurseType(atype) then
						stackHasNonAttack = true
					end
				end
			end
			if doppelgangersAmount > 1 then
				stackHasNonAttack = true
			end
			if #rangeAttackers > 0 then
				for i=1, #rangeAttackers do
					table.insert(result, rangeAttackers[i])
				end
			elseif #nonAttackers > 0 then
				stackHasNonAttack = false
			else
				for i=1, #meleeAttackers do
					table.insert(result, meleeAttackers[i])
				end
			end
			if not stackHasNonAttack then
				for i=1, #nonAttackers do
					table.insert(result, nonAttackers[i])
				end
			end
		end
		for i=1, #targets do
			if not targets[i].unit.impl.small then
				table.insert(result, targets[i])
			end
		end
		
		local result_filtered = {}
		for i=1, #result do
			if _common_IsAddedFilter(result_filtered, result[i]) then
				table.insert(result_filtered, result[i])
			end
		end
		return result_filtered
	end
	return targets	
end

function _targets_filter_DoTIsMainAttack_I(methodName, attacker, selected, allies, targets, targetsAreAllies, item, battle)
	if item then
		return targets
	end
	if targetsAreAllies or not statsCheck_isDoTType(attacker.unit.impl.attack1.type) or #targets < 1 then
		return targets
	end
	
	local aunit = attacker.unit
	local slots = _GroupInfo_getUnitGroup(targets[1].unit).slots
	local filteredslots = {}
	for i = 1, #slots do
		if slots[i].unit ~= nil then
			if _common_IsInBattle(slots[i].unit, battle) then
				table.insert(filteredslots, slots[i])
			end
		end
	end
	local trueTargets = _selector_getChoices(methodName, attacker, selected, allies, filteredslots, targetsAreAllies, item, battle)
	-- local result = {}
	-- for i = 1, #targets do
	-- 	if not _common_IsAddedFilter(trueTargets, targets[i]) then
	-- 		table.insert(result, targets[i])
	--	end
	-- end
	-- return result
	return trueTargets
end

function _targets_filter_DoTIsMainAttack_II(methodName, attacker, selected, allies, targets, targetsAreAllies, item, battle)
	if item then
		return targets
	end
	if targetsAreAllies or not statsCheck_isDoTType(attacker.unit.impl.attack1.type) or #targets < 1 then
		return targets
	end
	
	local filtered = {}
	for i = 1, #targets do
		if not battle:getUnitStatus(targets[i].unit.id, BattleStatus.Retreat) then
			table.insert(filtered, targets[i])
		end
	end
	return filtered
end


function _targets_filter_ModifBuffer(attacker, targets, targetsAreAllies, item, battle)
	if not targetsAreAllies then
		return targets
	end
	local aunit = attacker.unit
	if aunit == nil then
		return targets
	end
	local uid = aunit.baseImpl.id
	if uid == G000UU7605 then
		local add
		local u
		local uimpl
		local attack
		local mods
		local result = {}
		for i = 1, #targets do
			u = targets[i].unit
			uimpl = u.impl
			attack = uimpl.attack1.type
			add = statsCheck_isDirectDmgType(attack)
			   or statsCheck_isSelfTransformType(attack)
			if not add then
				attack = uimpl.attack2
				if attack ~= nil then
					attack = attack.type
					add = statsCheck_isDirectDmgType(attack)
					   or statsCheck_isSelfTransformType(attack)
				end
			end
			if add then
				mods = u.modifiers
				for k = 1, #mods do
					if _bloodsorcerer_info_isBuff(mods[k].id.value) then
						add = false
						break
					end
				end
			end
			if add then
				table.insert(result, targets[i])
			end
		end
		return result
	elseif uid == G000UU7592 or uid == G001UU7592 then
		local mods
		local uimpl
		local attack
		local hasUnitWithPowerAppliable = false
		local powerAppliable = {}
		local result = {}
		local addTarget = {}
		for i = 1, #targets do
			addTarget[i] = true
			mods = targets[i].unit.modifiers
			for k = 1, #mods do
				if _torhoth_info_isBuff(mods[k].id.value) then
					addTarget[i] = false
					break
				end
			end
		end
		local player = _GroupInfo_getUnitPlayer(aunit)
		if not ( player ~= nil and player.human ) then
			for i = 1, #targets do
				if addTarget[i] then
					uimpl = targets[i].unit.impl
					powerAppliable[i] = statsCheck_isPowerAppliable(uimpl.attack1.type)
					if not powerAppliable[i] then
						attack = uimpl.attack2
						if attack ~= nil then
							powerAppliable[i] = statsCheck_isPowerAppliable(attack.type)
						end
					end
					if powerAppliable[i] then
						hasUnitWithPowerAppliable = true
					end
				else
					powerAppliable[i] = false
				end
			end
		end
		if hasUnitWithPowerAppliable then
			for i = 1, #targets do
				if powerAppliable[i] then
					table.insert(result, targets[i])
				end
			end
		else
			for i = 1, #targets do
				if addTarget[i] then
					table.insert(result, targets[i])
				end
			end
		end
		return result
	elseif uid == G000UU8220 then
		local result = {}
		for i = 1, #targets do
			if not _GroupInfo_UnitHasModifierValue(targets[i].unit, G024UM0041) then
				table.insert(result, targets[i])
			end
		end
		return result
	elseif uid == G000UU7619 then
		local result = {}
		for i = 1, #targets do
			if not _GroupInfo_UnitHasModifierValue(targets[i].unit, G024UM0252) then
				table.insert(result, targets[i])
			end
		end
		return result
	elseif uid == G000UU0033 or uid == G000UU0034 or uid == G000UU7558 or uid == G000UU7559 then
		local result = {}
		for i = 1, #targets do
			u = targets[i].unit
			uimpl = u.impl
			attack1 = uimpl.attack1.type
			add = statsCheck_isDirectDmgType(attack1) or statsCheck_isSelfTransformType(attack1)
			if add then
				table.insert(result, targets[i])
			end			
		end
		return result
	end
	return targets
end

function _targets_filter_AI_Helper(targetsToSelect, methodName, attacker, allies, allTargets, targetsAreAllies, item, battle, isMarking)

	if smnsEnabled then
		return _smns_AI_Helper(methodName, attacker, selected, allies, targetsToSelect, targetsAreAllies, item, battle, isMarking)
	end

	_common_set_useRandom(false)
	local player = _GroupInfo_getUnitPlayer(attacker.unit)
	if player ~= nil and player.human then
		_common_set_useRandom(true)
		return targetsToSelect
	end
	local usedAttack = _targets_filter_GetAttack1(attacker, item, battle)
	local areaScript = _RangeInfo_getAttackScriptName(usedAttack.reach)
	local selectedTargets
	local effect    = {}
	local effectSum = {}
	local result    = {}
	for i = 1, #allTargets do
		--���_���� ��� �1*(�1+�2*�2)
		--����� ���������� ����/������ � ����
		--���_�������� ��� �����_��/(1-0.01*�����)
		
		-- ���������_����� = ���_���� / ���_��
		-- effect[i] = ���������_����� * ������_������_��������
		-- ���� �������, �� effect[i] = effect[i] * 2
		
		-- ��� ����, ���� ����� �� �������, �� ������ ��� �������
		-- ���� ���� - ������ ���� � ���� �� ������
		if targetsAreAllies then
			--������� ������������� ���� ���������
			effect[i] = 1
		else
			--������� ������������� ����� �����
			effect[i] = 1
		end
	end
	for i = 1, #targetsToSelect do
		selectedTargets = _getTargets(areaScript, attacker, targetsToSelect[i], allies, allTargets, targetsAreAllies, item, battle, false)
		-- ��������� ������ � ������ ������� �� ���-�� ����� � ������
		effectSum[i] = 0
		for j = 1, #selectedTargets do
			for k = 1, #allTargets do
				if selectedTargets[j] == allTargets[k] then
					effectSum[i] = effectSum[i] + effect[k]
					break
				end
			end
		end
	end
	
	local effectThreshold = 0
	for i = 1, #targetsToSelect do
		if effectThreshold < effectSum[i] then
			effectThreshold = effectSum[i]
		end
	end
	effectThreshold = effectThreshold * 0.9
	for i = 1, #targetsToSelect do
		if effectSum[i] >= effectThreshold then
			table.insert(result, targetsToSelect[i])
		end
	end
	_common_set_useRandom(true)
	return result
end

function _targets_filter_BuffsAttraction(methodName, attacker, selected, allies, targets, targetsAreAllies, result, item, battle)
	if not targetsAreAllies or not statsCheck_isHealType(_targets_filter_GetAttack1Type(attacker, item, battle)) then
		return result
	end
	local mods
	for i = 1, #targets do
		if _common_IsAddedFilter(result, targets[i]) then
			mods = _GroupInfo_UnitModifiers(targets[i].unit)
			if _GroupInfo_UnitModifierAmount(mods, G040UM0232) > 0 then
				table.insert(result, targets[i])
			end
		end
	end
	return result
end


function _targets_filter_Cowardice(methodName, attacker, selected, allies, targets, targetsAreAllies, item, battle)
	if targetsAreAllies or #targets < 1 then
		return targets
	end
	local aunit = attacker.unit
	local mods = _GroupInfo_UnitModifiers(aunit)
	if _unitAura_CowardiceBig_val(aunit, mods) > 0 then
		local acolumn = attacker.column
		local slots = _GroupInfo_getUnitGroup(targets[1].unit).slots
		local uid
		for i = 1, #slots do
			if slots[i].column == acolumn then
				local u = slots[i].unit
				if u ~= nil then
					if u.impl.small then
						return targets
					else
						uid = u.id
						if battle:getUnitStatus(uid, BattleStatus.Retreat) == false
						and _common_IsInBattle(u, battle) then
							if _unitAura_CowardiceBig_val(u, _GroupInfo_UnitModifiers(u)) > 0 then
								if aunit.impl.small then
									return {}
								else
									return targets
								end
							else
								return {}
							end
						else
							return targets
						end
					end
				end
			end
		end
	end
	return targets
end

function _targets_filter_Incorporeal(attacker, item, battle, slots)
	local result = {}
	if #slots < 1 or _GroupInfo_UnitHasModifierValue(attacker.unit, incorporeality_mod) then
		return result
	end
	
	if _targets_filter_GetAttack1Type(attacker, item, battle) == Attack.Summon then
		return slots
	else
		for i=1, #slots do
			if slots[i].unit ~= nil then
				if not _GroupInfo_UnitHasModifierValue(slots[i].unit, incorporeality_mod) then
					table.insert(result, slots[i])
				end
			else
				table.insert(result, slots[i])
			end
		end
	end
	return result
end

function _targets_filter_AddTrargetsChance(methodName, attacker, selected, allies, targets, targetsAreAllies, result, item, battle)
	if item or #targets <= #result then
		return result
	end
	local useRnd = _common_get_useRandom()
	local unit = attacker.unit
	local mods = _GroupInfo_UnitModifiers(unit)
	local a
	if _GroupInfo_UnitModifierAmount(mods, G040UM0243) > 0 then
		local maxHP = _unitAura_GetScenario():getUnit(unit.id).hpMax
		local chance = 200 * ( maxHP - unit.hp ) / maxHP
		if (useRnd or chance >= 100) and _mRnd_simpleRndEvent(chance) then
			for i = 1, #targets do
				if _common_IsAddedFilter(result, targets[i]) then
					table.insert(result, targets[i])
				end
			end
		end
	end
	if useRnd then
		a = _GroupInfo_UnitModifierAmount(mods, G040UM0245)
		if a > 0 then
			local hpMax = unit.hpMax
			local chance = 100 * a * ( hpMax - unit.hp ) / hpMax
			result = _common_PickNRandomsWithChance(result, selected, targets, 100, 100, chance)
		end
		a = _GroupInfo_UnitModifierAmount(mods, G040UM0246)
		if a > 0 then
			local hpMax = unit.hpMax
			local chance = 300 * a * ( hpMax - unit.hp ) / hpMax
			result = _common_PickNRandomsWithChance(result, selected, targets, 100, 100, chance)
		end
		a = _GroupInfo_UnitModifierAmount(mods, G040UM0247)
		if a > 0 then
			local overlevels = unit.impl.level - unit.baseImpl.level
			local chance = 100 * a * math.floor(overlevels / 2)
			result = _common_PickNRandomsWithChance(result, selected, targets, 100, 100, chance)
		end
		a = _GroupInfo_UnitModifierAmount(mods, G040UM0339)
		if a > 0 then
			local hpMax = unit.hpMax
			local chance = _Barrantor_Info_RandomTargetBonusMultiplier(unit) * a * ( hpMax - unit.hp ) / hpMax
			result = _common_PickNRandomsWithChance(result, selected, targets, 100, 100, chance)
		end
	end
	return result
end

function _targets_filter_AttackWithStatus(methodName, attacker, selected, allies, targets, result, targetsAreAllies, item, battle)
	local u
	local uid
	local attackerMods = _GroupInfo_UnitModifiers(attacker.unit)

	-- LowerDamage
	if _GroupInfo_UnitModifierAmount(attackerMods, G040UM0285) > 0 then
		for i = 1, #targets do
			u = targets[i].unit
			if _common_IsInBattle(u, battle) and _common_IsAddedFilter(result, targets[i]) then
				uid = u.id
				if battle:getUnitStatus(uid, BattleStatus.LowerDamageLvl1)
				or battle:getUnitStatus(uid, BattleStatus.LowerDamageLvl2)
				or battle:getUnitStatus(uid, BattleStatus.LowerDamageLong) then
					table.insert(result, targets[i])
				end
			end
		end
	end

	-- Blister
	if _GroupInfo_UnitModifierAmount(attackerMods, G040UM0283) > 0 then
		for i = 1, #targets do
			u = targets[i].unit
			if _common_IsInBattle(u, battle) and _common_IsAddedFilter(result, targets[i]) then
				uid = u.id
  				if battle:getUnitStatus(uid, BattleStatus.Blister)
				or battle:getUnitStatus(uid, BattleStatus.BlisterLong) then
					table.insert(result, targets[i])
				end
			end
		end
	end
	
	-- Blister for melee and scout leaders
	if _GroupInfo_UnitModifierAmount(attackerMods, g070um0312) > 0 and (attacker.unit.impl.attack1.reach == 103 or attacker.unit.impl.attack1.reach == 27 or attacker.unit.impl.attack1.reach == 102) then
		for i = 1, #targets do
			u = targets[i].unit
			if _common_IsInBattle(u, battle) and _common_IsAddedFilter(result, targets[i]) then
				uid = u.id
  				if battle:getUnitStatus(uid, BattleStatus.Blister)
				or battle:getUnitStatus(uid, BattleStatus.BlisterLong) 
			--	and attacker.impl.attack1.reach == 103 or attacker.impl.attack1.reach == 27 or attacker.impl.attack1.reach == 102 
			then
					table.insert(result, targets[i])
				end
			end
		end
	end

	-- Frostbite
	if _GroupInfo_UnitModifierAmount(attackerMods, G040UM0284) > 0 then
		for i = 1, #targets do
			u = targets[i].unit
			if _common_IsInBattle(u, battle) and _common_IsAddedFilter(result, targets[i]) then
				uid = u.id
				if battle:getUnitStatus(uid, BattleStatus.Frostbite)
				or battle:getUnitStatus(uid, BattleStatus.FrostbiteLong) then
					table.insert(result, targets[i])
				end
			end
		end
	end

	-- Poison
	if _GroupInfo_UnitModifierAmount(attackerMods, G040UM0302) > 0 then
		for i = 1, #targets do
			u = targets[i].unit
			if _common_IsInBattle(u, battle) and _common_IsAddedFilter(result, targets[i]) then
				uid = u.id
				if battle:getUnitStatus(uid, BattleStatus.Poison)
				or battle:getUnitStatus(uid, BattleStatus.PoisonLong) then
					table.insert(result, targets[i])
				end
			end
		end
	end

	-- LowerInitiative
	if _GroupInfo_UnitModifierAmount(attackerMods, G040UM0303) > 0 then
		for i = 1, #targets do
			u = targets[i].unit
			if _common_IsInBattle(u, battle) and _common_IsAddedFilter(result, targets[i]) then
				uid = u.id
				if battle:getUnitStatus(uid, BattleStatus.LowerInitiative)
				or battle:getUnitStatus(uid, BattleStatus.LowerInitiativeLong) then
					table.insert(result, targets[i])
				end
			end
		end
	end
	
	return result
end

function _targets_filter_SlotsListForSummoning(attacker, targets, item, battle)
	if _targets_filter_GetAttack1Type(attacker, item, battle) ~= Attack.Summon then
		return targets
	end
	local slots = _GroupInfo_getUnitGroup(attacker.unit).slots
	local result = {}
	local u
	local uid
	local add
	for i = 1, #slots do
		u = slots[i].unit
		add = false
		if u ~= nil then
			if u.hp == 0 then
				add = true
			else
				uid = u.id
				if  battle:getUnitStatus(uid, BattleStatus.Retreated)
				or  battle:getUnitStatus(uid, BattleStatus.Hidden) then
					add = true
				end
			end
		else
			add = true
		end
		if add then
			table.insert(result, slots[i])
		end
	end
	return result
end

function _targets_filter_GetAttack1(attacker, item, battle)
	if item then
		return item.base.attack
	else
		return attacker.unit.impl.attack1
	end
end
function _targets_filter_GetAttack2(attacker, item, battle)
	if item then
		return nil
	else
		return attacker.unit.impl.attack2
	end
end
function _targets_filter_GetAttack1Type(attacker, item, battle)
	if item then
		return item.base.attack.type
	else
		return attacker.unit.impl.attack1.type
	end
end
function _targets_filter_GetAttack2Type(attacker, item, battle)
	if item then
		return nil
	else
		local a = attacker.unit.impl.attack2
		if a ~= nil then
			return a.type
		end
	end
end

function _targets_filter_isDoppelganger(attacker)
	local aimpl = attacker.unit.impl
	local a = aimpl.attack1
	if a ~= nil then
		if a.type == Attack.Doppelganger then
			return true
		end
	end
	a = aimpl.attack2
	if a ~= nil then
		if a.type == Attack.Doppelganger then
			return true
		end
	end
	a = aimpl.altAttack
	if a ~= nil then
		if a.type == Attack.Doppelganger then
			return true
		end
	end
	return false
end

targets_filter.name = 'targets_filter'
return targets_filter
