package.path = ".\\Scripts\\?.lua;.\\Scripts\\exp\\?.lua;.\\Scripts\\modules\\?.lua;.\\Scripts\\modifiers\\?.lua;.\\Scripts\\modules\\smns\\?.lua;.\\Scripts\\modifiers\\items\\?.lua;.\\Scripts\\modifiers\\units\\?.lua"
require('setValue')

function getModifierDisplay(unit, prev)
	return prev
end

function getModifierDescTxt(unit, prev)
	return prev
end

function getAttackCritHit(unit, prev)
	_get_Group_and_Mods(unit)
	if _GroupInfo_stackHasModifierAmount(Id.new('g070um0070').value) > 0 then
		return true
	end
	return prev
end

function getAttackCritDamage(unit, prev)
	_get_Group_and_Mods(unit)
	if _GroupInfo_stackHasModifierAmount(Id.new('g070um0070').value) > 0 then
		return svAddCrit1Damage(unit, prev, 30)
	end
end

function getAttackCritPower(unit, prev)
	_get_Group_and_Mods(unit)
	if _GroupInfo_stackHasModifierAmount(Id.new('g070um0070').value) > 0 then
		return svAddCrit1Power(unit, prev, 10)
	end
end



function getAttack2CritHit(unit, prev)
	_get_Group_and_Mods(unit)
    if _GroupInfo_stackHasModifierAmount(Id.new('g070um0070').value) > 0 then
		return true
	end
	
end	

function getAttack2CritDamage(unit, prev)
	_get_Group_and_Mods(unit)
	if _GroupInfo_stackHasModifierAmount(Id.new('g070um0070').value) > 0 then
		return svAddCrit1Damage(unit, prev, 30)
	end
end

function getAttack2CritPower(unit, prev)
	_get_Group_and_Mods(unit)
	if _GroupInfo_stackHasModifierAmount(Id.new('g070um0070').value) > 0 then
		return svAddCrit1Power(unit, prev, 10)
	end
end


