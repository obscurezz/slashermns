package.path = ".\\Scripts\\?.lua;.\\Scripts\\exp\\?.lua;.\\Scripts\\modules\\?.lua;.\\Scripts\\modifiers\\?.lua;.\\Scripts\\modules\\smns\\?.lua;.\\Scripts\\modifiers\\items\\?.lua;.\\Scripts\\modifiers\\units\\?.lua"
require('setValue')

function getModifierDisplay(unit, prev)
	return prev
end

function getModifierDescTxt(unit, prev)
	return prev
end

function getAttackReach(unit, prev)
	if (unit.hp / unit.hpMax) < 0.5 then
		return 8 
	end
	return prev
end

function getAttackDamRatio(unit, prev)
	if (unit.hp / unit.hpMax) < 0.5 then
		return 50
	end

	return prev
end
