package.path = ".\\Scripts\\?.lua;.\\Scripts\\exp\\?.lua;.\\Scripts\\modifiers\\?.lua;.\\Scripts\\modifiers\\drawing\\?.lua;.\\Scripts\\modifiers\\items\\?.lua;.\\Scripts\\modifiers\\leaderMods\\?.lua;.\\Scripts\\modifiers\\perks\\?.lua;.\\Scripts\\modifiers\\smns\\?.lua;.\\Scripts\\modifiers\\smns\\items\\?.lua;.\\Scripts\\modifiers\\smns\\perks\\?.lua;.\\Scripts\\modifiers\\smns\\spells\\?.lua;.\\Scripts\\modifiers\\smns\\units\\?.lua;.\\Scripts\\modifiers\\spells\\?.lua;.\\Scripts\\modifiers\\units\\?.lua;.\\Scripts\\modifiers\\units\\bloodsorcerer\\?.lua;.\\Scripts\\modifiers\\units\\multiplicative_stats\\?.lua;.\\Scripts\\modifiers\\units\\torhoth\\?.lua;.\\Scripts\\modules\\?.lua;.\\Scripts\\modules\\smns\\?.lua;.\\Scripts\\workshop\\?.lua;.\\Scripts\\workshop\\classes\\?.lua"
require('setValue')

function getModifierDisplay(unit, prev)
	return prev
end

function getModifierDescTxt(unit, prev)
	return prev
end

function getHitPoint(unit, prev)
	if not unit.impl:hasAbility(Ability.TalismanUse) then
		return svMultimplyHitPoint(unit, prev, 0.1)
	end
	return prev
end

function getArmor(unit, prev)
	if not unit.impl:hasAbility(Ability.OrbUse) then
		return svFlatEffectArmor(unit, prev, 10)
	end
	return prev
end

function getMovement(unit, prev)
	if not unit.impl:hasAbility(Ability.TravelItemUse) then
		return svFlatEffectMovement(unit, prev, 4)
	end
	return prev
end

function getAttackInitiative(unit, prev)
	if not unit.impl:hasAbility(Ability.BannerUse) then
		return svMultimplyInitiative(unit, prev, 0.2)
	end
	return prev
end

function getAttackPower(unit, prev)
	if not unit.impl:hasAbility(Ability.WeaponArmorUse) then
		return svMultimplyPower1(unit, prev, 0.1)
	end
	return prev
end

function getAttack2Power(unit, prev)
	if not unit.impl:hasAbility(Ability.WeaponArmorUse) then
		return svMultimplyPower2(unit, prev, 0.1)
	end
	return prev
end
