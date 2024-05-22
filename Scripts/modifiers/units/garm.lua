

function getModifierDisplay(unit, prev)
	return prev
end

function getModifierDescTxt(unit, prev)
	return prev
end

function getImmuneToAttack(unit, attack, prev)
	if attack == Attack.DrainLevel then
		if unit.impl.level == unit.baseImpl.level then
			return Immune.Always
		end
	end	
	return prev
end
