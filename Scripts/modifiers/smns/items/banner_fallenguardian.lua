package.path = ".\\Scripts\\?.lua;.\\Scripts\\exp\\?.lua;.\\Scripts\\modifiers\\?.lua;.\\Scripts\\modifiers\\drawing\\?.lua;.\\Scripts\\modifiers\\items\\?.lua;.\\Scripts\\modifiers\\leaderMods\\?.lua;.\\Scripts\\modifiers\\perks\\?.lua;.\\Scripts\\modifiers\\smns\\?.lua;.\\Scripts\\modifiers\\smns\\items\\?.lua;.\\Scripts\\modifiers\\smns\\perks\\?.lua;.\\Scripts\\modifiers\\smns\\spells\\?.lua;.\\Scripts\\modifiers\\smns\\units\\?.lua;.\\Scripts\\modifiers\\spells\\?.lua;.\\Scripts\\modifiers\\units\\?.lua;.\\Scripts\\modifiers\\units\\bloodsorcerer\\?.lua;.\\Scripts\\modifiers\\units\\multiplicative_stats\\?.lua;.\\Scripts\\modifiers\\units\\torhoth\\?.lua;.\\Scripts\\modules\\?.lua;.\\Scripts\\modules\\smns\\?.lua;.\\Scripts\\workshop\\?.lua;.\\Scripts\\workshop\\classes\\?.lua"
require('statscheck')
require('setValue')

function getModifierDisplay(unit, prev)
	return prev
end

function getModifierDescTxt(unit, prev)
	return prev
end

-- function getRegen(unit, prev)
-- 	local a1 = unit.impl.attack1
-- 	local a2 = unit.impl.attack2
-- 	if statsCheck_isHealAttack(a1)
-- 	or statsCheck_isHealAttack(a2)
-- 	or statsCheck_isCurseAttack(a1)
-- 	or statsCheck_isCurseAttack(a2) then
-- 		return prev + 30
-- 	else
-- 		return prev
-- 	end
-- end

-- function getImmuneToAttack(unit, attack, prev)
-- 	if statsCheck_isCurseType(attack) and attack ~= Attack.LowerDamage then
-- 		if statsCheck_isHealAttack(unit.impl.attack1)
-- 		or statsCheck_isHealAttack(unit.impl.attack2) then
-- 			return svAttackImmunityClass(unit, attack, prev, Immune.Always)
-- 		end
-- 	end
-- 	return prev
-- end

function getAttackHeal(unit, prev)
	local result = prev
	if statsCheck_isHealAttack(unit.impl.attack1) then
		smnsInfo_SetApplyApplyDmgBuffToHeal(true)
		result = svMultimplyHeal1(unit, prev, 0.2)
		smnsInfo_SetApplyApplyDmgBuffToHeal(false)
	end
	return result
end

function getAttack2Heal(unit, prev)
	local result = prev
	if statsCheck_isHealAttack(unit.impl.attack2) then
		smnsInfo_SetApplyApplyDmgBuffToHeal(true)
		result = svMultimplyHeal2(unit, prev, 0.2)
		smnsInfo_SetApplyApplyDmgBuffToHeal(false)
	end
	return result
end

function getAttackPower(unit, prev)
	if statsCheck_isCurseAttack(unit.impl.attack1) then
		return svMultimplyPower1(unit, prev, 0.2)
	else
		return prev
	end
end

function getAttack2Power(unit, prev)
	local result = prev
	if statsCheck_isCurseAttack(unit.impl.attack2) then
		smnsInfo_SetApplyAccuracyBuffToAttack2(true)
		result = svMultimplyPower2(unit, prev, 0.2)
		smnsInfo_SetApplyAccuracyBuffToAttack2(false)
	end
	return result
end
