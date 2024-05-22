package.path = ".\\Scripts\\?.lua;.\\Scripts\\exp\\?.lua;.\\Scripts\\modifiers\\?.lua;.\\Scripts\\modifiers\\drawing\\?.lua;.\\Scripts\\modifiers\\items\\?.lua;.\\Scripts\\modifiers\\leaderMods\\?.lua;.\\Scripts\\modifiers\\perks\\?.lua;.\\Scripts\\modifiers\\smns\\?.lua;.\\Scripts\\modifiers\\smns\\items\\?.lua;.\\Scripts\\modifiers\\smns\\perks\\?.lua;.\\Scripts\\modifiers\\smns\\spells\\?.lua;.\\Scripts\\modifiers\\smns\\units\\?.lua;.\\Scripts\\modifiers\\spells\\?.lua;.\\Scripts\\modifiers\\units\\?.lua;.\\Scripts\\modifiers\\units\\bloodsorcerer\\?.lua;.\\Scripts\\modifiers\\units\\multiplicative_stats\\?.lua;.\\Scripts\\modifiers\\units\\torhoth\\?.lua;.\\Scripts\\modules\\?.lua;.\\Scripts\\modules\\smns\\?.lua;.\\Scripts\\workshop\\?.lua;.\\Scripts\\workshop\\classes\\?.lua"
setRequire={}
require('smnsInfo')
require('GroupInfo')
require('named_mods')
require('valueCap')
unitAura = unitAura or require('unitAura')

require('setValue_Accuracy')
require('setValue_Armor')
require('setValue_CriticalHit')
require('setValue_CriticalHitAccuracy')
require('setValue_Damage')
require('setValue_Drain')
require('setValue_ExpKilled')
require('setValue_ExpNext')
require('setValue_Heal')
require('setValue_HitPoint')
require('setValue_Immunity')
require('setValue_Initiative')
require('setValue_LowerCost')
require('setValue_Movement')
require('setValue_Scout')
require('setValue_Splash')

------------------------
_ConcentrationDegree        = {}
_ConcentrationDegreeDivider = {}
function svResetConcentrationDegree(unit)
	local uid = unit.id.value
	_ConcentrationDegree[uid] = 0
	_ConcentrationDegreeDivider[uid] = 0
	return 0
end
function svAddConcentrationDegree(unit, value)
	local uid = unit.id.value
	_ConcentrationDegree[uid] = _ConcentrationDegree[uid] + value
	_ConcentrationDegreeDivider[uid] = _ConcentrationDegreeDivider[uid] + 1
	return 0
end
function svGetConcentrationDegree(unit)
	local uid = unit.id.value
	return _ConcentrationDegree[uid] / _ConcentrationDegreeDivider[uid]
end

------------------------
setRequire.name = 'setRequire'
return setRequire
