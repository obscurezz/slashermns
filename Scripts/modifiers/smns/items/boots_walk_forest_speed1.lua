package.path = ".\\Scripts\\?.lua;.\\Scripts\\exp\\?.lua;.\\Scripts\\modules\\?.lua;.\\Scripts\\modifiers\\?.lua;.\\Scripts\\modules\\smns\\?.lua;.\\Scripts\\modifiers\\items\\?.lua;.\\Scripts\\modifiers\\units\\?.lua"
require "GroupInfo"
require "setValue"

function getModifierDisplay(unit, prev)
	return prev
end

function getModifierDescTxt(unit, prev)
	return prev
end

function hasMovementBonus(unit, ground, prev)
	if ground == Ground.Forest then
		return true
	end	
	return prev
end

function getMovement(unit, prev)
	return svFlatEffectMovement(unit, prev, 2)
end

function getAttackDamage(unit, prev)
	if _boots_walk_forest_speed1_add_fight_bonus(unit, prev) then
		return svMultimplyDamage1(unit, prev, 0.1)
	else
		return prev
	end
end

function getAttack2Damage(unit, prev)
	if _boots_walk_forest_speed1_add_fight_bonus(unit, prev) then
		return svMultimplyDamage2(unit, prev, 0.1)
	else
		return prev
	end
end

function getAttackPower(unit, prev)
	if _boots_walk_forest_speed1_add_fight_bonus(unit, prev) then
		return svMultimplyPower1(unit, prev, 0.1)
	else
		return prev
	end
end

function getAttack2Power(unit, prev)
	if _boots_walk_forest_speed1_add_fight_bonus(unit, prev) then
		return svMultimplyPower2(unit, prev, 0.1)
	else
		return prev
	end
end

function _boots_walk_forest_speed1_add_fight_bonus(unit, prev)
	local stack = _GroupInfo_getUnitStack(unit)
	if stack ~= nil then
		local pos = stack.position
		local tile = getScenario():getTile(pos.x, pos.y)
		if tile.ground == Ground.Forest then
			return true
		end
	end
	return false
end

