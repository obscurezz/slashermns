package.path = ".\\Scripts\\?.lua;.\\Scripts\\exp\\?.lua;.\\Scripts\\modifiers\\?.lua;.\\Scripts\\modifiers\\drawing\\?.lua;.\\Scripts\\modifiers\\items\\?.lua;.\\Scripts\\modifiers\\leaderMods\\?.lua;.\\Scripts\\modifiers\\perks\\?.lua;.\\Scripts\\modifiers\\smns\\?.lua;.\\Scripts\\modifiers\\smns\\items\\?.lua;.\\Scripts\\modifiers\\smns\\perks\\?.lua;.\\Scripts\\modifiers\\smns\\spells\\?.lua;.\\Scripts\\modifiers\\smns\\units\\?.lua;.\\Scripts\\modifiers\\spells\\?.lua;.\\Scripts\\modifiers\\units\\?.lua;.\\Scripts\\modifiers\\units\\bloodsorcerer\\?.lua;.\\Scripts\\modifiers\\units\\multiplicative_stats\\?.lua;.\\Scripts\\modifiers\\units\\torhoth\\?.lua;.\\Scripts\\modules\\?.lua;.\\Scripts\\modules\\smns\\?.lua;.\\Scripts\\workshop\\?.lua;.\\Scripts\\workshop\\classes\\?.lua"
require('mRnd')
require('succubus_info')

function getModifierDisplay(unit, prev)
	local uimpl = getScenario():getUnit(unit.id).impl
	local a = uimpl.attack2
	if a == nil or a.type ~= Attack.Paralyze then
		return false
	end
	if _succubus_info_paralize_infinite_chance(unit, uimpl) >= 100 then
		return false
	end
	return prev
end
function getModifierDescTxt(unit, prev)
	return prev
end

function getAttack2Infinite(unit, prev)
	local uimpl = getScenario():getUnit(unit.id).impl
	local a = uimpl.attack2
	if a ~= nil and a.type == Attack.Paralyze then
		return _mRnd_simpleRndEvent(_succubus_info_paralize_infinite_chance(unit, uimpl))
	end
	return prev
end
