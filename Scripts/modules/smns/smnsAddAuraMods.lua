
-- if you want to add modifiers, replace "nil" by array of strings
-- example:
-- return _smns_addMod_Common(mods, {'g000um1234'})
-- or if you want multiple mods
-- return _smns_addMod_Common(mods, {'g000um1234', 'g000um5678', 'g000um1357'})

-- increase stack hp by 5%
function _smns_addMod_uaHitPoint_valPercent5(mods)
	return _smns_addMod_Common(mods, nil)
end
-- increase stack hp by 5
function _smns_addMod_uaHitPoint_valFlat5(mods)
	return _smns_addMod_Common(mods, nil)
end
-- increase stack hp by 10
function _smns_addMod_uaHitPoint_valFlat10(mods)
	return _smns_addMod_Common(mods, nil)
end
-- increase stack hp by 25
function _smns_addMod_uaHitPoint_valFlat25(mods)
	return _smns_addMod_Common(mods, nil)
end
-- increase stack regen by 5%
function _smns_addMod_uaRegen_valFlat5(mods)
	return _smns_addMod_Common(mods, {'g070um0048', 'g070um0086', 'g070um0086', 'g070um0087', 'g070um0087', 'g070um0087'})
end
-- increase stack armor by 5
function _smns_addMod_uaArmor_valFlat5(mods)
	return _smns_addMod_Common(mods, nil)
end
-- increase stack initiative by 5%
function _smns_addMod_uaAttackInitiative_valPercent5(mods)
	return _smns_addMod_Common(mods, nil)
end
-- increase stack initiative by 10%
function _smns_addMod_uaAttackInitiative_valPercent10(mods)
	return _smns_addMod_Common(mods, nil)
end
-- increase stack damage and heal by 5%
function _smns_addMod_uaAttackDamageHeal_valPercent5(mods)
	return _smns_addMod_Common(mods, nil)
end
-- increase stack damage and heal by 20%
function _smns_addMod_uaAttackDamageHeal_valPercent20(mods)
	return _smns_addMod_Common(mods, nil)
end
-- increase stack damage and heal by 25%
function _smns_addMod_uaAttackDamageHeal_valPercent25(mods)
	return _smns_addMod_Common(mods, nil)
end
-- increase stack accuracy by 5%
function _smns_addMod_uaAttackPower_valPercent5(mods)
	return _smns_addMod_Common(mods, nil)
end
-- increase stack accuracy by 5% if modifier owner is not melee
function _smns_addMod_uaAttackPower_valPercent5_ranged(mods)
	return _smns_addMod_Common(mods, nil)
end
-- increase stack vampirism by 10%
function _smns_addMod_uaAttackDrain_valFlat10(mods)
	return _smns_addMod_Common(mods, nil)
end
-- increase stack vampirism by 20%
function _smns_addMod_uaAttackDrain_valFlat20(mods)
	return _smns_addMod_Common(mods, nil)
end
-- increase stack vampirism by 35%
function _smns_addMod_uaAttackDrain_valFlat35(mods)
	return _smns_addMod_Common(mods, nil)
end
-- increase stack crit damage by 5%
function _smns_addMod_uaAttackCrit_valFlat5(mods)
	return _smns_addMod_Common(mods, nil)
end
-- increase stack crit damage by 10%
function _smns_addMod_uaAttackCrit_valFlat10(mods)
	return _smns_addMod_Common(mods, nil)
end
-- increase chance to protect backward unit from hit by 5%
function _smns_addMod_umAttackProtection5(mods)
	return _smns_addMod_Common(mods, nil)
end
-- increase chance to protect backward unit from hit by 25%
function _smns_addMod_umAttackProtection25(mods)
	return _smns_addMod_Common(mods, nil)
end
-- increase chance to protect backward unit from hit by 35%
function _smns_addMod_umAttackProtection35(mods)
	return _smns_addMod_Common(mods, nil)
end
-- increase chance to protect backward unit from hit by 50%
function _smns_addMod_umAttackProtection50(mods)
	return _smns_addMod_Common(mods, nil)
end
-- increase chance to protect backward unit from hit by 75%
function _smns_addMod_umAttackProtection75(mods)
	return _smns_addMod_Common(mods, nil)
end
-- increase chance to protect backward unit from hit by 100%
function _smns_addMod_umAttackProtection100(mods)
	return _smns_addMod_Common(mods, nil)
end
-- increase level of summoned unit by 1 (only for modifier owner)
function _smns_addMod_umSummonBonusLevel1(mods)
	return _smns_addMod_Common(mods, nil)
end
-- increase level of summoned unit by 2 (only for modifier owner)
function _smns_addMod_umSummonBonusLevel2(mods)
	return _smns_addMod_Common(mods, nil)
end
-- increase level of summoned unit by 3 (only for modifier owner)
function _smns_addMod_umSummonBonusLevel3(mods)
	return _smns_addMod_Common(mods, nil)
end
-- increase level of summoned unit by 4 (only for modifier owner)
function _smns_addMod_umSummonBonusLevel4(mods)
	return _smns_addMod_Common(mods, nil)
end
-- increase level of summoned unit by 5 (only for modifier owner)
function _smns_addMod_umSummonBonusLevel5(mods)
	return _smns_addMod_Common(mods, nil)
end
-- increase level of summoned or selftransformed unit by 1 (for whole stack)
function _smns_addMod_uaSummonTransform_valFlat1(mods)
	return _smns_addMod_Common(mods, nil)
end
-- increase level of summoned or selftransformed unit by 2 (for whole stack)
function _smns_addMod_uaSummonTransform_valFlat2(mods)
	return _smns_addMod_Common(mods, nil)
end
-- decrease experience stack gain by 10% (modifier for leader)
function _smns_addMod_uaExpKill_valFlat10m(mods)
	return _smns_addMod_Common(mods, nil)
end
-- decrease experience stack gain by 25% (modifier for leader)
function _smns_addMod_uaExpKill_valFlat25m(mods)
	return _smns_addMod_Common(mods, nil)
end
-- increase experience stack gain by 10% (modifier for leader)
function _smns_addMod_uaExpKill_valFlat10(mods)
	return _smns_addMod_Common(mods, nil)
end
-- increase experience stack gain by 15% (modifier for leader)
function _smns_addMod_uaExpKill_valFlat15(mods)
	return _smns_addMod_Common(mods, nil)
end
-- increase experience stack gain by 25% (modifier for leader)
function _smns_addMod_uaExpKill_valFlat25(mods)
	return _smns_addMod_Common(mods, nil)
end
-- protect backward unit from curse attacks
function _smns_addMod_uaCurseProtection_valCovered1(mods)
	return _smns_addMod_Common(mods, nil)
end
-- increase backward unit armor by 10
function _smns_addMod_uaArmorFlat_valCovered10(mods)
	return _smns_addMod_Common(mods, nil)
end
-- increase backward unit armor by 15
function _smns_addMod_uaArmorFlat_valCovered15(mods)
	return _smns_addMod_Common(mods, nil)
end
-- increase backward unit armor by 20
function _smns_addMod_uaArmorFlat_valCovered20(mods)
	return _smns_addMod_Common(mods, nil)
end
-- protect stack from fire damage over time
function _smns_addMod_uaBlisterResist(mods)
	return _smns_addMod_Common(mods, nil)
end
-- protect stack from ice damage over time
function _smns_addMod_uaFrostbiteResist(mods)
	return _smns_addMod_Common(mods, nil)
end
-- protect stack from poison damage over time
function _smns_addMod_uaPoisonResist(mods)
	return _smns_addMod_Common(mods, nil)
end
-- protect stack from lower damage
function _smns_addMod_uaLowerDamageResist(mods)
	return _smns_addMod_Common(mods, nil)
end
-- protect stack from lower initiative
function _smns_addMod_uaLowerInitiativeResist(mods)
	return _smns_addMod_Common(mods, nil)
end
-- add 0.5 of armor per 1% of lost hp
function _smns_addMod_umPerLostHP_Armor1(mods)
	return _smns_addMod_Common(mods, nil)
end
-- add 0.5% of initiative per 1% of lost hp
function _smns_addMod_umPerLostHP_AttackInitiative1(mods)
	return _smns_addMod_Common(mods, nil)
end
-- add 0.5% of damage and heal per 1% of lost hp
function _smns_addMod_umPerLostHP_AttackDamageHeal1(mods)
	return _smns_addMod_Common(mods, nil)
end
-- add 0.5% of accuracy per 1% of lost hp
function _smns_addMod_umPerLostHP_AttackPower1(mods)
	return _smns_addMod_Common(mods, nil)
end
-- add 0.5% of vampirism per 1% of lost hp
function _smns_addMod_umPerLostHP_AttackDrain1(mods)
	return _smns_addMod_Common(mods, nil)
end
-- add 0.5% of critical damage per 1% of lost hp
function _smns_addMod_umPerLostHP_AttackCrit1(mods)
	return _smns_addMod_Common(mods, nil)
end
-- add 0.5% of attack twice chance per 1% of lost hp
function _smns_addMod_umPerLostHP_DoubleAttack1(mods)
	return _smns_addMod_Common(mods, nil)
end
-- increase initiative by 10% on full life
function _smns_addMod_umAttackDamageInitiativeOnFullLife10(mods)
	return _smns_addMod_Common(mods, nil)
end
-- increase power by 10% on full life
function _smns_addMod_umAttackLessPowerOnFullLife10(mods)
	return _smns_addMod_Common(mods, nil)
end
-- can not attack if stay in front of big unit
function _smns_addMod_umCowardiceBig(mods)
	return _smns_addMod_Common(mods, nil)
end
-- increase modifier owner vampirism by 10% per corpse in your stack
-- see modifiers\units\cadaver.lua
function _smns_addMod_umVampirismPerCorpse(mods)
	return _smns_addMod_Common(mods, nil)
end
-- increase modifier owner damage and initiative by 10% per corpse in your stack
-- see modifiers\units\smallblackspider.lua
function _smns_addMod_umCannibalism10(mods)
	return _smns_addMod_Common(mods, nil)
end
-- increase armor of nearest allies by 5
function _smns_addMod_uaArmorFlat_valNearest5(mods)
	return _smns_addMod_Common(mods, nil)
end
-- distribute 20 of armor between units with most part of lost hp
function _smns_addMod_ua_mlh_ArmorFlat20(mods)
	return _smns_addMod_Common(mods, nil)
end
-- distribute 20% of accuracy between units with most part of lost hp
function _smns_addMod_ua_mlh_PowerPercent20(mods)
	return _smns_addMod_Common(mods, nil)
end
-- distribute 20% of critical damage between units with most part of lost hp
function _smns_addMod_ua_mlh_CritFlat20(mods)
	return _smns_addMod_Common(mods, nil)
end
-- add 10% of attack1 adamage to attack2 damage (for modifier owner)
function _smns_addMod_ua_AddedDamagePercent10(mods)
	return _smns_addMod_Common(mods, nil)
end
-- add 30% of attack1 adamage to attack2 damage (for modifier owner)
function _smns_addMod_ua_AddedDamagePercent30(mods)
	return _smns_addMod_Common(mods, nil)
end
-- add 35% of attack1 adamage to attack2 damage (for modifier owner)
function _smns_addMod_ua_AddedDamagePercent35(mods)
	return _smns_addMod_Common(mods, nil)
end
-- add 45% of attack1 adamage to attack2 damage (for modifier owner)
function _smns_addMod_ua_AddedDamagePercent45(mods)
	return _smns_addMod_Common(mods, nil)
end
-- Drain level works with 50% less effectiveness on modifier owner (stacks multiplicatively)
function _smns_addMod_umDrainLevelResistance50(mods)
	return _smns_addMod_Common(mods, nil)
end
-- increase stack hp by 10% if modifier owner is dead
function _smns_addMod_uaHitPointOnDeath_valPercent10(mods)
	return _smns_addMod_Common(mods, nil)
end
-- increase stack hp by 20% if modifier owner is dead
function _smns_addMod_uaHitPointOnDeath_valPercent20(mods)
	return _smns_addMod_Common(mods, nil)
end
-- increase stack vampirism by 10% if modifier owner is dead
function _smns_addMod_uaAttackDrainOnDeath_valPercent10(mods)
	return _smns_addMod_Common(mods, nil)
end
-- increase stack vampirism by 20% if modifier owner is dead
function _smns_addMod_uaAttackDrainOnDeath_valPercent20(mods)
	return _smns_addMod_Common(mods, nil)
end
-- increase modifier owner hp by 10% per corpse in your stack
-- see modifiers\units\deathqueen_hp.lua
function _smns_addMod_umHitPointPerCorpse(mods)
	return _smns_addMod_Common(mods, nil)
end

-- no need to change this function
function _smns_addMod_Common(dest, source)
	if source ~= nil and #source > 0 then
		for i = 1, #source do
			dest[#dest + 1] = Id.new(source[i]).value
		end
	end
	return dest
end
