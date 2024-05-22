function canApplyAsLowerSpell()
log('canApplyAsLowerSpell')
	return false
end

function canApplyAsBoostSpell()
log('canApplyAsBoostSpell')
	return true
end

function canApplyToUnit(unit)
log('canApplyToUnit')
	-- Can apply on only on water unit
	return true
end

function canApplyToUnitType(unitType)
log('canApplyToUnitType')
	-- Can apply on stack leader only
	return
		unitType == Unit.Noble or
		unitType == Unit.Leader or
		unitType == Unit.Summon or
		unitType == Unit.Illusion
end

function getModifierDisplay(unit, prev)
log('getModifierDisplay')
	if unit.impl.level < 3 then
		return true
	end

	-- Default is DISPLAY from Gmodif.dbf
	return prev
end

function getModifierDescTxt(unit, prev)
log('getModifierDescTxt')
	if unit.impl.level < 3 then
		-- Description text from Tglobal.dbf
		return Id.new("x000tg0112")
	end

	-- Default is DESC_TXT from Gmodif.dbf
	return prev
end

function getModifierIconName(unit, prev)
log('getModifierIconName')
	if unit.impl.level < 3 then
		-- Any 31x36 icon name from Icons.ff
		return "ABIL0007"
	end

	-- Default is MODIF_ID from Gmodif.dbf
	return prev
end

function getNameTxt(unit, prev)
log('getNameTxt')
	-- You can use format text like "Overpowered %BASE%" to get names like "Overpowered Peasant"
	if unit.hpMax == 100 and unit.type == Leader.Rod then
		return Id.new("x000tgb004")
    elseif prev == Id.new("x000tg2201") then -- Peasant
		return Id.new("x000tg2053") -- Berzerker
	end

    return Id.new("x000tg2054") -- Anti-Paladin
end

function getDescTxt(unit, prev)
log('getDescTxt')
	if unit.impl.base and unit.impl.base.subrace == Subrace.Heretic then
		return Id.new("x000tg0112")
	end

	if unit.type == Leader.Rod then
		return Id.new("x160tgc536") --return "x000tgb004" -- Plants Rods
	end

    return Id.new("x000tg2054") -- Anti-Paladin
end

function getHitPoint(unit, prev)
log('getHitPoint')
	if unit.hpMax == 100 then
		return 1234
	end

	return prev + 69
end

function getArmor(unit, prev)
log('getArmor')
	return prev + 5
end

function getDeathAnim(unit, prev)
log('getDeathAnim')
	-- Currently there is a bug in the game that prevents this from working
	return DeathAnimation.Heretic
end

function getRegen(unit, prev)
log('getRegen')
	return 50
end

function getXpNext(unit, prev)
log('getXpNext')
	return prev / 2
end

function getXpKilled(unit, prev)
log('getXpKilled')
	return prev * 2
end

function getImmuneToAttack(unit, attack, prev)
log('getImmuneToAttack')
	if attack == Attack.Poison then
		return Immune.Always
	end
	
	return prev
end

function getImmuneToSource(unit, source, prev)
log('getImmuneToSource')
	if source == Source.Fire and prev ~= Immune.Always then
		return Immune.Once
	end

	return prev
end

function getAtckTwice(unit, prev)
log('getAtckTwice')
	if unit.hp / unit.hpMax < 0.5 then
		return true
	end

	return prev
end

function getEnrollCost(unit, prev)
log('getEnrollCost')
	local cost = Currency.new(prev)
	cost.gold = cost.gold + 100
	return cost
end

function getReviveCost(unit, prev)
log('getReviveCost')
	local cost = Currency.new(prev)
	cost.gold = 10
	return cost
end

function getHealCost(unit, prev)
log('getHealCost')
	local cost = Currency.new(prev)
	cost.gold = 1
	return cost
end

function getTrainingCost(unit, prev)
log('getTrainingCost')
	local cost = Currency.new(prev)
	cost.gold = 1
	return cost
end

function getMovement(unit, prev)
log('getMovement')
	return prev + 25
end

function hasMovementBonus(unit, ground, prev)
log('hasMovementBonus')
	if ground == Ground.Forest then
		return true
	end
	
	return prev
end

function getScout(unit, prev)
log('getScout')
	return prev + 1
end

function getLeadership(unit, prev)
log('getLeadership')
	return prev + math.floor(unit.impl.level / 3)
end

function getNegotiate(unit, prev)
log('getNegotiate')
	return prev + 10
end

function hasAbility(unit, ability, prev)
log('hasAbility')
	if ability == Ability.BannerUse then
		return true
	end
	
	return prev
end

function getFastRetreat(unit, prev)
log('getFastRetreat')
	return true
end

function getLowerCost(unit, prev)
log('getLowerCost')
	return 25
end

function getAttackInitiative(unit, prev)
log('getAttackInitiative')
	return prev * (2 - unit.hp / unit.hpMax)
end

function getAttackReach(unit, prev)
log('getAttackReach')
	if unit.hp / unit.hpMax < 0.5 then
		return Reach.All
	end

	return 5 -- Some custom attack reach
end

function getAttackId(unit, prev)
log('getAttackId')
	return Id.new("g000aa0164")
end

function getAttackNameTxt(unit, prev)
log('getAttackNameTxt')
	return Id.new("x160tgc536")
end

function getAttackDescTxt(unit, prev)
log('getAttackDescTxt')
	return Id.new("x160tgc537")
end

function getAttackClass(unit, prev)
log('getAttackClass')
	return Attack.Drain
end

function getAttackSource(unit, prev)
log('getAttackSource')
	if unit.hp > 50 then
		return Source.Fire
	end

	return 14 -- Some custom attack source
end

function getAttackPower(unit, prev)
log('getAttackPower')
	return 69
end

function getAttackDamage(unit, prev)
log('getAttackDamage')
	return prev + 100
end

function getAttackHeal(unit, prev)
log('getAttackHeal')
	return prev + 50
end

function getAttackDrain(unit, damage, prev)
log('getAttackDrain')
	return prev + damage * 0.75
end

function getAttackLevel(unit, prev)
log('getAttackLevel')
	return 3
end

function getAttackInfinite(unit, prev)
log('getAttackInfinite')
	return true
end

function getAttackCritHit(unit, prev)
log('getAttackCritHit')
	return true
end

function getAttackCritDamage(unit, prev)
log('getAttackCritDamage')
	return 50
end

function getAttackCritPower(unit, prev)
log('getAttackCritPower')
	-- Crit chance (0 : 100)
	return 30
end

function getAttackDamRatio(unit, prev)
log('getAttackDamRatio')
	return 50
end

function getAttackDrRepeat(unit, prev)
log('getAttackDrRepeat')
	return true
end

function getAttackDrSplit(unit, prev)
log('getAttackDrSplit')
	return true
end

function getAttackWards(unit, prev)
log('getAttackWards')
	local result = prev
	table.insert(result, Id.new("g000um0011")) -- Add mind ward
	return result
end

function getAttack2Id(unit, prev)
log('getAttack2Id')
	if prev == Id.new("g000000000") then
		return Id.new("g000aa9020")
	end
	
	return prev
end

function getAttack2NameTxt(unit, prev)
log('getAttack2NameTxt')
return prev
end

function getAttack2DescTxt(unit, prev)
log('getAttack2DescTxt')
return prev
end

function getAttack2Class(unit, prev)
log('getAttack2Class')
return prev
end

function getAttack2Source(unit, prev)
log('getAttack2Source')
return prev
end

function getAttack2Power(unit, prev)
log('getAttack2Power')
return prev
end

function getAttack2Damage(unit, prev)
log('getAttack2Damage')
return prev
end

function getAttack2Heal(unit, prev)
log('getAttack2Heal')
return prev
end

function getAttack2Drain(unit, damage, prev)
log('getAttack2Drain')
return prev
end

function getAttack2Level(unit, prev)
log('getAttack2Level')
return prev
end

function getAttack2Infinite(unit, prev)
log('getAttack2Infinite')
return prev
end

function getAttack2CritHit(unit, prev)
log('getAttack2CritHit')
return prev
end

function getAttack2CritDamage(unit, prev)
log('getAttack2CritDamage')
return prev
end

function getAttack2CritPower(unit, prev)
log('getAttack2CritPower')
return prev
end

function getAttack2DamRatio(unit, prev)
log('getAttack2DamRatio')
return prev
end

function getAttack2DrRepeat(unit, prev)
log('getAttack2DrRepeat')
return prev
end

function getAttack2DrSplit(unit, prev)
log('getAttack2DrSplit')
return prev
end

function getAttack2Wards(unit, prev)
log('getAttack2Wards')
return prev
end
