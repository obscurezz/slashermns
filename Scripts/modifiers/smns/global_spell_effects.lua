local DebuffImmunityModifier = Id.new('').value
local BuffWeakerImmunityModifier = Id.new('').value
local DebuffStrongerImmunityModifier = Id.new('').value

local unitDebuffWeaker15 = Id.new('').value
local unitDebuffWeaker30 = Id.new('').value
local unitDebuffWeaker50 = Id.new('').value

local unitDebuffStronger15 = Id.new('').value
local unitDebuffStronger30 = Id.new('').value
local unitDebuffStronger50 = Id.new('').value

local unitBuffWeaker15 = Id.new('').value
local unitBuffWeaker30 = Id.new('').value
local unitBuffWeaker50 = Id.new('').value

local unitBuffStronger15 = Id.new('').value
local unitBuffStronger30 = Id.new('').value
local unitBuffStronger50 = Id.new('').value

local groupDebuffWeaker15 = Id.new('').value
local groupDebuffWeaker30 = Id.new('').value
local groupDebuffWeaker50 = Id.new('').value

local groupDebuffStronger15 = Id.new('').value
local groupDebuffStronger30 = Id.new('').value
local groupDebuffStronger50 = Id.new('').value

local groupBuffWeaker15 = Id.new('').value
local groupBuffWeaker30 = Id.new('').value
local groupBuffWeaker50 = Id.new('').value

local groupBuffStronger15 = Id.new('').value
local groupBuffStronger30 = Id.new('').value
local groupBuffStronger50 = Id.new('').value

function _ChangeGlobalBuffEffect(unit, value)
    local unit_change_stats = 0

    if _GroupInfo_UnitHasModifierValue(unit, unitBuffWeaker15) and not _GroupInfo_UnitHasModifierValue(unit, BuffWeakerImmunityModifier) then
        unit_change_stats = unit_change_stats - 0.15
    end
    if _GroupInfo_UnitHasModifierValue(unit, unitBuffWeaker30) and not _GroupInfo_UnitHasModifierValue(unit, BuffWeakerImmunityModifier) then
        unit_change_stats = unit_change_stats - 0.3
    end
    if _GroupInfo_UnitHasModifierValue(unit, unitBuffWeaker50) and not _GroupInfo_UnitHasModifierValue(unit, BuffWeakerImmunityModifier) then
        unit_change_stats = unit_change_stats - 0.5
    end
    if _GroupInfo_UnitHasModifierValue(unit, unitBuffStronger15) then
        unit_change_stats = unit_change_stats + 0.15
    end
    if _GroupInfo_UnitHasModifierValue(unit, unitBuffStronger30) then
        unit_change_stats = unit_change_stats + 0.3
    end
    if _GroupInfo_UnitHasModifierValue(unit, unitBuffStronger50) then
        unit_change_stats = unit_change_stats + 0.5
    end

    if _GroupInfo_stackHasModifierAmount(groupBuffWeaker15) > 0 and not _GroupInfo_UnitHasModifierValue(unit, BuffWeakerImmunityModifier) then
        unit_change_stats = unit_change_stats - 0.15
    end
    if _GroupInfo_stackHasModifierAmount(groupBuffWeaker30) > 0 and not _GroupInfo_UnitHasModifierValue(unit, BuffWeakerImmunityModifier) then
        unit_change_stats = unit_change_stats - 0.3
    end
    if _GroupInfo_stackHasModifierAmount(groupBuffWeaker50) > 0 and not _GroupInfo_UnitHasModifierValue(unit, BuffWeakerImmunityModifier) then
        unit_change_stats = unit_change_stats - 0.5
    end
    if _GroupInfo_stackHasModifierAmount(groupBuffStronger15) > 0 then
        unit_change_stats = unit_change_stats + 0.15
    end
    if _GroupInfo_stackHasModifierAmount(groupBuffStronger30) > 0 then
        unit_change_stats = unit_change_stats + 0.3
    end
    if _GroupInfo_stackHasModifierAmount(groupBuffStronger50) > 0 then
        unit_change_stats = unit_change_stats + 0.5
    end

    if unit_change_stats < -1 then
        unit_change_stats = -1
    end

    if unit_change_stats > 1 then
        unit_change_stats = 1
    end

    return value + (value * unit_change_stats)
end

function _ChangeGlobalDebuffEffect(unit, value)
    local unit_change_stats = 0

    if _GroupInfo_UnitHasModifierValue(unit, DebuffImmunityModifier) then
        return 0
    else

        if _GroupInfo_UnitHasModifierValue(unit, unitDebuffWeaker15) then
            unit_change_stats = unit_change_stats - 0.15
        end
        if _GroupInfo_UnitHasModifierValue(unit, unitDebuffWeaker30) then
            unit_change_stats = unit_change_stats - 0.3
        end
        if _GroupInfo_UnitHasModifierValue(unit, unitDebuffWeaker50) then
            unit_change_stats = unit_change_stats - 0.5
        end
        if _GroupInfo_UnitHasModifierValue(unit, unitDebuffStronger15) and not _GroupInfo_UnitHasModifierValue(unit, DebuffStrongerImmunityModifier) then
            unit_change_stats = unit_change_stats + 0.15
        end
        if _GroupInfo_UnitHasModifierValue(unit, unitDebuffStronger30) and not _GroupInfo_UnitHasModifierValue(unit, DebuffStrongerImmunityModifier) then
            unit_change_stats = unit_change_stats + 0.3
        end
        if _GroupInfo_UnitHasModifierValue(unit, unitDebuffStronger50) and not _GroupInfo_UnitHasModifierValue(unit, DebuffStrongerImmunityModifier) then
            unit_change_stats = unit_change_stats + 0.5
        end

        if _GroupInfo_stackHasModifierAmount(groupDebuffWeaker15) > 0 then
            unit_change_stats = unit_change_stats - 0.15
        end
        if _GroupInfo_stackHasModifierAmount(groupDebuffWeaker30) > 0 then
            unit_change_stats = unit_change_stats - 0.3
        end
        if _GroupInfo_stackHasModifierAmount(groupDebuffWeaker50) > 0 then
            unit_change_stats = unit_change_stats - 0.5
        end
        if _GroupInfo_stackHasModifierAmount(groupDebuffStronger15) > 0 and not _GroupInfo_UnitHasModifierValue(unit, DebuffStrongerImmunityModifier) then
            unit_change_stats = unit_change_stats + 0.15
        end
        if _GroupInfo_stackHasModifierAmount(groupDebuffStronger30) > 0 and not _GroupInfo_UnitHasModifierValue(unit, DebuffStrongerImmunityModifier) then
            unit_change_stats = unit_change_stats + 0.3
        end
        if _GroupInfo_stackHasModifierAmount(groupDebuffStronger50) > 0 and not _GroupInfo_UnitHasModifierValue(unit, DebuffStrongerImmunityModifier) then
            unit_change_stats = unit_change_stats + 0.5
        end
    end

    if unit_change_stats < -1 then
        unit_change_stats = -1
    end

    if unit_change_stats > 1 then
        unit_change_stats = 1
    end

    return value + (value * unit_change_stats)
end