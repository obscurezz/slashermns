package.path = ".\\Scripts\\?.lua;.\\Scripts\\exp\\?.lua;.\\Scripts\\modules\\?.lua;.\\Scripts\\modifiers\\?.lua;.\\Scripts\\modules\\smns\\?.lua;.\\Scripts\\modifiers\\items\\?.lua;.\\Scripts\\modifiers\\units\\?.lua"
require "setValue"

function getModifierDisplay(unit, prev)
	return prev
end

function getModifierDescTxt(unit, prev)
	return prev
end

function hasMovementBonus(unit, ground, prev)
	if ground == Ground.Water then
		return true
	end	
	return prev
end

function getMovement(unit, prev)
	return svFlatEffectMovement(unit, prev, 7)
end
