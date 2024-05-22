package.path = ".\\Scripts\\?.lua;.\\Scripts\\exp\\?.lua;.\\Scripts\\modifiers\\?.lua;.\\Scripts\\modifiers\\drawing\\?.lua;.\\Scripts\\modifiers\\items\\?.lua;.\\Scripts\\modifiers\\leaderMods\\?.lua;.\\Scripts\\modifiers\\perks\\?.lua;.\\Scripts\\modifiers\\smns\\?.lua;.\\Scripts\\modifiers\\smns\\items\\?.lua;.\\Scripts\\modifiers\\smns\\perks\\?.lua;.\\Scripts\\modifiers\\smns\\spells\\?.lua;.\\Scripts\\modifiers\\smns\\units\\?.lua;.\\Scripts\\modifiers\\spells\\?.lua;.\\Scripts\\modifiers\\units\\?.lua;.\\Scripts\\modifiers\\units\\bloodsorcerer\\?.lua;.\\Scripts\\modifiers\\units\\multiplicative_stats\\?.lua;.\\Scripts\\modifiers\\units\\torhoth\\?.lua;.\\Scripts\\modules\\?.lua;.\\Scripts\\modules\\smns\\?.lua;.\\Scripts\\workshop\\?.lua;.\\Scripts\\workshop\\classes\\?.lua"
require('leadership_passive_info')
require('GroupInfo')

_passive_leadership_mod = Id.new("g040um0153").value

function getModifierDisplay(unit, prev)
	if _GroupInfo_UnitHasModifierValue(unit, _passive_leadership_mod) then
		return false
	end
	return _leadership_passive_info_getModifierDisplay(unit, prev, getScenario())
end

function getModifierDescTxt(unit, prev)
	return _leadership_passive_info_getModifierDescTxt(unit, prev, getScenario())
end

function getLeadership(unit, prev)
	return _leadership_passive_info_getLeadership(unit, prev, getScenario())
end
