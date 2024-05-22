package.path = ".\\Scripts\\?.lua;.\\Scripts\\exp\\?.lua;.\\Scripts\\modules\\?.lua;.\\Scripts\\modifiers\\?.lua;.\\Scripts\\modules\\smns\\?.lua;.\\Scripts\\modifiers\\items\\?.lua;.\\Scripts\\modifiers\\units\\?.lua"
require('setValue')

function _ProgressionCounter()
	local current_day = getScenario().day
	if current_day > 5 then
		return math.min((current_day - 5), 15)
	end
	return 0
end

function getModifierDisplay(unit, prev)
	return prev
end

function getModifierDescTxt(unit, prev)
	return prev
end

function getImmuneToAttack(unit, attack, prev)
	local debuff_resist_value
	if getScenario().day <= 10 then
		debuff_resist_value = 25
	elseif getScenario().day > 10 and getScenario().day <= 15 then
		debuff_resist_value = 30
	elseif getScenario().day > 15 and getScenario().day <= 20 then
		debuff_resist_value = 35
	else
		debuff_resist_value = 40
	end

	if _mRnd_simpleRndEvent(debuff_resist_value) then
		if attack == Attack.Paralyze or attack == Attack.Petrify or attack == Attack.Fear or attack == Attack.TransformOther then
			if prev ~= Immune.Always or prev ~= Immune.Once then
				return svAttackImmunityClass(unit, attack, prev, Immune.Always)
			end
		end
	end
	return prev
end

function getXpKilled(unit, prev)
	return svFlatEffectXpKilled(unit, prev, 250 * _ProgressionCounter())
end

function getHitPoint(unit, prev)
	return svFlatEffectHitPoint(unit, prev, 50 * _ProgressionCounter())
end

function getArmor(unit, prev)
	return svFlatEffectArmor(unit, prev, 5 * _ProgressionCounter())
end

function getAttackInitiative(unit, prev)
	return svFlatEffectInitiative(unit, prev, 5 * _ProgressionCounter())
end

function getAttackDamage(unit, prev)
	return svFlatEffectDamage1(unit, prev, 15 * _ProgressionCounter())
end

-- function getAttackDrain(unit, damage, prev)
-- 	return svAddDrain1(unit, prev, damage, 0.03 * _ProgressionCounter())
-- end

function getAttackCritHit(unit, prev)
	if _ProgressionCounter() > 0 then
		return true
	end
	return prev
end

function getAttackCritDamage(unit, prev)
	return svAddCrit1Damage(unit, prev, 2 * _ProgressionCounter())
end

function getAttackCritPower(unit, prev)
	return svAddCrit1Power(unit, prev, 2 * _ProgressionCounter())
end