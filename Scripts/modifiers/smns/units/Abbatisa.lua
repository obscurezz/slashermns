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
	if (unit.hp / unit.hpMax) < 0.45 then
		smnsInfo_SetApplyApplyDmgBuffToHeal(true)
		result = svMultimplyHeal1(unit, prev, 0.3)
		smnsInfo_SetApplyApplyDmgBuffToHeal(false)
	end
	return result
end

function getAttack2Heal(unit, prev)
	local result = prev
	if (unit.hp / unit.hpMax) < 0.45 then
		smnsInfo_SetApplyApplyDmgBuffToHeal(true)
		result = svMultimplyHeal2(unit, prev, 0.3)
		smnsInfo_SetApplyApplyDmgBuffToHeal(false)
	end
	return result
end