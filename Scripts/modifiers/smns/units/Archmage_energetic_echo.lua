package.path = ".\\Scripts\\?.lua;.\\Scripts\\exp\\?.lua;.\\Scripts\\modules\\?.lua;.\\Scripts\\modifiers\\?.lua;.\\Scripts\\modules\\smns\\?.lua;.\\Scripts\\modifiers\\items\\?.lua;.\\Scripts\\modifiers\\units\\?.lua"
require('setValue')
require('GroupInfo')
require('smns_new_mods_id')

function getModifierDisplay(unit, prev)
	return prev
end

function getModifierDescTxt(unit, prev)
	return prev
end

function getAttackDamage(unit, prev)
    _get_Group_and_Mods(unit)
    local AnyAirMageAmount = _GroupInfo_stackHasModifierAmount(MageWizardWhiteMageInParty)
    local result = 0
	if AnyAirMageAmount > 0 then
		local group = _GroupInfo_getCurrentGroup()
		local units = group.units
		local u
		for i = 1, #units do
            u = units[i]
			if _GroupInfo_UnitHasModifierValue(u, MageWizardWhiteMageInParty) then
                result = result + u.impl.attack1.damage * 0.04
            end
        end
        return prev + result
    end
    return prev
end
