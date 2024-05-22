package.path = ".\\Scripts\\?.lua;.\\Scripts\\exp\\?.lua;.\\Scripts\\modules\\?.lua;.\\Scripts\\modifiers\\?.lua;.\\Scripts\\modules\\smns\\?.lua;.\\Scripts\\modifiers\\items\\?.lua;.\\Scripts\\modifiers\\units\\?.lua"
require('setValue')

function getModifierDisplay(unit, prev)
	return prev
end

function getModifierDescTxt(unit, prev)
	return prev
end

function getAttackDamage(unit, prev)
	local maxHP = getScenario():getUnit(unit.id).hpMax
	local loseHP = ((1 - unit.hp / maxHP)*100)
	local stackPerk =  math.floor(loseHP / 1.5)
	return svMultimplyDamage1(unit, prev, stackPerk / 100)
end
