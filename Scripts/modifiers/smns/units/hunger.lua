package.path = ".\\Scripts\\?.lua;.\\Scripts\\exp\\?.lua;.\\Scripts\\modules\\?.lua;.\\Scripts\\modifiers\\?.lua;.\\Scripts\\modules\\smns\\?.lua;.\\Scripts\\modifiers\\items\\?.lua;.\\Scripts\\modifiers\\units\\?.lua"
require('setValue')

function getModifierDisplay(unit, prev)
	return prev
end

function getModifierDescTxt(unit, prev)
	return prev
end

function getAttackDrain(unit, damage, prev)
    local player = _GroupInfo_getUnitPlayer(unit)
	if player ~= nil and player.race ~= Race.Neutral then
		local DeathMana = player.bank.deathMana
		local bonus_drain = math.min(0.5, 0.05 * math.floor(DeathMana / 200))
		return svAddDrain1(unit, prev, damage, bonus_drain)
	end
	return prev
end