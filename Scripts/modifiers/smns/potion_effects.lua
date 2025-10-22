require('potion_buffs')
require('potion_resistances')
require('smnsInfo')

local POTIONS = {ARMOR10, ARMOR20, ARMOR30, INI15, INI25, INI35, DAMAGE15, DAMAGE25, DAMAGE35, ACCURACY15, ACCURACY30, HIDDEN_POTENT, VAMP25, VAMP50, CRIT10, CRIT20, HP50, BLESS10, BLESS20}
local RESISTANCES = {DISEASE, ABSORB, CURSE, CONTROL, WATER, AIR, EARTH, FIRE, MIND, DEATH, WEAPON, ARDENTI_SPELL, WATER_SPELL, AIR_SPELL, EARTH_SPELL, FIRE_SPELL, CALM_SPELL, MIND_SPELL, DEATH_SPELL, WAEPON_SPELL}

function has_value(tab, val)
    for index, value in ipairs(tab) do
        if value == val then
            return true
        end
    end
    return false
end  

function stackPotions(unit)
    local potion_counter = 0
    for i = 1, #POTIONS do
        p = POTIONS[i]
        if _GroupInfo_UnitHasModifierValue(unit, p) then
            potion_counter = potion_counter + 1
        end
    end
    return potion_counter
end

function _ChangePotionEffect(unit, value)
    local modify_result = 0
    if stackPotions(unit) > 2 then
        modify_result = math.sqrt(stackPotions(unit) - 1)
    end

    local result = value
    if checkRulesImplemented(_unitAura_GetScenario()) then
        if modify_result > 1 then
            result = value / modify_result
        end
    end

    return result
end

function _isResistanceApplyable(unit, res_mod)
    if not checkRulesImplemented(_unitAura_GetScenario()) then
        return true
    end

    -- local mods = _GroupInfo_UnitModifiers(unit)
    local m = _unitAura_GetScenario():getUnit(unit.id).modifiers
    local uresMods = {}
    local applyableResistances

    -- for key, value in pairs(mods) do
    --     if has_value(RESISTANCES, key) then
    --         table.insert(uresMods, key)
    --     end
    -- end

    for _, v in pairs(m) do
        val = Id.new(tostring(v.id)).value
        if has_value(RESISTANCES, val) then
            table.insert(uresMods, val)
        end
    end

    local applyableResistances = {uresMods[1], uresMods[2], uresMods[3]}

    return has_value(applyableResistances, res_mod)
end
