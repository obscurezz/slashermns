package.path = ".\\Scripts\\?.lua;.\\Scripts\\exp\\?.lua;.\\Scripts\\modules\\?.lua;.\\Scripts\\modifiers\\?.lua;.\\Scripts\\modules\\smns\\?.lua;.\\Scripts\\modifiers\\items\\?.lua;.\\Scripts\\modifiers\\units\\?.lua"
require('setValue')
require('GroupInfo')

function getModifierDisplay(unit, prev)
	return prev
end

function getModifierDescTxt(unit, prev)
	return prev
end

function getAttackPower(unit, prev)
    local Leader = _GroupInfo_getCurrentGroupLeader()
	if Leader ~= nil and Leader.hp > 0 and _GroupInfo_UnitHasModifierValue(Leader, NecroLead) then
		local LeaderLVL = Leader.impl.level
		local u
		local unitGroupSlots = unitGroup.slots
		local boostValue = 0
		for i = 1, #unitGroupSlots do
			if u ~= nil and u.hp > 0 and _GroupInfo_UnitHasModifierValue(u, NecroBoost) then
				boostValue = boostValue + 1 + 0.35 * (u.impl.level - u.baseImpl.level)
				break
			end
		end
		local result = svMultimplyPower1(unit, prev, 0.01 * (3 + boostValue) * LeaderLVL)
        return result
	end
    return prev
end

function getAttack2Power(unit, prev)
	local Leader = _GroupInfo_getCurrentGroupLeader()
	if Leader ~= nil and Leader.hp > 0 and _GroupInfo_UnitHasModifierValue(Leader, NecroLead) then
		local LeaderLVL = Leader.impl.level
		local u
		local unitGroupSlots = unitGroup.slots
		local boostValue = 0
		for i = 1, #unitGroupSlots do
			if u ~= nil and u.hp > 0 and _GroupInfo_UnitHasModifierValue(u, NecroBoost) then
				boostValue = boostValue + 1 + 0.35 * (u.impl.level - u.baseImpl.level)
				break
			end
		end
        smnsInfo_SetApplyAccuracyBuffToAttack2(true)
		local result = svMultimplyPower2(unit, prev, 0.01 * (3 + boostValue) * LeaderLVL)
        smnsInfo_SetApplyAccuracyBuffToAttack2(false)
        return result
	end
    return prev
end