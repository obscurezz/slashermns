package.path = ".\\Scripts\\?.lua;.\\Scripts\\exp\\?.lua;.\\Scripts\\modules\\?.lua;.\\Scripts\\modifiers\\?.lua;.\\Scripts\\modules\\smns\\?.lua;.\\Scripts\\modifiers\\items\\?.lua;.\\Scripts\\modifiers\\units\\?.lua"
require('setValue')
require('converter')
require('GroupInfo')
require('smnsInfo')

function getModifierDisplay(unit, prev)
	return prev
end

function getModifierDescTxt(unit, prev)
	return prev
end

function getAttackHeal(unit, prev)
	local result = prev
    local p = _GroupInfo_getUnitPlayer(unit)
	if p ~= nil and p.race ~= Race.Neutral then
		local LM = math.min(1000, p.bank.lifeMana)
		smnsInfo_SetApplyApplyDmgBuffToHeal(true)
		result = svFlatEffectHeal1(unit, prev, math.floor(LM / 40))
		smnsInfo_SetApplyApplyDmgBuffToHeal(false)
	end
	return result
end

-- function getAttack2Heal(unit, prev)
-- 	local result = prev
--     local p = _GroupInfo_getUnitPlayer(unit)
-- 	if p ~= nil and p.race ~= Race.Neutral then
-- 		local LM = math.min(1000, p.bank.lifeMana)
-- 		smnsInfo_SetApplyApplyDmgBuffToHeal(true)
-- 		result = svFlatEffectHeal2(unit, prev, math.floor(LM / 40))
-- 		smnsInfo_SetApplyApplyDmgBuffToHeal(false)
-- 	end
-- 	return result
-- end