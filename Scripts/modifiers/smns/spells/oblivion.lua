package.path = ".\\Scripts\\?.lua;.\\Scripts\\exp\\?.lua;.\\Scripts\\modules\\?.lua;.\\Scripts\\modifiers\\?.lua;.\\Scripts\\modules\\smns\\?.lua;.\\Scripts\\modifiers\\items\\?.lua;.\\Scripts\\modifiers\\units\\?.lua"

function getModifierDisplay(unit, prev)
	return prev
end

function getModifierDescTxt(unit, prev)
	return prev
end

function canApplyAsLowerSpell()
	return true
end

function canApplyAsBoostSpell()
	return false
end

function hasAbility(unit, ability, prev)
	if ability == Ability.WandScrollUse or ability == Ability.OrbUse or ability == Ability.TalismanUse then
		return false
	end
	return prev
end
