package.path = ".\\Scripts\\?.lua;.\\Scripts\\exp\\?.lua;.\\Scripts\\modules\\?.lua;.\\Scripts\\modifiers\\?.lua;.\\Scripts\\modules\\smns\\?.lua;.\\Scripts\\modifiers\\items\\?.lua;.\\Scripts\\modifiers\\units\\?.lua"
require('setValue')
require('smnsConditions')

function getModifierDisplay(unit, prev)
	return prev
end

function getModifierDescTxt(unit, prev)
	return prev
end

--Хранитель рун
function getAttackInitiative(unit, prev)
	if _GroupInfo_stackHasModifierAmount(Id.new('g070um0055').value) > 0 then
		return svFlatEffectInitiative(unit, prev, 10)
	end
	return prev
end

function getAttackDamage(unit, prev)
	if _GroupInfo_stackHasModifierAmount(Id.new('g070um0055').value) > 0 then
		return svMultimplyDamage1(unit, prev, 0.2)
	end	
	return prev
end

function getHitPoint(unit, prev)
	if _GroupInfo_stackHasModifierAmount(Id.new('g070um0055').value) > 0 then
		return svFlatEffectHitPoint(unit, prev, -50)
	end	
	return prev
end


function getAttackReach(unit, prev)
	if _GroupInfo_stackHasModifierAmount(Id.new('g070um0031').value) > 0 then
		return 27
	end
	return prev
end

-- function getAttack2Id(unit, prev)
-- 	if _GroupInfo_stackHasModifierAmount(Id.new('g070um0031').value) > 0 then
-- 		return Id.new('g070aa0156')
-- 	end
	
-- 	if _GroupInfo_stackHasModifierAmount(Id.new('g070um0054').value) > 0 then
-- 		return Id.new('g070aa0179')
-- 	end	
-- 	return prev
-- end	



function getArmor(unit, prev)
	local p = _GroupInfo_getUnitPlayer(unit)
	if p ~= nil and p.race ~= Race.Neutral then
		local RM = p.bank.runicMana
		if RM > 350 then
			return svFlatEffectArmor(unit, prev, 10)
		end
	end
	return prev
end

function getImmuneToAttack(unit, attack, prev)
	local p = _GroupInfo_getUnitPlayer(unit)
	if p ~= nil and p.race ~= Race.Neutral then
		local RM = p.bank.runicMana
		if prev ~= Immune.Always then
			if attack == Attack.Shatter and RM > 350 then
				return Immune.Once
			end
		end
	end
	return prev
end
--