package.path = ".\\Scripts\\?.lua;.\\Scripts\\exp\\?.lua;.\\Scripts\\modifiers\\?.lua;.\\Scripts\\modifiers\\drawing\\?.lua;.\\Scripts\\modifiers\\items\\?.lua;.\\Scripts\\modifiers\\leaderMods\\?.lua;.\\Scripts\\modifiers\\perks\\?.lua;.\\Scripts\\modifiers\\smns\\?.lua;.\\Scripts\\modifiers\\smns\\items\\?.lua;.\\Scripts\\modifiers\\smns\\perks\\?.lua;.\\Scripts\\modifiers\\smns\\spells\\?.lua;.\\Scripts\\modifiers\\smns\\units\\?.lua;.\\Scripts\\modifiers\\spells\\?.lua;.\\Scripts\\modifiers\\units\\?.lua;.\\Scripts\\modifiers\\units\\bloodsorcerer\\?.lua;.\\Scripts\\modifiers\\units\\multiplicative_stats\\?.lua;.\\Scripts\\modifiers\\units\\torhoth\\?.lua;.\\Scripts\\modules\\?.lua;.\\Scripts\\modules\\smns\\?.lua;.\\Scripts\\workshop\\?.lua;.\\Scripts\\workshop\\classes\\?.lua"
require('unitAuraCustomDesc')
require('setValue')

function getModifierDisplay(unit, prev)
	return prev
end

function getModifierDescTxt(unit, prev)
	return prev
end

function _get_Lowest_Sculptor_Level(unit)
	local H = {}
	local group = _GroupInfo_getCurrentGroup()
    local units = group.units
	for i = 1, #units do
        u = units[i]
        if u ~= nil and u.hp > 0 and _GroupInfo_UnitHasModifierValue(u, Id.new('g040um0012').value) then
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

function getAttackDrain(unit, damage, prev)
    return svAddDrain1(unit, prev, damage, 0.12 + 0.03 * _get_Lowest_Sculptor_Level(unit))
end

function getAttackCritHit(unit, prev)
    return true
end

function getAttackCritDamage(unit, prev)
    return svAddCrit1Damage(unit, prev, 12 + 3 * _get_Lowest_Sculptor_Level(unit))
end

function getAttackCritPower(unit, prev)
    return svAddCrit1Power(unit, prev, 10)
end

function getAttack2Drain(unit, damage, prev)
    return svAddDrain2(unit, prev, damage, 0.12 + 0.03 * _get_Lowest_Sculptor_Level(unit))
end

function getAttack2CritHit(unit, prev)
    return true
end

function getAttack2CritDamage(unit, prev)
    return svAddCrit2Damage(unit, prev, 12 + 3 * _get_Lowest_Sculptor_Level(unit))
end

function getAttack2CritPower(unit, prev)
    return svAddCrit2Power(unit, prev, 10)
end




