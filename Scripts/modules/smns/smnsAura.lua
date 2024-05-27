package.path = ".\\Scripts\\?.lua;.\\Scripts\\exp\\?.lua;.\\Scripts\\modifiers\\?.lua;.\\Scripts\\modifiers\\drawing\\?.lua;.\\Scripts\\modifiers\\items\\?.lua;.\\Scripts\\modifiers\\leaderMods\\?.lua;.\\Scripts\\modifiers\\perks\\?.lua;.\\Scripts\\modifiers\\smns\\?.lua;.\\Scripts\\modifiers\\smns\\items\\?.lua;.\\Scripts\\modifiers\\smns\\perks\\?.lua;.\\Scripts\\modifiers\\smns\\spells\\?.lua;.\\Scripts\\modifiers\\smns\\units\\?.lua;.\\Scripts\\modifiers\\spells\\?.lua;.\\Scripts\\modifiers\\units\\?.lua;.\\Scripts\\modifiers\\units\\bloodsorcerer\\?.lua;.\\Scripts\\modifiers\\units\\multiplicative_stats\\?.lua;.\\Scripts\\modifiers\\units\\torhoth\\?.lua;.\\Scripts\\modules\\?.lua;.\\Scripts\\modules\\smns\\?.lua;.\\Scripts\\workshop\\?.lua;.\\Scripts\\workshop\\classes\\?.lua"
require('GroupInfo')
require('RangeInfo')
require('mRnd')
require('common')
require('statscheck')
require('game_constants')
require('smnsInfo')
require('smnsConditions')
require('smns_new_mods_id')
require('smnsMapAuraEffects')
-- changes hit points
-- prev - numeric value of hit points
	local smns_scenario = nil
function _smnsAura_SetScenario(scen)
	
    smns_scenario = scen
    return smns_scenario
end

-- specify what is unit attack drain level value without modifiers
function _smns_getUnitAttackDrainLevelBaseValue(attacker, target)
	local lvl = target.impl.level
    local drain
    local attackerMods = _GroupInfo_UnitModifiers(attacker)
    local targetMods = _GroupInfo_UnitModifiers(target)
    if item then
    	drain = 1
	else
    local a2 = attacker.impl.attack2
		if a2 ~= nil and a2.id == G020AA0011 then
    	drain = 1
		else
		local flatBonus = 2 * _GroupInfo_UnitModifierAmount(attackerMods, G040UM0307)
		drain = math.min(5, 1 + flatBonus + math.floor( (attacker.impl.level - attacker.baseImpl.level) / 2))
		end
	end
    return drain
end

function _smns_multiplicativeHitPointBonus(unit, prev)
	local BonusHP = 0
	local mods = _GroupInfo_UnitModifiers(unit)

--Аура 8% ОЗ
	if _GroupInfo_stackHasModifierAmount(AuraHPperk) > 0 then
		BonusHP = BonusHP + 8
	end
--Аура 8% ОЗ END

-- Некромантия +%ХП
    if _GroupInfo_stackHasModifierAmount(NecroLead) > 0  and _GroupInfo_UnitModifierAmount(mods, NecromanceryMod) > 0 then
        local Leader = _GroupInfo_getCurrentGroupLeader()
        if Leader ~= nil and Leader.hp > 0 then
            local LeaderLVL = Leader.impl.level
            local u
            local boostValue = 0
            local unitGroupSlots = unitGroup.slots
            for i = 1, #unitGroupSlots do
                u = unitGroupSlots[i].unit
                if u ~= nil and u.hp > 0 and _GroupInfo_UnitHasModifierValue(u, NecroBoost) then
                    boostValue = boostValue + 1 + 0.35 * (u.impl.level - u.baseImpl.level)
                    break
                end
            end

            BonusHP = BonusHP + (3 + boostValue)*LeaderLVL
        end
    end
-- Некромантия +%ХП end

--В тени Иггдрасиля I (Алхимик 10% ХП если гигант в отряде)
	if _GroupInfo_UnitHasModifierValue(unit, Alchemist20HPIfGiant) then
		BonusHP = BonusHP + smnsConditions_getBonusIfGiant(unit, 10)
	end
	--В тени Иггдрасиля I END

	--В тени Иггдрасиля II (Эйра 20% ХП если гигант в отряде)
	if _GroupInfo_UnitHasModifierValue(unit, Eyra40HPIfGiant) then
		BonusHP = BonusHP + smnsConditions_getBonusIfGiant(unit, 20)
	end
	--В тени Иггдрасиля II END	
	
	--Взор Иллюмиэль I
    if _GroupInfo_stackHasModifierAmount(SunnyDancer) > 0 then
        BonusHP = BonusHP + 5
    end
    --Взор Иллюмиэль I END

    --Взор Иллюмиэль II
    if _GroupInfo_stackHasModifierAmount(Sylphida) > 0 then
        BonusHP = BonusHP + 10
    end
    --Взор Иллюмиэль II END
	

	
	return BonusHP
end

function _smns_flatHitPointBonus(unit, prev)
	BonusHP = 0
	return BonusHP
end

-- changes regen
-- prev - numeric value of regeneration
function _smns_flatRegenBonus(unit, prev)
	local RegenerationBonus = 0 + _Rod_Placer_Effect(unit)
--Целебное варево
  if unitGroup ~= nil then
        if _GroupInfo_stackHasModifierAmount(SkaldRegeneration) > 0 then
            local u
            local mAmount
            local unitGroupSlots = unitGroup.slots
            for i = 1, #unitGroupSlots do
                u = unitGroupSlots[i].unit
                if u ~= nil and u.hp > 0 then
                    mAmount = _GroupInfo_UnitModifierAmount(_GroupInfo_UnitModifiers(u), SkaldRegeneration)
                    if mAmount > 0 then
                        RegenerationBonus = 4 + 4*(u.impl.level - u.baseImpl.level)
                    end
                end
            end
        end
    end
--Целебное варево END



--Повелитель волков
    if _GroupInfo_stackHasModifierAmount(LordOfWolvesInParty) > 0 and _GroupInfo_UnitHasModifierValue(unit, WolfArmorRegen) then
        RegenerationBonus = RegenerationBonus + 10
    end
    --Повелитель волков END
	
--15 регена отряду если в лесу
    if _GroupInfo_stackHasModifierAmount(HolyTree) > 0 then
        local stack = _GroupInfo_getUnitStack(unit)
        if stack ~= nil then
            local pos = stack.position
            local tile = smns_scenario:getTile(pos.x, pos.y)
            if tile.ground == Ground.Forest then
                RegenerationBonus = RegenerationBonus + 15
            end
        end
    end
--END

--Покровительство
	-- if smnsConditions_isStackNearToStackWithUnitModifier(unit, 2, smns_scenario, Heaven) then
	-- 	RegenerationBonus = RegenerationBonus + 10
	-- end  
--Покровительство END




	return RegenerationBonus
end

-- changes armor
-- prev - numeric value of armor
function _smns_flatArmorBonus(unit, prev)
	local BonusArmor = 0 + _Grymturs_Deboost_Effect(unit)
	local mods = _GroupInfo_UnitModifiers(unit)

	--Броня предков
		if _GroupInfo_stackHasModifierAmount(ArcaneArmor) > 0 then
			local p = _GroupInfo_getUnitPlayer(unit)
				if p ~= nil and p.race ~= Race.Neutral then
					local EM = p.bank.groveMana
					local mana_criteria = math.min(1000, EM)
					BonusArmor = BonusArmor + math.floor(mana_criteria/55)
				end
		end
	


	--Броня предков END
	
	--Покров Мортис
	if _GroupInfo_stackHasModifierAmount(DlanMortis) > 0 and (_GroupInfo_UnitHasModifierValue(unit, NecroLead) or _GroupInfo_UnitHasModifierValue(unit, NecromanceryMod)) then
		local u
		local mAmount = {}
		local group = _GroupInfo_getCurrentGroup()
		local unitGroupSlots = group.slots
		for i = 1, #unitGroupSlots do
			u = unitGroupSlots[i].unit
			if u ~= nil and u.hp > 0 and _GroupInfo_UnitHasModifierValue(u, DlanMortis) then
				table.insert(mAmount, u)
			end
		end
		local highest = mAmount[1]
		for i = 1, #mAmount do
			if mAmount[i].impl.level > highest.impl.level then
				highest = mAmount[i]
			end
		end
		BonusArmor = BonusArmor + math.min(30, 6 * (highest.impl.level - highest.baseImpl.level))
	end
	--Покров Мортис END

	--абсолютный хлад
	-- if smnsConditions_isStackNearToEnemyStackWithUnitModifier(unit, 1, smns_scenario, Grymturs) then
	-- 	BonusArmor = BonusArmor - 10
	-- end
	--абсолютный хлад END
	
-- Элитная стража
	if _GroupInfo_stackHasModifierAmount(Yarl) > 0 and unit.impl.race == Race.Dwarf and _GroupInfo_UnitModifierAmount(mods, Yarl) == 0 then
		BonusArmor = BonusArmor + 5
	end	
-- Элитная стража END

--Паладин дает 10 брони юниту позади
	if _GroupInfo_stackHasModifierAmount(PaladinSameColArmor) > 0 then
		local covering = _GroupInfo_getCoveringUnit(unit, true)
		if covering ~= nil and covering.hp > 0 and _GroupInfo_UnitHasModifierValue(covering, PaladinSameColArmor) then
			BonusArmor = BonusArmor + 10
		end
	end
--END

--Повелитель волков
    if _GroupInfo_stackHasModifierAmount(LordOfWolvesInParty) > 0 and _GroupInfo_UnitHasModifierValue(unit, WolfArmorRegen) then
        BonusArmor = BonusArmor + 10
    end
--Повелитель волков END

--БлагослОвление леса дает +8 и +3 за оверлевел брони крестом вокруг себя
		
	if _GroupInfo_stackHasModifierAmount(CurerCrossArmor) > 0 then
		local u
		local same_col = _GroupInfo_getSameColumnUnit(unit, true)
		local left_right = _GroupInfo_getLeftAndRightNearestUnits(unit, true)
		if same_col ~= nil then
			table.insert(left_right, same_col)
		end
		for i = 1, #left_right do
            u = left_right[i]
            if u ~= nil and u.hp > 0 then
                if _GroupInfo_UnitHasModifierValue(u, CurerCrossArmor) then
                    BonusArmor = BonusArmor + 8 + 3*(u.impl.level - u.baseImpl.level)
                    break
                end
            end
        end
	end
--Благославление леса END

	--Осколки адского камня
	--incub
	local deadIncubAmount = _GroupInfo_stackHasModifierAmount_Dead(incub)
	if deadIncubAmount > 0 then
		BonusArmor = BonusArmor + 6 * deadIncubAmount
	end

	--yakshini
	local deadYakshiniAmount = _GroupInfo_stackHasModifierAmount_Dead(yakshini)
	if deadYakshiniAmount > 0 then
		BonusArmor = BonusArmor + 9 * deadYakshiniAmount
	end
	--Осколки адского камня END

	--Фанатизм I
	if _GroupInfo_UnitHasModifierValue(unit, Inquisitor10DamageSameRowDead) then
		if unit.hp / unit.hpMax < 0.4 then
			BonusArmor = BonusArmor + 25
		end
	end
	--Фанатизм I END

	--Фанатизм II
	if _GroupInfo_UnitHasModifierValue(unit, GrandInquisitor20DamageSameRowDead) then
		if unit.hp / unit.hpMax < 0.4 then
			BonusArmor = BonusArmor + 40
		end
	end
	--Фанатизм II END

	return BonusArmor
end

-- changes damage and heal
-- prev - numeric value of attack
-- attackN = 1 or 2. 1 - primary attack, 2 - secondary attack
-- unitMods - list of modifiers
function _smns_multiplicativeDamageHealBonus(unit, prev, attackN, unitMods)
	local mods = _GroupInfo_UnitModifiers(unit)
	local BonusDMG = 0 + _Spawn_Tiamat_Deboost_Effect(unit)

--Аура 7% DMG
	if _GroupInfo_stackHasModifierAmount(AuraDMGperk) > 0 then
		BonusDMG = BonusDMG + 7
	end
--Аура 7% DMG END

--бонус Лорда-мага
	local player = _GroupInfo_getUnitPlayer(unit)
	
	if player ~= nil and player.lord == Lord.Mage and player.race ~= Race.Neutral then
		if smnsConditions_isStackOnItsTerrain(smns_scenario, _GroupInfo_getUnitStack(unit)) then
			if statsCheck_isDirectDmgType(unit.impl.attack1.type) then
				local uias = unit.impl.attack1.source
				if uias == Source.Fire or uias == Source.Earth or uias == Source.Air or uias == Source.Water or uias == Source.Death or uias == Source.Mind or uias == Source.Life then
					BonusDMG = BonusDMG + 7
				end
			end
		end
	end
--end бонус Лорда-мага
	
-- Некромантия +%Урон 
    if _GroupInfo_stackHasModifierAmount(NecroLead) > 0  and _GroupInfo_UnitModifierAmount(mods, NecromanceryMod) > 0 then
        local Leader = _GroupInfo_getCurrentGroupLeader()
        if Leader ~= nil and Leader.hp > 0 then
            local LeaderLVL = Leader.impl.level
            local u
            local boostValue = 0
            local unitGroupSlots = unitGroup.slots
            for i = 1, #unitGroupSlots do
                u = unitGroupSlots[i].unit
                if u ~= nil and u.hp > 0 and _GroupInfo_UnitHasModifierValue(u, NecroBoost) then
                    boostValue = boostValue + 1 + 0.35 * (u.impl.level - u.baseImpl.level)
                    break
                end
            end

            BonusDMG = BonusDMG + (3 + boostValue)*LeaderLVL
        end
    end
-- Некромантия +%Урон END

	--древняя тьма
	if _GroupInfo_UnitHasModifierValue(unit, ElderVampire) then
		local maxHP = getScenario():getUnit(unit.id).hpMax
		if unit.hp / maxHP < 0.5 then
			BonusDMG = BonusDMG + 25
		end
	end
	--древняя тьма END

--Страх Бездны I
	-- if smnsConditions_isStackNearToEnemyStackWithUnitModifier(unit, 1, smns_scenario, AbyssalFearI) then
	-- 	BonusDMG = BonusDMG - 10
	-- end
--Страх Бездны I END

--Страх Бездны II
	-- if smnsConditions_isStackNearToEnemyStackWithUnitModifier(unit, 1, smns_scenario, AbyssalFearII) then
	-- 	BonusDMG = BonusDMG - 15
	-- end
--Страх Бездны II END

--защитник горна
if _GroupInfo_UnitHasModifierValue(unit, GornDefender) then
    local group = _GroupInfo_getCurrentGroup()
    local slots = group.slots
    local s
    local u
    local n = 0
    local FSlots = {}
    for i = 1, #slots do
        s = slots[i]
        u = s.unit
        if u ~= nil then
            n = n + 1
            FSlots[n] = slots[i]
        end
    end
    local FrontLine = _common_GetFrontline(FSlots)
    for i = 1, #slots do
        s = slots[i]
        u = s.unit
        if u ~= nil and u.id.value == unit.id.value then
            if s.line == FrontLine then
                BonusDMG = BonusDMG + 20
            end
            break
        end
    end
end
--

--Пророчество
--multiplicative damage
local deadProphetessAmount = _GroupInfo_stackHasModifierAmount_Dead(prophetess)
if deadProphetessAmount > 0 then
    local group = _GroupInfo_getCurrentGroup()
    local units = group.units
    local u
    local currentValue = 0
    for i = 1, #units do
        u = units[i]
        if _GroupInfo_UnitHasModifierValue(u, prophetess) and u.hp == 0 then
            currentValue = currentValue + 7 + 1 * (u.impl.level - u.baseImpl.level)
        end
    end

    BonusDMG = BonusDMG + currentValue
end
--Пророчество END

--Путь боли

if _GroupInfo_UnitHasModifierValue(unit, TormentorSameColResist) then
    local Leader = _GroupInfo_getCurrentGroupLeader()
    if Leader ~= nil and Leader.hp > 0 and _GroupInfo_UnitHasModifierValue(Leader, PathOfPain) then
        BonusDMG = BonusDMG + 4 * Leader.impl.level
    end
end

if _GroupInfo_UnitHasModifierValue(unit, TorturerCrossResist) then
    local Leader = _GroupInfo_getCurrentGroupLeader()
    if Leader ~= nil and Leader.hp > 0 and _GroupInfo_UnitHasModifierValue(Leader, PathOfPain) then
        BonusDMG = BonusDMG + 7 * Leader.impl.level
    end
end

--Путь боли END

--Оборотни
    local WerewolfAmount = _GroupInfo_stackHasModifierAmount(WerewolfInParty)
    if WerewolfAmount > 1 and _GroupInfo_UnitHasModifierValue(unit, T2Werewolf15DmgPerEach) then
        BonusDMG = BonusDMG + 15 * (WerewolfAmount - 1)
    end
--END

--Мастер клинка +3% урона за каждый уровень лидера отряда
	if _GroupInfo_UnitHasModifierValue(unit, SwordMaster3DamagePerHeroLVL) then
		local Leader = _GroupInfo_getCurrentGroupLeader()
		if Leader ~= nil and Leader.hp > 0 then
			BonusDMG = 3 * Leader.impl.level
		end
	end
--END

--Ангел/Юстициар +7% урона за каждого другого ангела/юстициара в отряде
	local AngelOrJusticiarAmount = _GroupInfo_stackHasModifierAmount(AngelJusticiarInParty)
	if AngelOrJusticiarAmount > 1 and _GroupInfo_UnitHasModifierValue(unit, AngelJusticiar10DmgPerEach) then
		BonusDMG = BonusDMG + 7 * (AngelOrJusticiarAmount - 1)
	end
--END

-- Закаленная сталь I +10% урона		
	local Attack1Source = unit.impl.attack1.source
	if _GroupInfo_stackHasModifierAmount(HardenedSteelBuffer) > 0 and Attack1Source == Source.Weapon and _GroupInfo_stackHasModifierAmount(HardenedSteelBufferII) == 0 then
		BonusDMG = BonusDMG + 10
	end	
-- Закаленная сталь I +10% урона END

-- Закаленная сталь II +15% урона		
	local Attack1Source = unit.impl.attack1.source
	if _GroupInfo_stackHasModifierAmount(HardenedSteelBufferII) > 0 and Attack1Source == Source.Weapon then
		BonusDMG = BonusDMG + 15
	end	
-- Закаленная сталь II +15% урона END

--Гнев преисподние +10% урона огню
	local CountWrathOfHellBuffer = _GroupInfo_stackHasModifierAmount(WrathOfHellBuffer)
	local Attack1Source = unit.impl.attack1.source
	if CountWrathOfHellBuffer > 0  
	and
		Attack1Source == Source.Fire  then
		BonusDMG = BonusDMG + 10 * CountWrathOfHellBuffer
	end	
--Гнев преисподние +10% урона огню END

--Ардет если не прикрыт наносит на 15% урона больше
    coveringUnit = _GroupInfo_getCoveringUnit(unit, nil)
    if _GroupInfo_UnitHasModifierValue(unit, ArdetIfNotCovered) and (coveringUnit == nil or coveringUnit.hp == 0 or _GroupInfo_UnitHasModifierValue(coveringUnit, Reconnaissance)) then
        BonusDMG = BonusDMG + 15
    end
--END

--Игнар если не прикрыт наносит на 30% урона больше
    coveringUnit = _GroupInfo_getCoveringUnit(unit, nil)
    if _GroupInfo_UnitHasModifierValue(unit, IgnarIfNotCovered) and (coveringUnit == nil or coveringUnit.hp == 0 or _GroupInfo_UnitHasModifierValue(coveringUnit, Reconnaissance)) then
        BonusDMG = BonusDMG + 30
    end
--END

--Тайны льда
	local CountWaterBuffer = _GroupInfo_stackHasModifierAmount(WaterBuffer)
	local Attack1Source = unit.impl.attack1.source
	if CountWaterBuffer > 0  
	and
		Attack1Source == Source.Water  then
		BonusDMG = BonusDMG + 12 * CountWaterBuffer
	end
--Тайны льда END

--Волчья стая
	local CountWolf = _GroupInfo_stackHasModifierAmount(Wolf) - 1
	if CountWolf > 0  
	and
	_GroupInfo_UnitHasModifierValue(unit, Wolf)  then
		BonusDMG = BonusDMG + 10 * CountWolf
	end
--Волчья стая END

--Союз
	if _GroupInfo_UnitHasModifierValue(unit, MeleeElf) and _GroupInfo_stackHasModifierAmount(GryphonIncreaseMeleeElfDamage) > 0 then
		BonusDMG = BonusDMG + 10
	end
--Союз END

-- Повелитель демонов
	if _GroupInfo_stackHasModifierAmount(DemonLord) > 0  
	and
	unit.impl.race == Race.Heretic
	and
	_GroupInfo_UnitModifierAmount(mods, DemonLord) == 0 then
		BonusDMG = BonusDMG + 15
	end	
-- Повелитель демонов END

--Элитная стража
	if _GroupInfo_stackHasModifierAmount(Yarl) > 0  
	and
	unit.impl.race == Race.Dwarf
	and
	_GroupInfo_UnitModifierAmount(mods, Yarl) == 0 then
		BonusDMG = BonusDMG + 10
	end	
--Элитная стража END

-- --Фанатизм I
-- 	if _GroupInfo_UnitHasModifierValue(unit, Inquisitor10DamageSameRowDead) then
-- 		local coveredUnit = _GroupInfo_getCoveredUnitCorpse(unit, true)
-- 		if coveredUnit ~= nil then
-- 			BonusDMG = BonusDMG + 10
-- 		end
-- 	end
-- --Фанатизм I END

-- --Фанатизм II
-- 	if _GroupInfo_UnitHasModifierValue(unit, GrandInquisitor20DamageSameRowDead) then
-- 		local coveredUnit = _GroupInfo_getCoveredUnitCorpse(unit, true)
-- 		if coveredUnit ~= nil then
-- 			BonusDMG = BonusDMG + 20
-- 		end
-- 	end
-- --Фанатизм II END

--Рефаим увеличивает на 5% + 5% за оверлевел урон воздухом в отряде, но не более 20%
	if _GroupInfo_stackHasModifierAmount(RefaimInParty) > 0 and unit.impl.attack1.source == Source.Air then
		local group = _GroupInfo_getCurrentGroup()
		local units = group.units
		local u
		local RefaimOverlevel
		local CountRefaim = _GroupInfo_stackHasModifierAmount(RefaimInParty)
		for i = 1, #units do
			u = units[i]
			if _GroupInfo_UnitHasModifierValue(u, RefaimInParty) then
				RefaimOverlevel = u.impl.level - u.baseImpl.level
			end
		end
		BonusDMG = BonusDMG + 4 + (4 * RefaimOverlevel) * CountRefaim
		if BonusDMG >= 20 then
			BonusDMG = 20
		end
	end
--END

	return BonusDMG
end

-- changes initiative
-- prev - numeric value of initiative
function _smns_flatInitiativeBonus(unit, prev)
	local result = 0

	--Авангард
	local HorsemanAmount = _GroupInfo_stackHasModifierAmount(Horseman)
	if HorsemanAmount > 0 and _GroupInfo_UnitHasModifierValue(unit, Avangard) then
		result = result + 5 * HorsemanAmount
	end

	local AvangardAmount = _GroupInfo_stackHasModifierAmount(Avangard)
	if _GroupInfo_UnitHasModifierValue(unit, Horseman) and AvangardAmount > 0 then
		result = result - 5 * AvangardAmount
	end
	--Авангард END

--Тварь +5 ини за труп
	if _GroupInfo_UnitHasModifierValue(unit, Spawn10RegenPerCorpse) then
		result = smnsConditions_getCorpseBonus(unit, 4)
	end
	--END

	--Тиамат +15 регена за труп
	if _GroupInfo_UnitHasModifierValue(unit, Timamat15regenPerCorpse) then
		result = smnsConditions_getCorpseBonus(unit, 7)
	end
--END

--Пророчество
--flat initiative
local deadProphetessAmount = _GroupInfo_stackHasModifierAmount_Dead(prophetess)
if deadProphetessAmount > 0 then
    local group = _GroupInfo_getCurrentGroup()
    local units = group.units
    local u
    local currentValue = 0
    for i = 1, #units do
        u = units[i]
        if _GroupInfo_UnitHasModifierValue(u, prophetess) and u.hp == 0 then
            currentValue = currentValue + 5 + 1 * (u.impl.level - u.baseImpl.level)
        end
    end

    result = result + currentValue
end
--Пророчество end

-- Боевой дух
	if _GroupInfo_stackHasModifierAmount(BattleSpirit) > 0 then
		local group = _GroupInfo_getCurrentGroup()
		local slots = group.slots
		local s
		local u
		local n = 0
		local FSlots = {}
		for i = 1, #slots do
			s = slots[i]
			u = s.unit
			if u ~= nil then
				n = n + 1
				FSlots[n] = slots[i]
			end
		end
		local FrontLine = _common_GetFrontline(FSlots)
		for i = 1, #slots do
			s = slots[i]
			u = s.unit
			if u ~= nil and u.id.value == unit.id.value then
				if s.line == FrontLine then
					result = result + 5
				end
				break
			end
		end
	end
-- -- Боевой дух END

--Жидкий камень
-- +5 ini to gargs
if _GroupInfo_UnitHasModifierValue(unit, AnyGorgule) and (_GroupInfo_stackHasModifierAmount(incub) + _GroupInfo_stackHasModifierAmount(yakshini)) > 0 then
    result = result + 5
end
--Жидкий камень END
	
--Кровавое братство	
    if _GroupInfo_UnitHasModifierValue(unit, Vampires5IniIfNosferatu) and _GroupInfo_stackHasModifierAmount(NosferatuInParty) > 0 then
        result = result + 5
    end
-- Кровавое братство END

	--древняя тьма
	if _GroupInfo_UnitHasModifierValue(unit, ElderVampire) then
		local maxHP = getScenario():getUnit(unit.id).hpMax
		if unit.hp / maxHP < 0.5 then
			result = result + 10
		end
	end
	--древняя тьма END

	return result
end
-- changes initiative
-- prev - numeric value of initiative
function _smns_percentInitiativeBonus(unit, prev)
	local mods = _GroupInfo_UnitModifiers(unit)
	local BonusIni = 0
	
--В тени Иггдрасиля II (Эйра 20% ХП если гигант в отряде)
    if _GroupInfo_UnitHasModifierValue(unit, Eyra40HPIfGiant) then
        BonusIni = BonusIni - smnsConditions_getBonusIfGiant(unit, 25)
    end
--В тени Иггдрасиля II END
	
--Волчья стая
	local CountWolf = _GroupInfo_stackHasModifierAmount(Wolf) - 1
	if CountWolf > 0  
	and
	_GroupInfo_UnitHasModifierValue(unit, Wolf)  then
		BonusIni = BonusIni + 5 * CountWolf
	end
--Волчья стая END

--Аура ловкости
	if _GroupInfo_stackHasModifierAmount(AuraIni) > 0 then
		BonusIni = BonusIni + 7
	end
--Аура ловкости END
	return BonusIni
end

-- change immunity to attack class
-- attack - attack class
-- prev - previous value
function _smns_ImmuneToAttack(unit, attack, prev, currentValue)
	local result = currentValue
-- Боевой дух

	if attack == Attack.Fear and _GroupInfo_stackHasModifierAmount(BattleSpirit) > 0 then
		local group = _GroupInfo_getCurrentGroup()
		local slots = group.slots
		local s
		local u
		local n = 0
		local FSlots = {}
		for i = 1, #slots do
			s = slots[i]
			u = s.unit
			if u ~= nil then
				n = n + 1
				FSlots[n] = slots[i]
			end
		end
		local FrontLine = _common_GetFrontline(FSlots)
		for i = 1, #slots do
			s = slots[i]
			u = s.unit
			if u ~= nil and u.id.value == unit.id.value then
				if s.line == FrontLine then
					result = Immune.Always
				end
				break
			end
		end
	end
-- Боевой дух END

--Святой наставник I
	if _GroupInfo_stackHasModifierAmount(HolyMentorI) > 0 and (attack == Attack.Paralyze or attack == Attack.Petrify or attack == Attack.LowerDamage or attack == Attack.LowerInitiative or attack == Attack.TransformOther) and currentValue ~= Immune.Always then
		local same_col = _GroupInfo_getSameColumnUnit(unit, true)
		if same_col ~= nil then
			if _GroupInfo_UnitHasModifierValue(same_col, HolyMentorI) then
				result = Immune.Once
			end
		end
	end
--Святой наставник I END

--Святой наставник II
	if _GroupInfo_stackHasModifierAmount(HolyMentorII) > 0 and (attack == Attack.Paralyze or attack == Attack.Petrify or attack == Attack.LowerDamage or attack == Attack.LowerInitiative or attack == Attack.TransformOther) and currentValue ~= Immune.Always then
		local same_col = _GroupInfo_getSameColumnUnit(unit, true)
		local left_right = _GroupInfo_getLeftAndRightNearestUnits(unit, true)
		if same_col ~= nil then
			table.insert(left_right, same_col)
		end
		for i = 1, #left_right do
			if _GroupInfo_UnitHasModifierValue(left_right[i], HolyMentorII) then
				result = Immune.Once
				break
			end
		end
	end
--Святой наставник II END

--Колдунья/Суккуб дают защиту от проклятий юниту слева и справа
	if _GroupInfo_stackHasModifierAmount(SorcSuccubCrossREsist) > 0 and (attack == Attack.Paralyze or attack == Attack.Petrify or attack == Attack.LowerDamage or attack == Attack.LowerInitiative or attack == Attack.TransformOther ) and currentValue ~= Immune.Always then
		local left_right = _GroupInfo_getLeftAndRightNearestUnits(unit, true)
		for i = 1, #left_right do
		local u = left_right[i]
			if _GroupInfo_UnitHasModifierValue(u, SorcSuccubCrossREsist) then
				result = Immune.Once
				break
			end
		end
	end
--END

--Прочные доспехи
	if _GroupInfo_stackHasModifierAmount(ShatterResist) > 0 and attack == Attack.Shatter and currentValue ~= Immune.Always then
		result = Immune.Once
	end
--Прочные доспехи END

--Бореалис с Рефаимом защита от ослабления
	if _GroupInfo_UnitHasModifierValue(unit, Borealis) and _GroupInfo_stackHasModifierAmount(RefaimInParty) > 0 and currentValue ~= Immune.Always then
		if attack == Attack.LowerDamage then
			result = Immune.Always
		end
	end
--END

--Ментальный блок I

	if _GroupInfo_stackHasModifierAmount(TormentorSameColResist) > 0 and attack == Attack.Paralyze and currentValue < Immune.Once then
		local same_col = _GroupInfo_getSameColumnUnit(unit, true)
		if same_col ~= nil then
			if _GroupInfo_UnitHasModifierValue(same_col, TormentorSameColResist) then
				result = Immune.Once
			end
		end
	end
--Ментальный блок I END

--Ментальный блок II
	if _GroupInfo_stackHasModifierAmount(TorturerCrossResist) > 0 and attack == Attack.Paralyze and currentValue < Immune.Once then
		local same_col = _GroupInfo_getSameColumnUnit(unit, true)
		local left_right = _GroupInfo_getLeftAndRightNearestUnits(unit, true)
		if same_col ~= nil then
			table.insert(left_right, same_col)	
		end
		for i = 1, #left_right do
			if _GroupInfo_UnitHasModifierValue(left_right[i], TorturerCrossResist) then
				result = Immune.Once
				break
			end
		end
	end
--Ментальный блок II END

	--аура стабильности
	if _GroupInfo_stackHasModifierAmount(StabilityAura) > 0 and attack == Attack.DrainLevel and currentValue ~= Immune.Always then
		result = Immune.Once
	end
	--аура стабильности END

	--дыхание распада
	-- if attack == Attack.Poison and smnsConditions_isStackNearToEnemyStackWithUnitModifier(unit, 1, smns_scenario, Wyrm) then
	-- 	if currentValue == Immune.Always then
	-- 		result = Immune.Once
	-- 	elseif currentValue == Immune.Once then
	-- 		result = Immune.NotImmune
	-- 	end
	-- end

	if attack == Attack.Poison and _Wyrm_Deboost_Effect(unit) == 1 then
		if currentValue == Immune.Always then
			result = Immune.Once
		elseif currentValue == Immune.Once then
			result = Immune.NotImmune
		end
	end
	--дыхание распада END

	--страж столицы снимает резист к разрушению
	if smns_scenario.day >= 10 then	
		if attack == Attack.Shatter and _Guard_Resistance_Deboost_Effect(unit) == 1 then
			if currentValue == Immune.Always then
				result = Immune.Once
			elseif currentValue == Immune.Once then
				result = Immune.NotImmune
			end
		end
	end
	--страж столицы снимает резист к разрушению END

	return result
end

-- change immunity to attack source
-- attack - attack source
-- prev - previous value
function _smns_ImmuneToSource(unit, source, prev, currentValue)
	local MagicProtectChance = 0 + _Rod_Placer_Effect(unit)
	local result = currentValue
	_get_Group_and_Mods(unit)
	
--Знамена
	if _GroupInfo_stackHasModifierAmount(FireBanner) > 0 and source == Source.Fire and currentValue ~= Immune.Always then
		result = Immune.Once
	end
	
	if _GroupInfo_stackHasModifierAmount(DeathBanner) > 0 and source == Source.Death and currentValue ~= Immune.Always then
		result = Immune.Once
	end
	
	if _GroupInfo_stackHasModifierAmount(AirBanner) > 0 and source == Source.Air and currentValue ~= Immune.Always then
		result = Immune.Once
	end
	
	if _GroupInfo_stackHasModifierAmount(EarthBanner) > 0 and source == Source.Earth and currentValue ~= Immune.Always then
		result = Immune.Once
	end
	
	if _GroupInfo_stackHasModifierAmount(WaterBanner) > 0 and source == Source.Water and currentValue ~= Immune.Always then
		result = Immune.Once
	end
	
	if _GroupInfo_stackHasModifierAmount(MindBanner) > 0 and source == Source.Mind and currentValue ~= Immune.Always then
		result = Immune.Once
	end
	
	if _GroupInfo_stackHasModifierAmount(WeaponBanner) > 0 and source == Source.Weapon and currentValue ~= Immune.Always then
		result = Immune.Once
	end

--Знамена END
--Игнар даёт защиту от огня в той же колонне
    if _GroupInfo_stackHasModifierAmount(IgnarInParty) > 0 and source == Source.Fire and currentValue ~= Immune.Always then
        local same_col = _GroupInfo_getSameColumnUnit(unit, true)
        if same_col ~= nil then
            if _GroupInfo_UnitHasModifierValue(same_col, IgnarInParty) then
                result = Immune.Once
            end
        end
    end
--END

	--дыхание распада
	-- if source == Source.Death and smnsConditions_isStackNearToEnemyStackWithUnitModifier(unit, 1, smns_scenario, Wyrm) then
	-- 	if currentValue == Immune.Always then
	-- 		result = Immune.Once
	-- 	elseif currentValue == Immune.Once then
	-- 		result = Immune.NotImmune
	-- 	end
	-- end

	if source == Source.Death and _Wyrm_Deboost_Effect(unit) == 1 then
		if currentValue == Immune.Always then
			result = Immune.Once
		elseif currentValue == Immune.Once then
			result = Immune.NotImmune
		end
	end
	--дыхание распада END

--Благословление вечных
	if _GroupInfo_stackHasModifierAmount(BlessOfEternal) > 0 and source == Source.Death and currentValue ~= Immune.Always then
		result = Immune.Once
	end
--Благословление вечных END

-- Резисты от магии
	if source == 8 then
		local mods = _GroupInfo_UnitModifiers(unit)
	
		if unitGroup ~= nil then		
			local u
			local unitGroupSlots = unitGroup.slots
		
			--hero shield
			for i = 1, #unitGroupSlots do
				u = unitGroupSlots[i].unit
				if u ~= nil and u.hp > 0 and _GroupInfo_UnitHasModifierValue(u, HeroShield) then
					MagicProtectChance = MagicProtectChance + 5 + 5 * (u.impl.level - u.baseImpl.level)
					break
				end
			end
			--end hero shield
			
			--Слезы грешников
				for i = 1, #unitGroupSlots do
				u = unitGroupSlots[i].unit
				if u ~= nil and u.hp > 0 and _GroupInfo_UnitHasModifierValue(u, TearsOfSinners) then
					MagicProtectChance = MagicProtectChance + 20
					break
				end
			end
			--Слезы грешников END
			
			--protector I
			for i = 1, #unitGroupSlots do
				u = unitGroupSlots[i].unit
				if u ~= nil and u.hp > 0 and _GroupInfo_UnitHasModifierValue(u, ProtectorI) then
					MagicProtectChance = MagicProtectChance + 10
					break
				end
			end
			--end protector I
		
			--protector II
			for i = 1, #unitGroupSlots do
				u = unitGroupSlots[i].unit
				if u ~= nil and u.hp > 0 and _GroupInfo_UnitHasModifierValue(u, ProtectorII) then
					MagicProtectChance = MagicProtectChance + 20 + 3 * (u.impl.level - u.baseImpl.level)
					break
				end
			end
			--end protector II
		
			--protector III
			for i = 1, #unitGroupSlots do
				u = unitGroupSlots[i].unit
				if u ~= nil and u.hp > 0 and _GroupInfo_UnitHasModifierValue(u, ProtectorIII) then
					MagicProtectChance = MagicProtectChance + 30 + 3 * (u.impl.level - u.baseImpl.level)
					break
				end
			end
			--end protector III
		
			--magic resistance
			for i = 1, #unitGroupSlots do
				u = unitGroupSlots[i].unit
				if u ~= nil and u.hp > 0 and _GroupInfo_UnitHasModifierValue(u, SupUnitProtector) then
					MagicProtectChance = MagicProtectChance + 10 + 2 * (u.impl.level - u.baseImpl.level)
					break
				end
			end
			--end magic resistance
			--arcane aura
			for i = 1, #unitGroupSlots do
				u = unitGroupSlots[i].unit
					if u ~= nil and u.hp > 0 and smnsConditions_isRodNearToStack(u, 1, smns_scenario) then
					MagicProtectChance = MagicProtectChance + 15
					break
					end
			end
			--end arcane aura

			--deep power
			for i = 1, #unitGroupSlots do
				u = unitGroupSlots[i].unit
				if u ~= nil and u.hp > 0 and _GroupInfo_UnitHasModifierValue(u, DeepPower) then
					MagicProtectChance = MagicProtectChance + 10
					break
				end
			end
			--end deep power

			--бонус Лорда-воина
			local player = _GroupInfo_getUnitPlayer(unit)
			if player ~= nil and player.lord == Lord.Warrior and player.race ~= Race.Neutral then
				if smnsConditions_isStackOnItsTerrain(smns_scenario, _GroupInfo_getUnitStack(unit)) then
					MagicProtectChance = MagicProtectChance + 10
				end
			end
			--end бонус Лорда-воина

			--Покровительство
			-- if smnsConditions_isStackNearToStackWithUnitModifier(unit, 2, smns_scenario, Heaven) then
			-- 	MagicProtectChance = MagicProtectChance + 10
			-- end  
			--Покровительство END
		end
		
		if _mRnd_simpleRndEvent(MagicProtectChance) then
			result = Immune.Always
		end
	end	
-- Резисты от магии END

--Прародитель с дриадой защита от воздуха отряду
    if _GroupInfo_stackHasModifierAmount(DryadLeader) > 0 and _GroupInfo_stackHasModifierAmount(Praroditel) > 0 and source == Source.Air and currentValue ~= Immune.Always then
        result = Immune.Once
    end
--Прародитель END

--Демиург защита от стихий в том же ряду
	if _GroupInfo_stackHasModifierAmount(DemiurgSourcesResistRow) > 0 and (source == Source.Fire or source == Source.Air or source == Source.Water or source == Source.Earth) and currentValue ~= Immune.Always then
		local left_right = _GroupInfo_getLeftAndRightNearestUnits(unit, true)
		for i = 1, #left_right do
		local u = left_right[i]
			if _GroupInfo_UnitHasModifierValue(u, DemiurgSourcesResistRow) then
				result = Immune.Once
				break
			end
		end
	end
--END

--Щит стихий
	local p = _GroupInfo_getUnitPlayer(unit)
	if p ~= nil and p.race ~= Race.Neutral then
		local RM = p.bank.runicMana > 300
		local IM = p.bank.infernalMana > 300
		local LM = p.bank.lifeMana > 300
		local EM = p.bank.groveMana > 300


		if ((source == Source.Fire and IM) or (source == Source.Water and RM) or (source == Source.Earth and EM) or (source == Source.Air and LM)) 
		and
		currentValue ~= Immune.Always then
			if _GroupInfo_stackHasModifierAmount(ElementalShield) > 0 then
				local ProtectorUnit = _GroupInfo_getCoveringUnit(unit, true) 
				if ProtectorUnit ~= nil then
					local ProtectorMod = _GroupInfo_UnitModifiers(ProtectorUnit)
					if _GroupInfo_UnitModifierAmount(ProtectorMod, ElementalShield) > 0 then
						result = Immune.Once 
					end
				end
			end
		end
	end
	
--Щит стихий END
	return result
end

-- change leader ability
-- attack - attack class
-- prev - previous value
function _smns_hasAbility(unit, ability, prev, currentValue)
	local result = currentValue
	
--Знание талисманов
	local g070um0084 = Id.new('g070um0084').value
	if ability == Ability.TalismanUse then
		if _GroupInfo_stackHasModifier(g070um0084) then
			result = true
		end
	end
--Знание талисманов end

--Мудрость
	local g070um0085 = Id.new('g070um0085').value
	if ability == Ability.WandScrollUse then
		if _GroupInfo_stackHasModifier(g070um0085) then
			result = true
		end
	end
	if ability == Ability.TalismanUse then
		if _GroupInfo_stackHasModifier(g070um0085) then
			result = true
		end
	end
--Мудрость end

-- Знаменосец			
	local g070um0021 = Id.new('g070um0021').value																																																						
	if ability == Ability.BannerUse then
		if _GroupInfo_stackHasModifier(g070um0021) then
			result = true
		end
	end
	
-- Знаменосец END

-- Установка жезлов			
	if ability == Ability.Rod then
		if _GroupInfo_stackHasModifier(RodPlacing) then
			result = true
		end
	end
-- Установка жезлов END

-- Знание реликвий
	if ability == Ability.JewelryUse then
		if _GroupInfo_stackHasModifier(JewelryUse) then
			result = true
		end
	end
--Знание реликвий END


-- Знания древних
	local g070um0047 = Id.new('g070um0047').value
	if ability == Ability.OrbUse then
		if _GroupInfo_stackHasModifier(g070um0047) then
			result = true
		end
	end
-- Знания древних END
	return result
	end

-- changes movepoints
-- prev - numeric value of movepoints
function _smns_flatMovementBonus(unit, prev, currentValue)
	local Bonus = 0
-- Наездник
	if _GroupInfo_stackHasModifierAmount(MoveBuffer) > 0 then
		Bonus = Bonus + 4 
	end
-- Наездник END

--Прародитель с героем кентавром дает +4 мува
    if _GroupInfo_UnitHasModifierValue(unit, CentaurLeader) and _GroupInfo_stackHasModifierAmount(Praroditel) > 0 then
        Bonus = Bonus + 4
    end
--Прародитель END

--Благородный эльф +3 мува и +1 мув за 2 оверлевела

	if unitGroup ~= nil then
		if _GroupInfo_stackHasModifierAmount(ForestElfMovepoints) > 0 then
			local u
			local mAmount = {}
			local unitGroupSlots = unitGroup.slots
			for i = 1, #unitGroupSlots do
				u = unitGroupSlots[i].unit
				if u ~= nil and u.hp > 0 and _GroupInfo_UnitHasModifierValue(u, ForestElfMovepoints) then
					table.insert(mAmount, u)
				end
			end
			local highest = mAmount[1]
			for i = 1, #mAmount do
				if mAmount[i].impl.level > highest.impl.level then
					highest = mAmount[i]
				end
			end
			local scale = math.floor((highest.impl.level - highest.baseImpl.level) / 2)
			Bonus = Bonus + 3 + scale
		end
	end

--Благородный эльф END


	return Bonus
end
	


-- changes surface movement: water, roads, forest etc.
-- ground - surface type
-- prev - previous value
function _smns_hasMovementBonus(unit, ground, prev, currentValue)

-- Знание дорог
	if ground == 0 
	and
	_GroupInfo_stackHasModifierAmount(Id.new('g070um0037').value) > 0 then
		return false
	end
-- Знание дорог END

	return currentValue
end

function _smns_getNegotiate(unit, prev, currentValue)
	local result = 0
--Бдительность
	if _GroupInfo_stackHasModifierAmount(VigilanceI) > 0 then
		countBuffs = _GroupInfo_stackHasModifierAmount(VigilanceI)
		result = result +(10 * countBuffs)
	end
--Бдительность END

--Бдительность II
	if _GroupInfo_stackHasModifierAmount(VigilanceII) > 0 then
		countBuffs = _GroupInfo_stackHasModifierAmount(VigilanceII)
		result = result +(15 * countBuffs)
	end
--Бдительность II END

--бонус Гильдмастера
	if smnsConditions_getThiefActionBonus(unit, 1, smns_scenario) then
		result = result - 5
	end
--бонус Гильдмастера END

	return result
end

function _smns_getScout(unit, prev, currentValue)
	local BonusVision = 0
--Разведчик
	if _GroupInfo_stackHasModifierAmount(Scout) > 0 then
		local countBuffs = _GroupInfo_stackHasModifierAmount(Scout)
		BonusVision = BonusVision +(1 * countBuffs)
	end
--Раззведчик END

	return BonusVision
end

function _smns_getFastRetreat(unit, prev, result)

--Мастер клинка дает быстрое отступление если мертв
	if _GroupInfo_stackHasModifierAmount_Dead(BladeMasterInParty) > 0 then
		result = true
	end
--END

	return result
end

function _smns_getExpGainBonus(currentValue, group, player, groupLeader)
	local BonusEXP = 0
	
--Ментор
    if _GroupInfo_stackHasModifierAmount(ExpMentor) > 0 then
        local u
        local mAmount = {}
        local group = _GroupInfo_getCurrentGroup()
        local unitGroupSlots = group.slots
        local mentorValue = 0
        for i = 1, #unitGroupSlots do
            u = unitGroupSlots[i].unit
            if u ~= nil and _GroupInfo_UnitHasModifierValue(u, ExpMentor) and u.hp > 0 then
                table.insert(mAmount, u)
            end
        end
        local highest = mAmount[1]
        for i = 1, #mAmount do
            if mAmount[i].impl.level > highest.impl.level then
                highest = mAmount[i]
            end
        end
        mentorValue = math.max( mentorValue, 6 + 3 * (highest.impl.level - highest.baseImpl.level) )
        BonusEXP = BonusEXP + mentorValue
    end
--Ментор END

    return BonusEXP
end
  

-- changes attack1 id
function _smns_getAttack1Id(unit, currentValue)
	-- if smnsConditions_DlanMortisResist(unit) then
	-- 	return Id.new('g070aa0155')
	-- end

    return currentValue
end

-- changes attack1 class
function _smns_getAttack1Type(unit, currentValue)
	-- if smnsConditions_DlanMortisResist(unit) then
	-- 	return Attack.BestowWards
	-- end

    return currentValue
end

-- changes attack1 base damage
function _smns_getAttack1BaseDamage(unit, currentValue)
	-- if smnsConditions_DlanMortisResist(unit) then
	-- 	return 0
	-- end

    return currentValue
end

-- changes attack11 base heal
function _smns_getAttack1BaseHeal(unit, currentValue)
	-- if smnsConditions_DlanMortisResist(unit) then
	-- 	return 0
	-- end

    return currentValue
end

-- changes attack1 base accuracy
function _smns_getAttack1BasePower(unit, currentValue)
	-- if smnsConditions_DlanMortisResist(unit) then
	-- 	return 100
	-- end

    return currentValue
end

-- changes attack2 id
function _smns_getAttack2Id(unit, currentValue)
	if smns_scenario.day >= 10 then
		if _GroupInfo_UnitHasModifierValue(unit, CapitalGuardian) then
			return Id.new('g070aa0186')
		end
	end
	
	if smnsConditions_RunekeeperWithLoremaster(unit) then
		return Id.new('g070aa0179')
	end

	if smnsConditions_RunekeeperWithEngineer(unit) then
		return Id.new('g070aa0156')
	end

	if smnsConditions_DetectiveSparePotion(unit) then
		return Id.new('g070aa0172')
	end

	if smnsConditions_EmyssarySparePotion(unit) then
		return Id.new('g070aa0173')
	end

--Коррозия I
	if smnsConditions_LichShatter(unit) then
        return Id.new('g070aa0129')
    end
--Коррозия I END

--Коррозия II
	if smnsConditions_ArchLichShatter(unit) then
        return Id.new('g070aa0130')
    end
--Коррозия II END

	if smnsConditions_StingerShatter(unit) then
		return Id.new('g070aa0127')
	end

	if smnsConditions_CryomantFrost(unit) then
		if unit.impl.level - unit.baseImpl.level + 1 == 1 then
            return Id.new('g070aa0132')
        elseif unit.impl.level - unit.baseImpl.level + 1 == 2 then
			return Id.new('g070aa0133')
		elseif unit.impl.level - unit.baseImpl.level + 1 == 3 then
			return Id.new('g070aa0134')
		elseif unit.impl.level - unit.baseImpl.level + 1 == 4 then
			return Id.new('g070aa0135')
		elseif unit.impl.level - unit.baseImpl.level + 1 == 5 then
			return Id.new('g070aa0136')
		elseif unit.impl.level - unit.baseImpl.level + 1 == 6 then
			return Id.new('g070aa0137')
		elseif unit.impl.level - unit.baseImpl.level + 1 == 7 then
			return Id.new('g070aa0138')
		elseif unit.impl.level - unit.baseImpl.level + 1 == 8 then
			return Id.new('g070aa0139')
		elseif unit.impl.level - unit.baseImpl.level + 1 == 9 then
			return Id.new('g070aa0140')
		elseif unit.impl.level - unit.baseImpl.level + 1 == 10 then
			return Id.new('g070aa0141')
		elseif unit.impl.level - unit.baseImpl.level + 1 == 11 then
			return Id.new('g070aa0142')
		elseif unit.impl.level - unit.baseImpl.level + 1 == 12 then
			return Id.new('g070aa0143')
		elseif unit.impl.level - unit.baseImpl.level + 1 == 13 then
			return Id.new('g070aa0144')
		elseif unit.impl.level - unit.baseImpl.level + 1 == 14 then
			return Id.new('g070aa0145')
		elseif unit.impl.level - unit.baseImpl.level + 1 == 15 then
			return Id.new('g070aa0146')
		elseif unit.impl.level - unit.baseImpl.level + 1 == 16 then
			return Id.new('g070aa0147')
		elseif unit.impl.level - unit.baseImpl.level + 1 == 17 then
			return Id.new('g070aa0148')
		elseif unit.impl.level - unit.baseImpl.level + 1 == 18 then
			return Id.new('g070aa0149')
		elseif unit.impl.level - unit.baseImpl.level + 1 == 19 then
			return Id.new('g070aa0150')
		elseif unit.impl.level - unit.baseImpl.level + 1 == 20 then
			return Id.new('g070aa0151')
		elseif unit.impl.level - unit.baseImpl.level + 1 == 21 then
			return Id.new('g070aa0152')
		elseif unit.impl.level - unit.baseImpl.level + 1 == 22 then
			return Id.new('g070aa0153')
		end
	end
	
    return currentValue
end

-- changes attack2 class
function _smns_getAttack2Type(unit, currentValue)
	if smns_scenario.day >= 10 then
		if _GroupInfo_UnitHasModifierValue(unit, CapitalGuardian) then
			return Attack.Shatter
		end
	end

	if smnsConditions_RunekeeperWithLoremaster(unit) then
		return Attack.LowerDamage
	end

	if smnsConditions_RunekeeperWithEngineer(unit) then
		return Attack.LowerDamage
	end

	if smnsConditions_DetectiveSparePotion(unit) then
		return Attack.LowerDamage
	end

	if smnsConditions_EmyssarySparePotion(unit) then
		return Attack.LowerDamage
	end

--Коррозия I
    if smnsConditions_LichShatter(unit) then
        return Attack.Shatter
    end
--Коррозия I END
    
--Коррозия II
    if smnsConditions_ArchLichShatter(unit) then
        return Attack.Shatter
    end
--Коррозия II END

	if smnsConditions_StingerShatter(unit) then
		return Attack.Shatter
	end

	if smnsConditions_CryomantFrost(unit) then
		return Attack.Frostbite
	end

    return currentValue
end

-- changes attack2 base damage
function _smns_getAttack2BaseDamage(unit, currentValue)
	if smns_scenario.day >= 10 then
		if _GroupInfo_UnitHasModifierValue(unit, CapitalGuardian) then
			return 10
		end
	end
--Коррозия I
    if smnsConditions_LichShatter(unit) then
        return 7
    end
    --Коррозия I END
    
    --Коррозия II
    if smnsConditions_ArchLichShatter(unit) then
        return 10
    end
    --Коррозия II END

	if smnsConditions_StingerShatter(unit) then
        return 10
    end

    return currentValue
end

-- changes attack2 base heal
function _smns_getAttack2BaseHeal(unit, currentValue)
	
    return currentValue
end

-- changes attack2 base accuracy
function _smns_getAttack2BasePower(unit, currentValue)
	if smns_scenario.day >= 10 then
		if _GroupInfo_UnitHasModifierValue(unit, CapitalGuardian) then
			return 80
		end
	end

	if smnsConditions_RunekeeperWithLoremaster(unit) then
		return 60
	end

	if smnsConditions_RunekeeperWithEngineer(unit) then
		return 60
	end
	
	if smnsConditions_DetectiveSparePotion(unit) then
		return 55
	end

	if smnsConditions_EmyssarySparePotion(unit) then
		return 55
	end

--Коррозия I
    if smnsConditions_LichShatter(unit) then
        return 70
    end
--Коррозия I END
    
--Коррозия II
    if smnsConditions_ArchLichShatter(unit) then
        return 70
    end
--Коррозия II END

	if smnsConditions_StingerShatter(unit) then
		return 85
	end

	if smnsConditions_CryomantFrost(unit) then
		return 80
	end
	
    return currentValue
end

-- changes merchant discount
-- prev - numeric value of movepoints
function _smns_flatLowerCostBonus(unit, prev, currentValue)
	local Discount = 0
--Гномья хитрость
	if _GroupInfo_stackHasModifierAmount(SkaldDiscount) > 0 then
        local u
        local mAmount = {}
        local group = _GroupInfo_getCurrentGroup()
        local unitGroupSlots = group.slots
        for i = 1, #unitGroupSlots do
            u = unitGroupSlots[i].unit
			if u ~= nil and u.hp > 0 and _GroupInfo_UnitHasModifierValue(u, SkaldDiscount) then
				table.insert(mAmount, u)
			end
		end
		local highest = mAmount[1]
		for i = 1, #mAmount do
			if mAmount[i].impl.level > highest.impl.level then
                highest = mAmount[i]
            end
		end
		Discount = Discount + 8 + 3*(highest.impl.level - highest.baseImpl.level)
	end
--Гномья хитрость END
--Лютня
	if _GroupInfo_stackHasModifierAmount(Lutnya) > 0 then
		Discount = Discount + 25
	end
--Лютня END	
--Торговец
	if _GroupInfo_stackHasModifierAmount(Trader) > 0 then
		Discount = Discount + 25
	end
--Торговец end
--Книга странника
	if _GroupInfo_stackHasModifierAmount(Id.new('g006um0068').value) > 0 then
		Discount = Discount + 10
	end
--Книга странника END
--Лисья хитрость
	if _GroupInfo_stackHasModifierAmount(Id.new('g070um0281').value) > 0 then
		Discount = Discount + 15
	end
--Лисья хитрость END
--Искусный торговец
	if _GroupInfo_stackHasModifierAmount(Id.new('g070um0282').value) > 0 then
		Discount = Discount + 20
	end
--Искусный торговец END
--знамя наемников
	if _GroupInfo_stackHasModifierAmount(Id.new('g070um0289').value) > 0 then
		local Leader = _GroupInfo_getCurrentGroupLeader()
		if Leader ~= nil and Leader.hp > 0 then
			local lship
			if Leader.original == nil then
				lship = Leader.impl.leadership
			else
				lship = Leader.original.impl.leadership
			end
			if lship < 6 then
				Discount = Discount + 10
			end
		end
	end
--знамя наемников END

    return Discount
end

-- changes accuracy
-- prev - numeric value of attack
-- attackN = 1 or 2. 1 - primary attack, 2 - secondary attack
-- unitMods - list of modifiers
function _smns_multiplicativePower(unit, prev, attackN, unitMods)
	local mods = _GroupInfo_UnitModifiers(unit)
	local BonusPower = 0 + _Spawn_Tiamat_Deboost_Effect(unit) + _Storm_Deboost_Effect(unit)

	--Аура сфокусированности
		if _GroupInfo_stackHasModifierAmount(AuraAccuracity) > 0 then
			BonusPower = BonusPower + 8
	end
	--Аура сфокусированности END
	
	--Страх Бездны I
	-- if smnsConditions_isStackNearToEnemyStackWithUnitModifier(unit, 1, smns_scenario, AbyssalFearI) then
	-- 	BonusPower = BonusPower - 10
	-- end
	--Страх Бездны I END

	--Страх Бездны II
	-- if smnsConditions_isStackNearToEnemyStackWithUnitModifier(unit, 1, smns_scenario, AbyssalFearII) then
	-- 	BonusPower = BonusPower - 15
	-- end
	--Страх Бездны II END

	--Вечная буря
	-- if smnsConditions_isStackNearToEnemyStackWithUnitModifier(unit, 1, smns_scenario, EndlessStorm) then
	-- 	BonusPower = BonusPower - 10
	-- end
	--Вечная буря END

	--Ардет если не прикрыт наносит на 15% урона больше
    coveringUnit = _GroupInfo_getCoveringUnit(unit, nil)
    if _GroupInfo_UnitHasModifierValue(unit, ArdetIfNotCovered) and (coveringUnit ~= nil and coveringUnit.hp > 0 and _GroupInfo_UnitHasModifierValue(coveringUnit, Reconnaissance)) then
        BonusPower = BonusPower + 15
    end
	--END

	--Игнар если не прикрыт наносит на 30% урона больше
    coveringUnit = _GroupInfo_getCoveringUnit(unit, nil)
    if _GroupInfo_UnitHasModifierValue(unit, IgnarIfNotCovered) and (coveringUnit ~= nil and coveringUnit.hp > 0 and _GroupInfo_UnitHasModifierValue(coveringUnit, Reconnaissance)) then
        BonusPower = BonusPower + 15
    end
	--END
    return BonusPower
end

-- changes accuracy
-- prev - numeric value of attack
-- attackN = 1 or 2. 1 - primary attack, 2 - secondary attack
-- unitMods - list of modifiers
function _smns_flatPower(unit, prev, attackN, unitMods)
	
    return 0
end

-- changes hit points
-- prev - numeric value of hit points
function _smns_flatHitPointBonus(unit, prev)
	local mods = _GroupInfo_UnitModifiers(unit)
	local BonusFlatHP = 0

	return BonusFlatHP
end

-- changes damage and heal
-- prev - numeric value of attack
-- attackN = 1 or 2. 1 - primary attack, 2 - secondary attack
-- unitMods - list of modifiers
function _smns_flatDamageHealBonus(unit, prev, attackN, unitMods)
	local mods = _GroupInfo_UnitModifiers(unit)
	local BonusFlatDamage = 0

	return BonusFlatDamage
end

-- changes critical damage
function _smns_CritDamage(unit)
	local mods = _GroupInfo_UnitModifiers(unit)
	local BonusCritDamage = 0

	if smns_scenario.day >= 15 then
		BonusCritDamage = BonusCritDamage - (0.01 * _Guard_CritDrain_Deboost_Effect(unit)) * (0.01 * unit.impl.attack1.critDamage) * unit.impl.attack1.damage
	end

	
return BonusCritDamage
end
-- changes critical damage chance
function _smns_CritPower(unit)
	local mods = _GroupInfo_UnitModifiers(unit)
	local BonusCritPower = 0

	return BonusCritPower
end

-- changes critical drain
function _smns_flatAttackDrain(unit, damage, prev)
	local mods = _GroupInfo_UnitModifiers(unit)
	local BonusFlatDrain = 0

	return BonusFlatDrain
end

-- changes critical drain
function _smns_multiplicativeAttackDrain(unit, damage, prev)
	local mods = _GroupInfo_UnitModifiers(unit)
	local BonusMultiplyDrain = 0

	if smns_scenario.day >= 20 then
		BonusMultiplyDrain = BonusMultiplyDrain - _Guard_CritDrain_Deboost_Effect(unit)
	end

	return BonusMultiplyDrain
end


