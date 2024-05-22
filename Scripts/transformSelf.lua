
-- Created by Norvezskaya Semga

package.path = ".\\Scripts\\?.lua;.\\Scripts\\exp\\?.lua;.\\Scripts\\modifiers\\?.lua;.\\Scripts\\modifiers\\drawing\\?.lua;.\\Scripts\\modifiers\\items\\?.lua;.\\Scripts\\modifiers\\leaderMods\\?.lua;.\\Scripts\\modifiers\\perks\\?.lua;.\\Scripts\\modifiers\\smns\\?.lua;.\\Scripts\\modifiers\\smns\\items\\?.lua;.\\Scripts\\modifiers\\smns\\perks\\?.lua;.\\Scripts\\modifiers\\smns\\spells\\?.lua;.\\Scripts\\modifiers\\smns\\units\\?.lua;.\\Scripts\\modifiers\\spells\\?.lua;.\\Scripts\\modifiers\\units\\?.lua;.\\Scripts\\modifiers\\units\\bloodsorcerer\\?.lua;.\\Scripts\\modifiers\\units\\multiplicative_stats\\?.lua;.\\Scripts\\modifiers\\units\\torhoth\\?.lua;.\\Scripts\\modules\\?.lua;.\\Scripts\\modules\\smns\\?.lua;.\\Scripts\\workshop\\?.lua;.\\Scripts\\workshop\\classes\\?.lua"
require('converter')
require('bonus')
require('valueCap')

function getLevel(unit, transformImpl, item)

	local unitExp = _getUnitExp(unit)
		* _getTransformSelfExpTransferEffectiveness(unit, transformImpl, item)
	-- log('transforming unit exp:'..unitExp)

	local bonusLvl = _getTransformSelfBonusLevel(unit, transformImpl, item)
	local lvl = _getUnitImplLevel(transformImpl, unitExp, bonusLvl)
	-- log('transform exp lvl:'..lvl)
	
	local result = _valueCap_unitLevel(lvl)

	-- log('unit will transform into lvl '..result)
	return result
end
