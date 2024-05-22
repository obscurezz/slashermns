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

function getImmuneToAttack(unit, attack, prev)
	if attack == Attack.Petrify or attack == Attack.TransformOther then
		if prev == Immune.Always then
			return Immune.Once
		else
			return Immune.NotImmune
		end
	end
	return prev
end
