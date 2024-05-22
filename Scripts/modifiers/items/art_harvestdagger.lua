package.path = ".\\Scripts\\?.lua;.\\Scripts\\exp\\?.lua;.\\Scripts\\modifiers\\?.lua;.\\Scripts\\modifiers\\drawing\\?.lua;.\\Scripts\\modifiers\\items\\?.lua;.\\Scripts\\modifiers\\leaderMods\\?.lua;.\\Scripts\\modifiers\\perks\\?.lua;.\\Scripts\\modifiers\\smns\\?.lua;.\\Scripts\\modifiers\\smns\\items\\?.lua;.\\Scripts\\modifiers\\smns\\perks\\?.lua;.\\Scripts\\modifiers\\smns\\spells\\?.lua;.\\Scripts\\modifiers\\smns\\units\\?.lua;.\\Scripts\\modifiers\\spells\\?.lua;.\\Scripts\\modifiers\\units\\?.lua;.\\Scripts\\modifiers\\units\\bloodsorcerer\\?.lua;.\\Scripts\\modifiers\\units\\multiplicative_stats\\?.lua;.\\Scripts\\modifiers\\units\\torhoth\\?.lua;.\\Scripts\\modules\\?.lua;.\\Scripts\\modules\\smns\\?.lua;.\\Scripts\\workshop\\?.lua;.\\Scripts\\workshop\\classes\\?.lua"
require "unitAuraCustomDesc"
require "GroupInfo"
require "unitAura"
require "setValue"

function getModifierDisplay(unit, prev)
	local r = _modifDisplay_Regen_Flat(unit, prev)
	if unit.hp > 0 then
		return r
	else
		return false
	end
end

function getModifierDescTxt(unit, prev)
	return _modifCustomTxt_Regen_Flat(unit, prev)
end

function getHitPoint(unit, prev)
	return svFlatEffectHitPoint(unit, prev, 25)
end

function getAttackCritHit(unit, prev)
	return true
end

function getAttackCritDamage(unit, prev)
	local m = 5 * unit.impl.leadership
	return svAddCrit1Damage(unit, prev, m)
end

function getAttack2CritHit(unit, prev)
	return true
end

function getAttack2CritDamage(unit, prev)
	local m = 5 * unit.impl.leadership
	return svAddCrit2Damage(unit, prev, m)
end
