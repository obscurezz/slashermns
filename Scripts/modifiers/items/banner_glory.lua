package.path = ".\\Scripts\\?.lua;.\\Scripts\\exp\\?.lua;.\\Scripts\\modifiers\\?.lua;.\\Scripts\\modifiers\\drawing\\?.lua;.\\Scripts\\modifiers\\items\\?.lua;.\\Scripts\\modifiers\\leaderMods\\?.lua;.\\Scripts\\modifiers\\perks\\?.lua;.\\Scripts\\modifiers\\smns\\?.lua;.\\Scripts\\modifiers\\smns\\items\\?.lua;.\\Scripts\\modifiers\\smns\\perks\\?.lua;.\\Scripts\\modifiers\\smns\\spells\\?.lua;.\\Scripts\\modifiers\\smns\\units\\?.lua;.\\Scripts\\modifiers\\spells\\?.lua;.\\Scripts\\modifiers\\units\\?.lua;.\\Scripts\\modifiers\\units\\bloodsorcerer\\?.lua;.\\Scripts\\modifiers\\units\\multiplicative_stats\\?.lua;.\\Scripts\\modifiers\\units\\torhoth\\?.lua;.\\Scripts\\modules\\?.lua;.\\Scripts\\modules\\smns\\?.lua;.\\Scripts\\workshop\\?.lua;.\\Scripts\\workshop\\classes\\?.lua"
require('setValue')
require('GroupInfo')

function getModifierDisplay(unit, prev)
	return _modifDisplay_DrainLevelResistance(unit, prev)
end

function getModifierDescTxt(unit, prev)
	return _modifCustomTxt_DrainLevelResistance(unit, prev)
end

function getAttackDamage(unit, prev)
   return svMultimplyDamage1(unit, prev, _banner_bonus(unit))
end

function getAttackHeal(unit, prev)
   return svMultimplyHeal1(unit, prev, _banner_bonus(unit))
end

function getAttack2Damage(unit, prev)
	if statsCheck_isDirectDmgType(unit.impl.attack2.type) then 
		return svMultimplyDamage2(unit, prev, _banner_bonus(unit))
	end
	return prev
end

function getAttack2Heal(unit, prev)
   return svMultimplyHeal2(unit, prev, _banner_bonus(unit))
end

function getImmuneToAttack(unit, attack, prev)
	if attack == Attack.DrainLevel then
		return svAttackImmunityClass(unit, attack, prev, Immune.Once)
	end
	return prev
end

function _banner_bonus(unit)
	local group = _GroupInfo_getUnitGroup(unit)
	return 0.05 * _GroupInfo_getFrontlineBonusMultiplier(group)
end
