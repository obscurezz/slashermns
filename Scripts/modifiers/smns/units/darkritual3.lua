package.path = ".\\Scripts\\?.lua;.\\Scripts\\exp\\?.lua;.\\Scripts\\modules\\?.lua;.\\Scripts\\modifiers\\?.lua;.\\Scripts\\modules\\smns\\?.lua;.\\Scripts\\modifiers\\items\\?.lua;.\\Scripts\\modifiers\\units\\?.lua"
require('setValue')
require('smnsConditions')

function getModifierDisplay(unit, prev)
	return prev
end

function getModifierDescTxt(unit, prev)
	return prev
end

-- function getAttackDamage(unit, prev)
--     if smnsConditions_stackHasCorpse(unit) then
--         return svMultimplyDamage1(unit, prev, 0.20)
--     end
-- 	return prev
-- end

function getAttackDrain(unit, damage, prev)
    if smnsConditions_stackHasCorpse(unit) then
        return prev + damage * 0.2
    end
    return prev
end