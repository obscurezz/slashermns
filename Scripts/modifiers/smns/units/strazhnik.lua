package.path = ".\\Scripts\\?.lua;.\\Scripts\\exp\\?.lua;.\\Scripts\\modules\\?.lua;.\\Scripts\\modifiers\\?.lua;.\\Scripts\\modules\\smns\\?.lua;.\\Scripts\\modifiers\\items\\?.lua;.\\Scripts\\modifiers\\units\\?.lua"
require('setValue')
require('smnsConditions')
require('GroupInfo')

function getModifierDisplay(unit, prev)
	return prev
end

function getModifierDescTxt(unit, prev)
	return prev
end

--стражник
function getAttackDamage(unit, prev)
	local player = _GroupInfo_getUnitPlayer(unit)
	if player ~= nil and player.race ~= Race.Neutral then
		local InfernalMana = player.bank.infernalMana
		bonus_damage = math.min(unit.impl.attack1.damage/2, math.floor(InfernalMana/55))
		return svFlatEffectDamage1(unit, prev, bonus_damage)
	end
	return prev
end

function getAttackSource(unit, prev)
	if unit.impl.level - unit.baseImpl.level >= 3 then
		return Source.Life
	end
	return prev
end