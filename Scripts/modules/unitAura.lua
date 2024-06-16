package.path = ".\\Scripts\\?.lua;.\\Scripts\\exp\\?.lua;.\\Scripts\\modifiers\\?.lua;.\\Scripts\\modifiers\\drawing\\?.lua;.\\Scripts\\modifiers\\items\\?.lua;.\\Scripts\\modifiers\\leaderMods\\?.lua;.\\Scripts\\modifiers\\perks\\?.lua;.\\Scripts\\modifiers\\smns\\?.lua;.\\Scripts\\modifiers\\smns\\items\\?.lua;.\\Scripts\\modifiers\\smns\\perks\\?.lua;.\\Scripts\\modifiers\\smns\\spells\\?.lua;.\\Scripts\\modifiers\\smns\\units\\?.lua;.\\Scripts\\modifiers\\spells\\?.lua;.\\Scripts\\modifiers\\units\\?.lua;.\\Scripts\\modifiers\\units\\bloodsorcerer\\?.lua;.\\Scripts\\modifiers\\units\\multiplicative_stats\\?.lua;.\\Scripts\\modifiers\\units\\torhoth\\?.lua;.\\Scripts\\modules\\?.lua;.\\Scripts\\modules\\smns\\?.lua;.\\Scripts\\workshop\\?.lua;.\\Scripts\\workshop\\classes\\?.lua"
unitAura={}
require('GroupInfo')
require('statscheck')
require('named_mods')
require('unitAura_mods')
require('mapMultipliers')
require('smnsInfo')
require('valueCap')
require('smallEnthInfo')
require('bloodsorcererInfo')
require('attackTypeConversion')
require('unitsLeveledAttacks')
require('statsMultiplier')
require('workshop_commonlib')
if workshopEnabled then
	require('workshop_get_bonus')
	require('workshop_special_mechanics')
end
if smnsEnabled then
	require('smnsAura')
	require('smnsAddAuraMods')
end
setValue = setValue or require('setValue')

uaMaxAdditionalCrit = _valueCap_GetMaxAdditionalCrit()
uaExternalExpKilled_Increased = {}
uaExternalExpKilled_More      = {}

uaVulnerabilityModifiers = {}
for sourceClass = 0, 7 do
	uaVulnerabilityModifiers[sourceClass] = Id.new("g040um0"..tostring(197 + sourceClass)).value
end

aG000000000 = Id.new("g000000000")
aG020AA0011 = Id.new("g020aa0011")
aG020AA0013 = Id.new("g020aa0013")
aG020AA0015 = Id.new("g020aa0015")
aG020AA0016 = Id.new("g020aa0016")
aG020AA0017 = Id.new("g020aa0017")
aG020AA0018 = Id.new("g020aa0018")
aG020AA0019 = Id.new("g020aa0019")
aG014AA0001 = Id.new("g014aa0001")
aG014AA0002 = Id.new("g014aa0002")
aG014AA0003 = Id.new("g014aa0003")
aG014AA0004 = Id.new("g014aa0004")
aG014AA0005 = Id.new("g014aa0005")
aG014AA0006 = Id.new("g014aa0006")
aG014AA0007 = Id.new("g014aa0007")
aG014AA0008 = Id.new("g014aa0008")
aG014AA0009 = Id.new("g014aa0009")
aG014AA0010 = Id.new("g014aa0010")
aG014AA0011 = Id.new("g014aa0011")
aG014AA0012 = Id.new("g014aa0012")

aRangedDoppelganger = Id.new("g000aa2079")
aMeleeDoppelganger = Id.new("g003aa0171")

function _unitAura_HitPoint(unit, prev)
	svSetHitPointFloatPart(unit, 0)
	_get_Group_and_Mods(unit)
	local mods = _GroupInfo_UnitModifiers(unit)
	local ugroup = _GroupInfo_getCurrentGroup()
	local id = unit.id.value
	if uaNewHitPoint[id] == nil then
		uaBaseHitPoint[id] = prev
	else
		uaBaseHitPoint[id] = uaNewHitPoint[id]
	end

	local baseAdditive = _unitAura_HitPoint_valFlat(unit)
			     + 10 * ( _GroupInfo_UnitModifierAmount(mods, G201UM9302) - _GroupInfo_UnitModifierAmount(mods, G201UM9304) )
			     + 1  * ( _GroupInfo_UnitModifierAmount(mods, G201UM9303) - _GroupInfo_UnitModifierAmount(mods, G201UM9305) )
	
	local baseMultiplicative = 0.1 * ( _GroupInfo_UnitModifierAmount(mods, G201UM9334) - _GroupInfo_UnitModifierAmount(mods, G201UM9335) )

	local workshopPercent = 1.0
	if workshopEnabled then
		workshopPercent = workshopPercent + 0.01 * Workshop_getBonus_baseHitPoint_Percent(scenario, unit, true)
	end
	
	uaBaseHitPoint[id] = _valueCap_GetInt(( uaBaseHitPoint[id] + baseAdditive ) * ( 1 + baseMultiplicative ) * workshopPercent)
	
	uaBaseHitPoint[id] = _valueCap_CheckMaxHitPoint(unit, uaBaseHitPoint[id])
	
	------------------

	local multiplicative = _unitAura_HitPoint_valPercent(unit)
	                     + _unitAura_HitPointOnDeath_valPercent(unit)

	local additive       = 0

	local SpiritCageAmount = _unitAura_EffectSumStack({G040UM0272}, 1)
	if SpiritCageAmount > 0 then
		additive = additive + SpiritCageAmount * _unitAura_SpiritCage_Effect(unit, ugroup, 1)
	end
	
	if smnsEnabled then
		multiplicative = multiplicative + _smns_multiplicativeHitPointBonus(unit, uaBaseHitPoint[id])
		additive = additive + _smns_flatHitPointBonus(unit, uaBaseHitPoint[id])
	end
	
	return svFlatEffectHitPoint(unit, uaBaseHitPoint[id] * ( 1 + 0.01 * multiplicative ), additive)
end

function _unitAura_Regen(unit, prev)
	_get_Group_and_Mods(unit)
	local mods = _GroupInfo_UnitModifiers(unit)
	local ugroup = _GroupInfo_getCurrentGroup()
	local id = unit.id.value
	if uaNewRegen[id] == nil then
		uaBaseRegen[id] = prev
	else
		uaBaseRegen[id] = uaNewRegen[id]
	end
	
	local baseAdditive =   10 * ( _GroupInfo_UnitModifierAmount(mods, G201UM9330) - _GroupInfo_UnitModifierAmount(mods, G201UM9332) )
			     + 1  * ( _GroupInfo_UnitModifierAmount(mods, G201UM9331) - _GroupInfo_UnitModifierAmount(mods, G201UM9333) )
	
	local baseMultiplicative = 0.1 * ( _GroupInfo_UnitModifierAmount(mods, G201UM9350) - _GroupInfo_UnitModifierAmount(mods, G201UM9351) )

	if workshopEnabled then
		baseAdditive = baseAdditive + Workshop_getBonus_baseRegen_Flat(scenario, unit, true)
	end
	
	uaBaseRegen[id] = _valueCap_GetInt(( uaBaseRegen[id] + baseAdditive ) * ( 1 + baseMultiplicative ))
	
	------------------
	
	local additive = _unitAura_Regen_valFlat(unit)
		       + _mapMultipliers_Regen_Flat(unit)
	
	-- ������
	if unitGroup ~= nil then
		if _GroupInfo_stackHasModifierAmount(aura_regen_5_1plevel_mod) > 0 then
			local u
			local mAmount
			local unitGroupSlots = unitGroup.slots
			for i = 1, #unitGroupSlots do
				u = unitGroupSlots[i].unit
				if u ~= nil and u.hp > 0 then
					mAmount = _GroupInfo_UnitModifierAmount(_GroupInfo_UnitModifiers(u), aura_regen_5_1plevel_mod)
					if mAmount > 0 then
						additive = additive + mAmount * math.min( 5 + u.impl.level - u.baseImpl.level, 15 )
					end
				end
			end
		end
	end
	
	local SpiritCageAmount = _unitAura_EffectSumStack({G040UM0272}, 1)
	if SpiritCageAmount > 0 then
		additive = additive + SpiritCageAmount * _unitAura_SpiritCage_Effect(unit, ugroup, 2)
	end
	
	if smnsEnabled then
		additive = additive + _smns_flatRegenBonus(unit, prev)
	end
	
	return uaBaseRegen[id] + additive
end

function _unitAura_Armor(unit, prev)
	svSetArmorFloatPart(unit, 0)
	_get_Group_and_Mods(unit)
	local mods = _GroupInfo_UnitModifiers(unit)
	local id = unit.id.value
	
	local additiveMaxArmor = -25 * _GroupInfo_UnitModifierAmount(mods, executionersax_mod)
	
	_valueCap_SetArmorMax(unit, additiveMaxArmor)
	
	if uaNewArmor[id] == nil then
		uaBaseArmor[id] = prev
	else
		uaBaseArmor[id] = uaNewArmor[id]
	end
	
	local baseAdditive =   10 * ( _GroupInfo_UnitModifierAmount(mods, G201UM9306) - _GroupInfo_UnitModifierAmount(mods, G201UM9308) )
			     + 1  * ( _GroupInfo_UnitModifierAmount(mods, G201UM9307) - _GroupInfo_UnitModifierAmount(mods, G201UM9309) )
	
	local baseMultiplicative = 0.1 * ( _GroupInfo_UnitModifierAmount(mods, G201UM9336) - _GroupInfo_UnitModifierAmount(mods, G201UM9337) )

	if workshopEnabled then
		baseAdditive = baseAdditive + Workshop_getBonus_baseArmor_Flat(scenario, unit, true)
	end
	
	uaBaseArmor[id] = _valueCap_GetInt(( uaBaseArmor[id] + baseAdditive ) * ( 1 + baseMultiplicative ))
	
	uaBaseArmor[id] = _valueCap_CheckMaxArmor(unit, uaBaseArmor[id])
	
	------------------
	
	local additive = _mapMultipliers_Armor_Flat(unit) + _statsMultiplier_Armor(unit, mods, _unitAura_SpellDebuffResistance_total(unit, mods))
	
	local c = _GroupInfo_getCoveringUnit(unit, true)
	local mods
	if c ~= nil then
		mods = _GroupInfo_UnitModifiers(c)
		additive = additive + _unitAura_ArmorFlat_txtCovered(c, mods)
	end
	if _unitAura_ArmorFlat_valNearest(unit) ~= 0 then
		local nearestUnits = _GroupInfo_getLeftAndRightNearestUnits(unit, true)
		for i = 1, #nearestUnits do
			mods = _GroupInfo_UnitModifiers(nearestUnits[i])
			additive = additive + _unitAura_ArmorFlat_txtNearest(nearestUnits[i], mods)
		end
	end
	
	mods = _GroupInfo_UnitModifiers(unit)
	
	additive = additive + _unitAura_Armor_valFlat(unit) 
			    + _unitAura_MostLostHPBuff_ArmorFlat(unit)
			    + _unitAura_LostHPEffect(unit, _unitAura_PerLostHP_Armor_val(unit, mods))
	
	local onFullHPEffect = _unitAura_ArmorOnFullLife_val(unit, mods)
	if onFullHPEffect ~= 0 and scenario:getUnit(unit.id).hpMax == unit.hp then
		additive = additive + onFullHPEffect
	end

	if smnsEnabled then
		additive = additive + _smns_flatArmorBonus(unit, prev)
	end	        
		      
	return svFlatEffectArmor(unit, uaBaseArmor[id], additive)
end

function _unitAura_ImmuneToAttack(unit, attack, prev)
	local result = prev
	local gotGroup = false
	
	if workshopEnabled then
		gotGroup = true
		_get_Group_and_Mods(unit)
		local workshopBonus_Once = Workshop_getBonus_ImmuneToAttack_Once(scenario, unit, attack, gotGroup)
		local workshopBonus_Always = Workshop_getBonus_ImmuneToAttack_Always(scenario, unit, attack, gotGroup)
		result = Workshop_changeImmuneClass(result, workshopBonus_Once, workshopBonus_Always)
	end

	-- if (attack == Attack.Poison and _Wyrm_Deboost_Effect(unit) == 1)
	-- or (attack == Attack.Blister and _Flamethrower_Deboost_Effect(unit) == 1)
	-- or (attack == Attack.Frostbite and _Kriomant_Deboost_Effect(unit) == 1)
	-- or (scenario.day >= 10 and attack == Attack.Shatter and _Guard_Resistance_Deboost_Effect(unit) == 1)
	-- then
	-- 	svSetAttackClassVulnerabilty(unit, attack, true)
	-- else
	-- 	svSetAttackClassVulnerabilty(unit, attack, false)
	-- end
	if _Wyrm_Deboost_Effect(unit) == 1 then
		svSetAttackClassVulnerabilty(unit, Attack.Poison, true)
	end
	if _Flamethrower_Deboost_Effect(unit) == 1 then
		svSetAttackClassVulnerabilty(unit, Attack.Blister, true)
	end
	if _Kriomant_Deboost_Effect(unit) == 1 then
		svSetAttackClassVulnerabilty(unit, Attack.Frostbite, true)
	end
	if scenario.day >= 10 and _Guard_Resistance_Deboost_Effect(unit) == 1 then
		svSetAttackClassVulnerabilty(unit, Attack.Shatter, true)
	end
	
	if result == Immune.NotImmune then
		if attack == Attack.Frostbite then
			if not gotGroup then
				gotGroup = true
				_get_Group_and_Mods(unit)
			end
			if _unitAura_FrostbiteResist_stk(unit) > 0 then
				result = Immune.Once
			end
			if result == Immune.NotImmune then
				local rEffect = _unitAura_EffectSumStack({G040UM0069}, 1)
				if rEffect > 0 then
					local leader = _GroupInfo_getCurrentGroupLeader()
					if leader == nil or not _GroupInfo_UnitIsRangedWithoutBow(leader) then
						rEffect = 0
					end
					if rEffect > 0 then
						result = Immune.Once
					end
				end
			end
		elseif attack == Attack.Blister then
			if not gotGroup then
				gotGroup = true
				_get_Group_and_Mods(unit)
			end
			if _unitAura_BlisterResist_stk(unit) > 0 then
				result = Immune.Once
			end
		elseif attack == Attack.Poison then
			if not gotGroup then
				gotGroup = true
				_get_Group_and_Mods(unit)
			end
			if _unitAura_PoisonResist_stk(unit) > 0 then
				result = Immune.Once
			end
		elseif attack == Attack.LowerInitiative then
			if not gotGroup then
				gotGroup = true
				_get_Group_and_Mods(unit)
			end
			if _unitAura_LowerInitiativeResist_stk(unit) > 0 then
				result = Immune.Once
			end
		elseif attack == Attack.LowerDamage then
			if not gotGroup then
				gotGroup = true
				_get_Group_and_Mods(unit)
			end
			if _unitAura_LowerDamageResist_stk(unit) > 0 then
				result = Immune.Once
			end
		elseif attack == Attack.Fear then
			if not gotGroup then
				gotGroup = true
				_get_Group_and_Mods(unit)
			end
			if _unitAura_FearResist_stk(unit) > 0 then
				result = Immune.Once
			end
		elseif attack == Attack.Petrify then
			if not gotGroup then
				gotGroup = true
				_get_Group_and_Mods(unit)
			end
			if _unitAura_PetrifyResist_stk(unit) > 0 then
				result = Immune.Once
			end
		end
		if result == Immune.NotImmune then
			if statsCheck_isCurseType(attack) then
				local c = _GroupInfo_getCoveringUnit(unit, gotGroup)
				if c ~= nil then
					local mods = _GroupInfo_UnitModifiers(c)
					if _unitAura_CurseProtection_txtCovered(c, mods) > 0 then
						result = Immune.Once
					end
				end
			end
		end
	end
	
	if smnsEnabled then
		if not gotGroup then
			gotGroup = true
			_get_Group_and_Mods(unit)
		end
		result = _smns_ImmuneToAttack(unit, attack, prev, result)
	end
	
	return svAttackImmunityClass(unit, attack, Immune.NotImmune, result)
end

function _unitAura_ImmuneToSource(unit, source, prev)
	_get_Group_and_Mods(unit)
	local mods = _GroupInfo_UnitModifiers(unit)
	
	if workshopEnabled then
		local workshopBonus_Once = Workshop_getBonus_ImmuneToSource_Once(scenario, unit, source, true)
		local workshopBonus_Always = Workshop_getBonus_ImmuneToSource_Always(scenario, unit, source, true)
		prev = Workshop_changeImmuneClass(prev, workshopBonus_Once, workshopBonus_Always)
	end
	
	if uaVulnerabilityModifiers[source] ~= nil 
	and _GroupInfo_UnitModifierAmount(mods, uaVulnerabilityModifiers[source]) > 0 
	and _unitAura_SpellDebuffResistance_total(unit, mods) < 100 then
		svSetAttackSourceVulnerability(unit, source, true)
	-- elseif (source == Source.Death and _Wyrm_Deboost_Effect(unit) == 1)
	-- or (source == Source.Water and _Kriomant_Deboost_Effect(unit) == 1) 
	-- then
	-- 	svSetAttackSourceVulnerability(unit, source, true)
	else
		svSetAttackSourceVulnerability(unit, source, false)
	end

	if _Wyrm_Deboost_Effect(unit) == 1 then
		svSetAttackSourceVulnerability(unit, Source.Death, true)
	end
	if _Kriomant_Deboost_Effect(unit) == 1 then
		svSetAttackSourceVulnerability(unit, Source.Water, true)
	end

	local alwaysWard = nil
	local onceWard   = nil
	if source == Source.Weapon then
		alwaysWard = G040UM0131
		onceWard   = G040UM0123
	elseif source == Source.Mind then
		alwaysWard = G040UM0132
		onceWard   = G040UM0124
	elseif source == Source.Life then
		alwaysWard = G040UM0133
		onceWard   = G040UM0125
	elseif source == Source.Death then
		alwaysWard = G040UM0134
		onceWard   = G040UM0126
	elseif source == Source.Fire then
		alwaysWard = G040UM0135
		onceWard   = G040UM0127
	elseif source == Source.Water then
		alwaysWard = G040UM0136
		onceWard   = G040UM0128
	elseif source == Source.Earth then
		alwaysWard = G040UM0137
		onceWard   = G040UM0129
	elseif source == Source.Air then
		alwaysWard = G040UM0138
		onceWard   = G040UM0130
	end
	local result = _GroupInfo_checkWard(unit, prev, alwaysWard, onceWard, false)
	
	if result == Immune.NotImmune then
		if source == Source.Water then
			if _GroupInfo_stackHasModifierAmount(luteofcharming_mod) > 0 
			and _GroupInfo_stackHasModifierAmount(oceanheart_mod) > 0 then
				result = Immune.Once
			end
		end
	end
	
	if smnsEnabled then
		result = _smns_ImmuneToSource(unit, source, prev, result)
	end
	
	return svSourceImmunityClass(unit, source, Immune.NotImmune, result)
end
function _unitAura_hasOnceImmuneToSource(unit, source)
	local mods = _GroupInfo_UnitModifiers(unit)
	local onceWard   = nil
	if source == Source.Weapon then
		onceWard   = G040UM0123
	elseif source == Source.Mind then
		onceWard   = G040UM0124
	elseif source == Source.Life then
		onceWard   = G040UM0125
	elseif source == Source.Death then
		onceWard   = G040UM0126
	elseif source == Source.Fire then
		onceWard   = G040UM0127
	elseif source == Source.Water then
		onceWard   = G040UM0128
	elseif source == Source.Earth then
		onceWard   = G040UM0129
	elseif source == Source.Air then
		onceWard   = G040UM0130
	end
	if _GroupInfo_UnitModifierAmount(mods, onceWard) > 0 then
		return true
	else
		return false
	end
end
function _unitAura_hasAlwaysImmuneToSource(unit, source)
	local mods = _GroupInfo_UnitModifiers(unit)
	local alwaysWard = nil
	if source == Source.Weapon then
		alwaysWard = G040UM0131
	elseif source == Source.Mind then
		alwaysWard = G040UM0132
	elseif source == Source.Life then
		alwaysWard = G040UM0133
	elseif source == Source.Death then
		alwaysWard = G040UM0134
	elseif source == Source.Fire then
		alwaysWard = G040UM0135
	elseif source == Source.Water then
		alwaysWard = G040UM0136
	elseif source == Source.Earth then
		alwaysWard = G040UM0137
	elseif source == Source.Air then
		alwaysWard = G040UM0138
	end
	if _GroupInfo_UnitModifierAmount(mods, alwaysWard) > 0 then
		return true
	else
		return false
	end
end

function _unitAura_AttackInitiative(unit, prev)
	local id = unit.id.value
	_get_Group_and_Mods(unit)
	local mods = _GroupInfo_UnitModifiers(unit)
	local addedValuesMultiplier = _statsMultiplier_Initiative(unit, mods, _unitAura_SpellDebuffResistance_total(unit, mods))
	svInitiativeInit(unit, 0, addedValuesMultiplier)

	uaBaseInitiative[id] = _unitAura_BaseInitiative(id, mods, unit)
	
	uaBaseInitiative[id] = _unitAura_ChainsOfSacrifice_Effect(unit, mods, uaBaseInitiative[id], true)
	
	uaBaseInitiative[id] = uaBaseInitiative[id] * _mapMultipliers_Initiative_Multi(unit)
	uaBaseInitiative[id] = _valueCap_CheckMaxInitiative(unit, uaBaseInitiative[id])

	------------------
	
	local multiplicative = _unitAura_AttackInitiative_valPercent(unit)
		             + _unitAura_LostHPEffect(unit, _unitAura_PerLostHP_AttackInitiative_val(unit, mods))
	
	local onFullHPEffect = _unitAura_AttackDamageInitiativeOnFullLife_val(unit, mods)
	if onFullHPEffect ~= 0 and scenario:getUnit(unit.id).hpMax == unit.hp then
		multiplicative = multiplicative + onFullHPEffect
	end
	
	local additive = 0
	if smnsEnabled then
		additive = additive + _smns_flatInitiativeBonus(unit, uaBaseInitiative[id])
		multiplicative = multiplicative + _smns_percentInitiativeBonus(unit, uaBaseInitiative[id])
	end
	
	return svFlatEffectInitiative(unit, 
				      uaBaseInitiative[id] * ( 1 + 0.01 * multiplicative ) * addedValuesMultiplier, 
				      additive)
end
function _unitAura_BaseInitiative(unitId, unitMods, unit)
	local result
	if uaNewInitiative[unitId] == nil then
		result = unit.leveledImpl.attack1.initiative
	else
		result = uaNewInitiative[unitId]
	end

	local baseAdditive =   10 * ( _GroupInfo_UnitModifierAmount(unitMods, G201UM9326) - _GroupInfo_UnitModifierAmount(unitMods, G201UM9328) )
			     + 1  * ( _GroupInfo_UnitModifierAmount(unitMods, G201UM9327) - _GroupInfo_UnitModifierAmount(unitMods, G201UM9329) )
	
	local baseMultiplicative = 0.1 * ( _GroupInfo_UnitModifierAmount(unitMods, G201UM9348) - _GroupInfo_UnitModifierAmount(unitMods, G201UM9349) )

	local workshopPercent = 1.0
	if workshopEnabled then
		workshopPercent = workshopPercent + 0.01 * Workshop_getBonus_baseAttackInitiative_Percent(scenario, unit, true)
	end
	
	return _valueCap_GetInt(( result + baseAdditive ) * ( 1 + baseMultiplicative ) * workshopPercent )
end

function _unitAura_AttackPower1(unit, prev)
	local id = unit.id.value
	_get_Group_and_Mods(unit)
	local mods = _GroupInfo_UnitModifiers(unit)
	local addedValuesMultiplier = _statsMultiplier_Power1(unit, mods, _unitAura_SpellDebuffResistance_total(unit, mods))
	svSetAttack1PowerInit(unit, 0, addedValuesMultiplier)
	
	_valueCap_Set_Attack1Accuracy_Cap(unit, uaBasePower1[id])
	
	local result = _unitAura_PowerModsEffect(unit, uaBasePower1[id], 1)
	if not svGetApplyDamageSpreadChanceShift1(unit) then
		return svFlatEffectPower1(unit, 
					  result * addedValuesMultiplier, 
					  0)
	else
		return svMultimplicativeEffectPower1(unit, 
						     uaBasePower1[id], 
						     result * addedValuesMultiplier / uaBasePower1[id])
	end
end
function _unitAura_AttackPower2(unit, prev)
	local id = unit.id.value
	_get_Group_and_Mods(unit)
	local mods = _GroupInfo_UnitModifiers(unit)
	local addedValuesMultiplier = _statsMultiplier_Power2(unit, mods, _unitAura_SpellDebuffResistance_total(unit, mods))
	svSetAttack2PowerInit(unit, 0, addedValuesMultiplier)
	
	_valueCap_Set_Attack2Accuracy_Cap(unit, uaBasePower2[id])
	
	if not smnsInfoApplyAccuracyBuffToAttack2 then
		return uaBasePower2[id]
	end
	
	local result = _unitAura_PowerModsEffect(unit, uaBasePower2[id], 2)
	if not svGetApplyDamageSpreadChanceShift2(unit) then
		return svFlatEffectPower2(unit, 
					  result * addedValuesMultiplier, 
					  0)
	else
		return svMultimplicativeEffectPower2(unit, 
						     uaBasePower2[id], 
						     result * addedValuesMultiplier / uaBasePower2[id])
	end
end

function _unitAura_AttackDamage1(unit, prev)
	local id = unit.id.value
	_get_Group_and_Mods(unit)
	local mods = _GroupInfo_UnitModifiers(unit)
	local addedValuesMultiplier = _statsMultiplier_Damage1(unit, mods, _unitAura_SpellDebuffResistance_total(unit, mods))
	svSetAttack1DamageInit(unit, 0, addedValuesMultiplier)
	
	_valueCap_Set_Attack1Damage_Cap(unit, uaBaseDamage1[id])
	
	if uaAttackType1[id] ~= Attack.Shatter then
		local result = _unitAura_DamageModsEffect(unit, uaBaseDamage1[id], 1, false)
		return svFlatEffectDamage1(unit, result * addedValuesMultiplier, 0)
	else
		return svFlatEffectShatter1(unit, uaBaseDamage1[id], 0)
	end
end
function _unitAura_AttackDamage2(unit, prev)
	local id = unit.id.value
	_get_Group_and_Mods(unit)
	local mods = _GroupInfo_UnitModifiers(unit)
	local addedValuesMultiplier = _statsMultiplier_Damage2(unit, mods, _unitAura_SpellDebuffResistance_total(unit, mods))
	svSetAttack2DamageInit(unit, 0, addedValuesMultiplier)
	
	_valueCap_Set_Attack2Damage_Cap(unit, uaBaseDamage2[id])
	
	if uaAttackType2[id] ~= Attack.Shatter then
		local result = _unitAura_DamageModsEffect(unit, uaBaseDamage2[id], 2, false)
		return svFlatEffectDamage2(unit, result * addedValuesMultiplier, 0)
	else
		return svFlatEffectShatter2(unit, uaBaseDamage2[id], uaAddToShatterBaseDamage2[id])
	end
end

function _unitAura_AttackHeal1(unit, prev)
	local id = unit.id.value
	_get_Group_and_Mods(unit)
	local mods = _GroupInfo_UnitModifiers(unit)
	local addedValuesMultiplier = _statsMultiplier_Heal1(unit, mods, _unitAura_SpellDebuffResistance_total(unit, mods))
	svSetAttack1HealInit(unit, 0, addedValuesMultiplier)
	
	_valueCap_Set_Attack1Heal_Cap(unit, uaBaseHeal1[id])
	
	if smnsInfoApplyDmgBuffToHeal then
		local result = _unitAura_HealModsEffect(unit, uaBaseHeal1[id], 1, false)
		return svFlatEffectHeal1(unit, result * addedValuesMultiplier, 0)
	else
		return uaBaseHeal1[id]
	end
end
function _unitAura_AttackHeal2(unit, prev)
	local id = unit.id.value
	_get_Group_and_Mods(unit)
	local mods = _GroupInfo_UnitModifiers(unit)
	local addedValuesMultiplier = _statsMultiplier_Heal2(unit, mods, _unitAura_SpellDebuffResistance_total(unit, mods))
	svSetAttack2HealInit(unit, 0, addedValuesMultiplier)
	
	_valueCap_Set_Attack2Heal_Cap(unit, uaBaseHeal2[id])
	
	if smnsInfoApplyDmgBuffToHeal then
		local result = _unitAura_HealModsEffect(unit, uaBaseHeal2[id], 2, false)
		return svFlatEffectHeal2(unit, result * addedValuesMultiplier, 0)
	else
		return uaBaseHeal2[id]
	end
end

function _unitAura_DamageModsEffect(unit, prev, attackN, callGetGroupAndMods)
	if prev == 0 then
		return prev
	end
	if callGetGroupAndMods then
		_get_Group_and_Mods(unit)
	end
	
	local mods = _GroupInfo_UnitModifiers(unit)

	local multiplicative = _unitAura_AttackDamageHeal_valPercent(unit)
                             + _unitAura_LostHPEffect(unit, _unitAura_PerLostHP_AttackDamageHeal_val(unit, mods))
                             + _unitAura_RingOfHeavenWill_Effect(unit, mods, true)
        local additive = 0

	if smnsEnabled then
		multiplicative = multiplicative + _smns_multiplicativeDamageHealBonus(unit, prev, attackN, mods)
		additive = additive + _smns_flatDamageHealBonus(unit, prev, attackN, mods)
	end

	local onFullHPEffect = _unitAura_AttackDamageInitiativeOnFullLife_val(unit, mods)
	if onFullHPEffect ~= 0 and scenario:getUnit(unit.id).hpMax == unit.hp then
		multiplicative = multiplicative + onFullHPEffect
	end
	
	onFullHPEffect = _unitAura_AttackLessDamageOnFullLife_val(unit, mods)
	if onFullHPEffect ~= 0 and scenario:getUnit(unit.id).hpMax == unit.hp then
		multiplicative = multiplicative - onFullHPEffect
	end
	
	if multiplicative ~= 0 or additive ~ 0 then
		local multiplier = 1 + 0.01 * multiplicative
		local attk = nil
		if attackN == 1 then
			attk = unit.impl.attack1
		elseif attackN == 2 then
			attk = unit.impl.attack2
		end
		if attk == nil or attk.type ~= Attack.Shatter then
			return prev * multiplier + additive
		else
			return prev
		end
	else
		return prev
	end
end

function _unitAura_HealModsEffect(unit, prev, attackN, callGetGroupAndMods)
	return _unitAura_DamageModsEffect(unit, prev, attackN, callGetGroupAndMods)
end

function _unitAura_PowerModsEffect(unit, prev, attackN)
	local mods = _GroupInfo_UnitModifiers(unit)

	local onFullHPEffect = _unitAura_AttackLessPowerOnFullLife_val(unit, mods)
	local lessPower
	if onFullHPEffect ~= 0 and scenario:getUnit(unit.id).hpMax == unit.hp then
		lessPower = onFullHPEffect
	else
		lessPower = 0
	end

	local additive = 0
	local multiplicative = _unitAura_AttackPower_valPercent(unit) 
	                     + _unitAura_MostLostHPBuff_PowerPercent(unit)
                             + _unitAura_LostHPEffect(unit, _unitAura_PerLostHP_AttackPower_val(unit, mods))
                             - lessPower
        
	local cursedAshesAmount = _GroupInfo_stackHasModifierAmount(cursedash_mod)
	if cursedAshesAmount > 0 then
		if _GroupInfo_stackHasModifierAmount(divinationbox_mod) > 0
		or _GroupInfo_stackHasModifierAmount(abyssfangs_mod) > 0 then
			if attackN == 1 then
				if statsCheck_isCurseType(unit.impl.attack1.type) then
					multiplicative = multiplicative + 10 * cursedAshesAmount
				end
			else
				if statsCheck_isCurseType(unit.impl.attack2.type) then
					multiplicative = multiplicative + 10 * cursedAshesAmount
				end
			end
		end
	end
	
	if smnsEnabled then
		multiplicative = multiplicative + _smns_multiplicativePower(unit, prev, attackN, mods)
		additive = additive + _smns_flatPower(unit, prev, attackN, mods)
	end

	return prev * ( 1 + 0.01 * multiplicative ) + additive
end

function _unitAura_AttackDrain(unit, damage, prev)
	svSetDrain1FloatPart(unit, 0)
	_valueCap_Set_Attack1Drain_Cap(unit, damage)
	
	if damage == 0 then
		return prev
	end
	_get_Group_and_Mods(unit)
	local ugroup = _GroupInfo_getCurrentGroup()
	
	local additive = 0
	local multiplicative = _unitAura_AttackDrain_valFlat(unit)
                             + _unitAura_LostHPEffect(unit, _unitAura_PerLostHP_AttackDrain_val(unit, _GroupInfo_UnitModifiers(unit)))
                             + _unitAura_AttackDrainOnDeath_valPercent(unit)
                             + _mapMultipliers_Drain1_Flat(unit)
        
	local SpiritCageAmount = _unitAura_EffectSumStack({G040UM0272}, 1)
	if SpiritCageAmount > 0 then
		additive = additive + SpiritCageAmount * _unitAura_SpiritCage_Effect(unit, ugroup, 3)
	end
	
	if workshopEnabled then
		multiplicative = multiplicative + Workshop_getBonus_Attack1Drain_Flat(scenario, unit, true)
	end
	
	if smnsEnabled then
		additive = additive + _smns_flatAttackDrain(unit, damage, prev)
		multiplicative = multiplicative + _smns_multiplicativeAttackDrain(unit, damage, prev)
	end
	
	return svAddDrain1(unit, prev + additive, damage, 0.01 * multiplicative)
end

function _unitAura_Attack2Drain(unit, damage, prev)
	svSetDrain2FloatPart(unit, 0)
	_valueCap_Set_Attack2Drain_Cap(unit, damage)
	
	if damage == 0 then
		return prev
	end
	_get_Group_and_Mods(unit)
	local ugroup = _GroupInfo_getCurrentGroup()
	
	local additive = 0
	local multiplicative = _unitAura_AttackDrain_valFlat(unit)
                             + _unitAura_LostHPEffect(unit, _unitAura_PerLostHP_AttackDrain_val(unit, _GroupInfo_UnitModifiers(unit)))
                             + _unitAura_AttackDrainOnDeath_valPercent(unit)
                             + _mapMultipliers_Drain2_Flat(unit)
        
	--local SpiritCageAmount = _unitAura_EffectSumStack({G040UM0272}, 1)
	--if SpiritCageAmount > 0 then
	--	additive = additive + SpiritCageAmount * _unitAura_SpiritCage_Effect(unit, ugroup, 3)
	--end
	
	if workshopEnabled then
		multiplicative = multiplicative + Workshop_getBonus_Attack2Drain_Flat(scenario, unit, true)
	end
	
	if smnsEnabled then
		additive = additive + _smns_flatAttackDrain(unit, damage, prev)
		multiplicative = multiplicative + _smns_multiplicativeAttackDrain(unit, damage, prev)
	end
	
	return svAddDrain2(unit, prev + additive, damage, 0.01 * multiplicative)
end

function _unitAura_getMovement(unit, prev)
	svSetMovementFloatPart(unit, 0)
	local result = prev
	_get_Group_and_Mods(unit)

	local mods = _GroupInfo_UnitModifiers(unit)
	local movementMultiplier = _statsMultiplier_Movement(unit, mods, _unitAura_SpellDebuffResistance_total(unit, mods))
	
	if workshopEnabled then
		movementMultiplier = movementMultiplier * ( 1 + 0.01 * Workshop_getBonus_Movement_Percent(scenario, unit, true) )
		result = result + Workshop_getBonus_Movement_Flat(scenario, unit, true)
	end
	
	svSetMovementMultiplier(unit, movementMultiplier)
		
	result = result + _mapMultipliers_MovementPoints_Flat(unit)
	
	if _GroupInfo_UnitModifierAmount(mods, itemsmasterperk_mod) > 0 then
		result = result + _unitAura_ItemsMasterPerk_Effect(unit)
	end
	
	if smnsEnabled then
		result = result + _smns_flatMovementBonus(unit, prev, result)
	end
	return svFlatEffectMovement(unit, 0, result)
end

function _unitAura_getFastRetreat(unit, prev)
	local result = prev
	if smnsEnabled or workshopEnabled then
		_get_Group_and_Mods(unit)
	end
	
	if workshopEnabled then
		result = Workshop_intToBoolean(result, Workshop_getBonus_FastRetreat(scenario, unit, true))
	end
	
	if smnsEnabled then
		result = _smns_getFastRetreat(unit, prev, result)
	end
	return result
end

function _unitAura_getNegotiate(unit, prev)
	local result = prev
	local id = unit.id.value
	if uaNewNegotiate[id] == nil then
		uaBaseNegotiate[id] = prev
	else
		uaBaseNegotiate[id] = uaNewNegotiate[id]
	end
	_get_Group_and_Mods(unit)
	uaBaseNegotiate[id] = uaBaseNegotiate[id] + _mapMultipliers_Negotiate_Flat(unit)

	if workshopEnabled then
		uaBaseNegotiate[id] = uaBaseNegotiate[id] + Workshop_getBonus_baseNegotiate_Flat(scenario, unit, true)
	end
	
	local result = uaBaseNegotiate[id]
		
	if smnsEnabled then
		result = result + _smns_getNegotiate(unit, prev, result)
	end
	return result
end

function _unitAura_getScout(unit, prev)
	svSetScoutFloatPart(unit, 0)
	local result = prev
	if smnsEnabled or workshopEnabled then
		_get_Group_and_Mods(unit)
	end
	
	result = result + _mapMultipliers_Scout_Flat(unit)
	
	if workshopEnabled then
		result = result + Workshop_getBonus_Scout_Flat(scenario, unit, true)
	end
		
	if smnsEnabled then
		result = result + _smns_getScout(unit, prev, result)
	end
	return svFlatEffectScout(unit, result, 0)
end

function _unitAura_getLowerCost(unit, prev)
	svSetLowerCostFloatPart(unit, 0)
	_get_Group_and_Mods(unit)

	local result = prev + _mapMultipliers_TradeDiscount_Flat(unit)
	
	if workshopEnabled then
		result = result + Workshop_getBonus_LowerCost_Flat(scenario, unit, true)
	end

	if smnsEnabled then
		result = result + _smns_flatLowerCostBonus(unit, prev, result)
	end
	return svFlatEffectLowerCost(unit, result, 0)
end

function _unitAura_getLeadership(unit, prev)
	if workshopEnabled then
		_get_Group_and_Mods(unit)
		prev = prev + Workshop_getBonus_Leadership_Flat(scenario, unit, true)
	end
	return prev
end

function _unitAura_hasMovementBonus(unit, ground, prev)
	local result = prev
	if smnsEnabled or workshopEnabled then
		_get_Group_and_Mods(unit)
	end
	if workshopEnabled then
		if ground == Ground.Plain then
			result = not Workshop_intToBoolean(not result, Workshop_getBonus_MoveAbility(scenario, unit, ground, true))
		else
			result = Workshop_intToBoolean(result, Workshop_getBonus_MoveAbility(scenario, unit, ground, true))
		end
	end
	if smnsEnabled then
		result = _smns_hasMovementBonus(unit, ground, prev, result)
	end
	return result
end

function _unitAura_hasAbility(unit, ability, prev)
	local gotGroup = false
	local result = prev
	
	if workshopEnabled then
		if not gotGroup then
			_get_Group_and_Mods(unit)
			gotGroup = true
		end
		result = Workshop_intToBoolean(result, Workshop_getBonus_LeaderAbility(scenario, unit, ability, gotGroup))
	end
	
	if ability == Ability.WandScrollUse then
		if not gotGroup then
			_get_Group_and_Mods(unit)
			gotGroup = true
		end
		if _GroupInfo_stackHasModifier(G040UM0161) then
			result = true
		end
	elseif ability == Ability.TalismanUse then
		if not gotGroup then
			_get_Group_and_Mods(unit)
			gotGroup = true
		end
		if _GroupInfo_stackHasModifier(G040UM0161)
		or _GroupInfo_stackHasModifier(G040UM0205) then
			result = true
		end
	end
	
	if smnsEnabled then
		if not gotGroup then
			_get_Group_and_Mods(unit)
			gotGroup = true
		end
		result = _smns_hasAbility(unit, ability, prev, result)
	end
	return result
end

function _unitAura_XpKilled(unit, prev)
	svSetXpKilledFloatPart(unit, 0)
	local id = unit.id.value
	if uaNewXpKilled[id] == nil then
		uaBaseXpKilled[id] = prev
	else
		uaBaseXpKilled[id] = uaNewXpKilled[id]
	end
	
	_get_Group_and_Mods(unit)
	local ugroup = _GroupInfo_getCurrentGroup()
	local gunits = _GroupInfo_getGroupUnits(ugroup)
	local umods
	local expMultiplier = 1
	for i = 1, #gunits do
		umods = _GroupInfo_UnitModifiers(gunits[i])
		expMultiplier = expMultiplier
			      + 0.05 * _GroupInfo_UnitModifierAmount(umods, G201UM9286)
			      - 0.05 * _GroupInfo_UnitModifierAmount(umods, G201UM9287)
			      + 0.10 * _GroupInfo_UnitModifierAmount(umods, G201UM9288)
			      - 0.10 * _GroupInfo_UnitModifierAmount(umods, G201UM9289)
	end
	
	if uaExternalExpKilled_Increased[id] ~= nil then
		expMultiplier = ( expMultiplier + uaExternalExpKilled_Increased[id] ) * uaExternalExpKilled_More[id]
	end
	svSetXpKilledMultiplier(unit, expMultiplier)
	return svFlatEffectXpKilled(unit, 0, uaBaseXpKilled[id])
end

function _unitAura_getXpNext(unit, prev)
	svSetXpNextFloatPart(unit, 0)
	return svFlatEffectXpNext(unit, prev, 0)
end

function _unitAura_AttackCritDamageEffectCommon(unit)
	local smnsBonus = 0
	if smnsEnabled then
		smnsBonus = _smns_CritDamage(unit)
	end
	return _unitAura_MostLostHPBuff_CritFlat(unit)
	     + _unitAura_AttackCrit_valFlat(unit)
             + _unitAura_LostHPEffect(unit, _unitAura_PerLostHP_AttackCrit_val(unit, _GroupInfo_UnitModifiers(unit)))
             + smnsBonus
end
function _unitAura_AttackCritDamageEffect1(unit, gotGroup)
	local workshopBonus = 0
	if workshopEnabled then
		if not gotGroup then
			_get_Group_and_Mods(unit)
		end
		workshopBonus = Workshop_getBonus_Attack1CritDamage_Flat(scenario, unit, true)
	end
	return _unitAura_AttackCritDamageEffectCommon(unit)
	     + _mapMultipliers_CritDamage1_Flat(unit)
	     + workshopBonus
end
function _unitAura_AttackCritDamageEffect2(unit, gotGroup)
	local workshopBonus = 0
	if workshopEnabled then
		if not gotGroup then
			_get_Group_and_Mods(unit)
		end
		workshopBonus = Workshop_getBonus_Attack2CritDamage_Flat(scenario, unit, true)
	end
	return _unitAura_AttackCritDamageEffectCommon(unit)
	     + _mapMultipliers_CritDamage2_Flat(unit)
	     + workshopBonus
end

function _unitAura_AttackCritHit(unit, prev)
	if prev then
		return true
	end
	_get_Group_and_Mods(unit)
	local effect = _unitAura_AttackCritDamageEffect1(unit, true)
	if effect > 0 then
		return true
	end
	return prev
end

function _unitAura_AttackCritDamage(unit, prev)
	local id = unit.id.value
	_get_Group_and_Mods(unit)
	
	local unitMods = _GroupInfo_UnitModifiers(unit)
	_valueCap_Set_AttackCriticalHitDamage_Percent_Bonus(unit, _unitAura_MaxAttackCritDamage_val(unit, unitMods))
	
	local effect = _unitAura_AttackCritDamageEffect1(unit, true)
	local result
	if unit.leveledImpl.attack1.crit then
		result = prev + effect
	else
		result = effect
	end
	
	local ratio
	local totalDmg
	if smnsInfoCriticalHit_ClassicalIncrease or scenario == nil then
		ratio = 1
		totalDmg = nil
	else
		local baseDmg  = uaBaseDamage1[id]
		if baseDmg == nil or baseDmg == 0 then
			ratio = 1
			totalDmg = baseDmg
		else
			totalDmg = scenario:getUnit(unit.id).impl.attack1.damage
			if totalDmg == 0 then
				totalDmg = baseDmg
			end
			ratio = baseDmg / totalDmg
		end
	end
	svSetCrit1InitialDamage(unit, result, ratio, totalDmg)
	return svAddCrit1Damage(unit, result, 0)
end

function _unitAura_getAttackCritPower(unit, prev)
	svSetCrit1Power(unit, prev)
	local workshopBonus = 0
	if workshopEnabled then
		_get_Group_and_Mods(unit)
		workshopBonus = Workshop_getBonus_Attack1CritPower_Flat(scenario, unit, true)
	end
	if smnsEnabled then
		workshopBonus = workshopBonus + _smns_CritPower(unit)
	end
	return svAddCrit1Power(unit, prev, _mapMultipliers_CritPower1_Flat(unit) + workshopBonus)
end

function _unitAura_Attack2CritHit(unit, prev)
	if prev then
		return true
	end
	_get_Group_and_Mods(unit)
	local effect = _unitAura_AttackCritDamageEffect2(unit, true)
	if effect > 0 then
		return true
	end
	return prev
end

function _unitAura_Attack2CritDamage(unit, prev)
	local id = unit.id.value
	_get_Group_and_Mods(unit)
	
	local unitMods = _GroupInfo_UnitModifiers(unit)
	_valueCap_Set_AttackCriticalHitDamage_Percent_Bonus(unit, _unitAura_MaxAttackCritDamage_val(unit, unitMods))
	
	local effect = _unitAura_AttackCritDamageEffect2(unit, true)
	local result
	local a = unit.leveledImpl.attack2
	if a ~= nil and a.crit then
		result = prev + effect
	else
		result = effect
	end
	
	local ratio
	local totalDmg
	if smnsInfoCriticalHit_ClassicalIncrease or scenario == nil then
		ratio = 1
		totalDmg = nil
	else
		local baseDmg  = uaBaseDamage2[id]
		if baseDmg == nil or baseDmg == 0 then
			ratio = 1
			totalDmg = baseDmg
		else
			totalDmg = scenario:getUnit(unit.id).impl.attack2.damage
			if totalDmg == 0 then
				totalDmg = baseDmg
			end
			ratio = baseDmg / totalDmg
		end
	end
	svSetCrit2InitialDamage(unit, result, ratio, totalDmg)
	return svAddCrit2Damage(unit, result, 0)
end

function _unitAura_getAttack2CritPower(unit, prev)
	svSetCrit2Power(unit, prev)
	local workshopBonus = 0
	if workshopEnabled then
		_get_Group_and_Mods(unit)
		workshopBonus = Workshop_getBonus_Attack2CritPower_Flat(scenario, unit, true)
	end
	if smnsEnabled then
		workshopBonus = workshopBonus + _smns_CritPower(unit)
	end
	return svAddCrit2Power(unit, prev, _mapMultipliers_CritPower2_Flat(unit) + workshopBonus)
end

function _unitAura_AtckTwice(unit, prev)
	local twice = prev
	local mods = _GroupInfo_UnitModifiers(unit)
	if twice and _GroupInfo_UnitModifierAmount(mods, G201UM9121) > 0 then
 		twice = false
	end 
	if not twice then
		local effect = _unitAura_LostHPEffect(unit, _unitAura_PerLostHP_DoubleAttack_val(unit, mods))
		if effect > 0 then
			twice = _mRnd_simpleRndEvent(effect)
		end
	end	
	return twice
end

function _unitAura_getAttackDamRatio(unit, prev)
	svSetAttack1SplashFloatPart(unit, 0)
	local mods = _GroupInfo_UnitModifiers(unit)
	return svFlatEffectSplash1(unit, prev, _unitAura_SplashDamage_val(unit, mods))
end

function _unitAura_getAttack2DamRatio(unit, prev)
	svSetAttack2SplashFloatPart(unit, 0)
	local mods = _GroupInfo_UnitModifiers(unit)
	return svFlatEffectSplash2(unit, prev, _unitAura_SplashDamage_val(unit, mods))
end

uaAttackType1 = {}
function _unitAura_getUaAttackType1(unit)
	return uaAttackType1[unit.id.value]
end
function _unitAura_getAttackClass(unit, prev)
	if statsCheck_isSelfTransformType(prev) then
		return prev
	end
	local id = unit.id.value
	if uaAttackType1[id] ~= nil then
		return uaAttackType1[id]
	end
	return prev
end

uaAttackType2 = {}
function _unitAura_getUaAttackType2(unit)
	return uaAttackType2[unit.id.value]
end
function _unitAura_getAttack2Class(unit, prev)
	local id = unit.id.value
	if uaAttackType2[id] ~= nil then
		return uaAttackType2[id]
	end
	return prev
end

uaAttackName1 = {}
function _unitAura_getAttackNameTxt(unit, prev)
	local id = unit.id.value
	if uaAttackName1[id] ~= nil then
		return uaAttackName1[id]
	end
	return prev
end

uaAttackName2 = {}
function _unitAura_getAttack2NameTxt(unit, prev)
	local id = unit.id.value
	if uaAttackName2[id] ~= nil then
		return uaAttackName2[id]
	end
	return prev
end

uaAttackSplit1 = {}
function _unitAura_getAttackDrSplit(unit, prev)
	local id = unit.id.value
	if uaAttackSplit1[id] ~= nil then
		return uaAttackSplit1[id]
	end
	return prev
end

uaAttackSplit2 = {}
function _unitAura_getAttack2DrSplit(unit, prev)
	local id = unit.id.value
	if uaAttackSplit2[id] ~= nil then
		return uaAttackSplit2[id]
	end
	return prev
end

uaAddToShatterBaseDamage2 = {}
function _unitAura_AttackId(unit, prev)
	local id = unit.id.value
	
	_valueCap_SetUnitAttackDamageHealMax(unit)
		
	_get_Group_and_Mods(unit)
	local ugroup = _GroupInfo_getCurrentGroup()
	local unitMods = _GroupInfo_UnitModifiers(unit)
	
	uaAttackName1[id] = nil
	uaAttackName2[id] = nil
	uaAddToShatterBaseDamage2[id] = 0
		
	local leveledAttack1
	if unit.leveledImpl.altAttack == nil then
		leveledAttack1 = unit.leveledImpl.attack1
	else
		leveledAttack1 = unit.leveledImpl.altAttack
	end
	local leveledAttack1Id = leveledAttack1.id
	uaAttackType1[id] = _UnitsLeveledAttacks_getAttackClass(leveledAttack1.type, unit, unitMods)
	
	local leveledAttack2 = unit.leveledImpl.attack2
	local leveledAttack2Id
	if leveledAttack2 == nil or _GroupInfo_UnitModifierAmount(unitMods, delete_attack2_mod) > 0 then
		leveledAttack2Id = aG000000000
		uaAttackType2[id] = nil
		leveledAttack2 = nil
	else
		leveledAttack2Id = leveledAttack2.id
		uaAttackType2[id] = leveledAttack2.type
	end
	leveledAttack2Id = _UnitsLeveledAttacks_getAttack2Id(leveledAttack2Id, unit, unitMods)
	uaAttackType2[id] = _UnitsLeveledAttacks_getAttack2Class(uaAttackType2[id], unit, unitMods)

	 if smnsEnabled then
        leveledAttack1Id = _smns_getAttack1Id(unit, leveledAttack1Id)
        uaAttackType1[id] = _smns_getAttack1Type(unit, uaAttackType1[id])

        leveledAttack2Id = _smns_getAttack2Id(unit, leveledAttack2Id)
        uaAttackType2[id] = _smns_getAttack2Type(unit, uaAttackType2[id])
    end
		
	---------------------------------------
	
	local damageFlatBonus = 10 * ( _GroupInfo_UnitModifierAmount(unitMods, G201UM9314) - _GroupInfo_UnitModifierAmount(unitMods, G201UM9318) )
			      + 1  * ( _GroupInfo_UnitModifierAmount(unitMods, G201UM9316) - _GroupInfo_UnitModifierAmount(unitMods, G201UM9320) )
	
	local healFlatBonus = 10 * ( _GroupInfo_UnitModifierAmount(unitMods, G201UM9322) - _GroupInfo_UnitModifierAmount(unitMods, G201UM9324) )
			    + 1  * ( _GroupInfo_UnitModifierAmount(unitMods, G201UM9323) - _GroupInfo_UnitModifierAmount(unitMods, G201UM9325) )
	
	local powerFlatBonus = _GroupInfo_UnitModifierAmount(unitMods, G201UM9310) - _GroupInfo_UnitModifierAmount(unitMods, G201UM9312)
	
	local damage2FlatBonus = 10 * ( _GroupInfo_UnitModifierAmount(unitMods, G201UM9315) - _GroupInfo_UnitModifierAmount(unitMods, G201UM9319) )
			       + 1  * ( _GroupInfo_UnitModifierAmount(unitMods, G201UM9317) - _GroupInfo_UnitModifierAmount(unitMods, G201UM9321) )

	local heal2FlatBonus = 10 * ( _GroupInfo_UnitModifierAmount(unitMods, G201UM9322) - _GroupInfo_UnitModifierAmount(unitMods, G201UM9324) )
			     + 1  * ( _GroupInfo_UnitModifierAmount(unitMods, G201UM9323) - _GroupInfo_UnitModifierAmount(unitMods, G201UM9325) )

	local power2FlatBonus = _GroupInfo_UnitModifierAmount(unitMods, G201UM9311) - _GroupInfo_UnitModifierAmount(unitMods, G201UM9313)
	
	
	if _GroupInfo_UnitModifierAmount(unitMods, runestone_mod) > 0 and
	   _GroupInfo_UnitModifierAmount(unitMods, runemaul_mod) > 0 then
		damageFlatBonus = damageFlatBonus + 5
	end
		
	local harvastCupsAmount = _GroupInfo_UnitModifierAmount(unitMods, harvestcup_mod)
	if harvastCupsAmount > 0 then
		damageFlatBonus = damageFlatBonus + math.floor(unit.hp * harvastCupsAmount / 20)
	end
	
	if _GroupInfo_stackHasModifierAmount(harvestarmor_mod) > 0 and
	   _GroupInfo_stackHasModifierAmount(harvestcup_mod) > 0 and
	   _GroupInfo_stackHasModifierAmount(harvestdagger_mod) > 0 then
		local cLeader = _GroupInfo_getCurrentGroupLeader()
		if cLeader ~= nil then
			damageFlatBonus = damageFlatBonus + math.floor(cLeader.hp / 25)
		end
	end
	
	local ChainsOfHumilityAmount = _unitAura_EffectSumStack({chainsofhumility_mod}, 1)
	if ChainsOfHumilityAmount > 0 then
		local chainsOfHumilityEffect = ChainsOfHumilityAmount * _unitAura_ChainsOfHumility_Effect(unit, ugroup)
		damageFlatBonus = damageFlatBonus + chainsOfHumilityEffect
		healFlatBonus = healFlatBonus + chainsOfHumilityEffect
	end
	
	---------------------------------------
	
	if uaNewDamage1[id] == nil then
		uaBaseDamage1[id] = leveledAttack1.damage
	else
		uaBaseDamage1[id] = uaNewDamage1[id]
	end
	if uaNewHeal1[id] == nil then
		uaBaseHeal1[id] = leveledAttack1.heal
	else
		uaBaseHeal1[id] = uaNewHeal1[id]
	end
	if uaNewPower1[id] == nil then
		uaBasePower1[id] = _UnitsLeveledAttacks_getAttackPower(leveledAttack1.power, unit, unitMods)
	else
		uaBasePower1[id] = uaNewPower1[id]
	end
	
	uaBaseDamage1[id] = _valueCap_CheckMaxDamage(unit, uaBaseDamage1[id])
	uaBaseHeal1[id] = _valueCap_CheckMaxHeal(unit, uaBaseHeal1[id])
	uaBasePower1[id] = _valueCap_CheckMaxAccuracy(unit, uaBasePower1[id])
	
	if leveledAttack2Id ~= aG000000000 then
		if uaNewDamage2[id] == nil then
			uaBaseDamage2[id] = _UnitsLeveledAttacks_getAttack2Damage(leveledAttack2, unit, unitMods)
		else
			uaBaseDamage2[id] = uaNewDamage2[id]
		end
		if uaNewHeal2[id] == nil then
			uaBaseHeal2[id] = _UnitsLeveledAttacks_getAttack2Heal(leveledAttack2, unit, unitMods)
		else
			uaBaseHeal2[id] = uaNewHeal2[id]
		end
		if uaNewPower2[id] == nil then
			uaBasePower2[id] = _UnitsLeveledAttacks_getAttack2Power(leveledAttack2, unit, unitMods)
		else
			uaBasePower2[id] = uaNewPower2[id]
		end

		if smnsEnabled then
            uaBaseDamage2[id] = _smns_getAttack2BaseDamage(unit, uaBaseDamage2[id])
            uaBaseHeal2[id] = _smns_getAttack2BaseHeal(unit, uaBaseHeal2[id])
            uaBasePower2[id] = _smns_getAttack2BasePower(unit, uaBasePower2[id])
        end
		
		uaBaseDamage2[id] = _valueCap_CheckMaxDamage(unit, uaBaseDamage2[id])
		uaBaseHeal2[id] = _valueCap_CheckMaxHeal(unit, uaBaseHeal2[id])
		uaBasePower2[id] = _valueCap_CheckMaxAccuracy(unit, uaBasePower2[id]) 
	else
		uaBaseDamage2[id] = 0
		uaBaseHeal2[id] = 0
		uaBasePower2[id] = 0
	end
	
	----------------------------------------------
	
	if workshopEnabled then
		local workshopPercent
		if uaBasePower1[id] ~= 0 or powerFlatBonus ~= 0 then
			workshopPercent = 1 + 0.01 * Workshop_getBonus_baseAttack1Power_Percent(scenario, unit, true)
			uaBasePower1[id] = uaBasePower1[id] * workshopPercent
			powerFlatBonus = powerFlatBonus * workshopPercent
		end
		if uaBasePower2[id] ~= 0 or power2FlatBonus ~= 0 then
			workshopPercent = 1 + 0.01 * Workshop_getBonus_baseAttack2Power_Percent(scenario, unit, true)
			uaBasePower2[id] = uaBasePower2[id] * workshopPercent
			power2FlatBonus = power2FlatBonus * workshopPercent
		end
		if uaBaseDamage1[id] ~= 0 or damageFlatBonus ~= 0 then
			workshopPercent = 1 + 0.01 * Workshop_getBonus_baseAttack1Damage_Percent(scenario, unit, true)
			uaBaseDamage1[id] = uaBaseDamage1[id] * workshopPercent
			damageFlatBonus = damageFlatBonus * workshopPercent
		end
		if uaBaseDamage2[id] ~= 0 or damage2FlatBonus ~= 0 then
			workshopPercent = 1 + 0.01 * Workshop_getBonus_baseAttack2Damage_Percent(scenario, unit, true)
			uaBaseDamage2[id] = uaBaseDamage2[id] * workshopPercent
			damage2FlatBonus = damage2FlatBonus * workshopPercent
		end
		if uaBaseHeal1[id] ~= 0 or healFlatBonus ~= 0 then
			workshopPercent = 1 + 0.01 * Workshop_getBonus_baseAttack1Heal_Percent(scenario, unit, true)
			uaBaseHeal1[id] = uaBaseHeal1[id] * workshopPercent
			healFlatBonus = healFlatBonus * workshopPercent
		end
		if uaBaseHeal2[id] ~= 0 or heal2FlatBonus ~= 0 then
			workshopPercent = 1 + 0.01 * Workshop_getBonus_baseAttack2Heal_Percent(scenario, unit, true)
			uaBaseHeal2[id] = uaBaseHeal2[id] * workshopPercent
			heal2FlatBonus = heal2FlatBonus * workshopPercent
		end
	end
	
	----------------------------------------------
		
	local addedDamageAttack = nil
	local drawnedDamageAttack2 = nil
	local drawnedHealAttack2 = nil
	local addedDamageAttackHasPercentValue = false
	
	-- ��������� ����� ��� ������ � ��������� ������ ������ ��� ����������
	if _GroupInfo_UnitModifierAmount(unitMods, G040UM0070) > 0 then
		-- ���������� ����� �� �������� ��������
		addedDamageAttack = AttackTypeConversion_MakeAttackInfo(Attack.Shatter, 0.10, 0, 0, 70, false, aG020AA0013, false)
		addedDamageAttackHasPercentValue = true
	elseif _GroupInfo_UnitModifierAmount(unitMods, G040UM0066) > 0 then
		-- ���� �� ���� ������
		addedDamageAttack = AttackTypeConversion_MakeAttackInfo(Attack.Damage, 0.30, 0, 0, 100, false, aG020AA0017, false)
		addedDamageAttackHasPercentValue = true
	elseif _GroupInfo_UnitModifierAmount(unitMods, G040UM0069) > 0 then
		-- ���� �� �������� ����
		addedDamageAttack = AttackTypeConversion_MakeAttackInfo(Attack.Damage, 0.35, 0, 0, 100, false, aG020AA0018, false)
		addedDamageAttackHasPercentValue = true
	elseif _GroupInfo_UnitModifierAmount(unitMods, G040UM0071) > 0 then
		-- ���� �� �������� ����
		addedDamageAttack = AttackTypeConversion_MakeAttackInfo(Attack.Damage, 0.30, 0, 0, 100, false, aG020AA0019, false)
		addedDamageAttackHasPercentValue = true
	elseif _GroupInfo_UnitModifierAmount(unitMods, G040UM0068) > 0 then
		-- ��������� ������ �� ���� ������
		addedDamageAttack = AttackTypeConversion_MakeAttackInfo(Attack.DrainLevel, 0, 0, 0, 40, false, aG020AA0011, false)
	elseif _GroupInfo_UnitModifierAmount(unitMods, mortistear_mod) > 0 and
	       _GroupInfo_UnitModifierAmount(unitMods, thanatosskull_mod) > 0 and
	       _GroupInfo_UnitModifierAmount(unitMods, thanatosblade_mod) > 0 then
		-- ��������� ������ �� ���� ��������
		addedDamageAttack = AttackTypeConversion_MakeAttackInfo(Attack.DrainLevel, 0, 0, 0, 40, false, aG020AA0016, false)
	end
	
	-- ��������� ����������
	if _GroupInfo_UnitModifierAmount(unitMods, G201UM9223) > 0 then
		drawnedDamageAttack2 = AttackTypeConversion_MakeAttackInfo(Attack.LowerDamage, 0, 0, 1, 50, false, aG014AA0001, false)
	elseif _GroupInfo_UnitModifierAmount(unitMods, G201UM9224) > 0 then
		drawnedDamageAttack2 = AttackTypeConversion_MakeAttackInfo(Attack.LowerInitiative, 0, 0, 1, 50, false, aG014AA0002, false)
	elseif _GroupInfo_UnitModifierAmount(unitMods, G201UM9225) > 0 then
		drawnedDamageAttack2 = AttackTypeConversion_MakeAttackInfo(Attack.DrainLevel, 0, 0, 0, 50, false, aG014AA0003, false)
	elseif _GroupInfo_UnitModifierAmount(unitMods, G201UM9226) > 0 then
		drawnedDamageAttack2 = AttackTypeConversion_MakeAttackInfo(Attack.Petrify, 0, 0, 0, 50, false, aG014AA0004, false)
	elseif _GroupInfo_UnitModifierAmount(unitMods, G201UM9227) > 0 then
		drawnedDamageAttack2 = AttackTypeConversion_MakeAttackInfo(Attack.Paralyze, 0, 0, 0, 50, false, aG014AA0005, false)
	elseif _GroupInfo_UnitModifierAmount(unitMods, G201UM9228) > 0 then
		drawnedDamageAttack2 = AttackTypeConversion_MakeAttackInfo(Attack.Fear, 0, 0, 0, 50, false, aG014AA0006, false)
	elseif _GroupInfo_UnitModifierAmount(unitMods, G201UM9229) > 0 then
		drawnedDamageAttack2 = AttackTypeConversion_MakeAttackInfo(Attack.Shatter, 10, 0, 0, 50, false, aG014AA0007, false)
	elseif _GroupInfo_UnitModifierAmount(unitMods, G201UM9230) > 0 then
		drawnedDamageAttack2 = AttackTypeConversion_MakeAttackInfo(Attack.TransformOther, 0, 0, 0, 50, false, aG014AA0008, false)
	end
		
	-- ��������� ����� ��� ������ � ��������� ������ ������ ��� ����������
	-- �����
	
	-- ��������� ����� ��� ������ � ��������� ������ �������� 
	
	-- ��������� ����������	
	if _GroupInfo_UnitModifierAmount(unitMods, G201UM9297) > 0 then
		drawnedHealAttack2 = AttackTypeConversion_MakeAttackInfo(Attack.BoostDamage, 0, 0, 1, 100, false, aG014AA0009, false)
	elseif _GroupInfo_UnitModifierAmount(unitMods, G201UM9298) > 0 then
		drawnedHealAttack2 = AttackTypeConversion_MakeAttackInfo(Attack.GiveAttack, 0, 0, 0, 100, false, aG014AA0010, false)
	elseif _GroupInfo_UnitModifierAmount(unitMods, G201UM9299) > 0 then
		drawnedHealAttack2 = AttackTypeConversion_MakeAttackInfo(Attack.Cure, 0, 0, 0, 100, false, aG014AA0011, false)
	elseif _GroupInfo_UnitModifierAmount(unitMods, G201UM9300) > 0 then
		drawnedHealAttack2 = AttackTypeConversion_MakeAttackInfo(Attack.Revive, 0, 0, 0, 100, false, aG014AA0012, false)
	end
		
	-- ��������� ����� ��� ������ � ��������� ������ ��������
	-- �����
	
	----------------------------------------------
	
	if addedDamageAttack ~= nil and statsCheck_isCurseType(AttackTypeConversion_GetClass(addedDamageAttack)) then
		if leveledAttack2Id ~= aG000000000 and AttackTypeConversion_GetClass(addedDamageAttack) == uaAttackType2[id] then
			uaBasePower2[id] = uaBasePower2[id] + (100 - uaBasePower2[id]) * 0.01 * AttackTypeConversion_GetPower(addedDamageAttack)
			addedDamageAttack = nil
		elseif drawnedDamageAttack2 ~= nil and AttackTypeConversion_GetClass(addedDamageAttack) == AttackTypeConversion_GetClass(drawnedDamageAttack2) then
			AttackTypeConversion_SetPower(drawnedDamageAttack2, AttackTypeConversion_GetPower(drawnedDamageAttack2) + (100 - AttackTypeConversion_GetPower(drawnedDamageAttack2)) * 0.01 * AttackTypeConversion_GetPower(addedDamageAttack))
			addedDamageAttack = nil
		elseif leveledAttack2Id ~= aG000000000 and AttackTypeConversion_GetClass(addedDamageAttack) == uaAttackType1[id] then
			uaBasePower1[id] = uaBasePower1[id] + (100 - uaBasePower1[id]) * 0.01 * AttackTypeConversion_GetPower(addedDamageAttack)
			addedDamageAttack = nil
		end
	end
	
	----------------------------------------------
	
	local damageMod      = _GroupInfo_UnitModifierAmount(unitMods, potion_change_attack_damage_mod)
	local vampirismMod   = _GroupInfo_UnitModifierAmount(unitMods, potion_change_attack_vampirism_mod)
	local thaumaturgyMod = _GroupInfo_UnitModifierAmount(unitMods, potion_change_attack_thaumaturgy_mod)
	local healMod        = _GroupInfo_UnitModifierAmount(unitMods, potion_change_attack_heal_mod)
	
	if healMod > 0 and damageMod > 0 then
		damageMod = 0
		healMod = 0
	end
	if healMod > 0 and vampirismMod > 0 then
		vampirismMod = 0
		healMod = 0
	end
	if healMod > 0 and thaumaturgyMod > 0 then
		thaumaturgyMod = 0
		healMod = 0
	end
	if vampirismMod > 0 then
		damageMod = 0
	end
	if thaumaturgyMod > 0 then
		damageMod = 0
		vampirismMod = 0
	end
	
	if thaumaturgyMod > 0 or vampirismMod > 0 or damageMod > 0 or healMod > 0 then
		local Attack2TypeBeforeConversion = uaAttackType2[id]
		
		if statsCheck_isDirectDmgType(uaAttackType1[id]) then
			uaBaseDamage1[id] = uaBaseDamage1[id] + damageFlatBonus
			damageFlatBonus = 0
			-- healFlatBonus   = 0
		elseif leveledAttack2Id ~= aG000000000 and statsCheck_isDirectDmgType(uaAttackType2[id]) then
			uaBaseDamage2[id] = uaBaseDamage2[id] + damageFlatBonus
			damageFlatBonus = 0
			-- healFlatBonus   = 0
		elseif statsCheck_isHPRestoreType(uaAttackType1[id]) then
			uaBaseHeal1[id] = uaBaseHeal1[id] + healFlatBonus
			-- damageFlatBonus = 0
			healFlatBonus   = 0
		elseif leveledAttack2Id ~= aG000000000 and statsCheck_isHPRestoreType(uaAttackType2[id]) then
			uaBaseHeal2[id] = uaBaseHeal2[id] + healFlatBonus
			-- damageFlatBonus = 0
			healFlatBonus   = 0
		end
		if leveledAttack2Id ~= aG000000000 and statsCheck_isDirectDmgType(uaAttackType2[id]) then
			uaBaseDamage2[id] = uaBaseDamage2[id] + damage2FlatBonus
			damage2FlatBonus = 0
			-- heal2FlatBonus   = 0
		elseif leveledAttack2Id ~= aG000000000 and statsCheck_isHPRestoreType(uaAttackType2[id]) then
			uaBaseHeal2[id] = uaBaseHeal2[id] + heal2FlatBonus
			-- damage2FlatBonus = 0
			heal2FlatBonus   = 0
		end
		if statsCheck_isPowerAppliable(uaAttackType1[id]) then
			uaBasePower1[id] = uaBasePower1[id] + powerFlatBonus
			powerFlatBonus  = 0
		end
		if leveledAttack2Id ~= aG000000000 and statsCheck_isPowerAppliable(uaAttackType2[id]) then
			uaBasePower2[id] = uaBasePower2[id] + power2FlatBonus
			power2FlatBonus = 0
		end
	
		local attack1Info = nil
		local attack2Info = nil
		attack1Info = AttackTypeConversion_MakeAttackInfo(uaAttackType1[id], uaBaseDamage1[id], uaBaseHeal1[id], 0, uaBasePower1[id], leveledAttack1.damageSplit, leveledAttack1Id, false)
		if leveledAttack2Id ~= aG000000000 then
			local split2Info
			if leveledAttack2 ~= nil then
				split2Info = leveledAttack2.damageSplit
			else
				split2Info = true
			end
			attack2Info = AttackTypeConversion_MakeAttackInfo(uaAttackType2[id], uaBaseDamage2[id], uaBaseHeal2[id], 0, uaBasePower2[id], split2Info, leveledAttack2Id, false)
		end
		
		local attacksArray
		if healMod == 0 then
			attacksArray = {attack1Info, attack2Info, drawnedDamageAttack2, drawnedHealAttack2}
		else
			attacksArray = {attack1Info, attack2Info, drawnedHealAttack2, drawnedDamageAttack2}
		end
		local attackArrayUpperBound = 4
		
		local convertedAttacksArray = {}
		local softConversion = true
		local convertedAddedDamageAttack = nil
		
		if thaumaturgyMod > 0 then
			for i=1, attackArrayUpperBound do
				convertedAttacksArray[i] = AttackTypeConversion_ThaumaturgyPotion(unit, attacksArray[i], softConversion)
			end
			convertedAddedDamageAttack = AttackTypeConversion_ThaumaturgyPotion(unit, addedDamageAttack, softConversion)
		elseif vampirismMod > 0 then
			for i=1, attackArrayUpperBound do
				convertedAttacksArray[i] = AttackTypeConversion_VampirismPotion(unit, attacksArray[i], softConversion)
			end
			convertedAddedDamageAttack = AttackTypeConversion_VampirismPotion(unit, addedDamageAttack, softConversion)
		elseif damageMod > 0 then
			for i=1, attackArrayUpperBound do
				convertedAttacksArray[i] = AttackTypeConversion_CommonDamagePotion(unit, attacksArray[i], softConversion)
			end
			convertedAddedDamageAttack = AttackTypeConversion_CommonDamagePotion(unit, addedDamageAttack, softConversion)
		elseif healMod > 0 then
			for i=1, attackArrayUpperBound do
				convertedAttacksArray[i] = AttackTypeConversion_HealPotion(unit, attacksArray[i], softConversion)
			end
			convertedAddedDamageAttack = AttackTypeConversion_HealPotion(unit, addedDamageAttack, softConversion)
		end
		
		local needHardConversion = true
		if healMod == 0 then
			if AttackTypeConversion_GetDamage(convertedAttacksArray[1]) > 0 then
				needHardConversion = false
			elseif convertedAttacksArray[2] ~= nil then
				if AttackTypeConversion_GetDamage(convertedAttacksArray[2]) > 0 then
					needHardConversion = false
				end
			else
				for i=3, attackArrayUpperBound do
					if convertedAttacksArray[i] ~= nil and AttackTypeConversion_GetDamage(convertedAttacksArray[i]) > 0 then
						needHardConversion = false
						break
					end
				end
			end
		else
			if AttackTypeConversion_GetHeal(convertedAttacksArray[1]) > 0 then
				needHardConversion = false
			elseif convertedAttacksArray[2] ~= nil then
				if AttackTypeConversion_GetHeal(convertedAttacksArray[2]) > 0 then
					needHardConversion = false
				end
			else
				for i=3, attackArrayUpperBound do
					if convertedAttacksArray[i] ~= nil and AttackTypeConversion_GetHeal(convertedAttacksArray[i]) > 0 then
						needHardConversion = false
						break
					end
				end
			end
		end
		
		if needHardConversion then
			softConversion = false
			if thaumaturgyMod > 0 then
				convertedAttacksArray[1] = AttackTypeConversion_ThaumaturgyPotion(unit, attacksArray[1], softConversion)
			elseif vampirismMod > 0 then
				convertedAttacksArray[1] = AttackTypeConversion_VampirismPotion(unit, attacksArray[1], softConversion)
			elseif damageMod > 0 then
				convertedAttacksArray[1] = AttackTypeConversion_CommonDamagePotion(unit, attacksArray[1], softConversion)
			elseif healMod > 0 then
				convertedAttacksArray[1] = AttackTypeConversion_HealPotion(unit, attacksArray[1], softConversion)
			end
		end
		
		local convertedAttack1 = convertedAttacksArray[1]
		local convertedAttack2 = nil
		
		if convertedAttacksArray[2] ~= nil then
			convertedAttack2 = convertedAttacksArray[2]
		else
			if healMod == 0 then
				if AttackTypeConversion_GetDamage(convertedAttack1) > 0 then
					for i=3, attackArrayUpperBound do
						if convertedAttacksArray[i] ~= nil then
							convertedAttack2 = convertedAttacksArray[i]
							break
						end
					end
				else
					for i=3, attackArrayUpperBound do
						if convertedAttacksArray[i] ~= nil and AttackTypeConversion_GetDamage(convertedAttacksArray[i]) > 0 then
							convertedAttack2 = convertedAttacksArray[i]
							break
						end
					end
				end
				
				if convertedAttack2 == nil and convertedAddedDamageAttack ~= nil then
					convertedAttack2 = AttackTypeConversion_MakeAttackInfo(AttackTypeConversion_GetClass(convertedAddedDamageAttack), 
											       0, 
											       0, 
											       AttackTypeConversion_GetLevel(convertedAddedDamageAttack), 
											       AttackTypeConversion_GetPower(convertedAddedDamageAttack), 
											       AttackTypeConversion_GetSplit(convertedAddedDamageAttack), 
											       AttackTypeConversion_GetAttackId(convertedAddedDamageAttack), 
											       AttackTypeConversion_GetValueIsGenerated(convertedAddedDamageAttack))
				end
			else
			
				if AttackTypeConversion_GetHeal(convertedAttack1) > 0 then
					for i=3, attackArrayUpperBound do
						if convertedAttacksArray[i] ~= nil then
							convertedAttack2 = convertedAttacksArray[i]
							break
						end
					end
				else
					for i=3, attackArrayUpperBound do
						if convertedAttacksArray[i] ~= nil and AttackTypeConversion_GetHeal(convertedAttacksArray[i]) > 0 then
							convertedAttack2 = convertedAttacksArray[i]
							break
						end
					end
				end
				if convertedAttack2 == nil and convertedAddedDamageAttack ~= nil then
					convertedAttack2 = AttackTypeConversion_MakeAttackInfo(AttackTypeConversion_GetClass(convertedAddedDamageAttack), 
											       0, 
											       0, 
											       AttackTypeConversion_GetLevel(convertedAddedDamageAttack), 
											       AttackTypeConversion_GetPower(convertedAddedDamageAttack), 
											       AttackTypeConversion_GetSplit(convertedAddedDamageAttack), 
											       AttackTypeConversion_GetAttackId(convertedAddedDamageAttack), 
											       AttackTypeConversion_GetValueIsGenerated(convertedAddedDamageAttack))
				end
			end
		end
		
		if convertedAttack2 ~= nil then
			if healMod == 0 then
				if AttackTypeConversion_GetDamage(convertedAttack1) > 0 and AttackTypeConversion_GetDamage(convertedAttack2) > 0 then
					if AttackTypeConversion_GetValueIsGenerated(convertedAttack2) then
						convertedAttack2 = AttackTypeConversion_SetDamage(convertedAttack2, 0.2 * AttackTypeConversion_GetDamage(convertedAttack2))
					elseif AttackTypeConversion_GetValueIsGenerated(convertedAttack1) then
						convertedAttack1 = AttackTypeConversion_SetDamage(convertedAttack1, 0.2 * AttackTypeConversion_GetDamage(convertedAttack1))
					end
				end
			else
				if AttackTypeConversion_GetHeal(convertedAttack1) > 0 and AttackTypeConversion_GetHeal(convertedAttack2) > 0 then
					if AttackTypeConversion_GetValueIsGenerated(convertedAttack2) then
						convertedAttack2 = AttackTypeConversion_SetHeal(convertedAttack2, 0.2 * AttackTypeConversion_GetHeal(convertedAttack2))
					elseif AttackTypeConversion_GetValueIsGenerated(convertedAttack1) then
						convertedAttack1 = AttackTypeConversion_SetHeal(convertedAttack1, 0.2 * AttackTypeConversion_GetHeal(convertedAttack1))
					end
				end			
			end
		end
		
			
		leveledAttack1Id = _unitAura_AttackInfoToAttack1BaseStats(id, convertedAttack1, true, true)
		
		if convertedAttack2 ~= nil then
			leveledAttack2Id = _unitAura_AttackInfoToAttack2BaseStats(id, convertedAttack2, true, true)
		else
			uaAttackType2[id]  = nil
			uaBaseDamage2[id]  = 0
			uaBaseHeal2[id]    = 0
			uaBasePower2[id]   = 0
			uaAttackSplit2[id] = false
			leveledAttack2Id   = aG000000000
		end
		
		-- log('attack1 '..AttackTypeConversion_PrintAttackInfo(convertedAttack1))
		-- log('attack2 '..AttackTypeConversion_PrintAttackInfo(convertedAttack2))
		
		if damageFlatBonus ~= 0 or healFlatBonus ~= 0 then
			if statsCheck_isDirectDmgType(uaAttackType1[id]) then
				uaBaseDamage1[id] = uaBaseDamage1[id] + damageFlatBonus
				damageFlatBonus = 0
			elseif leveledAttack2Id ~= aG000000000 and statsCheck_isDirectDmgType(uaAttackType2[id]) then
				uaBaseDamage2[id] = uaBaseDamage2[id] + damageFlatBonus
				damageFlatBonus = 0
			elseif statsCheck_isHPRestoreType(uaAttackType1[id]) then
				uaBaseHeal1[id] = uaBaseHeal1[id] + healFlatBonus
				healFlatBonus   = 0
			elseif leveledAttack2Id ~= aG000000000 and statsCheck_isHPRestoreType(uaAttackType2[id]) then
				uaBaseHeal2[id] = uaBaseHeal2[id] + healFlatBonus
				healFlatBonus   = 0
			end
			-- damageFlatBonus = 0
			-- healFlatBonus   = 0
		end
		if damage2FlatBonus ~= 0 or heal2FlatBonus ~= 0 then
			if leveledAttack2Id ~= aG000000000 and statsCheck_isDirectDmgType(uaAttackType2[id]) then
				uaBaseDamage2[id] = uaBaseDamage2[id] + damage2FlatBonus
				damage2FlatBonus = 0
			elseif leveledAttack2Id ~= aG000000000 and statsCheck_isHPRestoreType(uaAttackType2[id]) then
				uaBaseHeal2[id] = uaBaseHeal2[id] + heal2FlatBonus
				heal2FlatBonus   = 0
			end
			-- damage2FlatBonus = 0
			-- heal2FlatBonus   = 0
		end
		if powerFlatBonus ~= 0 or power2FlatBonus ~= 0 then
			if statsCheck_isPowerAppliable(uaAttackType1[id]) then
				uaBasePower1[id] = uaBasePower1[id] + powerFlatBonus
				powerFlatBonus  = 0
			end
			if leveledAttack2Id ~= aG000000000 and statsCheck_isPowerAppliable(uaAttackType2[id]) then
				uaBasePower2[id] = uaBasePower2[id] + power2FlatBonus
				power2FlatBonus = 0
			end
			-- powerFlatBonus  = 0
			-- power2FlatBonus = 0
		end
		
		if convertedAddedDamageAttack ~= nil then
			if healMod == 0 then
				if AttackTypeConversion_GetDamage(convertedAddedDamageAttack) ~= 0 then
					if leveledAttack2Id ~= aG000000000 and statsCheck_isDirectDmgType(uaAttackType2[id]) then
						if addedDamageAttackHasPercentValue then
							uaBaseDamage2[id] = uaBaseDamage2[id] + AttackTypeConversion_GetDamage(convertedAddedDamageAttack) * ( uaBaseDamage1[id] + uaBaseDamage2[id] )
						else
							uaBaseDamage2[id] = uaBaseDamage2[id] + AttackTypeConversion_GetDamage(convertedAddedDamageAttack)
						end
					elseif leveledAttack2Id ~= aG000000000 and statsCheck_isShatterType(uaAttackType2[id]) then
						if addedDamageAttackHasPercentValue then
							uaAddToShatterBaseDamage2[id] = uaAddToShatterBaseDamage2[id] + uaBaseDamage2[id] + AttackTypeConversion_GetDamage(convertedAddedDamageAttack)  * ( uaAddToShatterBaseDamage2[id] + uaBaseDamage1[id] + uaBaseDamage2[id] )
						else
							uaAddToShatterBaseDamage2[id] = uaAddToShatterBaseDamage2[id] + uaBaseDamage2[id] + AttackTypeConversion_GetDamage(convertedAddedDamageAttack)
						end
						uaBaseDamage2[id] = 0
					elseif statsCheck_isDirectDmgType(uaAttackType1[id]) then
						if addedDamageAttackHasPercentValue then
							uaBaseDamage1[id] = uaBaseDamage1[id] + AttackTypeConversion_GetDamage(convertedAddedDamageAttack) * ( uaBaseDamage1[id] + uaBaseDamage2[id] )
						
						else
							uaBaseDamage1[id] = uaBaseDamage1[id] + AttackTypeConversion_GetDamage(convertedAddedDamageAttack)
						end
					end
				end
			else
				if AttackTypeConversion_GetHeal(convertedAddedDamageAttack) ~= 0 then
					if leveledAttack2Id ~= aG000000000 and statsCheck_isHPRestoreType(uaAttackType2[id]) then
						if addedDamageAttackHasPercentValue then
							uaBaseHeal2[id] = uaBaseHeal2[id] + AttackTypeConversion_GetHeal(convertedAddedDamageAttack) * ( uaBaseHeal1[id] + uaBaseHeal2[id] )
						else
							uaBaseHeal2[id] = uaBaseHeal2[id] + AttackTypeConversion_GetHeal(convertedAddedDamageAttack)
						end
					elseif statsCheck_isHPRestoreType(uaAttackType1[id]) then
						if addedDamageAttackHasPercentValue then
							uaBaseHeal1[id] = uaBaseHeal1[id] + AttackTypeConversion_GetHeal(convertedAddedDamageAttack) * ( uaBaseHeal1[id] + uaBaseHeal2[id] )
						else
							uaBaseHeal1[id] = uaBaseHeal1[id] + AttackTypeConversion_GetHeal(convertedAddedDamageAttack)
						end
					end
				end
			end
		end
		
		if thaumaturgyMod > 0 then
			-- uaAttackType1[id] = Attack.DrainOverflow
			uaAttackName1[id], uaAttackName2[id] = AttackTypeConversion_Rename("x010tg1703", Attack.DrainOverflow, leveledAttack1, uaAttackType1[id], uaAttackType2[id], Attack2TypeBeforeConversion, uaAttackName1[id], uaAttackName2[id])
		elseif vampirismMod > 0 then
			-- uaAttackType1[id] = Attack.Drain
			uaAttackName1[id], uaAttackName2[id] = AttackTypeConversion_Rename("x000tg4037", Attack.Drain, leveledAttack1, uaAttackType1[id], uaAttackType2[id], Attack2TypeBeforeConversion, uaAttackName1[id], uaAttackName2[id])
		elseif damageMod > 0 then
			-- uaAttackType1[id] = Attack.Damage
			uaAttackName1[id], uaAttackName2[id] = AttackTypeConversion_Rename("x010tg1928", Attack.Damage, leveledAttack1, uaAttackType1[id], uaAttackType2[id], Attack2TypeBeforeConversion, uaAttackName1[id], uaAttackName2[id])
		elseif healMod > 0 then
			-- uaAttackType1[id] = Attack.Heal
			uaAttackName1[id], uaAttackName2[id] = AttackTypeConversion_Rename("x000tg5011", Attack.Heal, leveledAttack1, uaAttackType1[id], uaAttackType2[id], Attack2TypeBeforeConversion, uaAttackName1[id], uaAttackName2[id])
		end

		
	elseif addedDamageAttack ~= nil or drawnedDamageAttack2 ~= nil or drawnedHealAttack2 ~= nil then
		if statsCheck_isDirectDmgType(uaAttackType1[id]) then
			uaBaseDamage1[id] = uaBaseDamage1[id] + damageFlatBonus
		elseif leveledAttack2Id ~= aG000000000 and statsCheck_isDirectDmgType(uaAttackType2[id]) then
			uaBaseDamage2[id] = uaBaseDamage2[id] + damageFlatBonus
		elseif statsCheck_isHPRestoreType(uaAttackType1[id]) then
			uaBaseHeal1[id] = uaBaseHeal1[id] + healFlatBonus
		elseif leveledAttack2Id ~= aG000000000 and statsCheck_isHPRestoreType(uaAttackType2[id]) then
			uaBaseHeal2[id] = uaBaseHeal2[id] + healFlatBonus
		end
		if leveledAttack2Id ~= aG000000000 and statsCheck_isDirectDmgType(uaAttackType2[id]) then
			uaBaseDamage2[id] = uaBaseDamage2[id] + damage2FlatBonus
		elseif leveledAttack2Id ~= aG000000000 and statsCheck_isHPRestoreType(uaAttackType2[id]) then
			uaBaseHeal2[id] = uaBaseHeal2[id] + heal2FlatBonus
		end
		if statsCheck_isPowerAppliable(uaAttackType1[id]) then
			uaBasePower1[id] = uaBasePower1[id] + powerFlatBonus
		end
		if leveledAttack2Id ~= aG000000000 and statsCheck_isPowerAppliable(uaAttackType2[id]) then
			uaBasePower2[id] = uaBasePower2[id] + power2FlatBonus
		end
		damageFlatBonus  = 0
		healFlatBonus    = 0
		powerFlatBonus   = 0
		damage2FlatBonus = 0
		heal2FlatBonus   = 0
		power2FlatBonus  = 0
		if leveledAttack2Id == aG000000000 then
			if statsCheck_isDirectDmgType(uaAttackType1[id])
			or statsCheck_isCurseType(uaAttackType1[id])
			or statsCheck_isDoTType(uaAttackType1[id])
			or statsCheck_isShatterType(uaAttackType1[id]) then
				if statsCheck_isCurseType(uaAttackType1[id]) and ( uaAttackType1[id] ~= Attack.DrainLevel ) then
					addedDamageAttack = AttackTypeConversion_FilterDamagingAttack(uaAttackType1[id], addedDamageAttack)
					drawnedDamageAttack2 = AttackTypeConversion_FilterDamagingAttack(uaAttackType1[id], drawnedDamageAttack2)
				end
				if addedDamageAttack ~= nil and drawnedDamageAttack2 ~= nil then
					local addedDamageAttackClass    = AttackTypeConversion_GetClass(addedDamageAttack)
					local drawnedDamageAttack2Class = AttackTypeConversion_GetClass(drawnedDamageAttack2)
					if statsCheck_isDirectDmgType(addedDamageAttackClass) and statsCheck_isDirectDmgType(drawnedDamageAttack2Class) then
						leveledAttack2Id = _unitAura_AttackInfoToAttack2BaseStats(id, drawnedDamageAttack2, false, false)
						uaBaseDamage2[id] = AttackTypeConversion_GetDamage(drawnedDamageAttack2) + ( AttackTypeConversion_GetDamage(drawnedDamageAttack2) + uaBaseDamage1[id] ) * AttackTypeConversion_GetAverageDamage(addedDamageAttack)
					elseif statsCheck_isShatterType(addedDamageAttackClass) and statsCheck_isShatterType(drawnedDamageAttack2Class) then
						leveledAttack2Id = _unitAura_AttackInfoToAttack2BaseStats(id, drawnedDamageAttack2, false, false)
						uaBaseDamage2[id] = AttackTypeConversion_GetDamage(drawnedDamageAttack2) + uaBaseDamage1[id] * AttackTypeConversion_GetDamage(addedDamageAttack)
					elseif statsCheck_isDirectDmgType(uaAttackType1[id]) and
					    (  statsCheck_isDirectDmgType(addedDamageAttackClass)
					    or statsCheck_isDoTType(addedDamageAttackClass)
					    or statsCheck_isShatterType(addedDamageAttackClass) ) then
						uaBaseDamage1[id] = uaBaseDamage1[id] * ( 1 + AttackTypeConversion_GetAverageDamage(addedDamageAttack) )
						leveledAttack2Id = _unitAura_AttackInfoToAttack2BaseStats(id, drawnedDamageAttack2, true, false)
					else
						leveledAttack2Id = _unitAura_AttackInfoToAttack2BaseStats(id, addedDamageAttack, false, false)
						uaBaseDamage2[id] = AttackTypeConversion_GetDamage(addedDamageAttack) * uaBaseDamage1[id]
					end
				elseif addedDamageAttack ~= nil then
					leveledAttack2Id = _unitAura_AttackInfoToAttack2BaseStats(id, addedDamageAttack, false, false)
					uaBaseDamage2[id] = AttackTypeConversion_GetDamage(addedDamageAttack) * uaBaseDamage1[id]
				elseif drawnedDamageAttack2 ~= nil then
					leveledAttack2Id = _unitAura_AttackInfoToAttack2BaseStats(id, drawnedDamageAttack2, true, false)
				end
			elseif statsCheck_isHealType(uaAttackType1[id]) then
				if drawnedHealAttack2 ~= nil then
					if uaAttackType1[id] ~= AttackTypeConversion_GetClass(drawnedHealAttack2) or uaAttackType1[id] == Attack.GiveAttack then
						leveledAttack2Id = _unitAura_AttackInfoToAttack2BaseStats(id, drawnedHealAttack2, false, true)
					end
				end
			end
		else
			local addedDmgSum = 0
			local addedHealSum = 0
			if addedDamageAttack ~= nil then
				local addedDamageAttackClass = AttackTypeConversion_GetClass(addedDamageAttack)
				if statsCheck_isDirectDmgType(addedDamageAttackClass)
				or statsCheck_isDoTType(addedDamageAttackClass)
				or statsCheck_isShatterType(addedDamageAttackClass) then
					addedDmgSum = addedDmgSum + ( uaBaseDamage1[id] + uaBaseDamage2[id] ) * AttackTypeConversion_GetAverageDamage(addedDamageAttack)
				end
			end
			if drawnedDamageAttack2 ~= nil then
				local drawnedDamageAttack2Class = AttackTypeConversion_GetClass(drawnedDamageAttack2)
				if statsCheck_isDirectDmgType(drawnedDamageAttack2Class)
				or statsCheck_isDoTType(drawnedDamageAttack2Class)
				or statsCheck_isShatterType(drawnedDamageAttack2Class) then
					addedDmgSum = addedDmgSum + AttackTypeConversion_GetAverageDamage(drawnedDamageAttack2)
				end
			end
			if drawnedHealAttack2 ~= nil then
				if statsCheck_isHPRestoreType(AttackTypeConversion_GetClass(drawnedHealAttack2)) then
					addedHealSum = addedHealSum + AttackTypeConversion_GetHeal(drawnedHealAttack2)
				end
			end
	
			if statsCheck_isShatterType(uaAttackType2[id]) and addedDamageAttack ~= nil and statsCheck_isShatterType(AttackTypeConversion_GetClass(addedDamageAttack)) then
				uaAddToShatterBaseDamage2[id] = uaAddToShatterBaseDamage2[id] + addedDmgSum			
			-- elseif drawnedDamageAttack2 ~= nil and statsCheck_isShatterType(AttackTypeConversion_GetClass(drawnedDamageAttack2)) and addedDamageAttack ~= nil and statsCheck_isShatterType(AttackTypeConversion_GetClass(addedDamageAttack)) then
			--	uaAddToShatterBaseDamage2[id] = uaAddToShatterBaseDamage2[id] + addedDmgSum
			elseif statsCheck_isDirectDmgType(uaAttackType2[id]) then
				uaBaseDamage2[id] = uaBaseDamage2[id] + addedDmgSum
			elseif statsCheck_isDirectDmgType(uaAttackType1[id]) then
				uaBaseDamage1[id] = uaBaseDamage1[id] + addedDmgSum
			elseif statsCheck_isHPRestoreType(uaAttackType2[id]) then
				uaBaseHeal2[id] = uaBaseHeal2[id] + addedHealSum
			elseif statsCheck_isHPRestoreType(uaAttackType1[id]) then
				uaBaseHeal1[id] = uaBaseHeal1[id] + addedHealSum
			end
		end
		
	else
		-- ��� ����������� ��� ������������ �����
		if statsCheck_isDirectDmgType(uaAttackType1[id]) then
			uaBaseDamage1[id] = uaBaseDamage1[id] + damageFlatBonus
			damageFlatBonus = 0
		end
		if leveledAttack2Id ~= aG000000000 and statsCheck_isDirectDmgType(uaAttackType2[id]) then
			uaBaseDamage2[id] = uaBaseDamage2[id] + damageFlatBonus
			damageFlatBonus = 0
		end
		if statsCheck_isHPRestoreType(uaAttackType1[id]) then
			uaBaseHeal1[id] = uaBaseHeal1[id] + healFlatBonus
			healFlatBonus = 0
		end
		if leveledAttack2Id ~= aG000000000 and statsCheck_isHPRestoreType(uaAttackType2[id]) then
			uaBaseHeal2[id] = uaBaseHeal2[id] + healFlatBonus
			healFlatBonus = 0
		end
		if leveledAttack2Id ~= aG000000000 and statsCheck_isDirectDmgType(uaAttackType2[id]) then
			uaBaseDamage2[id] = uaBaseDamage2[id] + damage2FlatBonus
			damage2FlatBonus = 0
		end
		if leveledAttack2Id ~= aG000000000 and statsCheck_isHPRestoreType(uaAttackType2[id]) then
			uaBaseHeal2[id] = uaBaseHeal2[id] + heal2FlatBonus
			heal2FlatBonus = 0
		end
		if statsCheck_isPowerAppliable(uaAttackType1[id]) then
			uaBasePower1[id] = uaBasePower1[id] + powerFlatBonus
			powerFlatBonus = 0
		end
		if leveledAttack2Id ~= aG000000000 and statsCheck_isPowerAppliable(uaAttackType2[id]) then
			uaBasePower2[id] = uaBasePower2[id] + power2FlatBonus
			power2FlatBonus = 0
		end
		damageFlatBonus = 0
		healFlatBonus   = 0
		powerFlatBonus  = 0
		damage2FlatBonus = 0
		heal2FlatBonus   = 0
		power2FlatBonus = 0
	end
	
	-------------------------------------------
	
	uaAttack2Id[id] = leveledAttack2Id
	
	-------------------------------------------
	
	if _GroupInfo_UnitModifierAmount(unitMods, small_enth_leveling_mod) > 0 then
		local smallEnth_Multiplier = _smallEnthInfo_aBaseDamageMultiplier(unit)
		uaBaseDamage1[id] = uaBaseDamage1[id] * smallEnth_Multiplier
		uaBaseDamage2[id] = uaBaseDamage2[id] * smallEnth_Multiplier
		uaBaseHeal1[id] = uaBaseHeal1[id] * smallEnth_Multiplier
		uaBaseHeal2[id] = uaBaseHeal2[id] * smallEnth_Multiplier
	end

	if _GroupInfo_UnitModifierAmount(unitMods, linaret_mod) > 0 and unit.original == nil and unit.impl.small then
		uaAttack2Id[id] = aG000000000
		leveledAttack1Id = aRangedDoppelganger
		if statsCheck_isHealType(uaAttackType1[id]) or statsCheck_isSummonType(uaAttackType1[id]) then
			local generatedAttackInfo = AttackTypeConversion_MakeAttackInfo(nil, 0, 0, 0, uaBasePower1[id], false, nil, true)
			local generatedDmgAttack = AttackTypeConversion_GenDamage(unit, generatedAttackInfo)
			uaAttackType1[id] = Attack.Damage
			uaBaseDamage1[id] = AttackTypeConversion_GetDamage(generatedDmgAttack)
			uaBasePower1[id] = AttackTypeConversion_GetPower(generatedDmgAttack)
		end
	end

	svSetApplyDamageSpreadChanceShift1(unit, false)
	svSetApplyDamageSpreadChanceShift2(unit, false)
	if uaBasePower1[id] > 0 then
		uaBasePower1[id] = uaBasePower1[id] 
				 * _mapMultipliers_Power1_Multi(unit)
				 * ( 1 + 0.1 * ( _GroupInfo_UnitModifierAmount(unitMods, G201UM9338) - _GroupInfo_UnitModifierAmount(unitMods, G201UM9340) ) )
		uaBasePower1[id] = _valueCap_CheckMaxAccuracy(unit, _valueCap_GetInt(uaBasePower1[id]))
	end
	if uaBasePower2[id] > 0 then
		uaBasePower2[id] = uaBasePower2[id] 
				 * _mapMultipliers_Power2_Multi(unit)
				 * ( 1 + 0.1 * ( _GroupInfo_UnitModifierAmount(unitMods, G201UM9339) - _GroupInfo_UnitModifierAmount(unitMods, G201UM9341) ) )
		uaBasePower2[id] = _valueCap_CheckMaxAccuracy(unit, _valueCap_GetInt(uaBasePower2[id]))
	end
	if uaBaseDamage1[id] > 0 then
		uaBaseDamage1[id] = uaBaseDamage1[id] 
				  * _mapMultipliers_Damage1_Multi(unit)
				  * ( 1 + 0.1 * ( _GroupInfo_UnitModifierAmount(unitMods, G201UM9342) - _GroupInfo_UnitModifierAmount(unitMods, G201UM9344) ) )
		if workshopEnabled then
			local applyDamageSpread1
			uaBaseDamage1[id], uaBasePower1[id], applyDamageSpread1 = Workshop_Mechanics_DamageSpread(scenario, unit, true, uaBaseDamage1[id], uaBasePower1[id], uaAttackType1[id], 1)
			svSetApplyDamageSpreadChanceShift1(unit, applyDamageSpread1)
		end
		uaBaseDamage1[id] = _valueCap_CheckMaxDamage(unit, _valueCap_GetInt(uaBaseDamage1[id]))
	end
	if uaBaseDamage2[id] > 0 then
		uaBaseDamage2[id] = uaBaseDamage2[id] 
				  * _mapMultipliers_Damage2_Multi(unit)
				  * ( 1 + 0.1 * ( _GroupInfo_UnitModifierAmount(unitMods, G201UM9343) - _GroupInfo_UnitModifierAmount(unitMods, G201UM9345) ) )
		if workshopEnabled then
			local applyDamageSpread2
			uaBaseDamage2[id], uaBasePower2[id], applyDamageSpread2 = Workshop_Mechanics_DamageSpread(scenario, unit, true, uaBaseDamage2[id], uaBasePower2[id], uaAttackType2[id], 2)
			svSetApplyDamageSpreadChanceShift2(unit, applyDamageSpread2)
		end
		uaBaseDamage2[id] = _valueCap_CheckMaxDamage(unit, _valueCap_GetInt(uaBaseDamage2[id]))
	end
	if uaBaseHeal1[id] > 0 then
		uaBaseHeal1[id] = uaBaseHeal1[id] 
				* _mapMultipliers_Heal1_Multi(unit)
				* ( 1 + 0.1 * ( _GroupInfo_UnitModifierAmount(unitMods, G201UM9346) - _GroupInfo_UnitModifierAmount(unitMods, G201UM9347) ) )
		if workshopEnabled then
			uaBaseHeal1[id] = Workshop_Mechanics_HealSpread(scenario, unit, true, uaBaseHeal1[id])
		end
		uaBaseHeal1[id] = _valueCap_CheckMaxHeal(unit, _valueCap_GetInt(uaBaseHeal1[id]))
	end
	if uaBaseHeal2[id] > 0 then
		uaBaseHeal2[id] = uaBaseHeal2[id] 
				* _mapMultipliers_Heal2_Multi(unit)
				* ( 1 + 0.1 * ( _GroupInfo_UnitModifierAmount(unitMods, G201UM9346) - _GroupInfo_UnitModifierAmount(unitMods, G201UM9347) ) )
		if workshopEnabled then
			uaBaseHeal2[id] = Workshop_Mechanics_HealSpread(scenario, unit, true, uaBaseHeal2[id])
		end
		uaBaseHeal2[id] = _valueCap_CheckMaxHeal(unit, _valueCap_GetInt(uaBaseHeal2[id]))
	end
	
	if unit.leveledImpl.altAttack ~= nil then
		return unit.leveledImpl.attack1.id
	end
	return leveledAttack1Id
end
function _unitAura_AttackInfoToAttack1BaseStats(id, ainfo, setDamage, setHeal)
	uaAttackName1[id] = nil
	if setDamage then
		uaBaseDamage1[id] = AttackTypeConversion_GetDamage(ainfo)
	end
	if setHeal then
		uaBaseHeal1[id] = AttackTypeConversion_GetHeal(ainfo)
	end
	uaBasePower1[id]  = AttackTypeConversion_GetPower(ainfo)
	uaAttackType1[id] = AttackTypeConversion_GetClass(ainfo)
	uaAttackSplit1[id] = AttackTypeConversion_GetSplit(ainfo)
	return AttackTypeConversion_GetAttackId(ainfo)
end
function _unitAura_AttackInfoToAttack2BaseStats(id, ainfo, setDamage, setHeal)
	uaAttackName2[id] = nil
	if setDamage then
		uaBaseDamage2[id] = AttackTypeConversion_GetDamage(ainfo)
	end
	if setHeal then
		uaBaseHeal2[id] = AttackTypeConversion_GetHeal(ainfo)
	end
	uaBasePower2[id]  = AttackTypeConversion_GetPower(ainfo)
	uaAttackType2[id] = AttackTypeConversion_GetClass(ainfo)
	uaAttackSplit2[id] = AttackTypeConversion_GetSplit(ainfo)
	return AttackTypeConversion_GetAttackId(ainfo)
end

uaAttack2Id  = {}
function _unitAura_Attack2Id(unit, prev)
	local id = unit.id.value
	if uaAttack2Id[id] ~= nil then
		return uaAttack2Id[id]
	end
	return prev
end


uaNewDamage1  = {}
uaBaseDamage1 = {}
function _unitAura_SetNewDamage1(unit, value)
	local id = unit.id.value
	uaNewDamage1[id] = _valueCap_CheckMaxDamage(unit, _unitAura_SetMax(uaNewDamage1[id], value))
	return 0
end
function _unitAura_GetBaseDamage1(unitValueID)
	return uaBaseDamage1[unitValueID]
end

uaNewHeal1  = {}
uaBaseHeal1 = {}
function _unitAura_SetNewHeal1(unit, value)
	local id = unit.id.value
	uaNewHeal1[id] = _valueCap_CheckMaxHeal(unit, _unitAura_SetMax(uaNewHeal1[id], value))
	return 0
end
function _unitAura_GetBaseHeal1(unitValueID)
	return uaBaseHeal1[unitValueID]
end

uaNewPower1  = {}
uaBasePower1 = {}
function _unitAura_SetNewPower1(unit, value)
	local id = unit.id.value
	uaNewPower1[id] = _valueCap_CheckMaxAccuracy(unit, _unitAura_SetMax(uaNewPower1[id], value))
	return 0
end
function _unitAura_GetBasePower1(unitValueID)
	return uaBasePower1[unitValueID]
end

uaNewDamage2  = {}
uaBaseDamage2 = {}
function _unitAura_SetNewDamage2(unit, value)
	local id = unit.id.value
	uaNewDamage2[id] = _valueCap_CheckMaxDamage(unit, _unitAura_SetMax(uaNewDamage2[id], value))
	return 0
end
function _unitAura_GetBaseDamage2(unitValueID)
	return uaBaseDamage2[unitValueID]
end

uaNewHeal2  = {}
uaBaseHeal2 = {}
function _unitAura_SetNewHeal2(unit, value)
	local id = unit.id.value
	uaNewHeal2[id] = _valueCap_CheckMaxHeal(unit, _unitAura_SetMax(uaNewHeal2[id], value))
	return 0
end
function _unitAura_GetBaseHeal2(unitValueID)
	return uaBaseHeal2[unitValueID]
end

uaNewPower2  = {}
uaBasePower2 = {}
function _unitAura_SetNewPower2(unit, value)
	local id = unit.id.value
	uaNewPower2[id] = _valueCap_CheckMaxAccuracy(unit, _unitAura_SetMax(uaNewPower2[id], value))
	return 0
end
function _unitAura_GetBasePower2(unitValueID)
	return uaBasePower2[unitValueID]
end

uaNewRegen  = {}
uaBaseRegen = {}
function _unitAura_SetNewRegen(unit, value)
	local id = unit.id.value
	uaNewRegen[id] = _unitAura_SetMax(uaNewRegen[id], value)
	return 0
end
function _unitAura_GetBaseRegen(unitValueID)
	return uaBaseRegen[unitValueID]
end

uaNewArmor  = {}
uaBaseArmor = {}
function _unitAura_SetNewArmor(unit, value)
	local id = unit.id.value
	uaNewArmor[id] = _unitAura_SetMax(uaNewArmor[id], value)
	return 0
end
function _unitAura_GetBaseArmor(unitValueID)
	return uaBaseArmor[unitValueID]
end

uaNewInitiative  = {}
uaBaseInitiative = {}
function _unitAura_SetNewInitiative(unit, value)
	local id = unit.id.value
	uaNewInitiative[id] = _valueCap_CheckMaxInitiative(unit, _unitAura_SetMax(uaNewInitiative[id], value))
	return 0
end
function _unitAura_GetBaseInitiative(unitValueID)
	return uaBaseInitiative[unitValueID]
end

uaNewXpKilled  = {}
uaBaseXpKilled = {}
function _unitAura_SetNewXpKilled(unit, value)
	local id = unit.id.value
	uaNewXpKilled[id] = _valueCap_XpKilled(unit, _unitAura_SetMax(uaNewXpKilled[id], value))
	return 0
end
function _unitAura_GetBaseXpKilled(unitValueID)
	return uaBaseXpKilled[unitValueID]
end

uaNewNegotiate  = {}
uaBaseNegotiate = {}
function _unitAura_SetNewNegotiate(unit, value)
	local id = unit.id.value
	uaNewNegotiate[id] = _unitAura_SetMax(uaNewNegotiate[id], value)
	return 0
end
function _unitAura_GetBaseNegotiate(unitValueID)
	return uaBaseNegotiate[unitValueID]
end

uaNewHitPoint  = {}
uaBaseHitPoint = {}
function _unitAura_SetNewHitPoint(unit, value)
	local id = unit.id.value
	uaNewHitPoint[id] = _valueCap_CheckMaxHitPoint(unit, _unitAura_SetMax(uaNewHitPoint[id], value))
	return 0
end
function _unitAura_GetBaseHitPoint(unitValueID)
	return uaBaseHitPoint[unitValueID]
end

function _unitAura_SetNewClear(unitIDValue)
	uaNewRegen[unitIDValue] = nil
	uaNewArmor[unitIDValue] = nil
	uaNewDamage1[unitIDValue] = nil
	uaNewHeal1[unitIDValue] = nil
	uaNewPower1[unitIDValue] = nil
	uaNewDamage2[unitIDValue] = nil
	uaNewHeal2[unitIDValue] = nil
	uaNewPower2[unitIDValue] = nil
	uaNewInitiative[unitIDValue] = nil
	uaNewXpKilled[unitIDValue] = nil
	uaNewHitPoint[unitIDValue] = nil
	return 0
end
function _unitAura_SetMax(oldValue, newValue)
	if oldValue == nil then
		return newValue
	elseif newValue == nil then
		return newValue
	else
		return math.max(oldValue, newValue)
	end
end

scenario = nil
function _unitAura_SetScenario(scen)
	scenario = scen
	_mapMultipliers_SetScenario(scen)
	if smnsEnabled then
		_smnsAura_SetScenario(scen)
	end
	return _GroupInfo_SetScenario(scen)
end
function _unitAura_GetScenario()
	return scenario
end

uaHitPoint_valPercent5               = {G040UM0144, G040UM0145, G040UM0146, G040UM0149, G201UM9175}
uaHitPoint_valFlat5                  = {G040UM0141, G201UM9169}
uaHitPoint_valFlat10                 = {G040UM0142}
uaHitPoint_valFlat25                 = {G040UM0143}
uaRegen_valFlat5                     = {G040UM0108, G040UM0109, G040UM0110, G201UM9171, G040UM0312}
uaRegen_valFlat10                    = {G040UM0150, G040UM0313}
uaArmor_valFlat5                     = {G040UM0100, G040UM0120, G040UM0121, G040UM0122, G040UM0151, G201UM9166}
uaAttackInitiative_valPercent5       = {G040UM0117, G040UM0118, G040UM0119, G040UM0152, G201UM9168}
uaAttackInitiative_valPercent10      = {G040UM0257}
uaAttackDamageHeal_valPercent5       = {G040UM0111, G040UM0112, G040UM0113, G040UM0148, G201UM9167}
uaAttackDamageHeal_valPercent20      = {G040UM0239}
uaAttackDamageHeal_valPercent25      = {G040UM0238}
uaAttackPower_valPercent5            = {G040UM0114, G040UM0115, G040UM0116, G040UM0147, G201UM9176}
uaAttackPower_valPercent5_ranged     = {G040UM0067}
uaAttackDrain_valFlat10              = {G040UM0139, G040UM0240, G201UM9170}
uaAttackDrain_valFlat20              = {G040UM0140}
uaAttackDrain_valFlat35              = {G040UM0237}
uaAttackCrit_valFlat5                = {G040UM0188, G040UM0189, G040UM0190, G201UM9172, G040UM0251}
uaAttackCrit_valFlat10               = {G040UM0191}
umAttackProtection5                  = {G201UM9245}
umAttackProtection25                 = {G040UM0164, G040UM0168, G040UM0171, G040UM0192, G040UM0224, G201UM9182}
umAttackProtection35                 = {G070UM0017}
umAttackProtection50                 = {G040UM0165, G040UM0169, G040UM0172, G040UM0174, G040UM0319}
umAttackProtection75                 = {G040UM0166, G040UM0170, G040UM0173}
umAttackProtection100                = {G040UM0167}
umAttackProtectionIgnorance          = {G040UM0282, G040UM0320}
umSummonBonusLevel1                  = {G040UM0182}
umSummonBonusLevel2                  = {G040UM0183}
umSummonBonusLevel3                  = {G040UM0184}
umSummonBonusLevel4                  = {G040UM0185}
umSummonBonusLevel5                  = {G040UM0186}
uaSummonTransform_valFlat1           = {G040UM0208, G040UM0212, G040UM0213, G040UM0214, G201UM9173}
uaSummonTransform_valFlat2           = {G040UM0210, G040UM0211}
uaExpKill_valFlat10m                 = {G201UM9165}
uaExpKill_valFlat25m                 = {}
uaExpKill_valFlat10                  = {G040UM0215, G040UM0217, G040UM0048}
uaExpKill_valFlat15                  = {G040UM0216, G040UM0218, G000UM4012, G201UM9164, G201UM9040}
uaExpKill_valFlat25                  = {}
uaExpKill_valFlatSpellDebuff25       = {G040UM0194}
uaCurseProtection_valCovered1        = {G040UM0163, G040UM0223, G201UM9174}
uaArmorFlat_valCovered10             = {G040UM0227, G040UM0228, G201UM9183}
uaArmorFlat_valCovered15             = {G040UM0225}
uaArmorFlat_valCovered20             = {G040UM0226}
uaBlisterResist                      = {G040UM0101, G201UM9177}
uaFrostbiteResist                    = {G040UM0102, G201UM9178}
uaPoisonResist                       = {G040UM0103, G201UM9179}
uaLowerDamageResist                  = {G040UM0105, G201UM9180}
uaLowerInitiativeResist              = {G040UM0104, G201UM9181}
uaFearResist 		             = {}
uaPetrifyResist 		     = {}
umPerLostHP_Armor1                   = {G201UM9184}
umPerLostHP_AttackInitiative1        = {G201UM9185}
umPerLostHP_AttackDamageHeal1        = {G201UM9186}
umPerLostHP_AttackPower1             = {G201UM9187}
umPerLostHP_AttackDrain1             = {G201UM9188, G040UM0181}
umPerLostHP_AttackCrit1              = {G201UM9189}
umPerLostHP_DoubleAttack1            = {G201UM9190}
umAttackDamageInitiativeOnFullLife10 = {G201UM9191}
umAttackLessPowerOnFullLife10        = {G201UM9192}
umAttackLessDamageOnFullLife10       = {G201UM9285, G040UM0311}
umArmorOnFullLife10		     = {G201UM9282, G040UM0309}
umArmorOnFullLife20		     = {G040UM0345}
umAttackProtectionOnFullLife25       = {G201UM9283}
umAttackProtectionOnFullLife50       = {G040UM0310}
umAttackProtectionOnFullLife75       = {G040UM0308}
umAttackProtectionOnFullLife100      = {}
umAttackProtectionPerLevel1          = {G201UM9284}
umCowardiceBig                       = {G201UM9193, G040UM0242}
umVampirismPerCorpse                 = {G201UM9222, G040UM0013, G040UM0268}
umHitPointPerCorpse                  = {G201UM9242, G040UM0269}
umCannibalism10                      = {G201UM9194}
uaArmorFlat_valNearest5              = {G040UM0249}
umDrainLevelResistance50             = {G040UM0266, G040UM0267, G201UM9241, G040UM0306, G014UM1065}
umDrainLevelResistance75             = {G040UM0305}
uaHitPointOnDeath_valPercent10       = {G201UM9244}
uaHitPointOnDeath_valPercent20       = {G040UM0271}
uaAttackDrainOnDeath_valPercent10    = {G201UM9243}
uaAttackDrainOnDeath_valPercent20    = {G040UM0270}
umMaxAttackCritDamage5		     = {G201UM9301}
umMaxAttackCritDamage10		     = {}
umMaxAttackCritDamage25		     = {G040UM0317}
umMaxAttackCritDamage50		     = {G040UM0318}
umMaxAttackCritDamage75		     = {G040UM0321}
umSpellDebuffResistance10	     = {G201UM9352, G040UM0327, blessedbracelet_mod}
umSpellDebuffResistance20	     = {G040UM0322}
umSpellDebuffResistance30	     = {G040UM0323, perseverancebreastplate_mod}
umSpellDebuffResistance50	     = {G040UM0331, puritytiara_mod}
uaSpellDebuffResistance10	     = {G201UM9353, G040UM0324, G040UM0328, G040UM0329}
uaSpellDebuffResistance20	     = {G040UM0325, G040UM0330}
umSplashDamage5                      = {G201UM9354}
umSplashDamage5m                     = {G201UM9355}

function _unitAura_HitPoint_valPercent(unit)
	local warmasterSet = 0
	if _GroupInfo_stackHasModifierAmount(warmasterhelmet_mod) > 0 then
		local stack = _GroupInfo_getUnitStack(unit)
		if stack:getEquippedItem(Equipment.Banner) ~= nil then
			warmasterSet = 5
		end
	end
	local mjolnirSet = 0
	if _GroupInfo_stackHasModifierAmount(mjolnircrown_mod) > 0 then
		local stack = _GroupInfo_getUnitStack(unit)
		if stack:getEquippedItem(Equipment.Banner) ~= nil then
			mjolnirSet = 10
		end
	end
	return _unitAura_EffectSumStack(uaHitPoint_valPercent5, 5)
	     + warmasterSet
	     + mjolnirSet
end
function _unitAura_HitPoint_txtPercent(unit, unitMods)
	local warmasterSet = 0
	if _GroupInfo_UnitModifierAmount(unitMods, warmasterhelmet_mod) > 0 then
		local stack = _GroupInfo_getUnitStack(unit)
		if stack:getEquippedItem(Equipment.Banner) ~= nil then
			warmasterSet = 5
		end
	end
	local mjolnirSet = 0
	if _GroupInfo_UnitModifierAmount(unitMods, mjolnircrown_mod) > 0 then
		local stack = _GroupInfo_getUnitStack(unit)
		if stack:getEquippedItem(Equipment.Banner) ~= nil then
			mjolnirSet = 10
		end
	end
	return _unitAura_EffectSumUnit(unitMods, uaHitPoint_valPercent5, 5)
	     + warmasterSet
	     + mjolnirSet
end
function _unitAura_HitPoint_cntPercent(unit, unitMods)
	local warmasterSet = 0
	if _GroupInfo_UnitModifierAmount(unitMods, warmasterhelmet_mod) > 0 then
		local stack = _GroupInfo_getUnitStack(unit)
		if stack:getEquippedItem(Equipment.Banner) ~= nil then
			warmasterSet = 1
		end
	end
	local mjolnirSet = 0
	if _GroupInfo_UnitModifierAmount(unitMods, mjolnircrown_mod) > 0 then
		local stack = _GroupInfo_getUnitStack(unit)
		if stack:getEquippedItem(Equipment.Banner) ~= nil then
			mjolnirSet = 1
		end
	end
	return _unitAura_EffectSumUnit(unitMods, uaHitPoint_valPercent5, 1)
	     + warmasterSet
	     + mjolnirSet
end

function _unitAura_HitPoint_valFlat(unit)
	return _unitAura_EffectSumStack(uaHitPoint_valFlat5, 5)
	     + _unitAura_EffectSumStack(uaHitPoint_valFlat10, 10)
	     + _unitAura_EffectSumStack(uaHitPoint_valFlat25, 25)
end
function _unitAura_HitPoint_txtFlat(unit, unitMods)
	return _unitAura_EffectSumUnit(unitMods, uaHitPoint_valFlat5, 5)
	     + _unitAura_EffectSumUnit(unitMods, uaHitPoint_valFlat10, 10)
	     + _unitAura_EffectSumUnit(unitMods, uaHitPoint_valFlat25, 25)
end
function _unitAura_HitPoint_cntFlat(unit, unitMods)
	return _unitAura_EffectSumUnit(unitMods, uaHitPoint_valFlat5, 1)
	     + _unitAura_EffectSumUnit(unitMods, uaHitPoint_valFlat10, 1)
	     + _unitAura_EffectSumUnit(unitMods, uaHitPoint_valFlat25, 1)
end

function _unitAura_Regen_valFlat(unit)
	local harvestSet = 0
	if _GroupInfo_stackHasModifierAmount(harvestarmor_mod) > 0 and
	   _GroupInfo_stackHasModifierAmount(harvestcup_mod) > 0 and
	   _GroupInfo_stackHasModifierAmount(harvestdagger_mod) > 0 then
		harvestSet = gameConsdtants_harvestSet_Regen
	end
	local runeset = 0
	if _GroupInfo_stackHasModifierAmount(runicshield_mod) > 0 and
	   _GroupInfo_stackHasModifierAmount(runestone_mod) > 0 then
		runeset = 5
	end
	local bootsofhomelands = 0
	if _GroupInfo_stackHasModifierAmount(bootsofhomelands_mod) > 0 then
		local stack = _GroupInfo_getUnitStack(unit)
		if stack ~= nil then
			local player = stack.owner
			if player ~= nil then
				local pos = stack.position
				local tile = scenario:getTile(pos.x, pos.y)
				if _terrainToPlayerRace[tile.terrain] ~= player.race then
					bootsofhomelands = 10
				end
			end
		end
	end
	return _unitAura_EffectSumStack(uaRegen_valFlat5, 5)
	     + _unitAura_EffectSumStack(uaRegen_valFlat10, 10)
	     + harvestSet
	     + runeset
	     + bootsofhomelands
end
function _unitAura_Regen_txtFlat(unit, unitMods)
	local harvestSet = 0
	if _GroupInfo_UnitModifierAmount(unitMods, harvestarmor_mod) > 0 and
	   _GroupInfo_UnitModifierAmount(unitMods, harvestcup_mod) > 0 and
	   _GroupInfo_UnitModifierAmount(unitMods, harvestdagger_mod) > 0 then
		harvestSet = gameConsdtants_harvestSet_Regen
	end
	local runeset = 0
	if _GroupInfo_UnitModifierAmount(unitMods, runicshield_mod) > 0 and
	   _GroupInfo_UnitModifierAmount(unitMods, runestone_mod) > 0 then
		runeset = 5
	end
	local bootsofhomelands = 0
	if _GroupInfo_UnitModifierAmount(unitMods, bootsofhomelands_mod) > 0 then
		local stack = _GroupInfo_getUnitStack(unit)
		if stack ~= nil then
			local player = stack.owner
			if player ~= nil then
				local pos = stack.position
				local tile = scenario:getTile(pos.x, pos.y)
				if _terrainToPlayerRace[tile.terrain] ~= player.race then
					bootsofhomelands = 10
				end
			end
		end
	end
	return _unitAura_EffectSumUnit(unitMods, uaRegen_valFlat5, 5)
	     + _unitAura_EffectSumUnit(unitMods, uaRegen_valFlat10, 10)
	     + harvestSet
	     + runeset
	     + bootsofhomelands
end
function _unitAura_Regen_cntFlat(unit, unitMods)
	local harvestSet = _GroupInfo_UnitModifierAmount(unitMods, harvestdagger_mod)
	local runeset = _GroupInfo_UnitModifierAmount(unitMods, runestone_mod)
	local bootsofhomelands = _GroupInfo_UnitModifierAmount(unitMods, bootsofhomelands_mod)
	return _unitAura_EffectSumUnit(unitMods, uaRegen_valFlat5, 1)
	     + _unitAura_EffectSumUnit(unitMods, uaRegen_valFlat10, 1)
	     + harvestSet
	     + runeset
	     + bootsofhomelands
end

function _unitAura_Armor_valFlat(unit)
	local holyset = 0
	if _GroupInfo_stackHasModifierAmount(holychalice_mod) > 0 and
	   _GroupInfo_stackHasModifierAmount(saintblood_mod) > 0 then
		holyset = 5
	end
	return _unitAura_EffectSumStack(uaArmor_valFlat5, 5)
	     + holyset
end
function _unitAura_Armor_txtFlat(unit, unitMods)
	local holyset = 0
	if _GroupInfo_UnitModifierAmount(unitMods, holychalice_mod) > 0 and
	   _GroupInfo_UnitModifierAmount(unitMods, saintblood_mod) > 0 then
		holyset = 5
	end
	return _unitAura_EffectSumUnit(unitMods, uaArmor_valFlat5, 5)
	     + holyset
end
function _unitAura_Armor_cntFlat(unit, unitMods)
	local holyset = _GroupInfo_UnitModifierAmount(unitMods, holychalice_mod)
	return _unitAura_EffectSumUnit(unitMods, uaArmor_valFlat5, 1)
	     + holyset
end

function _unitAura_AttackInitiative_valPercent(unit)
	return _unitAura_EffectSumStack(uaAttackInitiative_valPercent5, 5)
	     + _unitAura_EffectSumStack(uaAttackInitiative_valPercent10, 10)
end
function _unitAura_AttackInitiative_txtPercent(unit, unitMods)
	return _unitAura_EffectSumUnit(unitMods, uaAttackInitiative_valPercent5, 5)
	     + _unitAura_EffectSumUnit(unitMods, uaAttackInitiative_valPercent10, 10)
end
function _unitAura_AttackInitiative_cntPercent(unit, unitMods)
	return _unitAura_EffectSumUnit(unitMods, uaAttackInitiative_valPercent5, 1)
	     + _unitAura_EffectSumUnit(unitMods, uaAttackInitiative_valPercent10, 1)
end

function _unitAura_AttackDamageHeal_valPercent(unit)
	local skullset = 0
	if _GroupInfo_stackHasModifierAmount(devilchalice_mod) > 0 and
	   _GroupInfo_stackHasModifierAmount(skullbracers_mod) > 0 then
		skullset = 5
	end
	local damnedset = 0
	if _GroupInfo_stackHasModifierAmount(helmetofthedamned_mod) > 0 and
	   _GroupInfo_stackHasModifierAmount(overlordblood_mod) > 0 and
	   _GroupInfo_stackHasModifierAmount(bladeofexalted_mod) > 0 then
		damnedset = 10
	end
	return _unitAura_EffectSumStack(uaAttackDamageHeal_valPercent5, 5)
	     + _unitAura_EffectSumStack(uaAttackDamageHeal_valPercent20, 20)
	     + _unitAura_EffectSumStack(uaAttackDamageHeal_valPercent25, 25)
	     + skullset
	     + damnedset
end
function _unitAura_AttackDamageHeal_txtPercent(unit, unitMods)
	local skullset = 0
	if _GroupInfo_UnitModifierAmount(unitMods, devilchalice_mod) > 0 and
	   _GroupInfo_UnitModifierAmount(unitMods, skullbracers_mod) > 0 then
		skullset = 5
	end
	local damnedset = 0
	if _GroupInfo_UnitModifierAmount(unitMods, helmetofthedamned_mod) > 0 and
	   _GroupInfo_UnitModifierAmount(unitMods, overlordblood_mod) > 0 and
	   _GroupInfo_UnitModifierAmount(unitMods, bladeofexalted_mod) > 0 then
		damnedset = 10
	end
	return _unitAura_EffectSumUnit(unitMods, uaAttackDamageHeal_valPercent5, 5)
	     + _unitAura_EffectSumUnit(unitMods, uaAttackDamageHeal_valPercent20, 20)
	     + _unitAura_EffectSumUnit(unitMods, uaAttackDamageHeal_valPercent25, 25)
	     + skullset
	     + damnedset
end
function _unitAura_AttackDamageHeal_cntPercent(unit, unitMods)
	local skullset = _GroupInfo_UnitModifierAmount(unitMods, skullbracers_mod)
	local damnedset = _GroupInfo_UnitModifierAmount(unitMods, helmetofthedamned_mod)
	return _unitAura_EffectSumUnit(unitMods, uaAttackDamageHeal_valPercent5, 1)
	     + _unitAura_EffectSumUnit(unitMods, uaAttackDamageHeal_valPercent20, 1)
	     + _unitAura_EffectSumUnit(unitMods, uaAttackDamageHeal_valPercent25, 1)
	     + skullset
	     + damnedset
end

function _unitAura_AttackPower_valPercent(unit)
	local rEffect = _unitAura_EffectSumStack(uaAttackPower_valPercent5_ranged, 5)
	if rEffect > 0 then
		local leader = _GroupInfo_getCurrentGroupLeader()
		if leader == nil or not _GroupInfo_UnitIsRangedWithoutBow(leader) then
			rEffect = 0
		end
	end
	return _unitAura_EffectSumStack(uaAttackPower_valPercent5, 5) + rEffect
end
function _unitAura_AttackPower_txtPercent(unit, unitMods)
	local rEffect = _unitAura_EffectSumUnit(unitMods, uaAttackPower_valPercent5_ranged, 5)
	if rEffect > 0 and not _GroupInfo_UnitIsRangedWithoutBow(unit) then
		rEffect = 0
	end
	return _unitAura_EffectSumUnit(unitMods, uaAttackPower_valPercent5, 5) + rEffect
end
function _unitAura_AttackPower_cntPercent(unit, unitMods)
	local rEffect = _unitAura_EffectSumUnit(unitMods, uaAttackPower_valPercent5_ranged, 1)
	--if rEffect > 0 and not _GroupInfo_UnitIsRangedWithoutBow(unit) then
	--	rEffect = 0
	--end
	return _unitAura_EffectSumUnit(unitMods, uaAttackPower_valPercent5, 1) + rEffect
end

function _unitAura_AttackDrain_valFlat(unit)
	return _unitAura_EffectSumStack(uaAttackDrain_valFlat10, 10)
	     + _unitAura_EffectSumStack(uaAttackDrain_valFlat20, 20)
	     + _unitAura_EffectSumStack(uaAttackDrain_valFlat35, 35)
end
function _unitAura_AttackDrain_txtFlat(unit, unitMods)
	return _unitAura_EffectSumUnit(unitMods, uaAttackDrain_valFlat10, 10)
	     + _unitAura_EffectSumUnit(unitMods, uaAttackDrain_valFlat20, 20)
	     + _unitAura_EffectSumUnit(unitMods, uaAttackDrain_valFlat35, 35)
end
function _unitAura_AttackDrain_cntFlat(unit, unitMods)
	return _unitAura_EffectSumUnit(unitMods, uaAttackDrain_valFlat10, 1)
	     + _unitAura_EffectSumUnit(unitMods, uaAttackDrain_valFlat20, 1)
	     + _unitAura_EffectSumUnit(unitMods, uaAttackDrain_valFlat35, 1)
end

function _unitAura_AttackCrit_valFlat(unit)
	return _unitAura_EffectSumStack(uaAttackCrit_valFlat5, 5)
	     + _unitAura_EffectSumStack(uaAttackCrit_valFlat10, 10)
end
function _unitAura_AttackCrit_txtFlat(unit, unitMods)
	return _unitAura_EffectSumUnit(unitMods, uaAttackCrit_valFlat5, 5)
	     + _unitAura_EffectSumUnit(unitMods, uaAttackCrit_valFlat10, 10)
end
function _unitAura_AttackCrit_cntFlat(unit, unitMods)
	return _unitAura_EffectSumUnit(unitMods, uaAttackCrit_valFlat5, 1)
	     + _unitAura_EffectSumUnit(unitMods, uaAttackCrit_valFlat10, 1)
end

function _unitAura_BlisterResist_stk(unit)
	return _unitAura_EffectSumStack(uaBlisterResist, 1)
end
function _unitAura_BlisterResist_val(unit, unitMods)
	return _unitAura_EffectSumUnit(unitMods, uaBlisterResist, 1)
end
function _unitAura_BlisterResist_cnt(unit, unitMods)
	return _unitAura_EffectSumUnit(unitMods, uaBlisterResist, 1)
end

function _unitAura_FrostbiteResist_stk(unit)
	return _unitAura_EffectSumStack(uaFrostbiteResist, 1)
end
function _unitAura_FrostbiteResist_val(unit, unitMods)
	return _unitAura_EffectSumUnit(unitMods, uaFrostbiteResist, 1)
end
function _unitAura_FrostbiteResist_cnt(unit, unitMods)
	return _unitAura_EffectSumUnit(unitMods, uaFrostbiteResist, 1)
end

function _unitAura_PoisonResist_stk(unit)
	return _unitAura_EffectSumStack(uaPoisonResist, 1)
end
function _unitAura_PoisonResist_val(unit, unitMods)
	return _unitAura_EffectSumUnit(unitMods, uaPoisonResist, 1)
end
function _unitAura_PoisonResist_cnt(unit, unitMods)
	return _unitAura_EffectSumUnit(unitMods, uaPoisonResist, 1)
end

function _unitAura_LowerDamageResist_stk(unit)
	return _unitAura_EffectSumStack(uaLowerDamageResist, 1)
end
function _unitAura_LowerDamageResist_val(unit, unitMods)
	return _unitAura_EffectSumUnit(unitMods, uaLowerDamageResist, 1)
end
function _unitAura_LowerDamageResist_cnt(unit, unitMods)
	return _unitAura_EffectSumUnit(unitMods, uaLowerDamageResist, 1)
end

function _unitAura_LowerInitiativeResist_stk(unit)
	return _unitAura_EffectSumStack(uaLowerInitiativeResist, 1)
end
function _unitAura_LowerInitiativeResist_val(unit, unitMods)
	return _unitAura_EffectSumUnit(unitMods, uaLowerInitiativeResist, 1)
end
function _unitAura_LowerInitiativeResist_cnt(unit, unitMods)
	return _unitAura_EffectSumUnit(unitMods, uaLowerInitiativeResist, 1)
end

function _unitAura_FearResist_stk(unit)
	local divinationset = 0
	if _GroupInfo_stackHasModifierAmount(divinationbox_mod) > 0
	and _GroupInfo_stackHasModifierAmount(saintblood_mod) > 0 then
		divinationset = 1
	end
	return _unitAura_EffectSumStack(uaFearResist, 1)
	     + divinationset
end
function _unitAura_FearResist_val(unit, unitMods)
	local divinationset = 0
	if _GroupInfo_stackHasModifierAmount(divinationbox_mod) > 0
	and _GroupInfo_stackHasModifierAmount(saintblood_mod) > 0 then
		divinationset = 1
	end
	return _unitAura_EffectSumUnit(unitMods, uaFearResist, 1)
	     + divinationset
end
function _unitAura_FearResist_cnt(unit, unitMods)
	local divinationset = _GroupInfo_UnitModifierAmount(unitMods, divinationbox_mod)
	return _unitAura_EffectSumUnit(unitMods, uaFearResist, 1)
	     + divinationset
end

function _unitAura_PetrifyResist_stk(unit)
	local abyssfangsset = 0
	if _GroupInfo_stackHasModifierAmount(abyssfangs_mod) > 0
	and _GroupInfo_stackHasModifierAmount(cursedash_mod) > 0 then
		abyssfangsset = 1
	end
	return _unitAura_EffectSumStack(uaPetrifyResist, 1)
	     + abyssfangsset
end
function _unitAura_PetrifyResist_val(unit, unitMods)
	local abyssfangsset = 0
	if _GroupInfo_stackHasModifierAmount(abyssfangs_mod) > 0
	and _GroupInfo_stackHasModifierAmount(cursedash_mod) > 0 then
		abyssfangsset = 1
	end
	return _unitAura_EffectSumUnit(unitMods, uaPetrifyResist, 1)
	     + abyssfangsset
end
function _unitAura_PetrifyResist_cnt(unit, unitMods)
	local abyssfangsset = _GroupInfo_UnitModifierAmount(unitMods, abyssfangs_mod)
	return _unitAura_EffectSumUnit(unitMods, uaPetrifyResist, 1)
	     + abyssfangsset
end

function _unitAura_AttackProtection_val(unit, unitMods)
	return math.min( 100, _unitAura_EffectSumUnit(unitMods, umAttackProtection5, 5)
			    + _unitAura_EffectSumUnit(unitMods, umAttackProtection25, 25)
			    + _unitAura_EffectSumUnit(unitMods, umAttackProtection35, 35)
			    + _unitAura_EffectSumUnit(unitMods, umAttackProtection50, 50)
			    + _unitAura_EffectSumUnit(unitMods, umAttackProtection75, 75)
			    + _unitAura_EffectSumUnit(unitMods, umAttackProtection100, 100))
end
function _unitAura_AttackProtection_cnt(unit, unitMods)
	return _unitAura_EffectSumUnit(unitMods, umAttackProtection5, 1)
	     + _unitAura_EffectSumUnit(unitMods, umAttackProtection25, 1)
	     + _unitAura_EffectSumUnit(unitMods, umAttackProtection35, 1)
	     + _unitAura_EffectSumUnit(unitMods, umAttackProtection50, 1)
	     + _unitAura_EffectSumUnit(unitMods, umAttackProtection75, 1)
	     + _unitAura_EffectSumUnit(unitMods, umAttackProtection100, 1)
end


function _unitAura_AttackProtectionIgnorance_val(unit, unitMods)
	return _unitAura_EffectSumUnit(unitMods, umAttackProtectionIgnorance, 1)
end
function _unitAura_AttackProtectionIgnorance_cnt(unit, unitMods)
	return _unitAura_EffectSumUnit(unitMods, umAttackProtectionIgnorance, 1)
end

function _unitAura_AttackProtectionPerLevel_val(unit, unitMods)
	return _unitAura_EffectSumUnit(unitMods, umAttackProtectionPerLevel1, 5)
end
function _unitAura_AttackProtectionPerLevel_cnt(unit, unitMods)
	return _unitAura_EffectSumUnit(unitMods, umAttackProtectionPerLevel1, 1)
end
function _unitAura_AttackProtectionPerLevelCapped_val(unit, unitMods)
	return _unitAura_EffectSumUnit(unitMods, {G040UM0337}, 4)
	     + _unitAura_EffectSumUnit(unitMods, {G040UM0338}, 10)
end

function _unitAura_CowardiceBig_val(unit, unitMods)
	if _unitAura_EffectSumUnit(unitMods, {G201UM9281}, 1) > 0 then
		return 0
	end
	local r = _unitAura_EffectSumUnit(unitMods, umCowardiceBig, 1)
	if r > 0 then
		local attackType = scenario:getUnit(unit.id).impl.attack1.type
		if not (statsCheck_isDirectDmgType(attackType)
		     or statsCheck_isCurseType(attackType)
		     or statsCheck_isDoTType(attackType)) then
			r = 0
		end
	end
	return r
end
function _unitAura_CowardiceBig_cnt(unit, unitMods)
	local r = _unitAura_EffectSumUnit(unitMods, umCowardiceBig, 1)
	return r
end

function _unitAura_Cannibalism_val(unit, unitMods)
	return _unitAura_EffectSumUnit(unitMods, umCannibalism10, 10)
end
function _unitAura_Cannibalism_cnt(unit, unitMods)
	return _unitAura_EffectSumUnit(unitMods, umCannibalism10, 1)
end

function _unitAura_VampirismPerCorpse_val(unit, unitMods)
	return _unitAura_EffectSumUnit(unitMods, umVampirismPerCorpse, 10)
end
function _unitAura_VampirismPerCorpse_cnt(unit, unitMods)
	return _unitAura_EffectSumUnit(unitMods, umVampirismPerCorpse, 1)
end

function _unitAura_HitPointPerCorpse_val(unit, unitMods)
	return _unitAura_EffectSumUnit(unitMods, umHitPointPerCorpse, 10)
end
function _unitAura_HitPointPerCorpse_cnt(unit, unitMods)
	return _unitAura_EffectSumUnit(unitMods, umHitPointPerCorpse, 1)
end

function _unitAura_MaxAttackCritDamage_val(unit, unitMods)
	return math.min( uaMaxAdditionalCrit, 
	       _unitAura_EffectSumUnit(unitMods, umMaxAttackCritDamage5, 5)
	     + _unitAura_EffectSumUnit(unitMods, umMaxAttackCritDamage10, 10)
	     + _unitAura_EffectSumUnit(unitMods, umMaxAttackCritDamage25, 25)
	     + _unitAura_EffectSumUnit(unitMods, umMaxAttackCritDamage50, 50)
	     + _unitAura_EffectSumUnit(unitMods, umMaxAttackCritDamage75, 75) )
end
function _unitAura_MaxAttackCritDamage_cnt(unit, unitMods)
	return _unitAura_EffectSumUnit(unitMods, umMaxAttackCritDamage5, 1)
	     + _unitAura_EffectSumUnit(unitMods, umMaxAttackCritDamage10, 1)
	     + _unitAura_EffectSumUnit(unitMods, umMaxAttackCritDamage25, 1)
	     + _unitAura_EffectSumUnit(unitMods, umMaxAttackCritDamage50, 1)
	     + _unitAura_EffectSumUnit(unitMods, umMaxAttackCritDamage75, 1)
end

function _unitAura_DrainLevelResistance_val(unit, unitMods)
	local n = _unitAura_EffectSumUnit(unitMods, umDrainLevelResistance50, 1)
		+ _unitAura_EffectSumUnit(unitMods, umDrainLevelResistance75, 2)
	return math.min(99, math.floor(100 * ( 1 - 0.5^n)))
end
function _unitAura_DrainLevelResistance_cnt(unit, unitMods)
	return _unitAura_EffectSumUnit(unitMods, umDrainLevelResistance50, 1)
	     + _unitAura_EffectSumUnit(unitMods, umDrainLevelResistance75, 1)
end

function _unitAura_SpellDebuffResistance_total(unit, unitMods)
	return _unitAura_SpellDebuffResistance_val(unit, unitMods) 
	     + _unitAura_SpellDebuffResistanceAura_stk(unit)
end
function _unitAura_SpellDebuffResistance_total_alt(unit, unitMods, unitGroupMods)
	return _unitAura_SpellDebuffResistance_val(unit, unitMods) 
	     + _unitAura_SpellDebuffResistanceAura_val(unit, unitGroupMods)
end

function _unitAura_SpellDebuffResistance_val(unit, unitMods)
	return math.min(100, _unitAura_EffectSumUnit(unitMods, umSpellDebuffResistance10, 10)
	                   + _unitAura_EffectSumUnit(unitMods, umSpellDebuffResistance20, 20)
	                   + _unitAura_EffectSumUnit(unitMods, umSpellDebuffResistance30, 30)
	                   + _unitAura_EffectSumUnit(unitMods, umSpellDebuffResistance50, 50))
end
function _unitAura_SpellDebuffResistance_cnt(unit, unitMods)
	return _unitAura_EffectSumUnit(unitMods, umSpellDebuffResistance10, 1)
	     + _unitAura_EffectSumUnit(unitMods, umSpellDebuffResistance20, 1)
	     + _unitAura_EffectSumUnit(unitMods, umSpellDebuffResistance30, 1)
	     + _unitAura_EffectSumUnit(unitMods, umSpellDebuffResistance50, 1)
end

function _unitAura_SpellDebuffResistanceAura_stk(unit)
	local perseverancebreastplateset = 0
	if _GroupInfo_stackHasModifierAmount(saintblood_mod) > 0
	and _GroupInfo_stackHasModifierAmount(perseverancebreastplate_mod) > 0 then
		perseverancebreastplateset = 10
	end
	local runeoflifeset = _GroupInfo_stackHasModifierAmount(runeoflife_mod)
	if runeoflifeset > 0
	and ( _GroupInfo_stackHasModifierAmount(mjolnircrown_mod) > 0
	or    _GroupInfo_stackHasModifierAmount(warmasterhelmet_mod) > 0 ) then
		runeoflifeset = 10 * runeoflifeset
	else
		runeoflifeset = 0
	end
	return math.min(100, _unitAura_EffectSumStack(uaSpellDebuffResistance10, 10)
	                   + _unitAura_EffectSumStack(uaSpellDebuffResistance20, 20)
	                   + perseverancebreastplateset
	                   + runeoflifeset)
end
function _unitAura_SpellDebuffResistanceAura_val(unit, unitMods)
	local perseverancebreastplateset = 0
	if _GroupInfo_UnitModifierAmount(unitMods, saintblood_mod) > 0
	and _GroupInfo_UnitModifierAmount(unitMods, perseverancebreastplate_mod) > 0 then
		perseverancebreastplateset = 10
	end
	local runeoflifeset = _GroupInfo_UnitModifierAmount(unitMods, runeoflife_mod)
	if runeoflifeset > 0
	and ( _GroupInfo_UnitModifierAmount(unitMods, mjolnircrown_mod) > 0
	or    _GroupInfo_UnitModifierAmount(unitMods, warmasterhelmet_mod) > 0 ) then
		runeoflifeset = 10 * runeoflifeset
	else
		runeoflifeset = 0
	end
	return math.min(100, _unitAura_EffectSumUnit(unitMods, uaSpellDebuffResistance10, 10)
			   + _unitAura_EffectSumUnit(unitMods, uaSpellDebuffResistance20, 20)
			   + perseverancebreastplateset
			   + runeoflifeset)
end
function _unitAura_SpellDebuffResistanceAura_cnt(unit, unitMods)
	local perseverancebreastplateset = _GroupInfo_UnitModifierAmount(unitMods, saintblood_mod)
	local runeoflifeset = _GroupInfo_UnitModifierAmount(unitMods, runeoflife_mod)
	return _unitAura_EffectSumUnit(unitMods, uaSpellDebuffResistance10, 1)
	     + _unitAura_EffectSumUnit(unitMods, uaSpellDebuffResistance20, 1)
	     + perseverancebreastplateset
	     + runeoflifeset
end

function _unitAura_SplashDamage_val(unit, unitMods)
	return _unitAura_EffectSumUnit(unitMods, umSplashDamage5, 5)
	     + _unitAura_EffectSumUnit(unitMods, umSplashDamage5m, -5)
end
function _unitAura_SplashDamage_cnt(unit, unitMods)
	return _unitAura_EffectSumUnit(unitMods, umSplashDamage5, 1)
	     + _unitAura_EffectSumUnit(unitMods, umSplashDamage5m, 1)
end

function _unitAura_PerLostHP_Armor_val(unit, unitMods)
	return _unitAura_EffectSumUnit(unitMods, umPerLostHP_Armor1, 1)
end
function _unitAura_PerLostHP_Armor_cnt(unit, unitMods)
	return _unitAura_EffectSumUnit(unitMods, umPerLostHP_Armor1, 1)
end

function _unitAura_PerLostHP_AttackInitiative_val(unit, unitMods)
	return _unitAura_EffectSumUnit(unitMods, umPerLostHP_AttackInitiative1, 1)
end
function _unitAura_PerLostHP_AttackInitiative_cnt(unit, unitMods)
	return _unitAura_EffectSumUnit(unitMods, umPerLostHP_AttackInitiative1, 1)
end

function _unitAura_PerLostHP_AttackDamageHeal_val(unit, unitMods)
	return _unitAura_EffectSumUnit(unitMods, umPerLostHP_AttackDamageHeal1, 1)
end
function _unitAura_PerLostHP_AttackDamageHeal_cnt(unit, unitMods)
	return _unitAura_EffectSumUnit(unitMods, umPerLostHP_AttackDamageHeal1, 1)
end

function _unitAura_PerLostHP_AttackPower_val(unit, unitMods)
	return _unitAura_EffectSumUnit(unitMods, umPerLostHP_AttackPower1, 1)
end
function _unitAura_PerLostHP_AttackPower_cnt(unit, unitMods)
	return _unitAura_EffectSumUnit(unitMods, umPerLostHP_AttackPower1, 1)
end

function _unitAura_PerLostHP_AttackDrain_val(unit, unitMods)
	return _unitAura_EffectSumUnit(unitMods, umPerLostHP_AttackDrain1, 1)
end
function _unitAura_PerLostHP_AttackDrain_cnt(unit, unitMods)
	return _unitAura_EffectSumUnit(unitMods, umPerLostHP_AttackDrain1, 1)
end

function _unitAura_PerLostHP_AttackCrit_val(unit, unitMods)
	return _unitAura_EffectSumUnit(unitMods, umPerLostHP_AttackCrit1, 1)
end
function _unitAura_PerLostHP_AttackCrit_cnt(unit, unitMods)
	return _unitAura_EffectSumUnit(unitMods, umPerLostHP_AttackCrit1, 1)
end

function _unitAura_PerLostHP_DoubleAttack_val(unit, unitMods)
	return _unitAura_EffectSumUnit(unitMods, umPerLostHP_DoubleAttack1, 1)
end
function _unitAura_PerLostHP_DoubleAttack_cnt(unit, unitMods)
	return _unitAura_EffectSumUnit(unitMods, umPerLostHP_DoubleAttack1, 1)
end

function _unitAura_AttackDamageInitiativeOnFullLife_val(unit, unitMods)
	return _unitAura_EffectSumUnit(unitMods, umAttackDamageInitiativeOnFullLife10, 10)
end
function _unitAura_AttackDamageInitiativeOnFullLife_cnt(unit, unitMods)
	return _unitAura_EffectSumUnit(unitMods, umAttackDamageInitiativeOnFullLife10, 1)
end

function _unitAura_AttackLessPowerOnFullLife_val(unit, unitMods)
	return _unitAura_EffectSumUnit(unitMods, umAttackLessPowerOnFullLife10, 10)
end
function _unitAura_AttackLessPowerOnFullLife_cnt(unit, unitMods)
	return _unitAura_EffectSumUnit(unitMods, umAttackLessPowerOnFullLife10, 1)
end

function _unitAura_AttackLessDamageOnFullLife_val(unit, unitMods)
	return _unitAura_EffectSumUnit(unitMods, umAttackLessDamageOnFullLife10, 10)
end
function _unitAura_AttackLessDamageOnFullLife_cnt(unit, unitMods)
	return _unitAura_EffectSumUnit(unitMods, umAttackLessDamageOnFullLife10, 1)
end

function _unitAura_ArmorOnFullLife_val(unit, unitMods)
	return _unitAura_EffectSumUnit(unitMods, umArmorOnFullLife10, 10)
	     + _unitAura_EffectSumUnit(unitMods, umArmorOnFullLife20, 20)
end
function _unitAura_ArmorOnFullLife_cnt(unit, unitMods)
	return _unitAura_EffectSumUnit(unitMods, umArmorOnFullLife10, 1)
	     + _unitAura_EffectSumUnit(unitMods, umArmorOnFullLife20, 1)
end

function _unitAura_AttackProtectionOnFullLife_val(unit, unitMods)
	return math.min( 100, _unitAura_EffectSumUnit(unitMods, umAttackProtectionOnFullLife25, 25)
	    		    + _unitAura_EffectSumUnit(unitMods, umAttackProtectionOnFullLife50, 50)
	    		    + _unitAura_EffectSumUnit(unitMods, umAttackProtectionOnFullLife75, 75)
	    		    + _unitAura_EffectSumUnit(unitMods, umAttackProtectionOnFullLife100, 100))
end
function _unitAura_AttackProtectionOnFullLife_cnt(unit, unitMods)
	return _unitAura_EffectSumUnit(unitMods, umAttackProtectionOnFullLife25, 1)
	     + _unitAura_EffectSumUnit(unitMods, umAttackProtectionOnFullLife50, 1)
	     + _unitAura_EffectSumUnit(unitMods, umAttackProtectionOnFullLife75, 1)
	     + _unitAura_EffectSumUnit(unitMods, umAttackProtectionOnFullLife100, 1)
end

function _unitAura_SummonBonusLevel_val(unit, unitMods)
	return _unitAura_EffectSumUnit(unitMods, umSummonBonusLevel1, 1)
	     + _unitAura_EffectSumUnit(unitMods, umSummonBonusLevel2, 2)
	     + _unitAura_EffectSumUnit(unitMods, umSummonBonusLevel3, 3)
	     + _unitAura_EffectSumUnit(unitMods, umSummonBonusLevel4, 4)
	     + _unitAura_EffectSumUnit(unitMods, umSummonBonusLevel5, 5)
end
function _unitAura_SummonBonusLevel_cnt(unit, unitMods)
	return _unitAura_EffectSumUnit(unitMods, umSummonBonusLevel1, 1)
	     + _unitAura_EffectSumUnit(unitMods, umSummonBonusLevel2, 1)
	     + _unitAura_EffectSumUnit(unitMods, umSummonBonusLevel3, 1)
	     + _unitAura_EffectSumUnit(unitMods, umSummonBonusLevel4, 1)
	     + _unitAura_EffectSumUnit(unitMods, umSummonBonusLevel5, 1)
end

function _unitAura_SummonTransform_valFlat(unit)
	return _unitAura_EffectSumStack(uaSummonTransform_valFlat1, 1)
	     + _unitAura_EffectSumStack(uaSummonTransform_valFlat2, 2)
end
function _unitAura_SummonTransform_txtFlat(unit, unitMods)
	return _unitAura_EffectSumUnit(unitMods, uaSummonTransform_valFlat1, 1)
	     + _unitAura_EffectSumUnit(unitMods, uaSummonTransform_valFlat2, 2)
end
function _unitAura_SummonTransform_cntFlat(unit, unitMods)
	return _unitAura_EffectSumUnit(unitMods, uaSummonTransform_valFlat1, 1)
	     + _unitAura_EffectSumUnit(unitMods, uaSummonTransform_valFlat2, 1)
end
function _unitAura_SummonTransform_Exp(unit)
	return 10 * _unitAura_SummonTransform_valFlat(unit)
end

function _unitAura_ExpKill_valFlat(mods, debuffMulti)
	return _unitAura_EffectSum(mods, uaExpKill_valFlat10, 10)
	     + _unitAura_EffectSum(mods, uaExpKill_valFlat15, 15)
	     + _unitAura_EffectSum(mods, uaExpKill_valFlat25, 25)
	     + _unitAura_EffectSum(mods, uaExpKill_valFlat10m, -10)
	     + _unitAura_EffectSum(mods, uaExpKill_valFlat25m, -25)
	     + _unitAura_EffectSum(mods, uaExpKill_valFlatSpellDebuff25, -25 * debuffMulti)
end

function _unitAura_CurseProtection_valCovered(unit)
	return _unitAura_EffectSumStack(uaCurseProtection_valCovered1, 1)
end
function _unitAura_CurseProtection_txtCovered(unit, unitMods)
	return _unitAura_EffectSumUnit(unitMods, uaCurseProtection_valCovered1, 1)
end
function _unitAura_CurseProtection_cntCovered(unit, unitMods)
	return _unitAura_EffectSumUnit(unitMods, uaCurseProtection_valCovered1, 1)
end

function _unitAura_ArmorFlat_valCovered(unit)
	return _unitAura_EffectSumStack(uaArmorFlat_valCovered10, 10)
	     + _unitAura_EffectSumStack(uaArmorFlat_valCovered15, 15)
	     + _unitAura_EffectSumStack(uaArmorFlat_valCovered20, 20)
end
function _unitAura_ArmorFlat_txtCovered(unit, unitMods)
	return _unitAura_EffectSumUnit(unitMods, uaArmorFlat_valCovered10, 10)
	     + _unitAura_EffectSumUnit(unitMods, uaArmorFlat_valCovered15, 15)
	     + _unitAura_EffectSumUnit(unitMods, uaArmorFlat_valCovered20, 20)
end
function _unitAura_ArmorFlat_cntCovered(unit, unitMods)
	return _unitAura_EffectSumUnit(unitMods, uaArmorFlat_valCovered10, 1)
	     + _unitAura_EffectSumUnit(unitMods, uaArmorFlat_valCovered15, 1)
	     + _unitAura_EffectSumUnit(unitMods, uaArmorFlat_valCovered20, 1)
end

function _unitAura_ArmorFlat_valNearest(unit)
	return _unitAura_EffectSumStack(uaArmorFlat_valNearest5, 5)
end
function _unitAura_ArmorFlat_txtNearest(unit, unitMods)
	return _unitAura_EffectSumUnit(unitMods, uaArmorFlat_valNearest5, 5)
end
function _unitAura_ArmorFlat_cntNearest(unit, unitMods)
	return _unitAura_EffectSumUnit(unitMods, uaArmorFlat_valNearest5, 1)
end

function _unitAura_HitPointOnDeath_valPercent(unit)
	return _unitAura_EffectSumStack_Dead(uaHitPointOnDeath_valPercent10, 10)
	     + _unitAura_EffectSumStack_Dead(uaHitPointOnDeath_valPercent20, 20)
end
function _unitAura_HitPointOnDeath_txtPercent(unit, unitMods)
	return _unitAura_EffectSumUnit(unitMods, uaHitPointOnDeath_valPercent10, 10)
	     + _unitAura_EffectSumUnit(unitMods, uaHitPointOnDeath_valPercent20, 20)
end
function _unitAura_HitPointOnDeath_cntPercent(unit, unitMods)
	return _unitAura_EffectSumUnit(unitMods, uaHitPointOnDeath_valPercent10, 1)
	     + _unitAura_EffectSumUnit(unitMods, uaHitPointOnDeath_valPercent20, 1)
end

function _unitAura_AttackDrainOnDeath_valPercent(unit)
	return _unitAura_EffectSumStack_Dead(uaAttackDrainOnDeath_valPercent10, 10)
	     + _unitAura_EffectSumStack_Dead(uaAttackDrainOnDeath_valPercent20, 20)
end
function _unitAura_AttackDrainOnDeath_txtPercent(unit, unitMods)
	return _unitAura_EffectSumUnit(unitMods, uaAttackDrainOnDeath_valPercent10, 10)
	     + _unitAura_EffectSumUnit(unitMods, uaAttackDrainOnDeath_valPercent20, 20)
end
function _unitAura_AttackDrainOnDeath_cntPercent(unit, unitMods)
	return _unitAura_EffectSumUnit(unitMods, uaAttackDrainOnDeath_valPercent10, 1)
	     + _unitAura_EffectSumUnit(unitMods, uaAttackDrainOnDeath_valPercent20, 1)
end

function _unitAura_EffectSum(modsArray, modsSearch, modValue)
	local result = 0
	for m = 1, #modsSearch do
		if modsArray[modsSearch[m]] ~= nil then
			result = result + modsArray[modsSearch[m]]
		end
	end
	return modValue * result
end
function _unitAura_EffectSumStack(modsSearch, modValue)
	local result = 0
	for m = 1, #modsSearch do
		result = result + _GroupInfo_stackHasModifierAmount(modsSearch[m])
	end
	return modValue * result
end
function _unitAura_EffectSumStack_Dead(modsSearch, modValue)
	local result = 0
	for m = 1, #modsSearch do
		result = result + _GroupInfo_stackHasModifierAmount_Dead(modsSearch[m])
	end
	return modValue * result
end
function _unitAura_EffectSumUnit(unitMods, modsSearch, modValue)
	local result = 0
	for m = 1, #modsSearch do
		result = result + _GroupInfo_UnitModifierAmount(unitMods, modsSearch[m])
	end
	return modValue * result
end

ua_mlh_ArmorFlat20    = {G040UM0175, G040UM0177}
ua_mlh_PowerPercent20 = {G040UM0177}
ua_mlh_CritFlat20     = {G040UM0176}

function _unitAura_MostLostHPBuff_ArmorFlat(unit)
	local effect = _unitAura_EffectSumStack(ua_mlh_ArmorFlat20, 20)
	return _unitAura_MostLostHPBuff_Calc(unit, effect, true, true, true, true, true)
end
function _unitAura_MostLostHPBuff_PowerPercent(unit)
	local effect = _unitAura_EffectSumStack(ua_mlh_PowerPercent20, 20)
	return _unitAura_MostLostHPBuff_Calc(unit, effect, false, true, true, true, false)
end
function _unitAura_MostLostHPBuff_CritFlat(unit)
	local effect = _unitAura_EffectSumStack(ua_mlh_CritFlat20, 20)
	return _unitAura_MostLostHPBuff_Calc(unit, effect, false, true, false, false, false)
end
	
function _unitAura_MostLostHPBuff_Calc(unit, effect, ignoreForFilter, forDirectDmg, forDotDmg, forCurse, forHeal)
	if effect == 0 or unit.hp == 0 then
		return 0
	end
	local myID       = unit.id
	local myHPPart   = nil
	local minHPPart  = 1
	local minHPCount = 0
	local p
	local u
	local uid
	local prev_uid = nil
	local uhp
	local apply
	local unitImpl
	local a1
	local a2
	local unitGroupSlots = unitGroup.slots
	for i=1, #unitGroupSlots do
	    u = unitGroupSlots[i].unit
	    if u ~= nil then
	     	uhp = u.hp
	     	if uhp > 0 then
	            uid = u.id
	            if uid ~= prev_uid then
	            	    prev_uid = uid
			    unitImpl = scenario:getUnit(uid).impl
			    a1 = unitImpl.attack1
			    a2 = unitImpl.attack2
			    
			    apply = ignoreForFilter
			    if not apply and forDirectDmg and (statsCheck_isDirectDmgAttack(a1) or statsCheck_isDirectDmgAttack(a2)) then
			    	apply = true
			    end
			    if not apply and forDotDmg and (statsCheck_isDoTAttack(a1) or statsCheck_isDoTAttack(a2)) then
			    	apply = true
			    end
			    if not apply and forCurse and (statsCheck_isCurseAttack(a1) or statsCheck_isCurseAttack(a2)) then
			    	apply = true
			    end
			    if not apply and forHeal and (statsCheck_isHealAttack(a1) or statsCheck_isHealAttack(a2)) then
			    	apply = true
			    end
			    if apply then
			        p = uhp / unitImpl.hp
			        if uid == myID then
			            if p > minHPPart then
			                return 0
			            end
			            myHPPart = p
			        end
			        if p == minHPPart then
			            minHPCount = minHPCount + 1
			        elseif p < minHPPart then
			            minHPPart  = p
			            minHPCount = 1
			            if myHPPart ~= nil and myHPPart > minHPPart then
			                return 0
			            end
			        end
			    else
			        if uid == myID then
			           return 0
			        end
			    end
			end
		end
	    end
	end
	if myHPPart == minHPPart then
		return math.max(math.floor(effect / minHPCount), 1)
	else
		return 0
	end
end

ua_AddedDamagePercent10 = {G040UM0070}
ua_AddedDamagePercent30 = {G040UM0066, G040UM0071}
ua_AddedDamagePercent35 = {G040UM0069}
ua_AddedDamagePercent45 = {}
function _unitAura_AddedDamageSum(unit)
	if unit.impl.leaderType == -1 then
		return 0
	end
	return _unitAura_EffectSumStack(ua_AddedDamagePercent10, 10)
	     + _unitAura_EffectSumStack(ua_AddedDamagePercent30, 30)
	     + _unitAura_EffectSumStack(ua_AddedDamagePercent35, 35)
	     + _unitAura_EffectSumStack(ua_AddedDamagePercent45, 45)
end

function externalModifiers(attacker, target)
	-- _get_Group_and_Mods(attacker.unit)
	local aGroup, aOwner, aOwnerType = _GroupInfo_getUnitGroup(attacker.unit)
	local aGroupM, aGroupMD = _GroupInfo_GroupModifires(aGroup, attacker.unit)
	local aPlayer = _GroupInfo_getPlayer(aOwnerType, aOwner)
	local aLeader = _GroupInfo_getGroupLeader(aGroup)
	local aExpMul = _mapMultipliers_XpGain_Multi(attacker.unit)
	local aDebuffMulti = math.max(0, 1 - 0.01 * _unitAura_SpellDebuffResistance_total_alt(attacker.unit, _GroupInfo_UnitModifiers(attacker.unit), aGroupM))
	
	if smnsEnabled then
		aExpMul = aExpMul + 0.01 * _smns_getExpGainBonus(aExpMul, aGroup, aPlayer, aLeader)
	end
	if workshopEnabled then
		aExpMul = aExpMul * ( 1 + 0.01 * Workshop_getBonus_XpGain_Percent(scenario, attacker.unit, true) )
	end
	
	-- _get_Group_and_Mods(target.unit)
	local tGroup, tOwner, tOwnerType = _GroupInfo_getUnitGroup(target.unit)
	local tGroupM, tGroupMD = _GroupInfo_GroupModifires(tGroup, target.unit)
	local tPlayer = _GroupInfo_getPlayer(tOwnerType, tOwner)
	local tLeader = _GroupInfo_getGroupLeader(tGroup)
	local tExpMul = _mapMultipliers_XpGain_Multi(target.unit)
	local tDebuffMulti = math.max(0, 1 - 0.01 * _unitAura_SpellDebuffResistance_total_alt(target.unit, _GroupInfo_UnitModifiers(target.unit), tGroupM))
	
	if smnsEnabled then
		tExpMul = tExpMul + 0.01 * _smns_getExpGainBonus(tExpMul, tGroup, tPlayer, tLeader)
	end
	if workshopEnabled then
		tExpMul = tExpMul * ( 1 + 0.01 * Workshop_getBonus_XpGain_Percent(scenario, target.unit, true) )
	end
	
	externalModifiersApply(aGroup, aPlayer, aLeader, aGroupM, aExpMul, aDebuffMulti,
	                       tGroup, tPlayer, tLeader, tGroupM, tExpMul, tDebuffMulti)
	externalModifiersApply(tGroup, tPlayer, tLeader, tGroupM, tExpMul, tDebuffMulti,
	                       aGroup, aPlayer, aLeader, aGroupM, aExpMul, aDebuffMulti)
	return 0
end
function externalModifiersApply(g1, p1, l1, m1, e1, d1,
				g2, p2, l2, m2, e2, d2)
	local ExpKilled = 1
	if p1 ~= nil and p1.race ~= Race.Neutral and p1.lord == Lord.Warrior then
		ExpKilled = ExpKilled + 0.05
	end
	if l1 ~= nil then
		local mods = _GroupInfo_UnitModifiers(l1)
		ExpKilled = ExpKilled + 0.01 * _unitAura_ExpKill_valFlat(mods, d1)
		if _GroupInfo_UnitModifierAmount(mods, harvestarmor_mod) > 0 and
		   _GroupInfo_UnitModifierAmount(mods, harvestcup_mod) > 0 and
		   _GroupInfo_UnitModifierAmount(mods, harvestdagger_mod) > 0 then
			ExpKilled = ExpKilled + 0.15
		end
		if _GroupInfo_UnitModifierAmount(mods, itemsmasterperk_mod) > 0 then
			ExpKilled = ExpKilled + 0.01 * _unitAura_ItemsMasterPerk_Effect(l1)
		end
	end
	
	local units = g2.units
	local v
	for i = 1, #units do
		v = units[i].id.value
		uaExternalExpKilled_Increased[v] = 0
		uaExternalExpKilled_More[v]      = ExpKilled * e1
		if units[i].original ~= nil then
			local vOrig = units[i].original.id.value
			uaExternalExpKilled_Increased[vOrig] = uaExternalExpKilled_Increased[v]
			uaExternalExpKilled_More[vOrig]      = uaExternalExpKilled_More[v]
		end
	end
	return 0
end

function _unitAura_LostHPEffect(unit, effectMultiplier)
	if effectMultiplier == 0 then
		return 0
	end
	local maxHP = scenario:getUnit(unit.id).hpMax
	return effectMultiplier * 100 * ( maxHP - math.min(maxHP, unit.hp) ) / ( 2 * maxHP )
end

function _unitAura_SpiritCage_Effect(unit, group, mode)
	-- mode == 1 - hp
	-- mode == 2 - regen
	-- mode == 3 - vampirism
	local units = group.units
	local expSum = 0
	for i = 1, #units do
		u = units[i]
		if u.hp == 0 then
			expSum = expSum + u.leveledImpl.xpKilled
		end
	end
	if mode ~= 2 then
		return math.floor( 0.1 * expSum)
	else
		local maxHP = scenario:getUnit(unit.id).hpMax
		return math.floor( 0.1 * expSum * 100 / maxHP)
	end
end

function _unitAura_ChainsOfHumility_Effect(unit, group)
	local leader = _GroupInfo_getGroupLeader(group)
	if leader ~= nil then
		local impl = leader.impl 
		return impl.level + 10 * (impl.leadership - leader.baseImpl.leadership)
	end
	return 0
end

function _unitAura_ChainsOfSacrifice_Effect(unit, unitMods, baseValue, gotGroup)
	-- use it only as wearable item modifier
	if unit.hp == 0 then
		return baseValue
	end
	if not gotGroup then
		_get_Group_and_Mods(unit)
	end
	if _GroupInfo_stackHasModifierAmount(chainsofsacrifice_mod) > 0 then
		local nearestUnits = _GroupInfo_getLeftAndRightNearestUnits(unit, true)
		if #nearestUnits > 0 then
			local unitChainsMCount = _GroupInfo_UnitModifierAmount(unitMods, chainsofsacrifice_mod)
			if unitChainsMCount > 0 then
				return math.floor( baseValue * ( 1 - 0.2 * unitChainsMCount ) )
			else
				local umCount
				for i = 1, #nearestUnits do
					local unitMods = _GroupInfo_UnitModifiers(nearestUnits[i])
					umCount = _GroupInfo_UnitModifierAmount(unitMods, chainsofsacrifice_mod)
					if umCount > 0 then
						local modOwnerBaseValue = _unitAura_BaseInitiative(nearestUnits[i].id, unitMods, nearestUnits[i])
						local nearestToOwner = _GroupInfo_getLeftAndRightNearestUnits(nearestUnits[i], true)
						local ownerEffect = math.floor( modOwnerBaseValue * ( 1 - 0.2 * umCount ) )
						return baseValue + math.ceil( ( modOwnerBaseValue - ownerEffect ) / #nearestToOwner )
					end
				end
			end 
		end
	end
	return baseValue
end

function _unitAura_RingOfHeavenWill_Effect(unit, unitMods, group)
	-- use it only as wearable item modifier
	if _GroupInfo_stackHasModifierAmount(ringofheavenwill_mod) > 0 then
		local stack = _GroupInfo_getUnitStack(unit)
		if stack == nil then
			return 0
		end
		
		local group = _GroupInfo_getCurrentGroup()
		local leader = _GroupInfo_getGroupLeader(group)
		if leader == nil then
			return 0
		end
		
		local result = 0
		local leadership = leader.impl.leadership
		local uHeavenwill = _GroupInfo_UnitModifierAmount(unitMods, ringofheavenwill_mod)
		
		local art1 = stack:getEquippedItem(Equipment.Artifact1)
		local art2 = stack:getEquippedItem(Equipment.Artifact2)
		if art1 ~= nil then
			if art1.base.id.value == ringofheavenwill_itm and uHeavenwill > 0 then
				result = result + 6 * leadership
			end
		end
		if art2 ~= nil then
			if art2.base.id.value == ringofheavenwill_itm and uHeavenwill == 0 then
				result = result + 2 * leadership
			end
		end
		return result
	end
	return 0
end

function _unitAura_ItemsMasterPerk_Effect(unit)
	local stack = _GroupInfo_getUnitStack(unit)
	if stack == nil then
		return 0
	end
	local item
	local totalCost = 0
	local checkTypes = {Equipment.Artifact1, Equipment.Artifact2, Equipment.Boots, Equipment.Banner, Equipment.Tome}
	for i = 1, #checkTypes do
		item = stack:getEquippedItem(checkTypes[i])
		if item ~= nil then
			totalCost = totalCost + item.base.value.gold
		end
	end
	return math.floor(totalCost / 3000)
end

function _unitAura_NearestGroupsAuraEffect(unit, effectFunction, radius, applyDiplomacyStatus)
	local diplomacy = scenario.diplomacy
	if diplomacy == nil then
		return 0
	end

	local unitOwner, unitOwnerType = _GroupInfo_getUnitOwner_Fast(unit)
	local unitPlayerRace
	local pos = unitOwner.position
	local minX, maxX, minY, maxY
	minX = pos.x - radius
	minY = pos.y - radius
	-- if unitOwnerType == OwnerTypeStack then
	-- 	unitPlayerRace = unitOwner.owner.race
	-- 	maxX = pos.x + radius
	-- 	maxY = pos.y + radius
	-- elseif unitOwnerType == OwnerTypeFort then
	-- 	unitPlayerRace = unitOwner.owner.race
	-- 	maxX = pos.x + radius + 3
	-- 	maxY = pos.y + radius + 3
	-- 	-- maxX = pos.x + radius + unitOwner.size - 1
	-- 	-- maxY = pos.Y + radius + unitOwner.size - 1
	-- elseif unitOwnerType == OwnerTypeRuin then
	-- 	unitPlayerRace = Race.Neutral
	-- 	maxX = pos.x + radius + 2
	-- 	maxY = pos.y + radius + 2
	-- end

	if unitOwnerType == OwnerTypeStack then
        unitPlayerRace = unitOwner.owner.race
        if unitOwner.inside ~= nil then
            local inside = unitOwner.inside
            local fortpos = inside.position
            minX = fortpos.x - radius
            minY = fortpos.y - radius
            maxX = fortpos.x + radius + 3
            maxY = fortpos.y + radius + 3
        else
            maxX = pos.x + radius
            maxY = pos.y + radius
        end
    elseif unitOwnerType == OwnerTypeFort then
        unitPlayerRace = unitOwner.owner.race
        maxX = pos.x + radius + 3
        maxY = pos.y + radius + 3
        -- maxX = pos.x + radius + unitOwner.size - 1
        -- maxY = pos.Y + radius + unitOwner.size - 1
    elseif unitOwnerType == OwnerTypeRuin then
        unitPlayerRace = Race.Neutral
        maxX = pos.x + radius + 2
        maxY = pos.y + radius + 2
    end
	
	local effect, unitGroup, unitGroupModifiers, unitGroupModifiersDead
	local objrace
	local stacks, ruins, forts = _GroupInfo_GetObjectsWithGroups(minX, maxX, minY, maxY)
	local objects = {stacks, ruins, forts}
	local relationships
	local effectSum = {}
	effectSum[diplomacyStatus_Alliance]  = 0
	effectSum[diplomacyStatus_War]       = 0
	effectSum[diplomacyStatus_Ownership] = 0

	for j = 1, #objects do
		for i = 1, #objects[j] do
			unitGroup = objects[j][i].group
			if unitGroup.units[1] ~= nil then
				unitGroupModifiers, unitGroupModifiersDead = _GroupInfo_GroupModifires(unitGroup, unitGroup.units[1])
				effect = effectFunction(nil, unitGroupModifiers)
				if effect ~= 0 then
					if j ~= 2 then
						-- stacks and forts
						objrace = objects[j][i].owner.race
						if objrace == unitPlayerRace then
							relationships = diplomacyStatus_Ownership
						elseif objrace ~= Race.Neutral and diplomacy:getAlliance(objrace, unitPlayerRace) then
							relationships = diplomacyStatus_Alliance
						else
							relationships = diplomacyStatus_War
						end
					else
						-- ruins
						if unitPlayerRace == Race.Neutral then
							relationships = diplomacyStatus_Ownership
						else
							relationships = diplomacyStatus_War
						end
					end
					effectSum[relationships] = effectSum[relationships] + effect
				end
			end
		end
	end
	effect = 0
	for i = 1, #applyDiplomacyStatus do
		effect = effect + effectSum[applyDiplomacyStatus[i]]
	end
	return effect
end

umMaxAttackCritDamage25 = _bloodsorcerer_info_addMods(umMaxAttackCritDamage25)

if smnsEnabled then
	uaHitPoint_valPercent5 = _smns_addMod_uaHitPoint_valPercent5(uaHitPoint_valPercent5)
	uaHitPoint_valFlat5 = _smns_addMod_uaHitPoint_valFlat5(uaHitPoint_valFlat5)
	uaHitPoint_valFlat10 = _smns_addMod_uaHitPoint_valFlat10(uaHitPoint_valFlat10)
	uaHitPoint_valFlat25 = _smns_addMod_uaHitPoint_valFlat25(uaHitPoint_valFlat25)
	uaRegen_valFlat5 = _smns_addMod_uaRegen_valFlat5(uaRegen_valFlat5)
	uaArmor_valFlat5 = _smns_addMod_uaArmor_valFlat5(uaArmor_valFlat5)
	uaAttackInitiative_valPercent5 = _smns_addMod_uaAttackInitiative_valPercent5(uaAttackInitiative_valPercent5)
	uaAttackInitiative_valPercent10 = _smns_addMod_uaAttackInitiative_valPercent10(uaAttackInitiative_valPercent10)
	uaAttackDamageHeal_valPercent5 = _smns_addMod_uaAttackDamageHeal_valPercent5(uaAttackDamageHeal_valPercent5)
	uaAttackDamageHeal_valPercent20 = _smns_addMod_uaAttackDamageHeal_valPercent20(uaAttackDamageHeal_valPercent20)
	uaAttackDamageHeal_valPercent25 = _smns_addMod_uaAttackDamageHeal_valPercent25(uaAttackDamageHeal_valPercent25)
	uaAttackPower_valPercent5 = _smns_addMod_uaAttackPower_valPercent5(uaAttackPower_valPercent5)
	uaAttackPower_valPercent5_ranged = _smns_addMod_uaAttackPower_valPercent5_ranged(uaAttackPower_valPercent5_ranged)
	uaAttackDrain_valFlat10 = _smns_addMod_uaAttackDrain_valFlat10(uaAttackDrain_valFlat10)
	uaAttackDrain_valFlat20 = _smns_addMod_uaAttackDrain_valFlat20(uaAttackDrain_valFlat20)
	uaAttackDrain_valFlat35 = _smns_addMod_uaAttackDrain_valFlat35(uaAttackDrain_valFlat35)
	uaAttackCrit_valFlat5 = _smns_addMod_uaAttackCrit_valFlat5(uaAttackCrit_valFlat5)
	uaAttackCrit_valFlat10 = _smns_addMod_uaAttackCrit_valFlat10(uaAttackCrit_valFlat10)
	umAttackProtection5 = _smns_addMod_umAttackProtection25(umAttackProtection5)
	umAttackProtection25 = _smns_addMod_umAttackProtection25(umAttackProtection25)
	umAttackProtection35 = _smns_addMod_umAttackProtection25(umAttackProtection35)
	umAttackProtection50 = _smns_addMod_umAttackProtection50(umAttackProtection50)
	umAttackProtection75 = _smns_addMod_umAttackProtection75(umAttackProtection75)
	umAttackProtection100 = _smns_addMod_umAttackProtection100(umAttackProtection100)
	umSummonBonusLevel1 = _smns_addMod_umSummonBonusLevel1(umSummonBonusLevel1)
	umSummonBonusLevel2 = _smns_addMod_umSummonBonusLevel2(umSummonBonusLevel2)
	umSummonBonusLevel3 = _smns_addMod_umSummonBonusLevel3(umSummonBonusLevel3)
	umSummonBonusLevel4 = _smns_addMod_umSummonBonusLevel4(umSummonBonusLevel4)
	umSummonBonusLevel5 = _smns_addMod_umSummonBonusLevel5(umSummonBonusLevel5)
	uaSummonTransform_valFlat1 = _smns_addMod_uaSummonTransform_valFlat1(uaSummonTransform_valFlat1)
	uaSummonTransform_valFlat2 = _smns_addMod_uaSummonTransform_valFlat2(uaSummonTransform_valFlat2)
	uaExpKill_valFlat10m = _smns_addMod_uaExpKill_valFlat10m(uaExpKill_valFlat10m)
	uaExpKill_valFlat25m = _smns_addMod_uaExpKill_valFlat25m(uaExpKill_valFlat25m)
	uaExpKill_valFlat10 = _smns_addMod_uaExpKill_valFlat10(uaExpKill_valFlat10)
	uaExpKill_valFlat15 = _smns_addMod_uaExpKill_valFlat15(uaExpKill_valFlat15)
	uaExpKill_valFlat25 = _smns_addMod_uaExpKill_valFlat25(uaExpKill_valFlat25)
	uaCurseProtection_valCovered1 = _smns_addMod_uaCurseProtection_valCovered1(uaCurseProtection_valCovered1)
	uaArmorFlat_valCovered10 = _smns_addMod_uaArmorFlat_valCovered10(uaArmorFlat_valCovered10)
	uaArmorFlat_valCovered15 = _smns_addMod_uaArmorFlat_valCovered15(uaArmorFlat_valCovered15)
	uaArmorFlat_valCovered20 = _smns_addMod_uaArmorFlat_valCovered20(uaArmorFlat_valCovered20)
	uaBlisterResist = _smns_addMod_uaBlisterResist(uaBlisterResist)
	uaFrostbiteResist = _smns_addMod_uaFrostbiteResist(uaFrostbiteResist)
	uaPoisonResist = _smns_addMod_uaPoisonResist(uaPoisonResist)
	uaLowerDamageResist = _smns_addMod_uaLowerDamageResist(uaLowerDamageResist)
	uaLowerInitiativeResist = _smns_addMod_uaLowerInitiativeResist(uaLowerInitiativeResist)
	umPerLostHP_Armor1 = _smns_addMod_umPerLostHP_Armor1(umPerLostHP_Armor1)
	umPerLostHP_AttackInitiative1 = _smns_addMod_umPerLostHP_AttackInitiative1(umPerLostHP_AttackInitiative1)
	umPerLostHP_AttackDamageHeal1 = _smns_addMod_umPerLostHP_AttackDamageHeal1(umPerLostHP_AttackDamageHeal1)
	umPerLostHP_AttackPower1 = _smns_addMod_umPerLostHP_AttackPower1(umPerLostHP_AttackPower1)
	umPerLostHP_AttackDrain1 = _smns_addMod_umPerLostHP_AttackDrain1(umPerLostHP_AttackDrain1)
	umPerLostHP_AttackCrit1 = _smns_addMod_umPerLostHP_AttackCrit1(umPerLostHP_AttackCrit1)
	umPerLostHP_DoubleAttack1 = _smns_addMod_umPerLostHP_DoubleAttack1(umPerLostHP_DoubleAttack1)
	umAttackDamageInitiativeOnFullLife10 = _smns_addMod_umAttackDamageInitiativeOnFullLife10(umAttackDamageInitiativeOnFullLife10)
	umAttackLessPowerOnFullLife10 = _smns_addMod_umAttackLessPowerOnFullLife10(umAttackLessPowerOnFullLife10)
	umCowardiceBig = _smns_addMod_umCowardiceBig(umCowardiceBig)
	umVampirismPerCorpse = _smns_addMod_umVampirismPerCorpse(umVampirismPerCorpse)
	umCannibalism10 = _smns_addMod_umCannibalism10(umCannibalism10)
	uaArmorFlat_valNearest5 = _smns_addMod_uaArmorFlat_valNearest5(uaArmorFlat_valNearest5)
	ua_mlh_ArmorFlat20 = _smns_addMod_ua_mlh_ArmorFlat20(ua_mlh_ArmorFlat20)
	ua_mlh_PowerPercent20 = _smns_addMod_ua_mlh_PowerPercent20(ua_mlh_PowerPercent20)
	ua_mlh_CritFlat20 = _smns_addMod_ua_mlh_CritFlat20(ua_mlh_CritFlat20)
	ua_AddedDamagePercent10 = _smns_addMod_ua_AddedDamagePercent10(ua_AddedDamagePercent10)
	ua_AddedDamagePercent30 = _smns_addMod_ua_AddedDamagePercent35(ua_AddedDamagePercent30)
	ua_AddedDamagePercent35 = _smns_addMod_ua_AddedDamagePercent35(ua_AddedDamagePercent35)
	ua_AddedDamagePercent45 = _smns_addMod_ua_AddedDamagePercent45(ua_AddedDamagePercent45)
	umDrainLevelResistance50 = _smns_addMod_umDrainLevelResistance50(umDrainLevelResistance50)
	uaHitPointOnDeath_valPercent10 = _smns_addMod_uaHitPointOnDeath_valPercent10(uaHitPointOnDeath_valPercent10)
	uaHitPointOnDeath_valPercent20 = _smns_addMod_uaHitPointOnDeath_valPercent20(uaHitPointOnDeath_valPercent20)
	uaAttackDrainOnDeath_valPercent10 = _smns_addMod_uaAttackDrainOnDeath_valPercent10(uaAttackDrainOnDeath_valPercent10)
	uaAttackDrainOnDeath_valPercent20 = _smns_addMod_uaAttackDrainOnDeath_valPercent20(uaAttackDrainOnDeath_valPercent20)
	umHitPointPerCorpse = _smns_addMod_umHitPointPerCorpse(umHitPointPerCorpse)
end

unitAura.name = 'unitAura'
return unitAura
