package.path = ".\\Scripts\\?.lua;.\\Scripts\\exp\\?.lua;.\\Scripts\\modifiers\\?.lua;.\\Scripts\\modifiers\\drawing\\?.lua;.\\Scripts\\modifiers\\items\\?.lua;.\\Scripts\\modifiers\\leaderMods\\?.lua;.\\Scripts\\modifiers\\perks\\?.lua;.\\Scripts\\modifiers\\smns\\?.lua;.\\Scripts\\modifiers\\smns\\items\\?.lua;.\\Scripts\\modifiers\\smns\\perks\\?.lua;.\\Scripts\\modifiers\\smns\\spells\\?.lua;.\\Scripts\\modifiers\\smns\\units\\?.lua;.\\Scripts\\modifiers\\spells\\?.lua;.\\Scripts\\modifiers\\units\\?.lua;.\\Scripts\\modifiers\\units\\bloodsorcerer\\?.lua;.\\Scripts\\modifiers\\units\\multiplicative_stats\\?.lua;.\\Scripts\\modifiers\\units\\torhoth\\?.lua;.\\Scripts\\modules\\?.lua;.\\Scripts\\modules\\smns\\?.lua;.\\Scripts\\workshop\\?.lua;.\\Scripts\\workshop\\classes\\?.lua"
require('setValue')
require('GroupInfo')

function _Harvest(unit)
    if _GroupInfo_UnitHasModifierValue(unit, Id.new('g040um0256').value) and _GroupInfo_UnitHasModifierValue(unit, Id.new('g070um0284').value) and _GroupInfo_UnitHasModifierValue(unit, Id.new('g070um0283').value) then
        return true
    end
    return false
end

function _Executor(unit)
    if _GroupInfo_UnitHasModifierValue(unit, Id.new('g070um0280').value) and _GroupInfo_UnitHasModifierValue(unit, Id.new('g006um0047').value) then
        return true
    end
    return false
end

function _Mercenary(unit)
    if _GroupInfo_stackHasModifierAmount(Id.new('g070um0286').value) > 0 and _GroupInfo_stackHasModifierAmount(Id.new('g070um0288').value) > 0 and _GroupInfo_stackHasModifierAmount(Id.new('g070um0289').value) > 0 then
        return true
    end
    return false
end

function _Seawolf(unit)
    if _GroupInfo_UnitHasModifierValue(unit, Id.new('g070um0290').value) and _GroupInfo_UnitHasModifierValue(unit, Id.new('g002um0012').value) then
        return true
    end
    return false
end

function getModifierDisplay(unit, prev)
    if _Harvest(unit) then
        return true
    end
	if _Executor(unit) then
        return true
    end
    if _Mercenary(unit) then
        return true
    end
    if _Seawolf(unit) then
        return true
    end
end

function getModifierDescTxt(unit, prev)
    if _Harvest(unit) then
        return Id.new('x070tg1401')
	end
    if _Executor(unit) then
        return Id.new('x070tg1402')
    end
    if _Mercenary(unit) then
        return Id.new('x070tg1411')
    end
    if _Seawolf(unit) then
        return Id.new('x070tg1414')
    end
end

function getModifierIconName(unit, prev)
    if _Harvest(unit) then
        return "HARVEST"
    end
    if _Executor(unit) then
        return "EXECUTOR"
    end
    if _Mercenary(unit) then
        return "MERCENARY"
    end
    if _Seawolf(unit) then
        return "SEAWOLF"
    end
end

function _getBattleWins(unit)
	local stack = _GroupInfo_getUnitStack(unit)
	return stack.battlesWon
end

function _unitHPLess50(unit)
    local maxHP = getScenario():getUnit(unit.id).hpMax
    if unit.hp / maxHP <= 0.5 then
        return true
    end
    return false
end

function _RacesInGroup(unit)
    local races = 1
    local group = _GroupInfo_getCurrentGroup()
    local units = group.units
    local u
    local ur
    for i = 1, #units do
        u = units[i]
        ur = u.impl.race
        if units[i - 1] ~= nil and units[i - 1].impl.race ~= ur then
            races = races + 1
        end
    end
    return races
end

function getXpNext(unit, prev)
    if _Harvest(unit) then
	    return svMultimplyXpNext(unit, prev, -0.01 * _getBattleWins(unit))
    end
    if _Seawolf(unit) then
        return svMultimplyXpNext(unit, prev, -0.1)
    end
    return prev
end

function getRegen(unit, prev)
    if _Seawolf(unit) then
        return prev + 30
    end
    return prev
end

function getAttackInitiative(unit, prev)
    if _Executor(unit) and _unitHPLess50(unit) then
        return svMultimplyInitiative(unit, prev, 0.15)
    end
    if _Mercenary(unit) then
        return svFlatEffectInitiative(unit, prev, 2 * _RacesInGroup(unit))
    end
    return prev
end

function getAttackDamage(unit, prev)
	if _Mercenary(unit) then
        return svFlatEffectDamage1(unit, prev, 2 * _RacesInGroup(unit))
    end
    return prev
end

function getAttackPower(unit, prev)
    if _Executor(unit) and _unitHPLess50(unit) then
        return svMultimplyPower1(unit, prev, 0.15)
    end
    return prev
end

