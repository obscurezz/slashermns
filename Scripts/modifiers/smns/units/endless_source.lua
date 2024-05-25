package.path = ".\\Scripts\\?.lua;.\\Scripts\\exp\\?.lua;.\\Scripts\\modules\\?.lua;.\\Scripts\\modifiers\\?.lua;.\\Scripts\\modules\\smns\\?.lua;.\\Scripts\\modifiers\\items\\?.lua;.\\Scripts\\modifiers\\units\\?.lua"
require('setValue')
require('GroupInfo')

function getModifierDisplay(unit, prev)
	return prev
end

function getModifierDescTxt(unit, prev)
	return prev
end

function getAttack2Damage(unit, prev)
	local p = _GroupInfo_getUnitPlayer(unit)
	if p ~= nil and p.race ~= Race.Neutral then
		local IM = math.min(1000, p.bank.infernalMana)

		local value = 0.02 * math.floor(IM / 50)

		return svMultimplyDamage2(unit, prev, value)
	end
	return prev
end

function getAttack2Power(unit, prev)
	local p = _GroupInfo_getUnitPlayer(unit)
	if p ~= nil and p.race ~= Race.Neutral then
		local IM = math.min(1000, p.bank.infernalMana)
		local value = math.floor(IM / 50)

		smnsInfo_SetApplyAccuracyBuffToAttack2(true)
		local res = svFlatEffectPower2(unit, prev, value)
		smnsInfo_SetApplyAccuracyBuffToAttack2(false)
		return res
	end
	return prev
end