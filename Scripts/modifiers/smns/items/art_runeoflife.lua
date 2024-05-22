package.path = ".\\Scripts\\?.lua;.\\Scripts\\exp\\?.lua;.\\Scripts\\modifiers\\?.lua;.\\Scripts\\modifiers\\drawing\\?.lua;.\\Scripts\\modifiers\\items\\?.lua;.\\Scripts\\modifiers\\leaderMods\\?.lua;.\\Scripts\\modifiers\\perks\\?.lua;.\\Scripts\\modifiers\\smns\\?.lua;.\\Scripts\\modifiers\\smns\\items\\?.lua;.\\Scripts\\modifiers\\smns\\perks\\?.lua;.\\Scripts\\modifiers\\smns\\spells\\?.lua;.\\Scripts\\modifiers\\smns\\units\\?.lua;.\\Scripts\\modifiers\\spells\\?.lua;.\\Scripts\\modifiers\\units\\?.lua;.\\Scripts\\modifiers\\units\\bloodsorcerer\\?.lua;.\\Scripts\\modifiers\\units\\multiplicative_stats\\?.lua;.\\Scripts\\modifiers\\units\\torhoth\\?.lua;.\\Scripts\\modules\\?.lua;.\\Scripts\\modules\\smns\\?.lua;.\\Scripts\\workshop\\?.lua;.\\Scripts\\workshop\\classes\\?.lua"
require('unitAuraCustomDesc')
require('setValue')

function getModifierDisplay(unit, prev)
	return _modifDisplay_SpellDebuffResistanceAura(unit, prev)
end

function getModifierDescTxt(unit, prev)
	return _modifCustomTxt_SpellDebuffResistanceAura(unit, prev)
end

function getHitPoint(unit, prev)
	return svMultimplyHitPoint(unit, prev, 0.25)
end

function getImmuneToSource(unit, source, prev)
	if source == Source.Death then
		return svSourceImmunityClass(unit, source, prev, Immune.Once)
	end
	return prev
end

function getRegen(unit, prev)
	return prev + 40
end
