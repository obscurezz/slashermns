
require('GroupInfo')
require('named_mods')
require('smnsInfo')

local debuffDamage_10 = _statsMultiplier_toIdArray({'g040um0092'})
local debuffDamage_15 = _statsMultiplier_toIdArray({'g040um0087','g040um0090','g040um0091'})
local debuffDamage_33 = _statsMultiplier_toIdArray({'g040um0088','g040um0089'})

local debuffHeal_10 = debuffDamage_10
local debuffHeal_15 = debuffDamage_15
local debuffHeal_33 = debuffDamage_33

local debuffPower_10 = _statsMultiplier_toIdArray({'g005um0178','g000um0064'})
local debuffPower_20 = _statsMultiplier_toIdArray({'g000um7542','g000um0073'})
local debuffPower_25 = _statsMultiplier_toIdArray({'g000um0089'})
local debuffPower_33 = _statsMultiplier_toIdArray({'g000um0055'})

local debuffInitiative_10 = _statsMultiplier_toIdArray({'g001um7541','g005um0179'})
local debuffInitiative_15 = _statsMultiplier_toIdArray({'g000um0050'})
local debuffInitiative_33 = _statsMultiplier_toIdArray({'g000um0091','g000um0075'})

local debuffArmor_10 = _statsMultiplier_toIdArray({'g000um0045','g000um0065'})
local debuffArmor_15 = _statsMultiplier_toIdArray({'g005um0183'})
local debuffArmor_20 = _statsMultiplier_toIdArray({'g000um7543'})






function _statsMultiplier_Damage1(unit, unitMods, spellDebuffLowerEffect)
	return 1.0
end

function _statsMultiplier_Damage2(unit, unitMods, spellDebuffLowerEffect)
	return 1.0
end

function _statsMultiplier_Heal1(unit, unitMods, spellDebuffLowerEffect)
	return 1.0
end

function _statsMultiplier_Heal2(unit, unitMods, spellDebuffLowerEffect)
	return 1.0
end

function _statsMultiplier_Power1(unit, unitMods, spellDebuffLowerEffect)
	return 1.0
end

function _statsMultiplier_Power2(unit, unitMods, spellDebuffLowerEffect)
	return 1.0
end

function _statsMultiplier_Initiative(unit, unitMods, spellDebuffLowerEffect)
	return 1.0
end

function _statsMultiplier_Armor(unit, unitMods, spellDebuffLowerEffect)
	return 1.0
end

function _statsMultiplier_Movement(unit, unitMods, spellDebuffLowerEffect)
	return 1.0
end
