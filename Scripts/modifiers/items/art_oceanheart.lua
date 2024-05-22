package.path = ".\\Scripts\\?.lua;.\\Scripts\\exp\\?.lua;.\\Scripts\\modifiers\\?.lua;.\\Scripts\\modifiers\\drawing\\?.lua;.\\Scripts\\modifiers\\items\\?.lua;.\\Scripts\\modifiers\\leaderMods\\?.lua;.\\Scripts\\modifiers\\perks\\?.lua;.\\Scripts\\modifiers\\smns\\?.lua;.\\Scripts\\modifiers\\smns\\items\\?.lua;.\\Scripts\\modifiers\\smns\\perks\\?.lua;.\\Scripts\\modifiers\\smns\\spells\\?.lua;.\\Scripts\\modifiers\\smns\\units\\?.lua;.\\Scripts\\modifiers\\spells\\?.lua;.\\Scripts\\modifiers\\units\\?.lua;.\\Scripts\\modifiers\\units\\bloodsorcerer\\?.lua;.\\Scripts\\modifiers\\units\\multiplicative_stats\\?.lua;.\\Scripts\\modifiers\\units\\torhoth\\?.lua;.\\Scripts\\modules\\?.lua;.\\Scripts\\modules\\smns\\?.lua;.\\Scripts\\workshop\\?.lua;.\\Scripts\\workshop\\classes\\?.lua"
require "GroupInfo"
require "setValue"
require "named_mods"

function getModifierDisplay(unit, prev)
	if _unitAura_hasOnceImmuneToSource(unit, Source.Water) 
	or _unitAura_hasAlwaysImmuneToSource(unit, Source.Water) then
		return false
	end
	local unitMods = _GroupInfo_UnitModifiers(unit)
	if _GroupInfo_UnitModifierAmount(unitMods, luteofcharming_mod) == 0 then
		return false
	end
	return prev
end

function getModifierDescTxt(unit, prev)
	return prev
end

function hasMovementBonus(unit, ground, prev)
	if ground == Ground.Water then
		return true
	end	
	return prev
end

function getMovement(unit, prev)
	local result = 4
	local stack = _GroupInfo_getUnitStack(unit)
	if stack ~= nil then
		local pos = stack.position
		local tile = getScenario():getTile(pos.x, pos.y)
		if tile.ground == Ground.Water then
			result = result + 2
		end
	end
	return svFlatEffectMovement(unit, prev, result)
end
