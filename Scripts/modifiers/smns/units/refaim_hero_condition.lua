package.path = ".\\Scripts\\?.lua;.\\Scripts\\exp\\?.lua;.\\Scripts\\modules\\?.lua;.\\Scripts\\modifiers\\?.lua;.\\Scripts\\modules\\smns\\?.lua;.\\Scripts\\modifiers\\items\\?.lua;.\\Scripts\\modifiers\\units\\?.lua"
require('GroupInfo')
require('setValue')

function getModifierDisplay(unit, prev)
	return prev
end

function getModifierDescTxt(unit, prev)
	return prev
end

function _heroCondition(unit, hero_modifier)
    _get_Group_and_Mods(unit)

	if _GroupInfo_stackHasModifierAmount(hero_modifier) > 0 then
		local group = _GroupInfo_getCurrentGroup()
        local units = group.units
		local u
		for i = 1, #units do
			u = units[i]
			if u.hp > 0 and (u.impl.level - u.baseImpl.level) >= 2 then
				local modUnits = _GroupInfo_UnitModifiers(u)
				if _GroupInfo_UnitModifierAmount(modUnits, hero_modifier) > 0 then
					return true
				end
			end
		end
		
	end
	return false

end

function getAttackDamRatio(unit, prev)
	local Archmage = Id.new('g070um0151').value
	if _heroCondition(unit, Archmage) then
		return 65
	end
	return prev
end

function getAttackInitiative(unit, prev)
    local Pepega = Id.new('g070um0150').value
    if _heroCondition(unit, Pepega) then
		return svFlatEffectInitiative(unit, prev, 5)
	end
	return prev	
end

function getAttackDamage(unit, prev)
	local Pepega = Id.new('g070um0150').value
    if _heroCondition(unit, Pepega) then
		return svMultimplyDamage1(unit, prev, 0.1)
	end
	return prev	
end

function getArmor(unit, prev)
    local Ranger = Id.new('g070um0152').value
    if _heroCondition(unit, Ranger) then
		return svFlatEffectArmor(unit, prev, 10)
	end
	return prev	
end

function getRegen(unit, prev)
    local Ranger = Id.new('g070um0152').value
    if _heroCondition(unit, Ranger) then
		return prev + 10
	end
	return prev	
end
