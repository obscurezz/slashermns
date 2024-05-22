function getModifierDisplay(unit, prev)
	return prev
end

function getModifierDescTxt(unit, prev)
	return prev
end

function getAttackDamage(unit, prev)
   return svMultimplyDamage1(unit, prev, -0.05)
end

function getAttack2Damage(unit, prev)
   return svMultimplyDamage2(unit, prev, -0.05)
end

function getAttackPower(unit, prev)
   return svMultimplyPower1(unit, prev, -0.05)
end

function getAttack2Power(unit, prev)
   return svMultimplyPower2(unit, prev, -0.05)
end