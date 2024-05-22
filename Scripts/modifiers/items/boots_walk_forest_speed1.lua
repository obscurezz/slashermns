package.path = ".\\Scripts\\?.lua;.\\Scripts\\exp\\?.lua;.\\Scripts\\modifiers\\?.lua;.\\Scripts\\modifiers\\drawing\\?.lua;.\\Scripts\\modifiers\\items\\?.lua;.\\Scripts\\modifiers\\leaderMods\\?.lua;.\\Scripts\\modifiers\\perks\\?.lua;.\\Scripts\\modifiers\\smns\\?.lua;.\\Scripts\\modifiers\\smns\\items\\?.lua;.\\Scripts\\modifiers\\smns\\perks\\?.lua;.\\Scripts\\modifiers\\smns\\spells\\?.lua;.\\Scripts\\modifiers\\smns\\units\\?.lua;.\\Scripts\\modifiers\\spells\\?.lua;.\\Scripts\\modifiers\\units\\?.lua;.\\Scripts\\modifiers\\units\\bloodsorcerer\\?.lua;.\\Scripts\\modifiers\\units\\multiplicative_stats\\?.lua;.\\Scripts\\modifiers\\units\\torhoth\\?.lua;.\\Scripts\\modules\\?.lua;.\\Scripts\\modules\\smns\\?.lua;.\\Scripts\\workshop\\?.lua;.\\Scripts\\workshop\\classes\\?.lua"
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
	return svFlatEffectMovement(unit, prev, 8)
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

function getAttackHeal(unit, prev)
	if _boots_walk_forest_speed1_add_fight_bonus(unit, prev) then
		return svMultimplyHeal1(unit, prev, 0.1)
	else
		return prev
	end
end

function getAttack2Heal(unit, prev)
	if _boots_walk_forest_speed1_add_fight_bonus(unit, prev) then
		return svMultimplyHeal2(unit, prev, 0.1)
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

