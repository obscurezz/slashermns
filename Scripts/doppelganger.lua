
-- Created by Norvezskaya Semga

package.path = ".\\Scripts\\?.lua;.\\Scripts\\exp\\?.lua;.\\Scripts\\modifiers\\?.lua;.\\Scripts\\modifiers\\drawing\\?.lua;.\\Scripts\\modifiers\\items\\?.lua;.\\Scripts\\modifiers\\leaderMods\\?.lua;.\\Scripts\\modifiers\\perks\\?.lua;.\\Scripts\\modifiers\\smns\\?.lua;.\\Scripts\\modifiers\\smns\\items\\?.lua;.\\Scripts\\modifiers\\smns\\spells\\?.lua;.\\Scripts\\modifiers\\smns\\units\\?.lua;.\\Scripts\\modifiers\\spells\\?.lua;.\\Scripts\\modifiers\\units\\?.lua;.\\Scripts\\modifiers\\units\\bloodsorcerer\\?.lua;.\\Scripts\\modifiers\\units\\multiplicative_stats\\?.lua;.\\Scripts\\modifiers\\units\\torhoth\\?.lua;.\\Scripts\\modules\\?.lua;.\\Scripts\\modules\\smns\\?.lua;.\\Scripts\\workshop\\?.lua;.\\Scripts\\workshop\\classes\\?.lua"
require('converter')
require('bonus')
require('valueCap')

function getLevel(doppelganger, target)
-- коммент
	local utype = target.impl.type
	if utype == Unit.Summon or utype == Unit.Noble or utype == Unit.Guardian then
		return target.baseImpl.level
	end
	
	local doppelExp = _getUnitExp(doppelganger)
		* _getDoppelgangerExpTransferEffectiveness(doppelganger, target)
	-- log('Doppelganger exp:'..doppelExp)

	local bonusLvl = _getDoppelgangerBonusLevel(doppelganger, target)
	local lvl = _getUnitImplLevel(target.baseImpl, doppelExp, bonusLvl)
	-- log('Doppelganger exp lvl '..lvl)
		
	local result = _valueCap_unitLevel(lvl)
	
	-- log('Doppelganger will transform into lvl '..result)
	return result
end
