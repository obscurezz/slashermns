package.path = ".\\Scripts\\?.lua;.\\Scripts\\exp\\?.lua;.\\Scripts\\modifiers\\?.lua;.\\Scripts\\modifiers\\drawing\\?.lua;.\\Scripts\\modifiers\\items\\?.lua;.\\Scripts\\modifiers\\leaderMods\\?.lua;.\\Scripts\\modifiers\\perks\\?.lua;.\\Scripts\\modifiers\\smns\\?.lua;.\\Scripts\\modifiers\\smns\\items\\?.lua;.\\Scripts\\modifiers\\smns\\perks\\?.lua;.\\Scripts\\modifiers\\smns\\spells\\?.lua;.\\Scripts\\modifiers\\smns\\units\\?.lua;.\\Scripts\\modifiers\\spells\\?.lua;.\\Scripts\\modifiers\\units\\?.lua;.\\Scripts\\modifiers\\units\\bloodsorcerer\\?.lua;.\\Scripts\\modifiers\\units\\multiplicative_stats\\?.lua;.\\Scripts\\modifiers\\units\\torhoth\\?.lua;.\\Scripts\\modules\\?.lua;.\\Scripts\\modules\\smns\\?.lua;.\\Scripts\\workshop\\?.lua;.\\Scripts\\workshop\\classes\\?.lua"
require('GroupInfo')
require('smnsInfo')
if smnsEnabled then
	require('smnsAura')
end

G040UM0155 = Id.new('g040um0155').value
G040UM0307 = Id.new('g040um0307').value
G020AA0011 = Id.new('g020aa0011')
StormCentaurId = Id.new('g001uu8240').value

function getLevel(attacker, target, item)
    -- transform into unit with its level minus 1 and minus attacker over-level
    local lvl = target.impl.level
    local drain
    local attackerMods = _GroupInfo_UnitModifiers(attacker)
    local targetMods = _GroupInfo_UnitModifiers(target)
    if item then
    	drain = 1
    else
    	local a2 = attacker.impl.attack2
    	if a2 ~= nil and a2.id == G020AA0011 then
    		drain = 1
    	else
    		local flatBonus = 2 * _GroupInfo_UnitModifierAmount(attackerMods, G040UM0307)
    		if not smnsEnabled then
			drain = math.min(5, 1 + flatBonus + math.floor( (attacker.impl.level - attacker.baseImpl.level) / 5))
		else
    			drain = _smns_getUnitAttackDrainLevelBaseValue(attacker, target)
    		end
    	end
    end
    
    local resistanceValue = _unitAura_DrainLevelResistance_val(target, targetMods)
    if resistanceValue > 0 then
    	    drain = math.max(1, math.ceil(drain * (100 - resistanceValue) * 0.01))
    end
    
    if _GroupInfo_UnitModifierAmount(targetMods, G040UM0155) > 0 then
    	    return math.max(target.baseImpl.level, lvl - drain)
    elseif target.impl.id.value == StormCentaurId then
    	    return math.max(target.baseImpl.level - 1, lvl - drain)
    else
	    return math.max(1, lvl - drain)
    end
end
