
local attackTypeConversionInfoUpperBound = 8

function AttackTypeConversion_MakeAttackInfo(class, damage, heal, level, power, split, attackId, valueIsGenerated)
	--	1      2       3     4      5      6      7         8
	return {class, damage, heal, level, power, split, attackId, valueIsGenerated}
end
function AttackTypeConversion_PrintAttackInfo(ainfo)
	if ainfo == nil then
		return 'info is empty'
	end
	return 'class '..tostring(AttackTypeConversion_GetClass(ainfo))..' damage '..tostring(AttackTypeConversion_GetDamage(ainfo))..' heal '..tostring(AttackTypeConversion_GetHeal(ainfo))..' level '..tostring(AttackTypeConversion_GetLevel(ainfo))..' power '..tostring(AttackTypeConversion_GetPower(ainfo))..' split '..tostring(AttackTypeConversion_GetSplit(ainfo))..' attackId '..tostring(AttackTypeConversion_GetAttackId(ainfo))
end
function AttackTypeConversion_GetClass(ainfo)
	return ainfo[1]
end
function AttackTypeConversion_GetDamage(ainfo)
	return ainfo[2]
end
function AttackTypeConversion_GetHeal(ainfo)
	return ainfo[3]
end
function AttackTypeConversion_GetLevel(ainfo)
	return ainfo[4]
end
function AttackTypeConversion_GetPower(ainfo)
	return ainfo[5]
end
function AttackTypeConversion_GetSplit(ainfo)
	return ainfo[6]
end
function AttackTypeConversion_GetAttackId(ainfo)
	return ainfo[7]
end
function AttackTypeConversion_GetValueIsGenerated(ainfo)
	return ainfo[8]
end

function AttackTypeConversion_GetAverageDamage(ainfo)
	return 0.01 * ainfo[2] * ainfo[5]
end

function AttackTypeConversion_SetDamage(ainfo, value)
	ainfo[2] = value
	return ainfo
end
function AttackTypeConversion_SetHeal(ainfo, value)
	ainfo[3] = value
	return ainfo
end
function AttackTypeConversion_SetPower(ainfo, value)
	ainfo[5] = value
	return ainfo
end

function AttackTypeConversion_DamageToHeal(unit, ainfo)
	ainfo[3] = 0.01 * ainfo[5] * ainfo[2]
	ainfo[2] = 0
	ainfo[5] = 100
	return ainfo
end
function AttackTypeConversion_HealToDamage(unit, ainfo)
	local overlevel = unit.impl.level - unit.baseImpl.level
	ainfo[2] = ainfo[3]
	ainfo[3] = 0
	ainfo[5] = 80 + math.min(overlevel, 10)
	return ainfo
end

function AttackTypeConversion_GenDamage(unit, ainfo)
	local overlevel = unit.impl.level - unit.baseImpl.level
	local baseDmg = 20 + 0.04 * unit.baseImpl.xpNext
	if unit.leveledImpl.attacksTwice then
		baseDmg = baseDmg * 0.5
	end
	baseDmg = baseDmg * (1 + 0.1 * overlevel) * 0.01 * ainfo[5]
	local basePower = 80 + math.min(overlevel, 10)
	return AttackTypeConversion_MakeAttackInfo(nil, baseDmg, 0, 0, basePower, true, ainfo[7], true)
end
function AttackTypeConversion_GenHeal(unit, ainfo)
	local overlevel = unit.impl.level - unit.baseImpl.level
	local baseHeal = 15 + 0.03 * unit.baseImpl.xpNext
	if unit.leveledImpl.attacksTwice then
		baseHeal = baseHeal * 0.5
	end
	baseHeal = baseHeal * (1 + 0.1 * overlevel) * 0.01 * ainfo[5]
	return AttackTypeConversion_MakeAttackInfo(nil, 0, baseHeal, 0, 100, true, ainfo[7], true)
end

----------------------------------------------------

function AttackTypeConversion_Rename(nameId, class, leveledAttack1, type1, type2, a2TypeBeforeConversion, name1, name2)
	if leveledAttack1.type ~= type1 then
		name1 = Id.new(nameId)
	end
	if leveledAttack2Id ~= aG000000000 then
		if a2TypeBeforeConversion ~= nil then
			if a2TypeBeforeConversion ~= type2 then
				name2 = Id.new(nameId)
			end
		else
			if type2 == class then
				name2 = Id.new(nameId)
			end
		end
	end
	return name1, name2
end

----------------------------------------------------

function AttackTypeConversion_ThaumaturgyPotion(unit, ainfo, soft)
	if ainfo == nil then
		return nil
	end
	local class = AttackTypeConversion_GetClass(ainfo)
	local result = {}
	result[1] = nil
	for i = 2, attackTypeConversionInfoUpperBound do
		result[i] = ainfo[i]
	end
	if class == Attack.Damage 
	or class == Attack.Drain 
	or class == Attack.DrainOverflow 
	or class == Attack.Poison 
	or class == Attack.Frostbite 
	or class == Attack.Blister then
		result[1] = Attack.DrainOverflow
		
	elseif class == Attack.Shatter then
		result[1] = Attack.Shatter
	elseif class == Attack.Heal then
		result = AttackTypeConversion_HealToDamage(unit, result)
		result[1] = Attack.DrainOverflow
	
	elseif class == Attack.Paralyze 
	    or class == Attack.Petrify 
	    or class == Attack.TransformOther 
	    or class == Attack.Fear 
	    or class == Attack.LowerDamage 
	    or class == Attack.LowerInitiative 
	    or class == Attack.DrainLevel then
	    	if soft then
	    		result[1] = class
	    	else
	    		result = AttackTypeConversion_GenDamage(unit, ainfo)
	    		result[1] = Attack.DrainOverflow
	    	end
	
	elseif class == Attack.BoostDamage 
	    or class == Attack.Revive 
	    or class == Attack.Cure 
	    or class == Attack.BestowWards 
	    or class == Attack.GiveAttack then
    		result = AttackTypeConversion_GenDamage(unit, ainfo)
    		result[1] = Attack.DrainOverflow
		
	elseif class == Attack.Summon then
		result = AttackTypeConversion_GenDamage(unit, ainfo)
		result[1] = Attack.DrainOverflow
	elseif class == Attack.Doppelganger then
		result[1] = Attack.Doppelganger
	elseif class == Attack.TransformSelf then
		result[1] = Attack.TransformSelf
	end
	return result
end

function AttackTypeConversion_VampirismPotion(unit, ainfo, soft)
	if ainfo == nil then
		return nil
	end
	local class = AttackTypeConversion_GetClass(ainfo)
	local result = {}
	result[1] = nil
	for i = 2, attackTypeConversionInfoUpperBound do
		result[i] = ainfo[i]
	end
	if class == Attack.Damage
	or class == Attack.Drain then
		result[1] = Attack.Drain
	
	elseif class == Attack.DrainOverflow then
		result[1] = Attack.DrainOverflow
	
	elseif class == Attack.Poison 
	    or class == Attack.Frostbite 
	    or class == Attack.Blister then
		result[1] = Attack.Drain
	elseif class == Attack.Shatter then
		result[1] = Attack.Shatter
	elseif class == Attack.Heal then
		result = AttackTypeConversion_HealToDamage(unit, result)
		result[1] = Attack.Drain
	
	elseif class == Attack.Paralyze 
	    or class == Attack.Petrify 
	    or class == Attack.TransformOther 
	    or class == Attack.Fear 
	    or class == Attack.LowerDamage 
	    or class == Attack.LowerInitiative 
	    or class == Attack.DrainLevel then
	    	if soft then
	    		result[1] = class
	    	else
	    		result = AttackTypeConversion_GenDamage(unit, ainfo)
	    		result[1] = Attack.Drain
	    	end
	
	elseif class == Attack.BoostDamage 
	    or class == Attack.Revive 
	    or class == Attack.Cure 
	    or class == Attack.BestowWards 
	    or class == Attack.GiveAttack then
    		result = AttackTypeConversion_GenDamage(unit, ainfo)
    		result[1] = Attack.Drain
		
	elseif class == Attack.Summon then
		result = AttackTypeConversion_GenDamage(unit, ainfo)
		result[1] = Attack.Drain
	elseif class == Attack.Doppelganger then
		result[1] = Attack.Doppelganger
	elseif class == Attack.TransformSelf then
		result[1] = Attack.TransformSelf
	end
	return result
end

function AttackTypeConversion_CommonDamagePotion(unit, ainfo, soft)
	if ainfo == nil then
		return nil
	end
	local class = AttackTypeConversion_GetClass(ainfo)
	local result = {}
	result[1] = nil
	for i = 2, attackTypeConversionInfoUpperBound do
		result[i] = ainfo[i]
	end
	if class == Attack.Damage then
		result[1] = Attack.Damage
			
	elseif class == Attack.Drain then
		result[1] = Attack.Drain
	
	elseif class == Attack.DrainOverflow then
		result[1] = Attack.DrainOverflow
	
	elseif class == Attack.Poison 
	    or class == Attack.Frostbite 
	    or class == Attack.Blister then
		result[1] = class
	elseif class == Attack.Shatter then
		result[1] = Attack.Shatter
	elseif class == Attack.Heal then
		result = AttackTypeConversion_HealToDamage(unit, result)
		result[1] = Attack.Damage
	
	elseif class == Attack.Paralyze 
	    or class == Attack.Petrify 
	    or class == Attack.TransformOther 
	    or class == Attack.Fear 
	    or class == Attack.LowerDamage 
	    or class == Attack.LowerInitiative 
	    or class == Attack.DrainLevel then
	    	if soft then
	    		result[1] = class
	    	else
	    		result = AttackTypeConversion_GenDamage(unit, ainfo)
	    		result[1] = Attack.Damage
	    	end
	
	elseif class == Attack.BoostDamage 
	    or class == Attack.Revive 
	    or class == Attack.Cure 
	    or class == Attack.BestowWards 
	    or class == Attack.GiveAttack then
    		result = AttackTypeConversion_GenDamage(unit, ainfo)
    		result[1] = Attack.Damage
		
	elseif class == Attack.Summon then
		result = AttackTypeConversion_GenDamage(unit, ainfo)
		result[1] = Attack.Damage
	elseif class == Attack.Doppelganger then
		result[1] = Attack.Doppelganger
	elseif class == Attack.TransformSelf then
		result[1] = Attack.TransformSelf
	end
	return result
end

function AttackTypeConversion_HealPotion(unit, ainfo, soft)
	if ainfo == nil then
		return nil
	end
	local class = AttackTypeConversion_GetClass(ainfo)
	local result = {}
	result[1] = nil
	for i = 2, attackTypeConversionInfoUpperBound do
		result[i] = ainfo[i]
	end
	if class == Attack.Damage 
	or class == Attack.Drain 
	or class == Attack.DrainOverflow 
	or class == Attack.Poison 
	or class == Attack.Frostbite 
	or class == Attack.Blister 
	or class == Attack.Shatter then
		result = AttackTypeConversion_DamageToHeal(unit, result)
		result[1] = Attack.Heal
	elseif class == Attack.Heal then
		result[1] = Attack.Heal
	
	elseif class == Attack.Paralyze 
	    or class == Attack.Petrify 
	    or class == Attack.TransformOther 
	    or class == Attack.Fear 
	    or class == Attack.LowerDamage 
	    or class == Attack.LowerInitiative 
	    or class == Attack.DrainLevel then
	    	result = AttackTypeConversion_GenHeal(unit, ainfo)
	     	result[1] = Attack.Heal
	
	elseif class == Attack.BoostDamage 
	    or class == Attack.Revive 
	    or class == Attack.Cure 
	    or class == Attack.BestowWards 
	    or class == Attack.GiveAttack then
	    	if soft then
	    		result[1] = class
	    	else
		    	result = AttackTypeConversion_GenHeal(unit, ainfo)
		     	result[1] = Attack.Heal
	    	end
		
	elseif class == Attack.Summon then
	    	result = AttackTypeConversion_GenHeal(unit, ainfo)
	     	result[1] = Attack.Heal
	elseif class == Attack.Doppelganger then
		result[1] = Attack.Doppelganger
	elseif class == Attack.TransformSelf then
		result[1] = Attack.TransformSelf
	end
	return result
end

function AttackTypeConversion_FilterDamagingAttack(attack1Class, attack2Info)
	if attack2Info ~= nil then
		if attack1Class == AttackTypeConversion_GetClass(attack2Info)
		or ( attack1Class == Attack.Petrify and AttackTypeConversion_GetClass(attack2Info) == Attack.Paralyze )
		or ( attack1Class == Attack.Paralyze and AttackTypeConversion_GetClass(attack2Info) == Attack.Petrify ) then
			return nil
		end
	end
	return attack2Info
end
