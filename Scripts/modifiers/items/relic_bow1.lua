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
		return svMultimplyInitiative(unit, prev, -0.2)
	end
end

function getAttackDamage(unit, prev)
	if _GroupInfo_UnitIsRangedWithoutBow(unit) then
		return svMultimplyDamage1(unit, prev, 0.2)
	else
		return prev
	end
end

function getAttack2Damage(unit, prev)
	if _GroupInfo_UnitIsRangedWithoutBow(unit) then
		return svMultimplyDamage2(unit, prev, 0.2)
	else
		return prev
	end
end

function getAttackPower(unit, prev)
	return svMultimplyPower1(unit, prev, 0.1)
end

function getAttack2Power(unit, prev)
	return svMultimplyPower2(unit, prev, 0.1)
end
