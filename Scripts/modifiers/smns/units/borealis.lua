package.path = ".\\Scripts\\?.lua;.\\Scripts\\exp\\?.lua;.\\Scripts\\modules\\?.lua;.\\Scripts\\modifiers\\?.lua;.\\Scripts\\modules\\smns\\?.lua;.\\Scripts\\modifiers\\items\\?.lua;.\\Scripts\\modifiers\\units\\?.lua"
require('setValue')
require('smnsConditions')

function getModifierDisplay(unit, prev)
	return prev
end

function getModifierDescTxt(unit, prev)
	return prev
end

--бореалис

function getAttackInitiative(unit, prev)
	local pathfinder = Id.new('g070um0152').value
	if _GroupInfo_stackHasModifierAmount(pathfinder) > 0 then
		return svMultimplyInitiative(unit, prev, 0.1)
	end
	return prev
end
--
