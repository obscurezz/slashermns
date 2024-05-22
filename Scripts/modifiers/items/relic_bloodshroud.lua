package.path = ".\\Scripts\\?.lua;.\\Scripts\\exp\\?.lua;.\\Scripts\\modifiers\\?.lua;.\\Scripts\\modifiers\\drawing\\?.lua;.\\Scripts\\modifiers\\items\\?.lua;.\\Scripts\\modifiers\\leaderMods\\?.lua;.\\Scripts\\modifiers\\perks\\?.lua;.\\Scripts\\modifiers\\smns\\?.lua;.\\Scripts\\modifiers\\smns\\items\\?.lua;.\\Scripts\\modifiers\\smns\\perks\\?.lua;.\\Scripts\\modifiers\\smns\\spells\\?.lua;.\\Scripts\\modifiers\\smns\\units\\?.lua;.\\Scripts\\modifiers\\spells\\?.lua;.\\Scripts\\modifiers\\units\\?.lua;.\\Scripts\\modifiers\\units\\bloodsorcerer\\?.lua;.\\Scripts\\modifiers\\units\\multiplicative_stats\\?.lua;.\\Scripts\\modifiers\\units\\torhoth\\?.lua;.\\Scripts\\modules\\?.lua;.\\Scripts\\modules\\smns\\?.lua;.\\Scripts\\workshop\\?.lua;.\\Scripts\\workshop\\classes\\?.lua"
require('setValue')

function getModifierDisplay(unit, prev)
	return prev
end

function getModifierDescTxt(unit, prev)
	return prev
end

function getAttackDamage(unit, prev)
	return svMultimplyDamage1(unit, prev, 0.2)
end

function getAttack2Damage(unit, prev)
	return svMultimplyDamage2(unit, prev, 0.2)
end

function getImmuneToAttack(unit, attack, prev)
	if attack == Attack.Paralyze or attack == Attack.Fear then
		return svAttackImmunityClass(unit, attack, prev, Immune.Always)
	elseif attack == Attack.LowerDamage and prev ~= Immune.Always then
		local unitMods = _GroupInfo_UnitModifiers(unit)
		if _GroupInfo_UnitModifierAmount(unitMods, executionersax_mod) > 0 then
			return svAttackImmunityClass(unit, attack, prev, Immune.Always)
		end
	end
	return prev
end

function getAttackInitiative(unit, prev)
	local unitMods = _GroupInfo_UnitModifiers(unit)
	if _GroupInfo_UnitModifierAmount(unitMods, executionersax_mod) > 0 then
		return svMultimplyInitiative(unit, prev, 0.1)
	end
	return prev
end
