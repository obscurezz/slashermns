package.path = ".\\Scripts\\?.lua;.\\Scripts\\exp\\?.lua;.\\Scripts\\modules\\?.lua;.\\Scripts\\modifiers\\?.lua;.\\Scripts\\modules\\smns\\?.lua"
require('setValue')
require('GroupInfo')
require('smnsInfo')


function getModifierDisplay(unit, prev)
	return prev
end

function getModifierDescTxt(unit, prev)
	return prev
end

function _getAirBonus(unit)
    _get_Group_and_Mods(unit)
    local result = 0
    local group = _GroupInfo_getCurrentGroup()
	local units = group.units
	local u
	for i = 1, #units do
		u = units[i]
		if u.hp > 0 and u.impl.attack1.source == Source.Air then
            result = result + 1
        end
    end
    return result
end


function getAttackDamage(unit, prev)
    counter = _getAirBonus(unit) - 1
    if counter > 0 then
        return svMultimplyDamage1(unit, prev, 0.05 * counter)
    end
    return prev
end

function getAttackPower(unit, prev)
	counter = _getAirBonus(unit) - 1
    if counter > 0 then
        return svFlatEffectPower1(unit, prev, 2 * counter)
    end
    return prev
end

function getAttack2Power(unit, prev)
    counter = _getAirBonus(unit) - 1
	local baff = prev
    if counter > 0 then
		
		smnsInfo_SetApplyAccuracyBuffToAttack2(true)
		baff = svFlatEffectPower2(unit, prev, 2 * counter)
		smnsInfo_SetApplyAccuracyBuffToAttack2(false)
    end
    return baff	
end
