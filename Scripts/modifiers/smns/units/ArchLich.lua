require('GroupInfo')
function getModifierDisplay(unit, prev)
	return prev
end

function getModifierDescTxt(unit, prev)
	return prev
end

-- function getAttack2Id(unit, prev)
-- 	_get_Group_and_Mods(unit)
-- 	if _GroupInfo_stackHasModifierAmount(Id.new('g070um0090').value) > 0 then
-- 		return Id.new('g070aa0130')
-- 	end
-- 	return prev
-- end

function getAttackDamage(unit, prev)
	local player = _GroupInfo_getUnitPlayer(unit)
	if player ~= nil and player.race ~= Race.Neutral then
		local DeathMana = player.bank.deathMana
		local bonus_damage = math.min(unit.impl.attack1.damage/2, math.floor(DeathMana / 40))

		return svFlatEffectDamage1(unit, prev, bonus_damage)
	end
	return prev
end
