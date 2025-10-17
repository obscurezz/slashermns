package.path = ".\\Scripts\\?.lua;.\\Scripts\\exp\\?.lua;.\\Scripts\\modules\\?.lua;.\\Scripts\\modifiers\\?.lua;.\\Scripts\\modules\\smns\\?.lua;.\\Scripts\\modifiers\\items\\?.lua;.\\Scripts\\modifiers\\units\\?.lua"
require('setValue')

function getModifierDisplay(unit, prev)
	return prev
end

function getModifierDescTxt(unit, prev)
	return prev
end

function _get_Lowest_Tree_Level(unit)
	local H = {}
	local group = _GroupInfo_getCurrentGroup()
    local units = group.units
	for i = 1, #units do
        u = units[i]
        if u ~= nil and u.hp > 0 and _GroupInfo_UnitHasModifierValue(u, Id.new('g070um0326').value) then
			table.insert(H, u)
		end
	end

	local lowest = H[1]
	for i = 1, #H do
		if H[i].impl.level < lowest.impl.level then
			lowest = H[i]
		end
	end
	return lowest.impl.level - lowest.baseImpl.level
end

function getElvenMana(unit)
	local p = _GroupInfo_getUnitPlayer(unit)
	if p ~= nil and p.race ~= Race.Neutral then
		return p.bank.groveMana
	end
	return 0
end

function getAttackCritHit(unit, prev)
    return true
end

function getAttackCritDamage(unit, prev)	
	local Baff = 15 + math.min(15, math.floor(getElvenMana(unit)/35))
    return svAddCrit1Damage(unit, prev, Baff)
end

function getAttack2CritHit(unit, prev)
    return true
end

function getAttack2CritDamage(unit, prev)
	local Baff = 15 + math.min(15, math.floor(getElvenMana(unit)/35))
    return svAddCrit2Damage(unit, prev, Baff)
end




