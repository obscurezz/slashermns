package.path = ".\\Scripts\\?.lua;.\\Scripts\\exp\\?.lua;.\\Scripts\\modifiers\\?.lua;.\\Scripts\\modifiers\\drawing\\?.lua;.\\Scripts\\modifiers\\items\\?.lua;.\\Scripts\\modifiers\\leaderMods\\?.lua;.\\Scripts\\modifiers\\perks\\?.lua;.\\Scripts\\modifiers\\smns\\?.lua;.\\Scripts\\modifiers\\smns\\items\\?.lua;.\\Scripts\\modifiers\\smns\\perks\\?.lua;.\\Scripts\\modifiers\\smns\\spells\\?.lua;.\\Scripts\\modifiers\\smns\\units\\?.lua;.\\Scripts\\modifiers\\spells\\?.lua;.\\Scripts\\modifiers\\units\\?.lua;.\\Scripts\\modifiers\\units\\bloodsorcerer\\?.lua;.\\Scripts\\modifiers\\units\\multiplicative_stats\\?.lua;.\\Scripts\\modifiers\\units\\torhoth\\?.lua;.\\Scripts\\modules\\?.lua;.\\Scripts\\modules\\smns\\?.lua;.\\Scripts\\workshop\\?.lua;.\\Scripts\\workshop\\classes\\?.lua"
require('mRnd')

function getModifierDisplay(unit, prev)
	local uimpl = getScenario():getUnit(unit.id).impl
	local a = uimpl.attack2
	if a ~= nil and a.type == Attack.LowerDamage then
		local chance = 10 * ( uimpl.level - unit.baseImpl.level )
		if chance < 100 then
			return prev
		else
			return false
		end
	end
	return false
end

function getModifierDescTxt(unit, prev)
	return prev
end

function getAttack2Infinite(unit, prev)
	if prev then
		return prev
	end
	local uimpl = unit.impl
	local a = uimpl.attack2
	if a == nil or a.type ~= Attack.LowerDamage then
		return prev
	end
	local chance = 10 * ( uimpl.level - unit.baseImpl.level )
	if _mRnd_simpleRndEvent(chance) then
		return true
	end
	return prev
end
