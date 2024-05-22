package.path = ".\\Scripts\\?.lua;.\\Scripts\\exp\\?.lua;.\\Scripts\\modules\\?.lua;.\\Scripts\\modifiers\\?.lua;.\\Scripts\\modules\\smns\\?.lua;.\\Scripts\\modifiers\\items\\?.lua;.\\Scripts\\modifiers\\units\\?.lua"
require('setValue')

function getModifierDisplay(unit, prev)
	return prev
end

function getModifierDescTxt(unit, prev)
	return prev
end

function getAttackReach(unit, prev)
	local player = _GroupInfo_getUnitPlayer(unit)
	if player ~= nil and player.race ~= Race.Neutral then
		local ElfMana = player.bank.groveMana
		if _mRnd_simpleRndEvent(35 + math.floor(ElfMana / 40)) then
			return 701
		end
	end
	return prev
end

function getAttackDamRatio(unit, prev)
	return 25
end