package.path = ".\\Scripts\\?.lua;.\\Scripts\\exp\\?.lua;.\\Scripts\\modifiers\\?.lua;.\\Scripts\\modifiers\\drawing\\?.lua;.\\Scripts\\modifiers\\items\\?.lua;.\\Scripts\\modifiers\\leaderMods\\?.lua;.\\Scripts\\modifiers\\perks\\?.lua;.\\Scripts\\modifiers\\smns\\?.lua;.\\Scripts\\modifiers\\smns\\items\\?.lua;.\\Scripts\\modifiers\\smns\\perks\\?.lua;.\\Scripts\\modifiers\\smns\\spells\\?.lua;.\\Scripts\\modifiers\\smns\\units\\?.lua;.\\Scripts\\modifiers\\spells\\?.lua;.\\Scripts\\modifiers\\units\\?.lua;.\\Scripts\\modifiers\\units\\bloodsorcerer\\?.lua;.\\Scripts\\modifiers\\units\\multiplicative_stats\\?.lua;.\\Scripts\\modifiers\\units\\torhoth\\?.lua;.\\Scripts\\modules\\?.lua;.\\Scripts\\modules\\smns\\?.lua;.\\Scripts\\workshop\\?.lua;.\\Scripts\\workshop\\classes\\?.lua"
require('baroness_info')
require('darkpaladin_info')
require('GroupInfo')

local darkpaladin_mod = Id.new('g040um0263').value
local baroness_mod = Id.new('g040um0096').value


function _UnitsLeveledAttacks_getAttackClass(prev, unit, unitMods)
	if _GroupInfo_UnitModifierAmount(unitMods, baroness_mod) > 0 then
		return _Baroness_Info_getAttackClass(prev, unit)
 	end
 	return prev
end

function _UnitsLeveledAttacks_getAttackPower(prev, unit, unitMods)
	if _GroupInfo_UnitModifierAmount(unitMods, baroness_mod) > 0 then
		return _Baroness_Info_getAttackPower(unit)
 	end
 	if prev == 0 then
 		prev = 100
 	end
 	return prev
end

function _UnitsLeveledAttacks_getAttack2Id(prev, unit, unitMods)
	if _GroupInfo_UnitModifierAmount(unitMods, darkpaladin_mod) > 0 then
		return _Darkpaladin_Info_getAttack2Id(prev, unit)
 	end
 	return prev
end

function _UnitsLeveledAttacks_getAttack2Class(prev, unit, unitMods)
	if _GroupInfo_UnitModifierAmount(unitMods, darkpaladin_mod) > 0 then
 		return _Darkpaladin_Info_getAttack2Class(prev, unit)
 	end
 	return prev
 end

function _UnitsLeveledAttacks_getAttack2Damage(attack, unit, unitMods)
 	if attack ~= nil then
 		return attack.damage
 	else
	 	return 0
	end
end

function _UnitsLeveledAttacks_getAttack2Heal(attack, unit, unitMods)
 	if attack ~= nil then
 		return attack.heal
 	else
	 	return 0
	end
end

function _UnitsLeveledAttacks_getAttack2Power(attack, unit, unitMods)
	if _GroupInfo_UnitModifierAmount(unitMods, darkpaladin_mod) > 0 then
		return _Darkpaladin_Info_getAttack2Power(unit)
 	end
 	if attack ~= nil then
 		local p = attack.power
 	 	if p == 0 then
 	 		p = 100
	 	end
 		return p
 	else
	 	return 0
	end
end
