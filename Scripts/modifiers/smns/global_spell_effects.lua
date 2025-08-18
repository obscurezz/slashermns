require('global_buffs')
require('smnsInfo')

local DebuffImmunityModifier = Id.new('g070um0338').value
local BuffWeakerImmunityModifier = Id.new('g070um0339').value
local DebuffStrongerImmunityModifier = Id.new('g070um0370').value

local unitDebuffWeaker15 = Id.new('g070um0343').value
local unitDebuffWeaker30 = Id.new('g070um0344').value
local unitDebuffWeaker50 = Id.new('g070um0345').value

local unitDebuffStronger15 = Id.new('').value
local unitDebuffStronger30 = Id.new('').value
local unitDebuffStronger50 = Id.new('').value

local unitBuffWeaker15 = Id.new('').value
local unitBuffWeaker30 = Id.new('').value
local unitBuffWeaker50 = Id.new('').value

local unitBuffStronger10 = Id.new('g070um0340').value
local unitBuffStronger20 = Id.new('g070um0341').value
local unitBuffStronger30 = Id.new('g070um0342').value

local groupDebuffWeaker15 = Id.new('g070um0349').value
local groupDebuffWeaker30 = Id.new('g070um0350').value
local groupDebuffWeaker50 = Id.new('g070um0351').value

local groupDebuffStronger15 = Id.new('').value
local groupDebuffStronger30 = Id.new('').value
local groupDebuffStronger50 = Id.new('').value

local groupBuffWeaker15 = Id.new('').value
local groupBuffWeaker30 = Id.new('').value
local groupBuffWeaker50 = Id.new('').value

local groupBuffStronger10 = Id.new('g070um0346').value
local groupBuffStronger20 = Id.new('g070um0347').value
local groupBuffStronger30 = Id.new('g070um0348').value

local Bracelet = Id.new('g002um0054').value

local BurningBanner = Id.new('g014um1066').value
local TomeOfSorcery = Id.new('g006um0070').value
local Potion10 = Id.new('g006um0064').value
local Potion20 = Id.new('g001um2007').value
local KhansSkull = Id.new('g002um0033').value
local BannerOfDualFate = Id.new('g070um0374').value
local RavenCuirass = Id.new('g070um0318').value

local BUFFS = {TEREBRARE_CORDE, VOTANS_BLESSING, ALLFATHERS_BLESSING, SPEED, CLANS_HYMN, ENCHANTED_WEAPONS, ICE_SHIELD, MIGHT, UNEVITABLE_REVENGE, CALL_TO_ARMS, SIR_ALLEMON, MORTIS_TOUCH, HOLY_ARMOR, HOLY_STRENGTH, STRENGTH, VITARS_STRENGTH, HURRYING_TIME, STEEL_BONES, ENDURANCE, GROVE_STAMINA, VAMPIRISM, HARVEST, VAMPIRE_TOUCH}

function stackBuffs(unit)
    local global_buff_counter = 0
    for i = 1, #BUFFS do
        b = BUFFS[i]
        if _GroupInfo_UnitHasModifierValue(unit, b) then
            global_buff_counter = global_buff_counter + 1
        end
    end
    return global_buff_counter
end

function _ChangeGlobalBuffEffect(unit, value)
    local unit_change_stats = 0

    -- -25% buffs on enemy territory
    if checkRulesImplemented(_unitAura_GetScenario()) then
        if not smnsConditions_isStackOnItsTerrain(_unitAura_GetScenario(), _GroupInfo_getUnitStack(unit)) and not smnsConditions_isStackOnNeutralTerrain(_unitAura_GetScenario(), _GroupInfo_getUnitStack(unit)) then
            unit_change_stats = unit_change_stats - 0.25
        end
    end
    -- end

    if _GroupInfo_UnitHasModifierValue(unit, unitBuffWeaker15) and not _GroupInfo_UnitHasModifierValue(unit, BuffWeakerImmunityModifier) then
        unit_change_stats = unit_change_stats - 0.15
    end
    if _GroupInfo_UnitHasModifierValue(unit, unitBuffWeaker30) and not _GroupInfo_UnitHasModifierValue(unit, BuffWeakerImmunityModifier) then
        unit_change_stats = unit_change_stats - 0.3
    end
    if _GroupInfo_UnitHasModifierValue(unit, unitBuffWeaker50) and not _GroupInfo_UnitHasModifierValue(unit, BuffWeakerImmunityModifier) then
        unit_change_stats = unit_change_stats - 0.5
    end
    if _GroupInfo_UnitHasModifierValue(unit, unitBuffStronger10) then
        unit_change_stats = unit_change_stats + 0.15
    end
    if _GroupInfo_UnitHasModifierValue(unit, unitBuffStronger20) then
        unit_change_stats = unit_change_stats + 0.3
    end
    if _GroupInfo_UnitHasModifierValue(unit, unitBuffStronger30) then
        unit_change_stats = unit_change_stats + 0.5
    end

    --adding section
    if _GroupInfo_UnitHasModifierValue(unit, TomeOfSorcery) then
        unit_change_stats = unit_change_stats + 0.15
    end
    if _GroupInfo_UnitHasModifierValue(unit, Potion10) then
        unit_change_stats = unit_change_stats + 0.1
    end
    if _GroupInfo_UnitHasModifierValue(unit, Potion20) then
        unit_change_stats = unit_change_stats + 0.2
    end
    if _GroupInfo_UnitHasModifierValue(unit, Id.new('g070um0156').value) and smnsConditions_heroCondition(unit, Pepega) then
        unit_change_stats = unit_change_stats + 0.3
    end
    --

    if _GroupInfo_stackHasModifierAmount(groupBuffWeaker15) > 0 and not _GroupInfo_UnitHasModifierValue(unit, BuffWeakerImmunityModifier) then
        unit_change_stats = unit_change_stats - 0.15
    end
    if _GroupInfo_stackHasModifierAmount(groupBuffWeaker30) > 0 and not _GroupInfo_UnitHasModifierValue(unit, BuffWeakerImmunityModifier) then
        unit_change_stats = unit_change_stats - 0.3
    end
    if _GroupInfo_stackHasModifierAmount(groupBuffWeaker50) > 0 and not _GroupInfo_UnitHasModifierValue(unit, BuffWeakerImmunityModifier) then
        unit_change_stats = unit_change_stats - 0.5
    end
    if _GroupInfo_stackHasModifierAmount(groupBuffStronger10) > 0 then
        unit_change_stats = unit_change_stats + 0.1
    end
    if _GroupInfo_stackHasModifierAmount(groupBuffStronger20) > 0 then
        unit_change_stats = unit_change_stats + 0.2
    end
    if _GroupInfo_stackHasModifierAmount(groupBuffStronger30) > 0 then
        unit_change_stats = unit_change_stats + 0.3
    end
    --
    if _GroupInfo_stackHasModifierAmount(BannerOfDualFate) > 0 then
        unit_change_stats = unit_change_stats + 0.2
    end
    --
    if unit_change_stats < -1 then
        unit_change_stats = -1
    end

    if unit_change_stats > 1 then
        unit_change_stats = 1
    end


    local modify_result = 0
    if stackBuffs(unit) > 2 then
        modify_result = math.sqrt(stackBuffs(unit) - 1)
    end


    local result = value + (value * unit_change_stats)

    if checkRulesImplemented(_unitAura_GetScenario()) then
        if modify_result > 1 then
            result = result / modify_result
        end
    end

    return result
end

function _ChangeGlobalDebuffEffect(unit, value)
    local unit_change_stats = 0

    if _GroupInfo_UnitHasModifierValue(unit, DebuffImmunityModifier) or _GroupInfo_UnitHasModifierValue(unit, Bracelet) then
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

        --adding section
        if _GroupInfo_UnitHasModifierValue(unit, Potion15) then
            unit_change_stats = unit_change_stats - 0.15
        end
        if _GroupInfo_UnitHasModifierValue(unit, Potion30) then
            unit_change_stats = unit_change_stats - 0.3
        end
        if _GroupInfo_UnitHasModifierValue(unit, KhansSkull) then
            unit_change_stats = unit_change_stats - 0.15
        end
        if _GroupInfo_UnitHasModifierValue(unit, Id.new('g070um0156').value) and smnsConditions_heroCondition(unit, Ranger) then
            unit_change_stats = unit_change_stats - 0.5
        end
        if _GroupInfo_UnitHasModifierValue(unit, RavenCuirass) then
            unit_change_stats = unit_change_stats - 0.5
        end
        if smnsConditions_isRodNearToStack(unit, 1, _unitAura_GetScenario()) then
            unit_change_stats = unit_change_stats - 0.15
        end
        --

        if _GroupInfo_stackHasModifierAmount(groupDebuffWeaker15) > 0 then
            unit_change_stats = unit_change_stats - 0.15
        end
        if _GroupInfo_stackHasModifierAmount(groupDebuffWeaker30) > 0 then
            unit_change_stats = unit_change_stats - 0.3
        end
        if _GroupInfo_stackHasModifierAmount(groupDebuffWeaker50) > 0 or _GroupInfo_stackHasModifierAmount(Id.new('g014um1066').value) > 0 then 
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

        --
        if _GroupInfo_stackHasModifierAmount(BannerOfDualFate) > 0 and not _GroupInfo_UnitHasModifierValue(unit, DebuffStrongerImmunityModifier) then
            unit_change_stats = unit_change_stats + 0.3
        end

        if _Abyssal_Deboost_Effect(unit) >= 1 and not _GroupInfo_UnitHasModifierValue(unit, DebuffStrongerImmunityModifier) then
            unit_change_stats = unit_change_stats + 0.3
        end
        --
    end

    if unit_change_stats < -1 then
        unit_change_stats = -1
    end

    if unit_change_stats > 1 then
        unit_change_stats = 1
    end

    return value + (value * unit_change_stats)
end