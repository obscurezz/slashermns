--[[
For complete API reference see
https://github.com/VladimirMakeev/D2ModdingToolset/blob/master/luaApi.md

If the script is used as SEL_SCRIPT, no unit is selected yet (selected.position == -1).

Unit positions on a battlefield are mirrored.
Frontline positions are even, backline - odd.
1 0    0 1
3 2 vs 2 3
5 4    4 5
--]]

-- Created by Norvezskaya Semga

function getTargets(attacker, selected, allies, targets, targetsAreAllies)
	_unitAura_SetScenario(getScenario())
    -- pick selected
    local result = {selected}

    -- pick two random including selected
    math.randomseed(os.time())
    local other1 = targets[math.random(#targets)]
    local other2 = targets[math.random(#targets)]
    
    -- get max ally hp
    local maxHP = 0
    for i = 1, #allies do
        local ally = allies[i]
        if ally.unit.hp > maxHP then
            maxHP = ally.unit.hp
        end
    end
    
    -- pick ally with max hp
    local maxHPallies = {}
    for i = 1, #allies do
        local ally = allies[i]
        if ally.unit.hp == maxHP then
            table.insert(maxHPallies, ally)
        end
    end
    local myally = maxHPallies[math.random(#maxHPallies)]
    
    table.insert(result, other1)
    table.insert(result, other2)
    table.insert(result, myally)

    return result
end
