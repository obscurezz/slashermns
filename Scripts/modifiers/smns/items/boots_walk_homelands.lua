package.path = ".\\Scripts\\?.lua;.\\Scripts\\exp\\?.lua;.\\Scripts\\modules\\?.lua;.\\Scripts\\modifiers\\?.lua;.\\Scripts\\modules\\smns\\?.lua;.\\Scripts\\modifiers\\items\\?.lua;.\\Scripts\\modifiers\\units\\?.lua"
require "unitAura"
require "GroupInfo"
require "unitAuraCustomDesc"
require "setValue"

function getModifierDisplay(unit, prev)
	local r = _modifDisplay_Regen_Flat(unit, prev)
	if unit.hp > 0 then
		return r
	else
		return false
	end
end

function getModifierDescTxt(unit, prev)
	return _modifCustomTxt_Regen_Flat(unit, prev)
end

function getMovement(unit, prev)
	local result = 2
	local stack = _GroupInfo_getUnitStack(unit)
	if stack ~= nil then
		local player = stack.owner
		if player ~= nil then
			local pos = stack.position
			local tile = getScenario():getTile(pos.x, pos.y)
			if _terrainToPlayerRace[tile.terrain] == player.race then
				result = result + 4
			end
		end
	end
	return svFlatEffectMovement(unit, prev, result)
end
