package.path = ".\\Scripts\\?.lua;.\\Scripts\\exp\\?.lua;.\\Scripts\\modifiers\\?.lua;.\\Scripts\\modifiers\\drawing\\?.lua;.\\Scripts\\modifiers\\items\\?.lua;.\\Scripts\\modifiers\\leaderMods\\?.lua;.\\Scripts\\modifiers\\perks\\?.lua;.\\Scripts\\modifiers\\smns\\?.lua;.\\Scripts\\modifiers\\smns\\items\\?.lua;.\\Scripts\\modifiers\\smns\\perks\\?.lua;.\\Scripts\\modifiers\\smns\\spells\\?.lua;.\\Scripts\\modifiers\\smns\\units\\?.lua;.\\Scripts\\modifiers\\spells\\?.lua;.\\Scripts\\modifiers\\units\\?.lua;.\\Scripts\\modifiers\\units\\bloodsorcerer\\?.lua;.\\Scripts\\modifiers\\units\\multiplicative_stats\\?.lua;.\\Scripts\\modifiers\\units\\torhoth\\?.lua;.\\Scripts\\modules\\?.lua;.\\Scripts\\modules\\smns\\?.lua;.\\Scripts\\workshop\\?.lua;.\\Scripts\\workshop\\classes\\?.lua"
require('GroupInfo')
require('setValue')

function getModifierDisplay(unit, prev)
	return prev
end

function getModifierDescTxt(unit, prev)
	return prev
end

function getAttackReach(unit, prev)
	return _RangeInfo_changeToRanged(prev)
end

function getAttackInitiative(unit, prev)
	if _GroupInfo_UnitIsRangedWithoutBow(unit) then
		return prev
	else
		return svMultimplyInitiative(unit, prev, -0.25)
	end
end

function getAttackDrain(unit, damage, prev)
	if _GroupInfo_UnitIsRangedWithoutBow(unit) then
		return svAddDrain1(unit, prev, damage, 0.25)
	else
		return prev
	end
end

function getAttack2Drain(unit, damage, prev)
	if _GroupInfo_UnitIsRangedWithoutBow(unit) then
		return svAddDrain2(unit, prev, damage, 0.25)
	else
		return prev
	end
end
