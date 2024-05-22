package.path = ".\\Scripts\\?.lua;.\\Scripts\\exp\\?.lua;.\\Scripts\\modules\\?.lua;.\\Scripts\\modifiers\\?.lua;.\\Scripts\\modules\\smns\\?.lua;.\\Scripts\\modifiers\\items\\?.lua;.\\Scripts\\modifiers\\units\\?.lua"
require('setValue')

function getModifierDisplay(unit, prev)
	return prev
end

function getModifierDescTxt(unit, prev)
	return prev
end

function getAttackPower(unit, prev)
	local res = prev
	if _GroupInfo_stackHasModifierAmount(Id.new('g070um0064').value) > 0 then
		res = svFlatEffectPower1(unit, prev, 10)
	end
	return res
end

function getAttack2Power(unit, prev)
	local res = prev
	if _GroupInfo_stackHasModifierAmount(Id.new('g070um0064').value) > 0 then
		smnsInfo_SetApplyAccuracyBuffToAttack2(true)
		res = svFlatEffectPower2(unit, prev, 10)
		smnsInfo_SetApplyAccuracyBuffToAttack2(false)
	end
	return res
end
