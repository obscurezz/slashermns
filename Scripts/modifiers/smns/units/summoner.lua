package.path = ".\\Scripts\\?.lua;.\\Scripts\\exp\\?.lua;.\\Scripts\\modules\\?.lua;.\\Scripts\\modifiers\\?.lua;.\\Scripts\\modules\\smns\\?.lua;.\\Scripts\\modifiers\\items\\?.lua;.\\Scripts\\modifiers\\units\\?.lua"
require('setValue')
require('smnsConditions')

function getModifierDisplay(unit, prev)
	return prev
end

function getModifierDescTxt(unit, prev)
	return prev
end

function getAttackReach(unit, prev)
	if smnsConditions_isPartyFull(unit) then
		return 801
	end

	return prev
end

function getAttackId(unit, prev)
	if smnsConditions_isPartyFull(unit) then
		return Id.new("g000aa0035")
	end

	return prev
end