package.path = ".\\Scripts\\?.lua;.\\Scripts\\exp\\?.lua;.\\Scripts\\modules\\?.lua;.\\Scripts\\modifiers\\?.lua;.\\Scripts\\modules\\smns\\?.lua"
require('GroupInfo')
require('converter')
require('GroupInfo')
require('setValue')
require('smns_new_mods_id')
function getModifierDisplay(unit, prev)
	return prev
end

function getModifierDescTxt(unit, prev)
	return prev
end

function getAttackDamage(unit, prev)
    _get_Group_and_Mods(unit)
    local TormentorAmount = _GroupInfo_stackHasModifierAmount(TormentorSameColResist)
    local TorturerAmount = _GroupInfo_stackHasModifierAmount(TorturerCrossResist)
    local result = 0
    if TormentorAmount > 0 or TorturerAmount > 0 then
        local group = _GroupInfo_getCurrentGroup()
        local units = group.units
        local u
        for i = 1, #units do
            u = units[i]
            if _GroupInfo_UnitHasModifierValue(u, TormentorSameColResist) then
                result = result + u.impl.attack1.damage * 0.03
            elseif _GroupInfo_UnitHasModifierValue(u, TorturerCrossResist) then
                result = result + u.impl.attack1.damage * 0.06
            end
        end
        return prev + result
    end
    return prev
end