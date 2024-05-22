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



function getAttackInitiative(unit, prev)
	local player = _GroupInfo_getUnitPlayer(unit)
	if player ~= nil and player.race ~= Race.Neutral then
		local RunicMana = player.bank.runicMana
		local bonus_ini = math.floor(RunicMana/100)

		return svFlatEffectInitiative(unit, prev, bonus_ini)
	end
	return prev
end

	