package.path = ".\\Scripts\\?.lua;.\\Scripts\\exp\\?.lua;.\\Scripts\\modules\\?.lua;.\\Scripts\\modifiers\\?.lua;.\\Scripts\\modules\\smns\\?.lua;.\\Scripts\\modifiers\\items\\?.lua;.\\Scripts\\modifiers\\units\\?.lua"
require('setValue')

function getModifierDisplay(unit, prev)
	return prev
end

function getModifierDescTxt(unit, prev)
	return prev
end

function getAttackReach(unit, prev)
    --nobody is 58
    local sculptor = Id.new('g070um0323').value
    local torhot = Id.new('g070um0324').value
    local devochka = Id.new('g070um0325').value
    local derevo = Id.new('g070um0326').value
    if (_GroupInfo_UnitHasModifierValue(unit, sculptor) and _GroupInfo_stackHasModifierAmount(sculptor) > 1) 
    or (_GroupInfo_UnitHasModifierValue(unit, torhot) and _GroupInfo_stackHasModifierAmount(torhot) > 1)
    or (_GroupInfo_UnitHasModifierValue(unit, devochka) and _GroupInfo_stackHasModifierAmount(devochka) > 1)
    or (_GroupInfo_UnitHasModifierValue(unit, derevo) and _GroupInfo_stackHasModifierAmount(derevo) > 1)
    then
        return 58
    end
	return prev
end