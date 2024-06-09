package.path = ".\\Scripts\\?.lua;.\\Scripts\\exp\\?.lua;.\\Scripts\\modules\\?.lua;.\\Scripts\\modifiers\\?.lua;.\\Scripts\\modules\\smns\\?.lua;.\\Scripts\\modifiers\\items\\?.lua;.\\Scripts\\modifiers\\units\\?.lua"
require('setValue')

function getModifierDisplay(unit, prev)
	return prev
end

function getModifierDescTxt(unit, prev)
	return prev
end

function getAttackDamage(unit, prev)
	if (unit.hp / unit.hpMax) < 0.4 then
		return svMultimplyDamage1(unit, prev, 0.2) 
	end
	return prev
end


function getAttackInitiative(unit, prev)
	if (unit.hp / unit.hpMax) < 0.4 then
		return svMultimplyInitiative(unit, prev, 0.15) 
	end
	return prev
end

