package.path = ".\\Scripts\\?.lua;.\\Scripts\\exp\\?.lua;.\\Scripts\\modules\\?.lua;.\\Scripts\\modifiers\\?.lua;.\\Scripts\\modules\\smns\\?.lua;.\\Scripts\\modifiers\\items\\?.lua;.\\Scripts\\modifiers\\units\\?.lua"
require('setValue')
require('smnsConditions')

function getModifierDisplay(unit, prev)
	return prev
end

function getModifierDescTxt(unit, prev)
	return prev
end

function getAttackDamage(unit, prev)
	if smnsConditions_stackHasCorpse(unit) then
		return svFlatEffectDamage1(unit, prev, 20)
	end

	return prev
end

function getAttack2Damage(unit, prev)
	if smnsConditions_stackHasCorpse(unit) then
		return svFlatEffectDamage2(unit, prev, 20)
	end

	return prev
end
