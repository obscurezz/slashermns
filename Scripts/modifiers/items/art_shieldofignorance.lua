package.path = ".\\Scripts\\?.lua;.\\Scripts\\exp\\?.lua;.\\Scripts\\modifiers\\?.lua;.\\Scripts\\modifiers\\drawing\\?.lua;.\\Scripts\\modifiers\\items\\?.lua;.\\Scripts\\modifiers\\leaderMods\\?.lua;.\\Scripts\\modifiers\\perks\\?.lua;.\\Scripts\\modifiers\\smns\\?.lua;.\\Scripts\\modifiers\\smns\\items\\?.lua;.\\Scripts\\modifiers\\smns\\perks\\?.lua;.\\Scripts\\modifiers\\smns\\spells\\?.lua;.\\Scripts\\modifiers\\smns\\units\\?.lua;.\\Scripts\\modifiers\\spells\\?.lua;.\\Scripts\\modifiers\\units\\?.lua;.\\Scripts\\modifiers\\units\\bloodsorcerer\\?.lua;.\\Scripts\\modifiers\\units\\multiplicative_stats\\?.lua;.\\Scripts\\modifiers\\units\\torhoth\\?.lua;.\\Scripts\\modules\\?.lua;.\\Scripts\\modules\\smns\\?.lua;.\\Scripts\\workshop\\?.lua;.\\Scripts\\workshop\\classes\\?.lua"
require "statscheck"
require "unitAuraCustomDesc"
require "setValue"

function getModifierDisplay(unit, prev)
	local r = _modifDisplay_CurseProtection_Covered(unit, prev)
	if unit.hp > 0 then
		return r
	else
		return false
	end
end

function getModifierDescTxt(unit, prev)
	return _modifCustomTxt_CurseProtection_Covered(unit, prev)
end

function getHitPoint(unit, prev)
	return svMultimplyHitPoint(unit, prev, 0.15)
end

function getImmuneToAttack(unit, attack, prev)
	if prev == Immune.NotImmune and statsCheck_isCurseType(attack) then
		return svAttackImmunityClass(unit, attack, prev, Immune.Once)
	end
	return prev
end
