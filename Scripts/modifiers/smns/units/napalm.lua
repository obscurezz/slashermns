package.path = ".\\Scripts\\?.lua;.\\Scripts\\exp\\?.lua;.\\Scripts\\modules\\?.lua;.\\Scripts\\modifiers\\?.lua;.\\Scripts\\modules\\smns\\?.lua"
require('GroupInfo')
require('converter')
require('setValue')

function getModifierDisplay(unit, prev)
	return prev
end

function getModifierDescTxt(unit, prev)
	return prev
end

function getAttackReach(unit, prev)
	_get_Group_and_Mods(unit)
	if _GroupInfo_stackHasModifierAmount(Id.new('g070um0042').value) > 0 then
		return 101
	end
	return prev
end

function getAttack2Power(unit, prev)
	_get_Group_and_Mods(unit)
	local result = prev
	if _GroupInfo_stackHasModifierAmount(Id.new('g070um0042').value) > 0 then
		smnsInfo_SetApplyAccuracyBuffToAttack2(true)
		result = svFlatEffectPower2(unit, prev, 10)
		smnsInfo_SetApplyAccuracyBuffToAttack2(false)
	end
	return result
end