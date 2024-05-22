package.path = ".\\Scripts\\?.lua;.\\Scripts\\exp\\?.lua;.\\Scripts\\modifiers\\?.lua;.\\Scripts\\modifiers\\drawing\\?.lua;.\\Scripts\\modifiers\\items\\?.lua;.\\Scripts\\modifiers\\leaderMods\\?.lua;.\\Scripts\\modifiers\\perks\\?.lua;.\\Scripts\\modifiers\\smns\\?.lua;.\\Scripts\\modifiers\\smns\\items\\?.lua;.\\Scripts\\modifiers\\smns\\perks\\?.lua;.\\Scripts\\modifiers\\smns\\spells\\?.lua;.\\Scripts\\modifiers\\smns\\units\\?.lua;.\\Scripts\\modifiers\\spells\\?.lua;.\\Scripts\\modifiers\\units\\?.lua;.\\Scripts\\modifiers\\units\\bloodsorcerer\\?.lua;.\\Scripts\\modifiers\\units\\multiplicative_stats\\?.lua;.\\Scripts\\modifiers\\units\\torhoth\\?.lua;.\\Scripts\\modules\\?.lua;.\\Scripts\\modules\\smns\\?.lua;.\\Scripts\\workshop\\?.lua;.\\Scripts\\workshop\\classes\\?.lua"
unitAura={}
require('GroupInfo')

_mapMulti_ignore_All = Id.new('g201um9255').value
_mapMulti_ignore_DAMAGE1_MULTI = Id.new('g201um9256').value
_mapMulti_ignore_DAMAGE2_MULTI = Id.new('g201um9257').value
_mapMulti_ignore_HEAL1_MULTI = Id.new('g201um9258').value
_mapMulti_ignore_HEAL2_MULTI = Id.new('g201um9259').value
_mapMulti_ignore_POWER1_MULTI = Id.new('g201um9260').value
_mapMulti_ignore_POWER2_MULTI = Id.new('g201um9261').value
_mapMulti_ignore_INITIATIVE_MULTI = Id.new('g201um9262').value
_mapMulti_ignore_ARMOR_FLAT = Id.new('g201um9263').value
_mapMulti_ignore_REGEN_FLAT = Id.new('g201um9264').value
_mapMulti_ignore_NEGOTIATE_FLAT = Id.new('g201um9265').value
_mapMulti_ignore_DRAIN1_FLAT = Id.new('g201um9266').value
_mapMulti_ignore_DRAIN2_FLAT = Id.new('g201um9267').value
_mapMulti_ignore_XPGAIN_MULTI = Id.new('g201um9268').value
_mapMulti_ignore_MOVEMENT_FLAT = Id.new('g201um9269').value
_mapMulti_ignore_SCOUT_FLAT = Id.new('g201um9270').value
_mapMulti_ignore_TRADEDISCOUNT_FLAT = Id.new('g201um9271').value
_mapMulti_ignore_CRITDAMAGE1_FLAT = Id.new('g201um9272').value
_mapMulti_ignore_CRITDAMAGE2_FLAT = Id.new('g201um9273').value
_mapMulti_ignore_CRITPOWER1_FLAT = Id.new('g201um9274').value
_mapMulti_ignore_CRITPOWER2_FLAT = Id.new('g201um9275').value

local scenario = nil
function _mapMultipliers_SetScenario(scen)
	scenario = scen
	return 0
end

function _mapMultipliers_getValue(unit, suffix, modifierToIgnore)
	local variables = scenario.variables
	if variables == nil then
		return nil
	end
	
	local race
	local p = _GroupInfo_getLastFoundGroupPlayer()
	if p ~= nil then
		local r = p.race
		if r == Race.Human then
			race = 'EMPIRE'
		elseif r == Race.Undead then
			race = 'HORDES'
		elseif r == Race.Heretic then
			race = 'LEGIONS'
		elseif r == Race.Dwarf then
			race = 'CLANS'
		elseif r == Race.Elf then
			race = 'ELVES'
		else
			race = 'NEUTRALS'
		end
	else
		race = 'NEUTRALS'
	end
	
	local mods = _GroupInfo_UnitModifiers(unit)
	local hasIgnoreModifier
	if _GroupInfo_UnitModifierAmount(mods, _mapMulti_ignore_All) > 0
	or _GroupInfo_UnitModifierAmount(mods, modifierToIgnore) > 0 then
		hasIgnoreModifier = true
	else
		hasIgnoreModifier = false
	end
	
	local ignoranceMode = variables:getVariable(race..'_IGNORANCE_MODE')
	if ignoranceMode ~= nil then
		if ignoranceMode.value == 1 then
			hasIgnoreModifier = not hasIgnoreModifier
		elseif ignoranceMode.value == 2 then
			hasIgnoreModifier = false
		end
	end
	
	if hasIgnoreModifier then
		return nil
	end
	
	local statValue = variables:getVariable(race..suffix)
	if statValue == nil then
		return nil
	else
		return statValue.value
	end
end

-- function _mapMultipliers_HitPoint_Multi()
--	local v = _mapMultipliers_getValue('_HIT_POINT_MULTI')
--	if v == nil then
--		return 1
--	else
--		return 0.01 * v
--	end
-- end

function _mapMultipliers_Damage1_Multi(unit)
	local v = _mapMultipliers_getValue(unit, '_DAMAGE1_MULTI', _mapMulti_ignore_DAMAGE1_MULTI)
	if v == nil then
		return 1
	else
		return 0.01 * v
	end
end

function _mapMultipliers_Damage2_Multi(unit)
	local v = _mapMultipliers_getValue(unit, '_DAMAGE2_MULTI', _mapMulti_ignore_DAMAGE2_MULTI)
	if v == nil then
		return 1
	else
		return 0.01 * v
	end
end

function _mapMultipliers_Heal1_Multi(unit)
	local v = _mapMultipliers_getValue(unit, '_HEAL1_MULTI', _mapMulti_ignore_HEAL1_MULTI)
	if v == nil then
		return 1
	else
		return 0.01 * v
	end
end

function _mapMultipliers_Heal2_Multi(unit)
	local v = _mapMultipliers_getValue(unit, '_HEAL2_MULTI', _mapMulti_ignore_HEAL2_MULTI)
	if v == nil then
		return 1
	else
		return 0.01 * v
	end
end

function _mapMultipliers_Power1_Multi(unit)
	local v = _mapMultipliers_getValue(unit, '_POWER1_MULTI', _mapMulti_ignore_POWER1_MULTI)
	if v == nil then
		return 1
	else
		return 0.01 * v
	end
end

function _mapMultipliers_Power2_Multi(unit)
	local v = _mapMultipliers_getValue(unit, '_POWER2_MULTI', _mapMulti_ignore_POWER2_MULTI)
	if v == nil then
		return 1
	else
		return 0.01 * v
	end
end

function _mapMultipliers_Initiative_Multi(unit)
	local v = _mapMultipliers_getValue(unit, '_INITIATIVE_MULTI', _mapMulti_ignore_INITIATIVE_MULTI)
	if v == nil then
		return 1
	else
		return 0.01 * v
	end
end

function _mapMultipliers_Armor_Flat(unit)
	local v = _mapMultipliers_getValue(unit, '_ARMOR_FLAT', _mapMulti_ignore_ARMOR_FLAT)
	if v == nil then
		return 0
	else
		return v - 100
	end
end

function _mapMultipliers_Regen_Flat(unit)
	local v = _mapMultipliers_getValue(unit, '_REGEN_FLAT', _mapMulti_ignore_REGEN_FLAT)
	if v == nil then
		return 0
	else
		return v - 100
	end
end

function _mapMultipliers_Negotiate_Flat(unit)
	local v = _mapMultipliers_getValue(unit, '_NEGOTIATE_FLAT', _mapMulti_ignore_NEGOTIATE_FLAT)
	if v == nil then
		return 0
	else
		return v - 100
	end
end

function _mapMultipliers_Drain1_Flat(unit)
	local v = _mapMultipliers_getValue(unit, '_DRAIN1_FLAT', _mapMulti_ignore_DRAIN1_FLAT)
	if v == nil then
		return 0
	else
		return v - 100
	end
end

function _mapMultipliers_Drain2_Flat(unit)
	local v = _mapMultipliers_getValue(unit, '_DRAIN2_FLAT', _mapMulti_ignore_DRAIN2_FLAT)
	if v == nil then
		return 0
	else
		return v - 100
	end
end

function _mapMultipliers_XpGain_Multi(unit)
	local v = _mapMultipliers_getValue(unit, '_XPGAIN_MULTI', _mapMulti_ignore_XPGAIN_MULTI)
	if v == nil then
		return 1
	else
		return 0.01 * v
	end
end

function _mapMultipliers_MovementPoints_Flat(unit)
	local v = _mapMultipliers_getValue(unit, '_MOVEMENT_FLAT', _mapMulti_ignore_MOVEMENT_FLAT)
	if v == nil then
		return 0
	else
		return v - 100
	end
end

function _mapMultipliers_Scout_Flat(unit)
	local v = _mapMultipliers_getValue(unit, '_SCOUT_FLAT', _mapMulti_ignore_SCOUT_FLAT)
	if v == nil then
		return 0
	else
		return v - 100
	end
end

function _mapMultipliers_TradeDiscount_Flat(unit)
	local v = _mapMultipliers_getValue(unit, '_TRADEDISCOUNT_FLAT', _mapMulti_ignore_TRADEDISCOUNT_FLAT)
	if v == nil then
		return 0
	else
		return v - 100
	end
end

function _mapMultipliers_CritDamage1_Flat(unit)
	local v = _mapMultipliers_getValue(unit, '_CRITDAMAGE1_FLAT', _mapMulti_ignore_CRITDAMAGE1_FLAT)
	if v == nil then
		return 0
	else
		return v - 100
	end
end

function _mapMultipliers_CritDamage2_Flat(unit)
	local v = _mapMultipliers_getValue(unit, '_CRITDAMAGE2_FLAT', _mapMulti_ignore_CRITDAMAGE2_FLAT)
	if v == nil then
		return 0
	else
		return v - 100
	end
end

function _mapMultipliers_CritPower1_Flat(unit)
	local v = _mapMultipliers_getValue(unit, '_CRITPOWER1_FLAT', _mapMulti_ignore_CRITPOWER1_FLAT)
	if v == nil then
		return 0
	else
		return v - 100
	end
end

function _mapMultipliers_CritPower2_Flat(unit)
	local v = _mapMultipliers_getValue(unit, '_CRITPOWER2_FLAT', _mapMulti_ignore_CRITPOWER2_FLAT)
	if v == nil then
		return 0
	else
		return v - 100
	end
end
