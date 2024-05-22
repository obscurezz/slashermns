function getModifierDisplay(unit, prev)
	return prev
end

function getModifierDescTxt(unit, prev)
	return prev
end

function getImmuneToAttack(unit, attack, prev)
	if prev ~= Immune.Always then
		if attack == Attack.Damage then
			if unit.hp / unit.hpMax < 0.25 then
				return Immune.Once
			end
		end
	end

	return prev
end
