function getModifierDisplay(unit, prev)
	return prev
end

function getModifierDescTxt(unit, prev)
	return prev
end

function getArmor(unit, prev)
	BonusArmor = prev
	if _GroupInfo_stackHasModifierAmount(Id.new('g070um0055').value) > 0 then
		BonusArmor = prev + 10
	end
	return BonusArmor
end


function getImmuneToAttack(unit, attack, prev)
	if prev ~= Immune.Always then
		if attack == Attack.Shatter then
			_get_Group_and_Mods(unit)
			if _GroupInfo_stackHasModifierAmount(Id.new('g070um0055').value) > 0 then 
				return Immune.Once
			end
		end
	end

	return prev
end

function getAttackInitiative(unit, prev)
	local BonusIni = prev
	if _GroupInfo_stackHasModifierAmount(Id.new('g070um0031').value) > 0 then
		BonusIni = prev + 7
	end
	return BonusIni
end