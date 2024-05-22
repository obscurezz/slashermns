package.path = ".\\Scripts\\?.lua;.\\Scripts\\exp\\?.lua;.\\Scripts\\modules\\?.lua;.\\Scripts\\modifiers\\?.lua;.\\Scripts\\modules\\smns\\?.lua;.\\Scripts\\modifiers\\items\\?.lua;.\\Scripts\\modifiers\\units\\?.lua"
require('GroupInfo')

function getModifierDisplay(unit, prev)
	return prev
end

function getModifierDescTxt(unit, prev)
	return prev
end

function _getLeftOrb(unit)
	local stack = _GroupInfo_getUnitStack(unit)
	local battle_item_left = stack:getEquippedItem(Equipment.Battle1)
    if battle_item_left ~= nil then
	    if battle_item_left.base.type == Item.Orb then
		    return battle_item_left
        end
	end

	return nil
end

function _getRightOrb(unit)
	local stack = _GroupInfo_getUnitStack(unit)
	local battle_item_right = stack:getEquippedItem(Equipment.Battle2)
    if battle_item_right ~= nil then
	    if battle_item_right.base.type == Item.Orb then
		    return battle_item_right
        end
	end

	return nil
end

function getAttackId(unit, prev)
	if _getLeftOrb(unit) ~= nil then
		return _getLeftOrb(unit).base.attack.id
	end
	return prev
end

function getAttackReach(unit, prev)
	if _getLeftOrb(unit) ~= nil then
		return _getLeftOrb(unit).base.attack.reach
	end
	return prev
end

function getAttackDamage(unit, prev)
	local result = prev
	if _getLeftOrb(unit) ~= nil then
		if statsCheck_isHealAttack(unit.impl.attack1) then
			smnsInfo_SetApplyApplyDmgBuffToHeal(true)
			result = svFlatEffectHeal1(unit, prev, 10 * (unit.impl.level - unit.baseImpl.level))
			smnsInfo_SetApplyApplyDmgBuffToHeal(false)
		elseif statsCheck_isDirectDmgAttack(unit.impl.attack1) then
			result = svFlatEffectDamage1(unit, prev, 0.1 * _getLeftOrb(unit).base.attack.damage * (unit.impl.level - unit.baseImpl.level))
		else
			return prev
		end
	end
	return result
end