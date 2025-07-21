package.path = ".\\Scripts\\?.lua;.\\Scripts\\exp\\?.lua;.\\Scripts\\modules\\?.lua;.\\Scripts\\modifiers\\?.lua;.\\Scripts\\modules\\smns\\?.lua;.\\Scripts\\modifiers\\items\\?.lua;.\\Scripts\\modifiers\\units\\?.lua"
require('GroupInfo')
require('setValue')

function getModifierDisplay(unit, prev)
	return prev
end

function getModifierDescTxt(unit, prev)
	return prev
end

-- function getAttackDamRatio(unit, prev)	
-- 	if _heroCondition(unit, Archmage) then
-- 		return 65
-- 	end
-- 	return prev
-- end

-- function getAttackInitiative(unit, prev)    
--     if _heroCondition(unit, Pepega) then
-- 		return svFlatEffectInitiative(unit, prev, 5)
-- 	end
-- 	return prev	
-- end

function getAttackDamage(unit, prev)
    if smnsConditions_heroCondition(unit, Archmage) then
		return svMultimplyDamage1(unit, prev, 0.15)
	end
	return prev	
end

-- function getArmor(unit, prev)    
--     if _heroCondition(unit, Ranger) then
-- 		return svFlatEffectArmor(unit, prev, 10)
-- 	end
-- 	return prev	
-- end

-- function getRegen(unit, prev)
--     if _heroCondition(unit, Ranger) then
-- 		return prev + 10
-- 	end
-- 	return prev	
-- end
