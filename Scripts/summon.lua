
-- Created by Norvezskaya Semga

package.path = ".\\Scripts\\?.lua;.\\Scripts\\exp\\?.lua;.\\Scripts\\modifiers\\?.lua;.\\Scripts\\modifiers\\drawing\\?.lua;.\\Scripts\\modifiers\\items\\?.lua;.\\Scripts\\modifiers\\leaderMods\\?.lua;.\\Scripts\\modifiers\\perks\\?.lua;.\\Scripts\\modifiers\\smns\\?.lua;.\\Scripts\\modifiers\\smns\\items\\?.lua;.\\Scripts\\modifiers\\smns\\spells\\?.lua;.\\Scripts\\modifiers\\smns\\units\\?.lua;.\\Scripts\\modifiers\\spells\\?.lua;.\\Scripts\\modifiers\\units\\?.lua;.\\Scripts\\modifiers\\units\\bloodsorcerer\\?.lua;.\\Scripts\\modifiers\\units\\multiplicative_stats\\?.lua;.\\Scripts\\modifiers\\units\\torhoth\\?.lua;.\\Scripts\\modules\\?.lua;.\\Scripts\\modules\\smns\\?.lua;.\\Scripts\\workshop\\?.lua;.\\Scripts\\workshop\\classes\\?.lua"
require('converter')
require('bonus')
require('valueCap')

function getLevel(summoner, summonImpl, item)

	local summonerExp = _getUnitExp(summoner) 
		* _getSummonExpTransferEffectiveness(summoner, summonImpl, item)
	-- log('summoner exp:'..summonerExp)

	local bonusLvl = _getSummonBonusLevel(summoner, summonImpl, item)
	local lvl = _getUnitImplLevel(summonImpl, summonerExp, bonusLvl)
	-- log('summon exp lvl:'..lvl)
	
	local result = _valueCap_unitLevel(lvl)

	-- log('summoner will summon lvl '..result)
	return result
end
