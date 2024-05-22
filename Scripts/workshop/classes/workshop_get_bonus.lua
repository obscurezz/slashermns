-- Â ÝÒÎÌ ÔÀÉËÅ ÍÈ×ÅÃÎ ÒÐÎÃÀÒÜ ÍÅ ÍÓÆÍÎ
-- ñìîòðè â workshop_commonlib.lua

require('workshop_commonlib')
require('workshop_enums')
require('GroupInfo')

function Workshop_Info(unit, gotGroup)
	local group
	if gotGroup then
		group = _GroupInfo_getCurrentGroup()
	else
		group = _GroupInfo_getUnitGroup(unit)
	end
	if group == nil then
		return nil, nil, nil, nil, nil
	end
	local player = _GroupInfo_getLastFoundGroupPlayer()
	local race
	if player ~= nil then
		race = player.race
	else
		race = Race.Neutral
	end
	local settings = Workshop_GetPlayer(race)
	local owner, ownerType = _GroupInfo_getUnitOwner_Fast(unit)
	return group, owner, ownerType, player, settings
end
function Workshop_GetPositionTerrainRace(scen, tileTerrainRace, owner, ownerType, player)
	if tileTerrainRace ~= nil then
		return tileTerrainRace
	end
	if ownerType == 1 then
		local pos = owner.position
		local terrain = scen:getTile(pos.x, pos.y).terrain
		return _terrainToPlayerRace[terrain]
	elseif ownerType == 2 then
		return player.race
	else
		return Race.Neutral
	end
end
function Workshop_GetDiversityInfo(group, divTable, identical)
	if divTable == nil then
		local id
		local units = group.units
		divTable = {}
		for i=1, #units do
			id = units[i].baseImpl.id.value
			if divTable[id] == nil then
				divTable[id] = 1
			else
				divTable[id] = divTable[id] + 1
			end
		end
	end
	local result
	if identical then
		result = 0
		for k, v in pairs(divTable) do
			result = result + v - 1
		end
	else
		result = -1
		for k, v in pairs(divTable) do
			result = result + 1
		end
	end
	return result, divTable
end
local _workshop_IncreaseThreshold =  0.999
local _workshop_DecreaseThreshold = -0.999
function Workshop_changeImmuneClass(prev, workshopBonus_Once, workshopBonus_Always)
	if prev == Immune.NotImmune then
		if workshopBonus_Always > _workshop_IncreaseThreshold then
			prev = Immune.Always
		elseif workshopBonus_Once > _workshop_IncreaseThreshold then
			prev = Immune.Once
		end
	elseif prev == Immune.Once then
		if workshopBonus_Always > _workshop_IncreaseThreshold then
			prev = Immune.Always
		elseif workshopBonus_Once < _workshop_DecreaseThreshold then
			prev = Immune.NotImmune
		end
	elseif prev == Immune.Always then
		if workshopBonus_Always < _workshop_DecreaseThreshold then
			prev = Immune.Once
			if workshopBonus_Once < _workshop_DecreaseThreshold then
				prev = Immune.NotImmune
			end
		end
	end
	return prev
end
function Workshop_intToBoolean(prev, value)
	if value > _workshop_IncreaseThreshold then
		return true
	elseif value < _workshop_DecreaseThreshold then
		return false
	else
		return prev
	end
end
function Workshop_getArrayValue(resistKey, bonusTable)
	for k, v in pairs(bonusTable) do
		if k == resistKey then
			return v
		end
	end
	return 0
end
function Workshop_GetBonusSum(scen, unit,
                              leaderType,
                              group, owner, ownerType, player, settings,
                              constantStatsBonus, yourTerrainStatsBonus, opponentTerrainStatsBonus, neutralTerrainStatsBonus, perLostHPStatsBonus, perDifferentUnitStatsBonus, perIdenticalUnitStatsBonus, 
                              constantStatsBonusLeaderType, yourTerrainStatsBonusLeaderType, opponentTerrainStatsBonusLeaderType, neutralTerrainStatsBonusLeaderType, perLostHPStatsBonusLeaderType, perDifferentUnitStatsBonusLeaderType, perIdenticalUnitStatsBonusLeaderType)

	local result = constantStatsBonus + constantStatsBonusLeaderType
	local tileTerrainRace = nil
	local divTable = nil
	local v
	
	if yourTerrainStatsBonus ~= 0 or yourTerrainStatsBonusLeaderType ~= 0 then
		tileTerrainRace = Workshop_GetPositionTerrainRace(scen, tileTerrainRace, owner, ownerType, player)
		if tileTerrainRace == player.race then
			result = result + yourTerrainStatsBonus + yourTerrainStatsBonusLeaderType
		end
	end
	if opponentTerrainStatsBonus ~= 0 or opponentTerrainStatsBonusLeaderType ~= 0 then
		tileTerrainRace = Workshop_GetPositionTerrainRace(scen, tileTerrainRace, owner, ownerType, player)
		if settings:get_opponentTerrain()[tileTerrainRace] ~= nil then
			result = result + opponentTerrainStatsBonus + opponentTerrainStatsBonusLeaderType
		end
	end
	if neutralTerrainStatsBonus ~= 0 or neutralTerrainStatsBonusLeaderType ~= 0 then
		tileTerrainRace = Workshop_GetPositionTerrainRace(scen, tileTerrainRace, owner, ownerType, player)
		if settings:get_neutralTerrain()[tileTerrainRace] ~= nil then
			result = result + neutralTerrainStatsBonus + neutralTerrainStatsBonusLeaderType
		end
	end
	if perLostHPStatsBonus ~= 0 or perLostHPStatsBonusLeaderType ~= 0 then
		local maxHP = scen:getUnit(unit.id).hpMax
		result = result + ( perLostHPStatsBonus + perLostHPStatsBonusLeaderType ) * 100 * ( maxHP - math.min(maxHP, unit.hp) ) / maxHP
	end
	if perDifferentUnitStatsBonus ~= 0 or perDifferentUnitStatsBonusLeaderType ~= 0 then
		v, divTable = Workshop_GetDiversityInfo(group, divTable, false)
		result = result + v * ( perDifferentUnitStatsBonus + perDifferentUnitStatsBonusLeaderType )
	end
	if perIdenticalUnitStatsBonus ~= 0 then
		v, divTable = Workshop_GetDiversityInfo(group, divTable, true)
		result = result + v * ( perIdenticalUnitStatsBonus + perIdenticalUnitStatsBonusLeaderType )
	end
	return result
end

------------------------------------------------
------------------------------------------------
------------------------------------------------


function Workshop_getBonus_baseHitPoint_Percent(scen, unit, gotGroup)
   local group, owner, ownerType, player, settings = Workshop_Info(unit, gotGroup)

   if settings == nil then
       return 0
   end

   local LeaderType = WorkshopEnum_getGroupLeaderType(group, owner, ownerType)

   local constantStatsBonus = settings:get_constantStatsBonus():get_baseHitPoint_Percent()
   local yourTerrainStatsBonus = settings:get_yourTerrainStatsBonus():get_baseHitPoint_Percent()
   local opponentTerrainStatsBonus = settings:get_opponentTerrainStatsBonus():get_baseHitPoint_Percent()
   local neutralTerrainStatsBonus = settings:get_neutralTerrainStatsBonus():get_baseHitPoint_Percent()
   local perLostHPStatsBonus = settings:get_perLostHPStatsBonus():get_baseHitPoint_Percent()
   local perDifferentUnitStatsBonus = settings:get_perDifferentUnitStatsBonus():get_baseHitPoint_Percent()
   local perIdenticalUnitStatsBonus = settings:get_perIdenticalUnitStatsBonus():get_baseHitPoint_Percent()

   local constantStatsBonusLeaderType = 0
   local yourTerrainStatsBonusLeaderType = 0
   local opponentTerrainStatsBonusLeaderType = 0
   local neutralTerrainStatsBonusLeaderType = 0
   local perLostHPStatsBonusLeaderType = 0
   local perDifferentUnitStatsBonusLeaderType = 0
   local perIdenticalUnitStatsBonusLeaderType = 0

   if LeaderType ~= nil then
       constantStatsBonusLeaderType = settings:get_constantStatsBonus(LeaderType):get_baseHitPoint_Percent()
       yourTerrainStatsBonusLeaderType = settings:get_yourTerrainStatsBonus(LeaderType):get_baseHitPoint_Percent()
       opponentTerrainStatsBonusLeaderType = settings:get_opponentTerrainStatsBonus(LeaderType):get_baseHitPoint_Percent()
       neutralTerrainStatsBonusLeaderType = settings:get_neutralTerrainStatsBonus(LeaderType):get_baseHitPoint_Percent()
       perLostHPStatsBonusLeaderType = settings:get_perLostHPStatsBonus(LeaderType):get_baseHitPoint_Percent()
       perDifferentUnitStatsBonusLeaderType = settings:get_perDifferentUnitStatsBonus(LeaderType):get_baseHitPoint_Percent()
       perIdenticalUnitStatsBonusLeaderType = settings:get_perIdenticalUnitStatsBonus(LeaderType):get_baseHitPoint_Percent()
   end

   return Workshop_GetBonusSum(scen, unit,
                               LeaderType,
                               group, owner, ownerType, player, settings,
                               constantStatsBonus, yourTerrainStatsBonus, opponentTerrainStatsBonus, neutralTerrainStatsBonus, perLostHPStatsBonus, perDifferentUnitStatsBonus, perIdenticalUnitStatsBonus, 
                               constantStatsBonusLeaderType, yourTerrainStatsBonusLeaderType, opponentTerrainStatsBonusLeaderType, neutralTerrainStatsBonusLeaderType, perLostHPStatsBonusLeaderType, perDifferentUnitStatsBonusLeaderType, perIdenticalUnitStatsBonusLeaderType)
end

function Workshop_getBonus_baseAttack1Power_Percent(scen, unit, gotGroup)
   local group, owner, ownerType, player, settings = Workshop_Info(unit, gotGroup)

   if settings == nil then
       return 0
   end

   local LeaderType = WorkshopEnum_getGroupLeaderType(group, owner, ownerType)

   local constantStatsBonus = settings:get_constantStatsBonus():get_baseAttack1Power_Percent()
   local yourTerrainStatsBonus = settings:get_yourTerrainStatsBonus():get_baseAttack1Power_Percent()
   local opponentTerrainStatsBonus = settings:get_opponentTerrainStatsBonus():get_baseAttack1Power_Percent()
   local neutralTerrainStatsBonus = settings:get_neutralTerrainStatsBonus():get_baseAttack1Power_Percent()
   local perLostHPStatsBonus = settings:get_perLostHPStatsBonus():get_baseAttack1Power_Percent()
   local perDifferentUnitStatsBonus = settings:get_perDifferentUnitStatsBonus():get_baseAttack1Power_Percent()
   local perIdenticalUnitStatsBonus = settings:get_perIdenticalUnitStatsBonus():get_baseAttack1Power_Percent()

   local constantStatsBonusLeaderType = 0
   local yourTerrainStatsBonusLeaderType = 0
   local opponentTerrainStatsBonusLeaderType = 0
   local neutralTerrainStatsBonusLeaderType = 0
   local perLostHPStatsBonusLeaderType = 0
   local perDifferentUnitStatsBonusLeaderType = 0
   local perIdenticalUnitStatsBonusLeaderType = 0

   if LeaderType ~= nil then
       constantStatsBonusLeaderType = settings:get_constantStatsBonus(LeaderType):get_baseAttack1Power_Percent()
       yourTerrainStatsBonusLeaderType = settings:get_yourTerrainStatsBonus(LeaderType):get_baseAttack1Power_Percent()
       opponentTerrainStatsBonusLeaderType = settings:get_opponentTerrainStatsBonus(LeaderType):get_baseAttack1Power_Percent()
       neutralTerrainStatsBonusLeaderType = settings:get_neutralTerrainStatsBonus(LeaderType):get_baseAttack1Power_Percent()
       perLostHPStatsBonusLeaderType = settings:get_perLostHPStatsBonus(LeaderType):get_baseAttack1Power_Percent()
       perDifferentUnitStatsBonusLeaderType = settings:get_perDifferentUnitStatsBonus(LeaderType):get_baseAttack1Power_Percent()
       perIdenticalUnitStatsBonusLeaderType = settings:get_perIdenticalUnitStatsBonus(LeaderType):get_baseAttack1Power_Percent()
   end

   return Workshop_GetBonusSum(scen, unit,
                               LeaderType,
                               group, owner, ownerType, player, settings,
                               constantStatsBonus, yourTerrainStatsBonus, opponentTerrainStatsBonus, neutralTerrainStatsBonus, perLostHPStatsBonus, perDifferentUnitStatsBonus, perIdenticalUnitStatsBonus, 
                               constantStatsBonusLeaderType, yourTerrainStatsBonusLeaderType, opponentTerrainStatsBonusLeaderType, neutralTerrainStatsBonusLeaderType, perLostHPStatsBonusLeaderType, perDifferentUnitStatsBonusLeaderType, perIdenticalUnitStatsBonusLeaderType)
end

function Workshop_getBonus_baseAttack2Power_Percent(scen, unit, gotGroup)
   local group, owner, ownerType, player, settings = Workshop_Info(unit, gotGroup)

   if settings == nil then
       return 0
   end

   local LeaderType = WorkshopEnum_getGroupLeaderType(group, owner, ownerType)

   local constantStatsBonus = settings:get_constantStatsBonus():get_baseAttack2Power_Percent()
   local yourTerrainStatsBonus = settings:get_yourTerrainStatsBonus():get_baseAttack2Power_Percent()
   local opponentTerrainStatsBonus = settings:get_opponentTerrainStatsBonus():get_baseAttack2Power_Percent()
   local neutralTerrainStatsBonus = settings:get_neutralTerrainStatsBonus():get_baseAttack2Power_Percent()
   local perLostHPStatsBonus = settings:get_perLostHPStatsBonus():get_baseAttack2Power_Percent()
   local perDifferentUnitStatsBonus = settings:get_perDifferentUnitStatsBonus():get_baseAttack2Power_Percent()
   local perIdenticalUnitStatsBonus = settings:get_perIdenticalUnitStatsBonus():get_baseAttack2Power_Percent()

   local constantStatsBonusLeaderType = 0
   local yourTerrainStatsBonusLeaderType = 0
   local opponentTerrainStatsBonusLeaderType = 0
   local neutralTerrainStatsBonusLeaderType = 0
   local perLostHPStatsBonusLeaderType = 0
   local perDifferentUnitStatsBonusLeaderType = 0
   local perIdenticalUnitStatsBonusLeaderType = 0

   if LeaderType ~= nil then
       constantStatsBonusLeaderType = settings:get_constantStatsBonus(LeaderType):get_baseAttack2Power_Percent()
       yourTerrainStatsBonusLeaderType = settings:get_yourTerrainStatsBonus(LeaderType):get_baseAttack2Power_Percent()
       opponentTerrainStatsBonusLeaderType = settings:get_opponentTerrainStatsBonus(LeaderType):get_baseAttack2Power_Percent()
       neutralTerrainStatsBonusLeaderType = settings:get_neutralTerrainStatsBonus(LeaderType):get_baseAttack2Power_Percent()
       perLostHPStatsBonusLeaderType = settings:get_perLostHPStatsBonus(LeaderType):get_baseAttack2Power_Percent()
       perDifferentUnitStatsBonusLeaderType = settings:get_perDifferentUnitStatsBonus(LeaderType):get_baseAttack2Power_Percent()
       perIdenticalUnitStatsBonusLeaderType = settings:get_perIdenticalUnitStatsBonus(LeaderType):get_baseAttack2Power_Percent()
   end

   return Workshop_GetBonusSum(scen, unit,
                               LeaderType,
                               group, owner, ownerType, player, settings,
                               constantStatsBonus, yourTerrainStatsBonus, opponentTerrainStatsBonus, neutralTerrainStatsBonus, perLostHPStatsBonus, perDifferentUnitStatsBonus, perIdenticalUnitStatsBonus, 
                               constantStatsBonusLeaderType, yourTerrainStatsBonusLeaderType, opponentTerrainStatsBonusLeaderType, neutralTerrainStatsBonusLeaderType, perLostHPStatsBonusLeaderType, perDifferentUnitStatsBonusLeaderType, perIdenticalUnitStatsBonusLeaderType)
end

function Workshop_getBonus_baseAttack1Damage_Percent(scen, unit, gotGroup)
   local group, owner, ownerType, player, settings = Workshop_Info(unit, gotGroup)

   if settings == nil then
       return 0
   end

   local LeaderType = WorkshopEnum_getGroupLeaderType(group, owner, ownerType)

   local constantStatsBonus = settings:get_constantStatsBonus():get_baseAttack1Damage_Percent()
   local yourTerrainStatsBonus = settings:get_yourTerrainStatsBonus():get_baseAttack1Damage_Percent()
   local opponentTerrainStatsBonus = settings:get_opponentTerrainStatsBonus():get_baseAttack1Damage_Percent()
   local neutralTerrainStatsBonus = settings:get_neutralTerrainStatsBonus():get_baseAttack1Damage_Percent()
   local perLostHPStatsBonus = settings:get_perLostHPStatsBonus():get_baseAttack1Damage_Percent()
   local perDifferentUnitStatsBonus = settings:get_perDifferentUnitStatsBonus():get_baseAttack1Damage_Percent()
   local perIdenticalUnitStatsBonus = settings:get_perIdenticalUnitStatsBonus():get_baseAttack1Damage_Percent()

   local constantStatsBonusLeaderType = 0
   local yourTerrainStatsBonusLeaderType = 0
   local opponentTerrainStatsBonusLeaderType = 0
   local neutralTerrainStatsBonusLeaderType = 0
   local perLostHPStatsBonusLeaderType = 0
   local perDifferentUnitStatsBonusLeaderType = 0
   local perIdenticalUnitStatsBonusLeaderType = 0

   if LeaderType ~= nil then
       constantStatsBonusLeaderType = settings:get_constantStatsBonus(LeaderType):get_baseAttack1Damage_Percent()
       yourTerrainStatsBonusLeaderType = settings:get_yourTerrainStatsBonus(LeaderType):get_baseAttack1Damage_Percent()
       opponentTerrainStatsBonusLeaderType = settings:get_opponentTerrainStatsBonus(LeaderType):get_baseAttack1Damage_Percent()
       neutralTerrainStatsBonusLeaderType = settings:get_neutralTerrainStatsBonus(LeaderType):get_baseAttack1Damage_Percent()
       perLostHPStatsBonusLeaderType = settings:get_perLostHPStatsBonus(LeaderType):get_baseAttack1Damage_Percent()
       perDifferentUnitStatsBonusLeaderType = settings:get_perDifferentUnitStatsBonus(LeaderType):get_baseAttack1Damage_Percent()
       perIdenticalUnitStatsBonusLeaderType = settings:get_perIdenticalUnitStatsBonus(LeaderType):get_baseAttack1Damage_Percent()
   end

   return Workshop_GetBonusSum(scen, unit,
                               LeaderType,
                               group, owner, ownerType, player, settings,
                               constantStatsBonus, yourTerrainStatsBonus, opponentTerrainStatsBonus, neutralTerrainStatsBonus, perLostHPStatsBonus, perDifferentUnitStatsBonus, perIdenticalUnitStatsBonus, 
                               constantStatsBonusLeaderType, yourTerrainStatsBonusLeaderType, opponentTerrainStatsBonusLeaderType, neutralTerrainStatsBonusLeaderType, perLostHPStatsBonusLeaderType, perDifferentUnitStatsBonusLeaderType, perIdenticalUnitStatsBonusLeaderType)
end

function Workshop_getBonus_baseAttack2Damage_Percent(scen, unit, gotGroup)
   local group, owner, ownerType, player, settings = Workshop_Info(unit, gotGroup)

   if settings == nil then
       return 0
   end

   local LeaderType = WorkshopEnum_getGroupLeaderType(group, owner, ownerType)

   local constantStatsBonus = settings:get_constantStatsBonus():get_baseAttack2Damage_Percent()
   local yourTerrainStatsBonus = settings:get_yourTerrainStatsBonus():get_baseAttack2Damage_Percent()
   local opponentTerrainStatsBonus = settings:get_opponentTerrainStatsBonus():get_baseAttack2Damage_Percent()
   local neutralTerrainStatsBonus = settings:get_neutralTerrainStatsBonus():get_baseAttack2Damage_Percent()
   local perLostHPStatsBonus = settings:get_perLostHPStatsBonus():get_baseAttack2Damage_Percent()
   local perDifferentUnitStatsBonus = settings:get_perDifferentUnitStatsBonus():get_baseAttack2Damage_Percent()
   local perIdenticalUnitStatsBonus = settings:get_perIdenticalUnitStatsBonus():get_baseAttack2Damage_Percent()

   local constantStatsBonusLeaderType = 0
   local yourTerrainStatsBonusLeaderType = 0
   local opponentTerrainStatsBonusLeaderType = 0
   local neutralTerrainStatsBonusLeaderType = 0
   local perLostHPStatsBonusLeaderType = 0
   local perDifferentUnitStatsBonusLeaderType = 0
   local perIdenticalUnitStatsBonusLeaderType = 0

   if LeaderType ~= nil then
       constantStatsBonusLeaderType = settings:get_constantStatsBonus(LeaderType):get_baseAttack2Damage_Percent()
       yourTerrainStatsBonusLeaderType = settings:get_yourTerrainStatsBonus(LeaderType):get_baseAttack2Damage_Percent()
       opponentTerrainStatsBonusLeaderType = settings:get_opponentTerrainStatsBonus(LeaderType):get_baseAttack2Damage_Percent()
       neutralTerrainStatsBonusLeaderType = settings:get_neutralTerrainStatsBonus(LeaderType):get_baseAttack2Damage_Percent()
       perLostHPStatsBonusLeaderType = settings:get_perLostHPStatsBonus(LeaderType):get_baseAttack2Damage_Percent()
       perDifferentUnitStatsBonusLeaderType = settings:get_perDifferentUnitStatsBonus(LeaderType):get_baseAttack2Damage_Percent()
       perIdenticalUnitStatsBonusLeaderType = settings:get_perIdenticalUnitStatsBonus(LeaderType):get_baseAttack2Damage_Percent()
   end

   return Workshop_GetBonusSum(scen, unit,
                               LeaderType,
                               group, owner, ownerType, player, settings,
                               constantStatsBonus, yourTerrainStatsBonus, opponentTerrainStatsBonus, neutralTerrainStatsBonus, perLostHPStatsBonus, perDifferentUnitStatsBonus, perIdenticalUnitStatsBonus, 
                               constantStatsBonusLeaderType, yourTerrainStatsBonusLeaderType, opponentTerrainStatsBonusLeaderType, neutralTerrainStatsBonusLeaderType, perLostHPStatsBonusLeaderType, perDifferentUnitStatsBonusLeaderType, perIdenticalUnitStatsBonusLeaderType)
end

function Workshop_getBonus_baseAttack1Heal_Percent(scen, unit, gotGroup)
   local group, owner, ownerType, player, settings = Workshop_Info(unit, gotGroup)

   if settings == nil then
       return 0
   end

   local LeaderType = WorkshopEnum_getGroupLeaderType(group, owner, ownerType)

   local constantStatsBonus = settings:get_constantStatsBonus():get_baseAttack1Heal_Percent()
   local yourTerrainStatsBonus = settings:get_yourTerrainStatsBonus():get_baseAttack1Heal_Percent()
   local opponentTerrainStatsBonus = settings:get_opponentTerrainStatsBonus():get_baseAttack1Heal_Percent()
   local neutralTerrainStatsBonus = settings:get_neutralTerrainStatsBonus():get_baseAttack1Heal_Percent()
   local perLostHPStatsBonus = settings:get_perLostHPStatsBonus():get_baseAttack1Heal_Percent()
   local perDifferentUnitStatsBonus = settings:get_perDifferentUnitStatsBonus():get_baseAttack1Heal_Percent()
   local perIdenticalUnitStatsBonus = settings:get_perIdenticalUnitStatsBonus():get_baseAttack1Heal_Percent()

   local constantStatsBonusLeaderType = 0
   local yourTerrainStatsBonusLeaderType = 0
   local opponentTerrainStatsBonusLeaderType = 0
   local neutralTerrainStatsBonusLeaderType = 0
   local perLostHPStatsBonusLeaderType = 0
   local perDifferentUnitStatsBonusLeaderType = 0
   local perIdenticalUnitStatsBonusLeaderType = 0

   if LeaderType ~= nil then
       constantStatsBonusLeaderType = settings:get_constantStatsBonus(LeaderType):get_baseAttack1Heal_Percent()
       yourTerrainStatsBonusLeaderType = settings:get_yourTerrainStatsBonus(LeaderType):get_baseAttack1Heal_Percent()
       opponentTerrainStatsBonusLeaderType = settings:get_opponentTerrainStatsBonus(LeaderType):get_baseAttack1Heal_Percent()
       neutralTerrainStatsBonusLeaderType = settings:get_neutralTerrainStatsBonus(LeaderType):get_baseAttack1Heal_Percent()
       perLostHPStatsBonusLeaderType = settings:get_perLostHPStatsBonus(LeaderType):get_baseAttack1Heal_Percent()
       perDifferentUnitStatsBonusLeaderType = settings:get_perDifferentUnitStatsBonus(LeaderType):get_baseAttack1Heal_Percent()
       perIdenticalUnitStatsBonusLeaderType = settings:get_perIdenticalUnitStatsBonus(LeaderType):get_baseAttack1Heal_Percent()
   end

   return Workshop_GetBonusSum(scen, unit,
                               LeaderType,
                               group, owner, ownerType, player, settings,
                               constantStatsBonus, yourTerrainStatsBonus, opponentTerrainStatsBonus, neutralTerrainStatsBonus, perLostHPStatsBonus, perDifferentUnitStatsBonus, perIdenticalUnitStatsBonus, 
                               constantStatsBonusLeaderType, yourTerrainStatsBonusLeaderType, opponentTerrainStatsBonusLeaderType, neutralTerrainStatsBonusLeaderType, perLostHPStatsBonusLeaderType, perDifferentUnitStatsBonusLeaderType, perIdenticalUnitStatsBonusLeaderType)
end

function Workshop_getBonus_baseAttack2Heal_Percent(scen, unit, gotGroup)
   local group, owner, ownerType, player, settings = Workshop_Info(unit, gotGroup)

   if settings == nil then
       return 0
   end

   local LeaderType = WorkshopEnum_getGroupLeaderType(group, owner, ownerType)

   local constantStatsBonus = settings:get_constantStatsBonus():get_baseAttack2Heal_Percent()
   local yourTerrainStatsBonus = settings:get_yourTerrainStatsBonus():get_baseAttack2Heal_Percent()
   local opponentTerrainStatsBonus = settings:get_opponentTerrainStatsBonus():get_baseAttack2Heal_Percent()
   local neutralTerrainStatsBonus = settings:get_neutralTerrainStatsBonus():get_baseAttack2Heal_Percent()
   local perLostHPStatsBonus = settings:get_perLostHPStatsBonus():get_baseAttack2Heal_Percent()
   local perDifferentUnitStatsBonus = settings:get_perDifferentUnitStatsBonus():get_baseAttack2Heal_Percent()
   local perIdenticalUnitStatsBonus = settings:get_perIdenticalUnitStatsBonus():get_baseAttack2Heal_Percent()

   local constantStatsBonusLeaderType = 0
   local yourTerrainStatsBonusLeaderType = 0
   local opponentTerrainStatsBonusLeaderType = 0
   local neutralTerrainStatsBonusLeaderType = 0
   local perLostHPStatsBonusLeaderType = 0
   local perDifferentUnitStatsBonusLeaderType = 0
   local perIdenticalUnitStatsBonusLeaderType = 0

   if LeaderType ~= nil then
       constantStatsBonusLeaderType = settings:get_constantStatsBonus(LeaderType):get_baseAttack2Heal_Percent()
       yourTerrainStatsBonusLeaderType = settings:get_yourTerrainStatsBonus(LeaderType):get_baseAttack2Heal_Percent()
       opponentTerrainStatsBonusLeaderType = settings:get_opponentTerrainStatsBonus(LeaderType):get_baseAttack2Heal_Percent()
       neutralTerrainStatsBonusLeaderType = settings:get_neutralTerrainStatsBonus(LeaderType):get_baseAttack2Heal_Percent()
       perLostHPStatsBonusLeaderType = settings:get_perLostHPStatsBonus(LeaderType):get_baseAttack2Heal_Percent()
       perDifferentUnitStatsBonusLeaderType = settings:get_perDifferentUnitStatsBonus(LeaderType):get_baseAttack2Heal_Percent()
       perIdenticalUnitStatsBonusLeaderType = settings:get_perIdenticalUnitStatsBonus(LeaderType):get_baseAttack2Heal_Percent()
   end

   return Workshop_GetBonusSum(scen, unit,
                               LeaderType,
                               group, owner, ownerType, player, settings,
                               constantStatsBonus, yourTerrainStatsBonus, opponentTerrainStatsBonus, neutralTerrainStatsBonus, perLostHPStatsBonus, perDifferentUnitStatsBonus, perIdenticalUnitStatsBonus, 
                               constantStatsBonusLeaderType, yourTerrainStatsBonusLeaderType, opponentTerrainStatsBonusLeaderType, neutralTerrainStatsBonusLeaderType, perLostHPStatsBonusLeaderType, perDifferentUnitStatsBonusLeaderType, perIdenticalUnitStatsBonusLeaderType)
end

function Workshop_getBonus_baseAttackInitiative_Percent(scen, unit, gotGroup)
   local group, owner, ownerType, player, settings = Workshop_Info(unit, gotGroup)

   if settings == nil then
       return 0
   end

   local LeaderType = WorkshopEnum_getGroupLeaderType(group, owner, ownerType)

   local constantStatsBonus = settings:get_constantStatsBonus():get_baseAttackInitiative_Percent()
   local yourTerrainStatsBonus = settings:get_yourTerrainStatsBonus():get_baseAttackInitiative_Percent()
   local opponentTerrainStatsBonus = settings:get_opponentTerrainStatsBonus():get_baseAttackInitiative_Percent()
   local neutralTerrainStatsBonus = settings:get_neutralTerrainStatsBonus():get_baseAttackInitiative_Percent()
   local perLostHPStatsBonus = settings:get_perLostHPStatsBonus():get_baseAttackInitiative_Percent()
   local perDifferentUnitStatsBonus = settings:get_perDifferentUnitStatsBonus():get_baseAttackInitiative_Percent()
   local perIdenticalUnitStatsBonus = settings:get_perIdenticalUnitStatsBonus():get_baseAttackInitiative_Percent()

   local constantStatsBonusLeaderType = 0
   local yourTerrainStatsBonusLeaderType = 0
   local opponentTerrainStatsBonusLeaderType = 0
   local neutralTerrainStatsBonusLeaderType = 0
   local perLostHPStatsBonusLeaderType = 0
   local perDifferentUnitStatsBonusLeaderType = 0
   local perIdenticalUnitStatsBonusLeaderType = 0

   if LeaderType ~= nil then
       constantStatsBonusLeaderType = settings:get_constantStatsBonus(LeaderType):get_baseAttackInitiative_Percent()
       yourTerrainStatsBonusLeaderType = settings:get_yourTerrainStatsBonus(LeaderType):get_baseAttackInitiative_Percent()
       opponentTerrainStatsBonusLeaderType = settings:get_opponentTerrainStatsBonus(LeaderType):get_baseAttackInitiative_Percent()
       neutralTerrainStatsBonusLeaderType = settings:get_neutralTerrainStatsBonus(LeaderType):get_baseAttackInitiative_Percent()
       perLostHPStatsBonusLeaderType = settings:get_perLostHPStatsBonus(LeaderType):get_baseAttackInitiative_Percent()
       perDifferentUnitStatsBonusLeaderType = settings:get_perDifferentUnitStatsBonus(LeaderType):get_baseAttackInitiative_Percent()
       perIdenticalUnitStatsBonusLeaderType = settings:get_perIdenticalUnitStatsBonus(LeaderType):get_baseAttackInitiative_Percent()
   end

   return Workshop_GetBonusSum(scen, unit,
                               LeaderType,
                               group, owner, ownerType, player, settings,
                               constantStatsBonus, yourTerrainStatsBonus, opponentTerrainStatsBonus, neutralTerrainStatsBonus, perLostHPStatsBonus, perDifferentUnitStatsBonus, perIdenticalUnitStatsBonus, 
                               constantStatsBonusLeaderType, yourTerrainStatsBonusLeaderType, opponentTerrainStatsBonusLeaderType, neutralTerrainStatsBonusLeaderType, perLostHPStatsBonusLeaderType, perDifferentUnitStatsBonusLeaderType, perIdenticalUnitStatsBonusLeaderType)
end

function Workshop_getBonus_baseRegen_Flat(scen, unit, gotGroup)
   local group, owner, ownerType, player, settings = Workshop_Info(unit, gotGroup)

   if settings == nil then
       return 0
   end

   local LeaderType = WorkshopEnum_getGroupLeaderType(group, owner, ownerType)

   local constantStatsBonus = settings:get_constantStatsBonus():get_baseRegen_Flat()
   local yourTerrainStatsBonus = settings:get_yourTerrainStatsBonus():get_baseRegen_Flat()
   local opponentTerrainStatsBonus = settings:get_opponentTerrainStatsBonus():get_baseRegen_Flat()
   local neutralTerrainStatsBonus = settings:get_neutralTerrainStatsBonus():get_baseRegen_Flat()
   local perLostHPStatsBonus = settings:get_perLostHPStatsBonus():get_baseRegen_Flat()
   local perDifferentUnitStatsBonus = settings:get_perDifferentUnitStatsBonus():get_baseRegen_Flat()
   local perIdenticalUnitStatsBonus = settings:get_perIdenticalUnitStatsBonus():get_baseRegen_Flat()

   local constantStatsBonusLeaderType = 0
   local yourTerrainStatsBonusLeaderType = 0
   local opponentTerrainStatsBonusLeaderType = 0
   local neutralTerrainStatsBonusLeaderType = 0
   local perLostHPStatsBonusLeaderType = 0
   local perDifferentUnitStatsBonusLeaderType = 0
   local perIdenticalUnitStatsBonusLeaderType = 0

   if LeaderType ~= nil then
       constantStatsBonusLeaderType = settings:get_constantStatsBonus(LeaderType):get_baseRegen_Flat()
       yourTerrainStatsBonusLeaderType = settings:get_yourTerrainStatsBonus(LeaderType):get_baseRegen_Flat()
       opponentTerrainStatsBonusLeaderType = settings:get_opponentTerrainStatsBonus(LeaderType):get_baseRegen_Flat()
       neutralTerrainStatsBonusLeaderType = settings:get_neutralTerrainStatsBonus(LeaderType):get_baseRegen_Flat()
       perLostHPStatsBonusLeaderType = settings:get_perLostHPStatsBonus(LeaderType):get_baseRegen_Flat()
       perDifferentUnitStatsBonusLeaderType = settings:get_perDifferentUnitStatsBonus(LeaderType):get_baseRegen_Flat()
       perIdenticalUnitStatsBonusLeaderType = settings:get_perIdenticalUnitStatsBonus(LeaderType):get_baseRegen_Flat()
   end

   return Workshop_GetBonusSum(scen, unit,
                               LeaderType,
                               group, owner, ownerType, player, settings,
                               constantStatsBonus, yourTerrainStatsBonus, opponentTerrainStatsBonus, neutralTerrainStatsBonus, perLostHPStatsBonus, perDifferentUnitStatsBonus, perIdenticalUnitStatsBonus, 
                               constantStatsBonusLeaderType, yourTerrainStatsBonusLeaderType, opponentTerrainStatsBonusLeaderType, neutralTerrainStatsBonusLeaderType, perLostHPStatsBonusLeaderType, perDifferentUnitStatsBonusLeaderType, perIdenticalUnitStatsBonusLeaderType)
end

function Workshop_getBonus_baseArmor_Flat(scen, unit, gotGroup)
   local group, owner, ownerType, player, settings = Workshop_Info(unit, gotGroup)

   if settings == nil then
       return 0
   end

   local LeaderType = WorkshopEnum_getGroupLeaderType(group, owner, ownerType)

   local constantStatsBonus = settings:get_constantStatsBonus():get_baseArmor_Flat()
   local yourTerrainStatsBonus = settings:get_yourTerrainStatsBonus():get_baseArmor_Flat()
   local opponentTerrainStatsBonus = settings:get_opponentTerrainStatsBonus():get_baseArmor_Flat()
   local neutralTerrainStatsBonus = settings:get_neutralTerrainStatsBonus():get_baseArmor_Flat()
   local perLostHPStatsBonus = settings:get_perLostHPStatsBonus():get_baseArmor_Flat()
   local perDifferentUnitStatsBonus = settings:get_perDifferentUnitStatsBonus():get_baseArmor_Flat()
   local perIdenticalUnitStatsBonus = settings:get_perIdenticalUnitStatsBonus():get_baseArmor_Flat()

   local constantStatsBonusLeaderType = 0
   local yourTerrainStatsBonusLeaderType = 0
   local opponentTerrainStatsBonusLeaderType = 0
   local neutralTerrainStatsBonusLeaderType = 0
   local perLostHPStatsBonusLeaderType = 0
   local perDifferentUnitStatsBonusLeaderType = 0
   local perIdenticalUnitStatsBonusLeaderType = 0

   if LeaderType ~= nil then
       constantStatsBonusLeaderType = settings:get_constantStatsBonus(LeaderType):get_baseArmor_Flat()
       yourTerrainStatsBonusLeaderType = settings:get_yourTerrainStatsBonus(LeaderType):get_baseArmor_Flat()
       opponentTerrainStatsBonusLeaderType = settings:get_opponentTerrainStatsBonus(LeaderType):get_baseArmor_Flat()
       neutralTerrainStatsBonusLeaderType = settings:get_neutralTerrainStatsBonus(LeaderType):get_baseArmor_Flat()
       perLostHPStatsBonusLeaderType = settings:get_perLostHPStatsBonus(LeaderType):get_baseArmor_Flat()
       perDifferentUnitStatsBonusLeaderType = settings:get_perDifferentUnitStatsBonus(LeaderType):get_baseArmor_Flat()
       perIdenticalUnitStatsBonusLeaderType = settings:get_perIdenticalUnitStatsBonus(LeaderType):get_baseArmor_Flat()
   end

   return Workshop_GetBonusSum(scen, unit,
                               LeaderType,
                               group, owner, ownerType, player, settings,
                               constantStatsBonus, yourTerrainStatsBonus, opponentTerrainStatsBonus, neutralTerrainStatsBonus, perLostHPStatsBonus, perDifferentUnitStatsBonus, perIdenticalUnitStatsBonus, 
                               constantStatsBonusLeaderType, yourTerrainStatsBonusLeaderType, opponentTerrainStatsBonusLeaderType, neutralTerrainStatsBonusLeaderType, perLostHPStatsBonusLeaderType, perDifferentUnitStatsBonusLeaderType, perIdenticalUnitStatsBonusLeaderType)
end

function Workshop_getBonus_baseNegotiate_Flat(scen, unit, gotGroup)
   local group, owner, ownerType, player, settings = Workshop_Info(unit, gotGroup)

   if settings == nil then
       return 0
   end

   local LeaderType = WorkshopEnum_getGroupLeaderType(group, owner, ownerType)

   local constantStatsBonus = settings:get_constantStatsBonus():get_baseNegotiate_Flat()
   local yourTerrainStatsBonus = settings:get_yourTerrainStatsBonus():get_baseNegotiate_Flat()
   local opponentTerrainStatsBonus = settings:get_opponentTerrainStatsBonus():get_baseNegotiate_Flat()
   local neutralTerrainStatsBonus = settings:get_neutralTerrainStatsBonus():get_baseNegotiate_Flat()
   local perLostHPStatsBonus = settings:get_perLostHPStatsBonus():get_baseNegotiate_Flat()
   local perDifferentUnitStatsBonus = settings:get_perDifferentUnitStatsBonus():get_baseNegotiate_Flat()
   local perIdenticalUnitStatsBonus = settings:get_perIdenticalUnitStatsBonus():get_baseNegotiate_Flat()

   local constantStatsBonusLeaderType = 0
   local yourTerrainStatsBonusLeaderType = 0
   local opponentTerrainStatsBonusLeaderType = 0
   local neutralTerrainStatsBonusLeaderType = 0
   local perLostHPStatsBonusLeaderType = 0
   local perDifferentUnitStatsBonusLeaderType = 0
   local perIdenticalUnitStatsBonusLeaderType = 0

   if LeaderType ~= nil then
       constantStatsBonusLeaderType = settings:get_constantStatsBonus(LeaderType):get_baseNegotiate_Flat()
       yourTerrainStatsBonusLeaderType = settings:get_yourTerrainStatsBonus(LeaderType):get_baseNegotiate_Flat()
       opponentTerrainStatsBonusLeaderType = settings:get_opponentTerrainStatsBonus(LeaderType):get_baseNegotiate_Flat()
       neutralTerrainStatsBonusLeaderType = settings:get_neutralTerrainStatsBonus(LeaderType):get_baseNegotiate_Flat()
       perLostHPStatsBonusLeaderType = settings:get_perLostHPStatsBonus(LeaderType):get_baseNegotiate_Flat()
       perDifferentUnitStatsBonusLeaderType = settings:get_perDifferentUnitStatsBonus(LeaderType):get_baseNegotiate_Flat()
       perIdenticalUnitStatsBonusLeaderType = settings:get_perIdenticalUnitStatsBonus(LeaderType):get_baseNegotiate_Flat()
   end

   return Workshop_GetBonusSum(scen, unit,
                               LeaderType,
                               group, owner, ownerType, player, settings,
                               constantStatsBonus, yourTerrainStatsBonus, opponentTerrainStatsBonus, neutralTerrainStatsBonus, perLostHPStatsBonus, perDifferentUnitStatsBonus, perIdenticalUnitStatsBonus, 
                               constantStatsBonusLeaderType, yourTerrainStatsBonusLeaderType, opponentTerrainStatsBonusLeaderType, neutralTerrainStatsBonusLeaderType, perLostHPStatsBonusLeaderType, perDifferentUnitStatsBonusLeaderType, perIdenticalUnitStatsBonusLeaderType)
end

function Workshop_getBonus_XpGain_Percent(scen, unit, gotGroup)
   local group, owner, ownerType, player, settings = Workshop_Info(unit, gotGroup)

   if settings == nil then
       return 0
   end

   local LeaderType = WorkshopEnum_getGroupLeaderType(group, owner, ownerType)

   local constantStatsBonus = settings:get_constantStatsBonus():get_XpGain_Percent()
   local yourTerrainStatsBonus = settings:get_yourTerrainStatsBonus():get_XpGain_Percent()
   local opponentTerrainStatsBonus = settings:get_opponentTerrainStatsBonus():get_XpGain_Percent()
   local neutralTerrainStatsBonus = settings:get_neutralTerrainStatsBonus():get_XpGain_Percent()
   local perLostHPStatsBonus = settings:get_perLostHPStatsBonus():get_XpGain_Percent()
   local perDifferentUnitStatsBonus = settings:get_perDifferentUnitStatsBonus():get_XpGain_Percent()
   local perIdenticalUnitStatsBonus = settings:get_perIdenticalUnitStatsBonus():get_XpGain_Percent()

   local constantStatsBonusLeaderType = 0
   local yourTerrainStatsBonusLeaderType = 0
   local opponentTerrainStatsBonusLeaderType = 0
   local neutralTerrainStatsBonusLeaderType = 0
   local perLostHPStatsBonusLeaderType = 0
   local perDifferentUnitStatsBonusLeaderType = 0
   local perIdenticalUnitStatsBonusLeaderType = 0

   if LeaderType ~= nil then
       constantStatsBonusLeaderType = settings:get_constantStatsBonus(LeaderType):get_XpGain_Percent()
       yourTerrainStatsBonusLeaderType = settings:get_yourTerrainStatsBonus(LeaderType):get_XpGain_Percent()
       opponentTerrainStatsBonusLeaderType = settings:get_opponentTerrainStatsBonus(LeaderType):get_XpGain_Percent()
       neutralTerrainStatsBonusLeaderType = settings:get_neutralTerrainStatsBonus(LeaderType):get_XpGain_Percent()
       perLostHPStatsBonusLeaderType = settings:get_perLostHPStatsBonus(LeaderType):get_XpGain_Percent()
       perDifferentUnitStatsBonusLeaderType = settings:get_perDifferentUnitStatsBonus(LeaderType):get_XpGain_Percent()
       perIdenticalUnitStatsBonusLeaderType = settings:get_perIdenticalUnitStatsBonus(LeaderType):get_XpGain_Percent()
   end

   return Workshop_GetBonusSum(scen, unit,
                               LeaderType,
                               group, owner, ownerType, player, settings,
                               constantStatsBonus, yourTerrainStatsBonus, opponentTerrainStatsBonus, neutralTerrainStatsBonus, perLostHPStatsBonus, perDifferentUnitStatsBonus, perIdenticalUnitStatsBonus, 
                               constantStatsBonusLeaderType, yourTerrainStatsBonusLeaderType, opponentTerrainStatsBonusLeaderType, neutralTerrainStatsBonusLeaderType, perLostHPStatsBonusLeaderType, perDifferentUnitStatsBonusLeaderType, perIdenticalUnitStatsBonusLeaderType)
end

function Workshop_getBonus_Movement_Percent(scen, unit, gotGroup)
   local group, owner, ownerType, player, settings = Workshop_Info(unit, gotGroup)

   if settings == nil then
       return 0
   end

   local LeaderType = WorkshopEnum_getGroupLeaderType(group, owner, ownerType)

   local constantStatsBonus = settings:get_constantStatsBonus():get_Movement_Percent()
   local yourTerrainStatsBonus = settings:get_yourTerrainStatsBonus():get_Movement_Percent()
   local opponentTerrainStatsBonus = settings:get_opponentTerrainStatsBonus():get_Movement_Percent()
   local neutralTerrainStatsBonus = settings:get_neutralTerrainStatsBonus():get_Movement_Percent()
   local perLostHPStatsBonus = settings:get_perLostHPStatsBonus():get_Movement_Percent()
   local perDifferentUnitStatsBonus = settings:get_perDifferentUnitStatsBonus():get_Movement_Percent()
   local perIdenticalUnitStatsBonus = settings:get_perIdenticalUnitStatsBonus():get_Movement_Percent()

   local constantStatsBonusLeaderType = 0
   local yourTerrainStatsBonusLeaderType = 0
   local opponentTerrainStatsBonusLeaderType = 0
   local neutralTerrainStatsBonusLeaderType = 0
   local perLostHPStatsBonusLeaderType = 0
   local perDifferentUnitStatsBonusLeaderType = 0
   local perIdenticalUnitStatsBonusLeaderType = 0

   if LeaderType ~= nil then
       constantStatsBonusLeaderType = settings:get_constantStatsBonus(LeaderType):get_Movement_Percent()
       yourTerrainStatsBonusLeaderType = settings:get_yourTerrainStatsBonus(LeaderType):get_Movement_Percent()
       opponentTerrainStatsBonusLeaderType = settings:get_opponentTerrainStatsBonus(LeaderType):get_Movement_Percent()
       neutralTerrainStatsBonusLeaderType = settings:get_neutralTerrainStatsBonus(LeaderType):get_Movement_Percent()
       perLostHPStatsBonusLeaderType = settings:get_perLostHPStatsBonus(LeaderType):get_Movement_Percent()
       perDifferentUnitStatsBonusLeaderType = settings:get_perDifferentUnitStatsBonus(LeaderType):get_Movement_Percent()
       perIdenticalUnitStatsBonusLeaderType = settings:get_perIdenticalUnitStatsBonus(LeaderType):get_Movement_Percent()
   end

   return Workshop_GetBonusSum(scen, unit,
                               LeaderType,
                               group, owner, ownerType, player, settings,
                               constantStatsBonus, yourTerrainStatsBonus, opponentTerrainStatsBonus, neutralTerrainStatsBonus, perLostHPStatsBonus, perDifferentUnitStatsBonus, perIdenticalUnitStatsBonus, 
                               constantStatsBonusLeaderType, yourTerrainStatsBonusLeaderType, opponentTerrainStatsBonusLeaderType, neutralTerrainStatsBonusLeaderType, perLostHPStatsBonusLeaderType, perDifferentUnitStatsBonusLeaderType, perIdenticalUnitStatsBonusLeaderType)
end

function Workshop_getBonus_Movement_Flat(scen, unit, gotGroup)
   local group, owner, ownerType, player, settings = Workshop_Info(unit, gotGroup)

   if settings == nil then
       return 0
   end

   local LeaderType = WorkshopEnum_getGroupLeaderType(group, owner, ownerType)

   local constantStatsBonus = settings:get_constantStatsBonus():get_Movement_Flat()
   local yourTerrainStatsBonus = settings:get_yourTerrainStatsBonus():get_Movement_Flat()
   local opponentTerrainStatsBonus = settings:get_opponentTerrainStatsBonus():get_Movement_Flat()
   local neutralTerrainStatsBonus = settings:get_neutralTerrainStatsBonus():get_Movement_Flat()
   local perLostHPStatsBonus = settings:get_perLostHPStatsBonus():get_Movement_Flat()
   local perDifferentUnitStatsBonus = settings:get_perDifferentUnitStatsBonus():get_Movement_Flat()
   local perIdenticalUnitStatsBonus = settings:get_perIdenticalUnitStatsBonus():get_Movement_Flat()

   local constantStatsBonusLeaderType = 0
   local yourTerrainStatsBonusLeaderType = 0
   local opponentTerrainStatsBonusLeaderType = 0
   local neutralTerrainStatsBonusLeaderType = 0
   local perLostHPStatsBonusLeaderType = 0
   local perDifferentUnitStatsBonusLeaderType = 0
   local perIdenticalUnitStatsBonusLeaderType = 0

   if LeaderType ~= nil then
       constantStatsBonusLeaderType = settings:get_constantStatsBonus(LeaderType):get_Movement_Flat()
       yourTerrainStatsBonusLeaderType = settings:get_yourTerrainStatsBonus(LeaderType):get_Movement_Flat()
       opponentTerrainStatsBonusLeaderType = settings:get_opponentTerrainStatsBonus(LeaderType):get_Movement_Flat()
       neutralTerrainStatsBonusLeaderType = settings:get_neutralTerrainStatsBonus(LeaderType):get_Movement_Flat()
       perLostHPStatsBonusLeaderType = settings:get_perLostHPStatsBonus(LeaderType):get_Movement_Flat()
       perDifferentUnitStatsBonusLeaderType = settings:get_perDifferentUnitStatsBonus(LeaderType):get_Movement_Flat()
       perIdenticalUnitStatsBonusLeaderType = settings:get_perIdenticalUnitStatsBonus(LeaderType):get_Movement_Flat()
   end

   return Workshop_GetBonusSum(scen, unit,
                               LeaderType,
                               group, owner, ownerType, player, settings,
                               constantStatsBonus, yourTerrainStatsBonus, opponentTerrainStatsBonus, neutralTerrainStatsBonus, perLostHPStatsBonus, perDifferentUnitStatsBonus, perIdenticalUnitStatsBonus, 
                               constantStatsBonusLeaderType, yourTerrainStatsBonusLeaderType, opponentTerrainStatsBonusLeaderType, neutralTerrainStatsBonusLeaderType, perLostHPStatsBonusLeaderType, perDifferentUnitStatsBonusLeaderType, perIdenticalUnitStatsBonusLeaderType)
end

function Workshop_getBonus_Attack1CritDamage_Flat(scen, unit, gotGroup)
   local group, owner, ownerType, player, settings = Workshop_Info(unit, gotGroup)

   if settings == nil then
       return 0
   end

   local LeaderType = WorkshopEnum_getGroupLeaderType(group, owner, ownerType)

   local constantStatsBonus = settings:get_constantStatsBonus():get_Attack1CritDamage_Flat()
   local yourTerrainStatsBonus = settings:get_yourTerrainStatsBonus():get_Attack1CritDamage_Flat()
   local opponentTerrainStatsBonus = settings:get_opponentTerrainStatsBonus():get_Attack1CritDamage_Flat()
   local neutralTerrainStatsBonus = settings:get_neutralTerrainStatsBonus():get_Attack1CritDamage_Flat()
   local perLostHPStatsBonus = settings:get_perLostHPStatsBonus():get_Attack1CritDamage_Flat()
   local perDifferentUnitStatsBonus = settings:get_perDifferentUnitStatsBonus():get_Attack1CritDamage_Flat()
   local perIdenticalUnitStatsBonus = settings:get_perIdenticalUnitStatsBonus():get_Attack1CritDamage_Flat()

   local constantStatsBonusLeaderType = 0
   local yourTerrainStatsBonusLeaderType = 0
   local opponentTerrainStatsBonusLeaderType = 0
   local neutralTerrainStatsBonusLeaderType = 0
   local perLostHPStatsBonusLeaderType = 0
   local perDifferentUnitStatsBonusLeaderType = 0
   local perIdenticalUnitStatsBonusLeaderType = 0

   if LeaderType ~= nil then
       constantStatsBonusLeaderType = settings:get_constantStatsBonus(LeaderType):get_Attack1CritDamage_Flat()
       yourTerrainStatsBonusLeaderType = settings:get_yourTerrainStatsBonus(LeaderType):get_Attack1CritDamage_Flat()
       opponentTerrainStatsBonusLeaderType = settings:get_opponentTerrainStatsBonus(LeaderType):get_Attack1CritDamage_Flat()
       neutralTerrainStatsBonusLeaderType = settings:get_neutralTerrainStatsBonus(LeaderType):get_Attack1CritDamage_Flat()
       perLostHPStatsBonusLeaderType = settings:get_perLostHPStatsBonus(LeaderType):get_Attack1CritDamage_Flat()
       perDifferentUnitStatsBonusLeaderType = settings:get_perDifferentUnitStatsBonus(LeaderType):get_Attack1CritDamage_Flat()
       perIdenticalUnitStatsBonusLeaderType = settings:get_perIdenticalUnitStatsBonus(LeaderType):get_Attack1CritDamage_Flat()
   end

   return Workshop_GetBonusSum(scen, unit,
                               LeaderType,
                               group, owner, ownerType, player, settings,
                               constantStatsBonus, yourTerrainStatsBonus, opponentTerrainStatsBonus, neutralTerrainStatsBonus, perLostHPStatsBonus, perDifferentUnitStatsBonus, perIdenticalUnitStatsBonus, 
                               constantStatsBonusLeaderType, yourTerrainStatsBonusLeaderType, opponentTerrainStatsBonusLeaderType, neutralTerrainStatsBonusLeaderType, perLostHPStatsBonusLeaderType, perDifferentUnitStatsBonusLeaderType, perIdenticalUnitStatsBonusLeaderType)
end

function Workshop_getBonus_Attack2CritDamage_Flat(scen, unit, gotGroup)
   local group, owner, ownerType, player, settings = Workshop_Info(unit, gotGroup)

   if settings == nil then
       return 0
   end

   local LeaderType = WorkshopEnum_getGroupLeaderType(group, owner, ownerType)

   local constantStatsBonus = settings:get_constantStatsBonus():get_Attack2CritDamage_Flat()
   local yourTerrainStatsBonus = settings:get_yourTerrainStatsBonus():get_Attack2CritDamage_Flat()
   local opponentTerrainStatsBonus = settings:get_opponentTerrainStatsBonus():get_Attack2CritDamage_Flat()
   local neutralTerrainStatsBonus = settings:get_neutralTerrainStatsBonus():get_Attack2CritDamage_Flat()
   local perLostHPStatsBonus = settings:get_perLostHPStatsBonus():get_Attack2CritDamage_Flat()
   local perDifferentUnitStatsBonus = settings:get_perDifferentUnitStatsBonus():get_Attack2CritDamage_Flat()
   local perIdenticalUnitStatsBonus = settings:get_perIdenticalUnitStatsBonus():get_Attack2CritDamage_Flat()

   local constantStatsBonusLeaderType = 0
   local yourTerrainStatsBonusLeaderType = 0
   local opponentTerrainStatsBonusLeaderType = 0
   local neutralTerrainStatsBonusLeaderType = 0
   local perLostHPStatsBonusLeaderType = 0
   local perDifferentUnitStatsBonusLeaderType = 0
   local perIdenticalUnitStatsBonusLeaderType = 0

   if LeaderType ~= nil then
       constantStatsBonusLeaderType = settings:get_constantStatsBonus(LeaderType):get_Attack2CritDamage_Flat()
       yourTerrainStatsBonusLeaderType = settings:get_yourTerrainStatsBonus(LeaderType):get_Attack2CritDamage_Flat()
       opponentTerrainStatsBonusLeaderType = settings:get_opponentTerrainStatsBonus(LeaderType):get_Attack2CritDamage_Flat()
       neutralTerrainStatsBonusLeaderType = settings:get_neutralTerrainStatsBonus(LeaderType):get_Attack2CritDamage_Flat()
       perLostHPStatsBonusLeaderType = settings:get_perLostHPStatsBonus(LeaderType):get_Attack2CritDamage_Flat()
       perDifferentUnitStatsBonusLeaderType = settings:get_perDifferentUnitStatsBonus(LeaderType):get_Attack2CritDamage_Flat()
       perIdenticalUnitStatsBonusLeaderType = settings:get_perIdenticalUnitStatsBonus(LeaderType):get_Attack2CritDamage_Flat()
   end

   return Workshop_GetBonusSum(scen, unit,
                               LeaderType,
                               group, owner, ownerType, player, settings,
                               constantStatsBonus, yourTerrainStatsBonus, opponentTerrainStatsBonus, neutralTerrainStatsBonus, perLostHPStatsBonus, perDifferentUnitStatsBonus, perIdenticalUnitStatsBonus, 
                               constantStatsBonusLeaderType, yourTerrainStatsBonusLeaderType, opponentTerrainStatsBonusLeaderType, neutralTerrainStatsBonusLeaderType, perLostHPStatsBonusLeaderType, perDifferentUnitStatsBonusLeaderType, perIdenticalUnitStatsBonusLeaderType)
end

function Workshop_getBonus_Attack1CritPower_Flat(scen, unit, gotGroup)
   local group, owner, ownerType, player, settings = Workshop_Info(unit, gotGroup)

   if settings == nil then
       return 0
   end

   local LeaderType = WorkshopEnum_getGroupLeaderType(group, owner, ownerType)

   local constantStatsBonus = settings:get_constantStatsBonus():get_Attack1CritPower_Flat()
   local yourTerrainStatsBonus = settings:get_yourTerrainStatsBonus():get_Attack1CritPower_Flat()
   local opponentTerrainStatsBonus = settings:get_opponentTerrainStatsBonus():get_Attack1CritPower_Flat()
   local neutralTerrainStatsBonus = settings:get_neutralTerrainStatsBonus():get_Attack1CritPower_Flat()
   local perLostHPStatsBonus = settings:get_perLostHPStatsBonus():get_Attack1CritPower_Flat()
   local perDifferentUnitStatsBonus = settings:get_perDifferentUnitStatsBonus():get_Attack1CritPower_Flat()
   local perIdenticalUnitStatsBonus = settings:get_perIdenticalUnitStatsBonus():get_Attack1CritPower_Flat()

   local constantStatsBonusLeaderType = 0
   local yourTerrainStatsBonusLeaderType = 0
   local opponentTerrainStatsBonusLeaderType = 0
   local neutralTerrainStatsBonusLeaderType = 0
   local perLostHPStatsBonusLeaderType = 0
   local perDifferentUnitStatsBonusLeaderType = 0
   local perIdenticalUnitStatsBonusLeaderType = 0

   if LeaderType ~= nil then
       constantStatsBonusLeaderType = settings:get_constantStatsBonus(LeaderType):get_Attack1CritPower_Flat()
       yourTerrainStatsBonusLeaderType = settings:get_yourTerrainStatsBonus(LeaderType):get_Attack1CritPower_Flat()
       opponentTerrainStatsBonusLeaderType = settings:get_opponentTerrainStatsBonus(LeaderType):get_Attack1CritPower_Flat()
       neutralTerrainStatsBonusLeaderType = settings:get_neutralTerrainStatsBonus(LeaderType):get_Attack1CritPower_Flat()
       perLostHPStatsBonusLeaderType = settings:get_perLostHPStatsBonus(LeaderType):get_Attack1CritPower_Flat()
       perDifferentUnitStatsBonusLeaderType = settings:get_perDifferentUnitStatsBonus(LeaderType):get_Attack1CritPower_Flat()
       perIdenticalUnitStatsBonusLeaderType = settings:get_perIdenticalUnitStatsBonus(LeaderType):get_Attack1CritPower_Flat()
   end

   return Workshop_GetBonusSum(scen, unit,
                               LeaderType,
                               group, owner, ownerType, player, settings,
                               constantStatsBonus, yourTerrainStatsBonus, opponentTerrainStatsBonus, neutralTerrainStatsBonus, perLostHPStatsBonus, perDifferentUnitStatsBonus, perIdenticalUnitStatsBonus, 
                               constantStatsBonusLeaderType, yourTerrainStatsBonusLeaderType, opponentTerrainStatsBonusLeaderType, neutralTerrainStatsBonusLeaderType, perLostHPStatsBonusLeaderType, perDifferentUnitStatsBonusLeaderType, perIdenticalUnitStatsBonusLeaderType)
end

function Workshop_getBonus_Attack2CritPower_Flat(scen, unit, gotGroup)
   local group, owner, ownerType, player, settings = Workshop_Info(unit, gotGroup)

   if settings == nil then
       return 0
   end

   local LeaderType = WorkshopEnum_getGroupLeaderType(group, owner, ownerType)

   local constantStatsBonus = settings:get_constantStatsBonus():get_Attack2CritPower_Flat()
   local yourTerrainStatsBonus = settings:get_yourTerrainStatsBonus():get_Attack2CritPower_Flat()
   local opponentTerrainStatsBonus = settings:get_opponentTerrainStatsBonus():get_Attack2CritPower_Flat()
   local neutralTerrainStatsBonus = settings:get_neutralTerrainStatsBonus():get_Attack2CritPower_Flat()
   local perLostHPStatsBonus = settings:get_perLostHPStatsBonus():get_Attack2CritPower_Flat()
   local perDifferentUnitStatsBonus = settings:get_perDifferentUnitStatsBonus():get_Attack2CritPower_Flat()
   local perIdenticalUnitStatsBonus = settings:get_perIdenticalUnitStatsBonus():get_Attack2CritPower_Flat()

   local constantStatsBonusLeaderType = 0
   local yourTerrainStatsBonusLeaderType = 0
   local opponentTerrainStatsBonusLeaderType = 0
   local neutralTerrainStatsBonusLeaderType = 0
   local perLostHPStatsBonusLeaderType = 0
   local perDifferentUnitStatsBonusLeaderType = 0
   local perIdenticalUnitStatsBonusLeaderType = 0

   if LeaderType ~= nil then
       constantStatsBonusLeaderType = settings:get_constantStatsBonus(LeaderType):get_Attack2CritPower_Flat()
       yourTerrainStatsBonusLeaderType = settings:get_yourTerrainStatsBonus(LeaderType):get_Attack2CritPower_Flat()
       opponentTerrainStatsBonusLeaderType = settings:get_opponentTerrainStatsBonus(LeaderType):get_Attack2CritPower_Flat()
       neutralTerrainStatsBonusLeaderType = settings:get_neutralTerrainStatsBonus(LeaderType):get_Attack2CritPower_Flat()
       perLostHPStatsBonusLeaderType = settings:get_perLostHPStatsBonus(LeaderType):get_Attack2CritPower_Flat()
       perDifferentUnitStatsBonusLeaderType = settings:get_perDifferentUnitStatsBonus(LeaderType):get_Attack2CritPower_Flat()
       perIdenticalUnitStatsBonusLeaderType = settings:get_perIdenticalUnitStatsBonus(LeaderType):get_Attack2CritPower_Flat()
   end

   return Workshop_GetBonusSum(scen, unit,
                               LeaderType,
                               group, owner, ownerType, player, settings,
                               constantStatsBonus, yourTerrainStatsBonus, opponentTerrainStatsBonus, neutralTerrainStatsBonus, perLostHPStatsBonus, perDifferentUnitStatsBonus, perIdenticalUnitStatsBonus, 
                               constantStatsBonusLeaderType, yourTerrainStatsBonusLeaderType, opponentTerrainStatsBonusLeaderType, neutralTerrainStatsBonusLeaderType, perLostHPStatsBonusLeaderType, perDifferentUnitStatsBonusLeaderType, perIdenticalUnitStatsBonusLeaderType)
end

function Workshop_getBonus_Attack1Drain_Flat(scen, unit, gotGroup)
   local group, owner, ownerType, player, settings = Workshop_Info(unit, gotGroup)

   if settings == nil then
       return 0
   end

   local LeaderType = WorkshopEnum_getGroupLeaderType(group, owner, ownerType)

   local constantStatsBonus = settings:get_constantStatsBonus():get_Attack1Drain_Flat()
   local yourTerrainStatsBonus = settings:get_yourTerrainStatsBonus():get_Attack1Drain_Flat()
   local opponentTerrainStatsBonus = settings:get_opponentTerrainStatsBonus():get_Attack1Drain_Flat()
   local neutralTerrainStatsBonus = settings:get_neutralTerrainStatsBonus():get_Attack1Drain_Flat()
   local perLostHPStatsBonus = settings:get_perLostHPStatsBonus():get_Attack1Drain_Flat()
   local perDifferentUnitStatsBonus = settings:get_perDifferentUnitStatsBonus():get_Attack1Drain_Flat()
   local perIdenticalUnitStatsBonus = settings:get_perIdenticalUnitStatsBonus():get_Attack1Drain_Flat()

   local constantStatsBonusLeaderType = 0
   local yourTerrainStatsBonusLeaderType = 0
   local opponentTerrainStatsBonusLeaderType = 0
   local neutralTerrainStatsBonusLeaderType = 0
   local perLostHPStatsBonusLeaderType = 0
   local perDifferentUnitStatsBonusLeaderType = 0
   local perIdenticalUnitStatsBonusLeaderType = 0

   if LeaderType ~= nil then
       constantStatsBonusLeaderType = settings:get_constantStatsBonus(LeaderType):get_Attack1Drain_Flat()
       yourTerrainStatsBonusLeaderType = settings:get_yourTerrainStatsBonus(LeaderType):get_Attack1Drain_Flat()
       opponentTerrainStatsBonusLeaderType = settings:get_opponentTerrainStatsBonus(LeaderType):get_Attack1Drain_Flat()
       neutralTerrainStatsBonusLeaderType = settings:get_neutralTerrainStatsBonus(LeaderType):get_Attack1Drain_Flat()
       perLostHPStatsBonusLeaderType = settings:get_perLostHPStatsBonus(LeaderType):get_Attack1Drain_Flat()
       perDifferentUnitStatsBonusLeaderType = settings:get_perDifferentUnitStatsBonus(LeaderType):get_Attack1Drain_Flat()
       perIdenticalUnitStatsBonusLeaderType = settings:get_perIdenticalUnitStatsBonus(LeaderType):get_Attack1Drain_Flat()
   end

   return Workshop_GetBonusSum(scen, unit,
                               LeaderType,
                               group, owner, ownerType, player, settings,
                               constantStatsBonus, yourTerrainStatsBonus, opponentTerrainStatsBonus, neutralTerrainStatsBonus, perLostHPStatsBonus, perDifferentUnitStatsBonus, perIdenticalUnitStatsBonus, 
                               constantStatsBonusLeaderType, yourTerrainStatsBonusLeaderType, opponentTerrainStatsBonusLeaderType, neutralTerrainStatsBonusLeaderType, perLostHPStatsBonusLeaderType, perDifferentUnitStatsBonusLeaderType, perIdenticalUnitStatsBonusLeaderType)
end

function Workshop_getBonus_Attack2Drain_Flat(scen, unit, gotGroup)
   local group, owner, ownerType, player, settings = Workshop_Info(unit, gotGroup)

   if settings == nil then
       return 0
   end

   local LeaderType = WorkshopEnum_getGroupLeaderType(group, owner, ownerType)

   local constantStatsBonus = settings:get_constantStatsBonus():get_Attack2Drain_Flat()
   local yourTerrainStatsBonus = settings:get_yourTerrainStatsBonus():get_Attack2Drain_Flat()
   local opponentTerrainStatsBonus = settings:get_opponentTerrainStatsBonus():get_Attack2Drain_Flat()
   local neutralTerrainStatsBonus = settings:get_neutralTerrainStatsBonus():get_Attack2Drain_Flat()
   local perLostHPStatsBonus = settings:get_perLostHPStatsBonus():get_Attack2Drain_Flat()
   local perDifferentUnitStatsBonus = settings:get_perDifferentUnitStatsBonus():get_Attack2Drain_Flat()
   local perIdenticalUnitStatsBonus = settings:get_perIdenticalUnitStatsBonus():get_Attack2Drain_Flat()

   local constantStatsBonusLeaderType = 0
   local yourTerrainStatsBonusLeaderType = 0
   local opponentTerrainStatsBonusLeaderType = 0
   local neutralTerrainStatsBonusLeaderType = 0
   local perLostHPStatsBonusLeaderType = 0
   local perDifferentUnitStatsBonusLeaderType = 0
   local perIdenticalUnitStatsBonusLeaderType = 0

   if LeaderType ~= nil then
       constantStatsBonusLeaderType = settings:get_constantStatsBonus(LeaderType):get_Attack2Drain_Flat()
       yourTerrainStatsBonusLeaderType = settings:get_yourTerrainStatsBonus(LeaderType):get_Attack2Drain_Flat()
       opponentTerrainStatsBonusLeaderType = settings:get_opponentTerrainStatsBonus(LeaderType):get_Attack2Drain_Flat()
       neutralTerrainStatsBonusLeaderType = settings:get_neutralTerrainStatsBonus(LeaderType):get_Attack2Drain_Flat()
       perLostHPStatsBonusLeaderType = settings:get_perLostHPStatsBonus(LeaderType):get_Attack2Drain_Flat()
       perDifferentUnitStatsBonusLeaderType = settings:get_perDifferentUnitStatsBonus(LeaderType):get_Attack2Drain_Flat()
       perIdenticalUnitStatsBonusLeaderType = settings:get_perIdenticalUnitStatsBonus(LeaderType):get_Attack2Drain_Flat()
   end

   return Workshop_GetBonusSum(scen, unit,
                               LeaderType,
                               group, owner, ownerType, player, settings,
                               constantStatsBonus, yourTerrainStatsBonus, opponentTerrainStatsBonus, neutralTerrainStatsBonus, perLostHPStatsBonus, perDifferentUnitStatsBonus, perIdenticalUnitStatsBonus, 
                               constantStatsBonusLeaderType, yourTerrainStatsBonusLeaderType, opponentTerrainStatsBonusLeaderType, neutralTerrainStatsBonusLeaderType, perLostHPStatsBonusLeaderType, perDifferentUnitStatsBonusLeaderType, perIdenticalUnitStatsBonusLeaderType)
end

function Workshop_getBonus_Scout_Flat(scen, unit, gotGroup)
   local group, owner, ownerType, player, settings = Workshop_Info(unit, gotGroup)

   if settings == nil then
       return 0
   end

   local LeaderType = WorkshopEnum_getGroupLeaderType(group, owner, ownerType)

   local constantStatsBonus = settings:get_constantStatsBonus():get_Scout_Flat()
   local yourTerrainStatsBonus = settings:get_yourTerrainStatsBonus():get_Scout_Flat()
   local opponentTerrainStatsBonus = settings:get_opponentTerrainStatsBonus():get_Scout_Flat()
   local neutralTerrainStatsBonus = settings:get_neutralTerrainStatsBonus():get_Scout_Flat()
   local perLostHPStatsBonus = settings:get_perLostHPStatsBonus():get_Scout_Flat()
   local perDifferentUnitStatsBonus = settings:get_perDifferentUnitStatsBonus():get_Scout_Flat()
   local perIdenticalUnitStatsBonus = settings:get_perIdenticalUnitStatsBonus():get_Scout_Flat()

   local constantStatsBonusLeaderType = 0
   local yourTerrainStatsBonusLeaderType = 0
   local opponentTerrainStatsBonusLeaderType = 0
   local neutralTerrainStatsBonusLeaderType = 0
   local perLostHPStatsBonusLeaderType = 0
   local perDifferentUnitStatsBonusLeaderType = 0
   local perIdenticalUnitStatsBonusLeaderType = 0

   if LeaderType ~= nil then
       constantStatsBonusLeaderType = settings:get_constantStatsBonus(LeaderType):get_Scout_Flat()
       yourTerrainStatsBonusLeaderType = settings:get_yourTerrainStatsBonus(LeaderType):get_Scout_Flat()
       opponentTerrainStatsBonusLeaderType = settings:get_opponentTerrainStatsBonus(LeaderType):get_Scout_Flat()
       neutralTerrainStatsBonusLeaderType = settings:get_neutralTerrainStatsBonus(LeaderType):get_Scout_Flat()
       perLostHPStatsBonusLeaderType = settings:get_perLostHPStatsBonus(LeaderType):get_Scout_Flat()
       perDifferentUnitStatsBonusLeaderType = settings:get_perDifferentUnitStatsBonus(LeaderType):get_Scout_Flat()
       perIdenticalUnitStatsBonusLeaderType = settings:get_perIdenticalUnitStatsBonus(LeaderType):get_Scout_Flat()
   end

   return Workshop_GetBonusSum(scen, unit,
                               LeaderType,
                               group, owner, ownerType, player, settings,
                               constantStatsBonus, yourTerrainStatsBonus, opponentTerrainStatsBonus, neutralTerrainStatsBonus, perLostHPStatsBonus, perDifferentUnitStatsBonus, perIdenticalUnitStatsBonus, 
                               constantStatsBonusLeaderType, yourTerrainStatsBonusLeaderType, opponentTerrainStatsBonusLeaderType, neutralTerrainStatsBonusLeaderType, perLostHPStatsBonusLeaderType, perDifferentUnitStatsBonusLeaderType, perIdenticalUnitStatsBonusLeaderType)
end

function Workshop_getBonus_Leadership_Flat(scen, unit, gotGroup)
   local group, owner, ownerType, player, settings = Workshop_Info(unit, gotGroup)

   if settings == nil then
       return 0
   end

   local LeaderType = WorkshopEnum_getGroupLeaderType(group, owner, ownerType)

   local constantStatsBonus = settings:get_constantStatsBonus():get_Leadership_Flat()
   local yourTerrainStatsBonus = settings:get_yourTerrainStatsBonus():get_Leadership_Flat()
   local opponentTerrainStatsBonus = settings:get_opponentTerrainStatsBonus():get_Leadership_Flat()
   local neutralTerrainStatsBonus = settings:get_neutralTerrainStatsBonus():get_Leadership_Flat()
   local perLostHPStatsBonus = settings:get_perLostHPStatsBonus():get_Leadership_Flat()
   local perDifferentUnitStatsBonus = settings:get_perDifferentUnitStatsBonus():get_Leadership_Flat()
   local perIdenticalUnitStatsBonus = settings:get_perIdenticalUnitStatsBonus():get_Leadership_Flat()

   local constantStatsBonusLeaderType = 0
   local yourTerrainStatsBonusLeaderType = 0
   local opponentTerrainStatsBonusLeaderType = 0
   local neutralTerrainStatsBonusLeaderType = 0
   local perLostHPStatsBonusLeaderType = 0
   local perDifferentUnitStatsBonusLeaderType = 0
   local perIdenticalUnitStatsBonusLeaderType = 0

   if LeaderType ~= nil then
       constantStatsBonusLeaderType = settings:get_constantStatsBonus(LeaderType):get_Leadership_Flat()
       yourTerrainStatsBonusLeaderType = settings:get_yourTerrainStatsBonus(LeaderType):get_Leadership_Flat()
       opponentTerrainStatsBonusLeaderType = settings:get_opponentTerrainStatsBonus(LeaderType):get_Leadership_Flat()
       neutralTerrainStatsBonusLeaderType = settings:get_neutralTerrainStatsBonus(LeaderType):get_Leadership_Flat()
       perLostHPStatsBonusLeaderType = settings:get_perLostHPStatsBonus(LeaderType):get_Leadership_Flat()
       perDifferentUnitStatsBonusLeaderType = settings:get_perDifferentUnitStatsBonus(LeaderType):get_Leadership_Flat()
       perIdenticalUnitStatsBonusLeaderType = settings:get_perIdenticalUnitStatsBonus(LeaderType):get_Leadership_Flat()
   end

   return Workshop_GetBonusSum(scen, unit,
                               LeaderType,
                               group, owner, ownerType, player, settings,
                               constantStatsBonus, yourTerrainStatsBonus, opponentTerrainStatsBonus, neutralTerrainStatsBonus, perLostHPStatsBonus, perDifferentUnitStatsBonus, perIdenticalUnitStatsBonus, 
                               constantStatsBonusLeaderType, yourTerrainStatsBonusLeaderType, opponentTerrainStatsBonusLeaderType, neutralTerrainStatsBonusLeaderType, perLostHPStatsBonusLeaderType, perDifferentUnitStatsBonusLeaderType, perIdenticalUnitStatsBonusLeaderType)
end

function Workshop_getBonus_LowerCost_Flat(scen, unit, gotGroup)
   local group, owner, ownerType, player, settings = Workshop_Info(unit, gotGroup)

   if settings == nil then
       return 0
   end

   local LeaderType = WorkshopEnum_getGroupLeaderType(group, owner, ownerType)

   local constantStatsBonus = settings:get_constantStatsBonus():get_LowerCost_Flat()
   local yourTerrainStatsBonus = settings:get_yourTerrainStatsBonus():get_LowerCost_Flat()
   local opponentTerrainStatsBonus = settings:get_opponentTerrainStatsBonus():get_LowerCost_Flat()
   local neutralTerrainStatsBonus = settings:get_neutralTerrainStatsBonus():get_LowerCost_Flat()
   local perLostHPStatsBonus = settings:get_perLostHPStatsBonus():get_LowerCost_Flat()
   local perDifferentUnitStatsBonus = settings:get_perDifferentUnitStatsBonus():get_LowerCost_Flat()
   local perIdenticalUnitStatsBonus = settings:get_perIdenticalUnitStatsBonus():get_LowerCost_Flat()

   local constantStatsBonusLeaderType = 0
   local yourTerrainStatsBonusLeaderType = 0
   local opponentTerrainStatsBonusLeaderType = 0
   local neutralTerrainStatsBonusLeaderType = 0
   local perLostHPStatsBonusLeaderType = 0
   local perDifferentUnitStatsBonusLeaderType = 0
   local perIdenticalUnitStatsBonusLeaderType = 0

   if LeaderType ~= nil then
       constantStatsBonusLeaderType = settings:get_constantStatsBonus(LeaderType):get_LowerCost_Flat()
       yourTerrainStatsBonusLeaderType = settings:get_yourTerrainStatsBonus(LeaderType):get_LowerCost_Flat()
       opponentTerrainStatsBonusLeaderType = settings:get_opponentTerrainStatsBonus(LeaderType):get_LowerCost_Flat()
       neutralTerrainStatsBonusLeaderType = settings:get_neutralTerrainStatsBonus(LeaderType):get_LowerCost_Flat()
       perLostHPStatsBonusLeaderType = settings:get_perLostHPStatsBonus(LeaderType):get_LowerCost_Flat()
       perDifferentUnitStatsBonusLeaderType = settings:get_perDifferentUnitStatsBonus(LeaderType):get_LowerCost_Flat()
       perIdenticalUnitStatsBonusLeaderType = settings:get_perIdenticalUnitStatsBonus(LeaderType):get_LowerCost_Flat()
   end

   return Workshop_GetBonusSum(scen, unit,
                               LeaderType,
                               group, owner, ownerType, player, settings,
                               constantStatsBonus, yourTerrainStatsBonus, opponentTerrainStatsBonus, neutralTerrainStatsBonus, perLostHPStatsBonus, perDifferentUnitStatsBonus, perIdenticalUnitStatsBonus, 
                               constantStatsBonusLeaderType, yourTerrainStatsBonusLeaderType, opponentTerrainStatsBonusLeaderType, neutralTerrainStatsBonusLeaderType, perLostHPStatsBonusLeaderType, perDifferentUnitStatsBonusLeaderType, perIdenticalUnitStatsBonusLeaderType)
end

function Workshop_getBonus_ImmuneToSource_Once(scen, unit, typeKey, gotGroup)
   local group, owner, ownerType, player, settings = Workshop_Info(unit, gotGroup)

   if settings == nil then
       return 0
   end

   local LeaderType = WorkshopEnum_getGroupLeaderType(group, owner, ownerType)

   local constantStatsBonus = Workshop_getArrayValue(typeKey, settings:get_constantStatsBonus():get_ImmuneToSource_Once())
   local yourTerrainStatsBonus = Workshop_getArrayValue(typeKey, settings:get_yourTerrainStatsBonus():get_ImmuneToSource_Once())
   local opponentTerrainStatsBonus = Workshop_getArrayValue(typeKey, settings:get_opponentTerrainStatsBonus():get_ImmuneToSource_Once())
   local neutralTerrainStatsBonus = Workshop_getArrayValue(typeKey, settings:get_neutralTerrainStatsBonus():get_ImmuneToSource_Once())
   local perLostHPStatsBonus = Workshop_getArrayValue(typeKey, settings:get_perLostHPStatsBonus():get_ImmuneToSource_Once())
   local perDifferentUnitStatsBonus = Workshop_getArrayValue(typeKey, settings:get_perDifferentUnitStatsBonus():get_ImmuneToSource_Once())
   local perIdenticalUnitStatsBonus = Workshop_getArrayValue(typeKey, settings:get_perIdenticalUnitStatsBonus():get_ImmuneToSource_Once())

   local constantStatsBonusLeaderType = 0
   local yourTerrainStatsBonusLeaderType = 0
   local opponentTerrainStatsBonusLeaderType = 0
   local neutralTerrainStatsBonusLeaderType = 0
   local perLostHPStatsBonusLeaderType = 0
   local perDifferentUnitStatsBonusLeaderType = 0
   local perIdenticalUnitStatsBonusLeaderType = 0

   if LeaderType ~= nil then
       constantStatsBonusLeaderType = Workshop_getArrayValue(typeKey, settings:get_constantStatsBonus(LeaderType):get_ImmuneToSource_Once())
       yourTerrainStatsBonusLeaderType = Workshop_getArrayValue(typeKey, settings:get_yourTerrainStatsBonus(LeaderType):get_ImmuneToSource_Once())
       opponentTerrainStatsBonusLeaderType = Workshop_getArrayValue(typeKey, settings:get_opponentTerrainStatsBonus(LeaderType):get_ImmuneToSource_Once())
       neutralTerrainStatsBonusLeaderType = Workshop_getArrayValue(typeKey, settings:get_neutralTerrainStatsBonus(LeaderType):get_ImmuneToSource_Once())
       perLostHPStatsBonusLeaderType = Workshop_getArrayValue(typeKey, settings:get_perLostHPStatsBonus(LeaderType):get_ImmuneToSource_Once())
       perDifferentUnitStatsBonusLeaderType = Workshop_getArrayValue(typeKey, settings:get_perDifferentUnitStatsBonus(LeaderType):get_ImmuneToSource_Once())
       perIdenticalUnitStatsBonusLeaderType = Workshop_getArrayValue(typeKey, settings:get_perIdenticalUnitStatsBonus(LeaderType):get_ImmuneToSource_Once())
   end

   return Workshop_GetBonusSum(scen, unit,
                               LeaderType,
                               group, owner, ownerType, player, settings,
                               constantStatsBonus, yourTerrainStatsBonus, opponentTerrainStatsBonus, neutralTerrainStatsBonus, perLostHPStatsBonus, perDifferentUnitStatsBonus, perIdenticalUnitStatsBonus, 
                               constantStatsBonusLeaderType, yourTerrainStatsBonusLeaderType, opponentTerrainStatsBonusLeaderType, neutralTerrainStatsBonusLeaderType, perLostHPStatsBonusLeaderType, perDifferentUnitStatsBonusLeaderType, perIdenticalUnitStatsBonusLeaderType)
end

function Workshop_getBonus_ImmuneToSource_Always(scen, unit, typeKey, gotGroup)
   local group, owner, ownerType, player, settings = Workshop_Info(unit, gotGroup)

   if settings == nil then
       return 0
   end

   local LeaderType = WorkshopEnum_getGroupLeaderType(group, owner, ownerType)

   local constantStatsBonus = Workshop_getArrayValue(typeKey, settings:get_constantStatsBonus():get_ImmuneToSource_Always())
   local yourTerrainStatsBonus = Workshop_getArrayValue(typeKey, settings:get_yourTerrainStatsBonus():get_ImmuneToSource_Always())
   local opponentTerrainStatsBonus = Workshop_getArrayValue(typeKey, settings:get_opponentTerrainStatsBonus():get_ImmuneToSource_Always())
   local neutralTerrainStatsBonus = Workshop_getArrayValue(typeKey, settings:get_neutralTerrainStatsBonus():get_ImmuneToSource_Always())
   local perLostHPStatsBonus = Workshop_getArrayValue(typeKey, settings:get_perLostHPStatsBonus():get_ImmuneToSource_Always())
   local perDifferentUnitStatsBonus = Workshop_getArrayValue(typeKey, settings:get_perDifferentUnitStatsBonus():get_ImmuneToSource_Always())
   local perIdenticalUnitStatsBonus = Workshop_getArrayValue(typeKey, settings:get_perIdenticalUnitStatsBonus():get_ImmuneToSource_Always())

   local constantStatsBonusLeaderType = 0
   local yourTerrainStatsBonusLeaderType = 0
   local opponentTerrainStatsBonusLeaderType = 0
   local neutralTerrainStatsBonusLeaderType = 0
   local perLostHPStatsBonusLeaderType = 0
   local perDifferentUnitStatsBonusLeaderType = 0
   local perIdenticalUnitStatsBonusLeaderType = 0

   if LeaderType ~= nil then
       constantStatsBonusLeaderType = Workshop_getArrayValue(typeKey, settings:get_constantStatsBonus(LeaderType):get_ImmuneToSource_Always())
       yourTerrainStatsBonusLeaderType = Workshop_getArrayValue(typeKey, settings:get_yourTerrainStatsBonus(LeaderType):get_ImmuneToSource_Always())
       opponentTerrainStatsBonusLeaderType = Workshop_getArrayValue(typeKey, settings:get_opponentTerrainStatsBonus(LeaderType):get_ImmuneToSource_Always())
       neutralTerrainStatsBonusLeaderType = Workshop_getArrayValue(typeKey, settings:get_neutralTerrainStatsBonus(LeaderType):get_ImmuneToSource_Always())
       perLostHPStatsBonusLeaderType = Workshop_getArrayValue(typeKey, settings:get_perLostHPStatsBonus(LeaderType):get_ImmuneToSource_Always())
       perDifferentUnitStatsBonusLeaderType = Workshop_getArrayValue(typeKey, settings:get_perDifferentUnitStatsBonus(LeaderType):get_ImmuneToSource_Always())
       perIdenticalUnitStatsBonusLeaderType = Workshop_getArrayValue(typeKey, settings:get_perIdenticalUnitStatsBonus(LeaderType):get_ImmuneToSource_Always())
   end

   return Workshop_GetBonusSum(scen, unit,
                               LeaderType,
                               group, owner, ownerType, player, settings,
                               constantStatsBonus, yourTerrainStatsBonus, opponentTerrainStatsBonus, neutralTerrainStatsBonus, perLostHPStatsBonus, perDifferentUnitStatsBonus, perIdenticalUnitStatsBonus, 
                               constantStatsBonusLeaderType, yourTerrainStatsBonusLeaderType, opponentTerrainStatsBonusLeaderType, neutralTerrainStatsBonusLeaderType, perLostHPStatsBonusLeaderType, perDifferentUnitStatsBonusLeaderType, perIdenticalUnitStatsBonusLeaderType)
end

function Workshop_getBonus_ImmuneToAttack_Once(scen, unit, typeKey, gotGroup)
   local group, owner, ownerType, player, settings = Workshop_Info(unit, gotGroup)

   if settings == nil then
       return 0
   end

   local LeaderType = WorkshopEnum_getGroupLeaderType(group, owner, ownerType)

   local constantStatsBonus = Workshop_getArrayValue(typeKey, settings:get_constantStatsBonus():get_ImmuneToAttack_Once())
   local yourTerrainStatsBonus = Workshop_getArrayValue(typeKey, settings:get_yourTerrainStatsBonus():get_ImmuneToAttack_Once())
   local opponentTerrainStatsBonus = Workshop_getArrayValue(typeKey, settings:get_opponentTerrainStatsBonus():get_ImmuneToAttack_Once())
   local neutralTerrainStatsBonus = Workshop_getArrayValue(typeKey, settings:get_neutralTerrainStatsBonus():get_ImmuneToAttack_Once())
   local perLostHPStatsBonus = Workshop_getArrayValue(typeKey, settings:get_perLostHPStatsBonus():get_ImmuneToAttack_Once())
   local perDifferentUnitStatsBonus = Workshop_getArrayValue(typeKey, settings:get_perDifferentUnitStatsBonus():get_ImmuneToAttack_Once())
   local perIdenticalUnitStatsBonus = Workshop_getArrayValue(typeKey, settings:get_perIdenticalUnitStatsBonus():get_ImmuneToAttack_Once())

   local constantStatsBonusLeaderType = 0
   local yourTerrainStatsBonusLeaderType = 0
   local opponentTerrainStatsBonusLeaderType = 0
   local neutralTerrainStatsBonusLeaderType = 0
   local perLostHPStatsBonusLeaderType = 0
   local perDifferentUnitStatsBonusLeaderType = 0
   local perIdenticalUnitStatsBonusLeaderType = 0

   if LeaderType ~= nil then
       constantStatsBonusLeaderType = Workshop_getArrayValue(typeKey, settings:get_constantStatsBonus(LeaderType):get_ImmuneToAttack_Once())
       yourTerrainStatsBonusLeaderType = Workshop_getArrayValue(typeKey, settings:get_yourTerrainStatsBonus(LeaderType):get_ImmuneToAttack_Once())
       opponentTerrainStatsBonusLeaderType = Workshop_getArrayValue(typeKey, settings:get_opponentTerrainStatsBonus(LeaderType):get_ImmuneToAttack_Once())
       neutralTerrainStatsBonusLeaderType = Workshop_getArrayValue(typeKey, settings:get_neutralTerrainStatsBonus(LeaderType):get_ImmuneToAttack_Once())
       perLostHPStatsBonusLeaderType = Workshop_getArrayValue(typeKey, settings:get_perLostHPStatsBonus(LeaderType):get_ImmuneToAttack_Once())
       perDifferentUnitStatsBonusLeaderType = Workshop_getArrayValue(typeKey, settings:get_perDifferentUnitStatsBonus(LeaderType):get_ImmuneToAttack_Once())
       perIdenticalUnitStatsBonusLeaderType = Workshop_getArrayValue(typeKey, settings:get_perIdenticalUnitStatsBonus(LeaderType):get_ImmuneToAttack_Once())
   end

   return Workshop_GetBonusSum(scen, unit,
                               LeaderType,
                               group, owner, ownerType, player, settings,
                               constantStatsBonus, yourTerrainStatsBonus, opponentTerrainStatsBonus, neutralTerrainStatsBonus, perLostHPStatsBonus, perDifferentUnitStatsBonus, perIdenticalUnitStatsBonus, 
                               constantStatsBonusLeaderType, yourTerrainStatsBonusLeaderType, opponentTerrainStatsBonusLeaderType, neutralTerrainStatsBonusLeaderType, perLostHPStatsBonusLeaderType, perDifferentUnitStatsBonusLeaderType, perIdenticalUnitStatsBonusLeaderType)
end

function Workshop_getBonus_ImmuneToAttack_Always(scen, unit, typeKey, gotGroup)
   local group, owner, ownerType, player, settings = Workshop_Info(unit, gotGroup)

   if settings == nil then
       return 0
   end

   local LeaderType = WorkshopEnum_getGroupLeaderType(group, owner, ownerType)

   local constantStatsBonus = Workshop_getArrayValue(typeKey, settings:get_constantStatsBonus():get_ImmuneToAttack_Always())
   local yourTerrainStatsBonus = Workshop_getArrayValue(typeKey, settings:get_yourTerrainStatsBonus():get_ImmuneToAttack_Always())
   local opponentTerrainStatsBonus = Workshop_getArrayValue(typeKey, settings:get_opponentTerrainStatsBonus():get_ImmuneToAttack_Always())
   local neutralTerrainStatsBonus = Workshop_getArrayValue(typeKey, settings:get_neutralTerrainStatsBonus():get_ImmuneToAttack_Always())
   local perLostHPStatsBonus = Workshop_getArrayValue(typeKey, settings:get_perLostHPStatsBonus():get_ImmuneToAttack_Always())
   local perDifferentUnitStatsBonus = Workshop_getArrayValue(typeKey, settings:get_perDifferentUnitStatsBonus():get_ImmuneToAttack_Always())
   local perIdenticalUnitStatsBonus = Workshop_getArrayValue(typeKey, settings:get_perIdenticalUnitStatsBonus():get_ImmuneToAttack_Always())

   local constantStatsBonusLeaderType = 0
   local yourTerrainStatsBonusLeaderType = 0
   local opponentTerrainStatsBonusLeaderType = 0
   local neutralTerrainStatsBonusLeaderType = 0
   local perLostHPStatsBonusLeaderType = 0
   local perDifferentUnitStatsBonusLeaderType = 0
   local perIdenticalUnitStatsBonusLeaderType = 0

   if LeaderType ~= nil then
       constantStatsBonusLeaderType = Workshop_getArrayValue(typeKey, settings:get_constantStatsBonus(LeaderType):get_ImmuneToAttack_Always())
       yourTerrainStatsBonusLeaderType = Workshop_getArrayValue(typeKey, settings:get_yourTerrainStatsBonus(LeaderType):get_ImmuneToAttack_Always())
       opponentTerrainStatsBonusLeaderType = Workshop_getArrayValue(typeKey, settings:get_opponentTerrainStatsBonus(LeaderType):get_ImmuneToAttack_Always())
       neutralTerrainStatsBonusLeaderType = Workshop_getArrayValue(typeKey, settings:get_neutralTerrainStatsBonus(LeaderType):get_ImmuneToAttack_Always())
       perLostHPStatsBonusLeaderType = Workshop_getArrayValue(typeKey, settings:get_perLostHPStatsBonus(LeaderType):get_ImmuneToAttack_Always())
       perDifferentUnitStatsBonusLeaderType = Workshop_getArrayValue(typeKey, settings:get_perDifferentUnitStatsBonus(LeaderType):get_ImmuneToAttack_Always())
       perIdenticalUnitStatsBonusLeaderType = Workshop_getArrayValue(typeKey, settings:get_perIdenticalUnitStatsBonus(LeaderType):get_ImmuneToAttack_Always())
   end

   return Workshop_GetBonusSum(scen, unit,
                               LeaderType,
                               group, owner, ownerType, player, settings,
                               constantStatsBonus, yourTerrainStatsBonus, opponentTerrainStatsBonus, neutralTerrainStatsBonus, perLostHPStatsBonus, perDifferentUnitStatsBonus, perIdenticalUnitStatsBonus, 
                               constantStatsBonusLeaderType, yourTerrainStatsBonusLeaderType, opponentTerrainStatsBonusLeaderType, neutralTerrainStatsBonusLeaderType, perLostHPStatsBonusLeaderType, perDifferentUnitStatsBonusLeaderType, perIdenticalUnitStatsBonusLeaderType)
end

function Workshop_getBonus_LeaderAbility(scen, unit, typeKey, gotGroup)
   local group, owner, ownerType, player, settings = Workshop_Info(unit, gotGroup)

   if settings == nil then
       return 0
   end

   local LeaderType = WorkshopEnum_getGroupLeaderType(group, owner, ownerType)

   local constantStatsBonus = Workshop_getArrayValue(typeKey, settings:get_constantStatsBonus():get_LeaderAbility())
   local yourTerrainStatsBonus = Workshop_getArrayValue(typeKey, settings:get_yourTerrainStatsBonus():get_LeaderAbility())
   local opponentTerrainStatsBonus = Workshop_getArrayValue(typeKey, settings:get_opponentTerrainStatsBonus():get_LeaderAbility())
   local neutralTerrainStatsBonus = Workshop_getArrayValue(typeKey, settings:get_neutralTerrainStatsBonus():get_LeaderAbility())
   local perLostHPStatsBonus = Workshop_getArrayValue(typeKey, settings:get_perLostHPStatsBonus():get_LeaderAbility())
   local perDifferentUnitStatsBonus = Workshop_getArrayValue(typeKey, settings:get_perDifferentUnitStatsBonus():get_LeaderAbility())
   local perIdenticalUnitStatsBonus = Workshop_getArrayValue(typeKey, settings:get_perIdenticalUnitStatsBonus():get_LeaderAbility())

   local constantStatsBonusLeaderType = 0
   local yourTerrainStatsBonusLeaderType = 0
   local opponentTerrainStatsBonusLeaderType = 0
   local neutralTerrainStatsBonusLeaderType = 0
   local perLostHPStatsBonusLeaderType = 0
   local perDifferentUnitStatsBonusLeaderType = 0
   local perIdenticalUnitStatsBonusLeaderType = 0

   if LeaderType ~= nil then
       constantStatsBonusLeaderType = Workshop_getArrayValue(typeKey, settings:get_constantStatsBonus(LeaderType):get_LeaderAbility())
       yourTerrainStatsBonusLeaderType = Workshop_getArrayValue(typeKey, settings:get_yourTerrainStatsBonus(LeaderType):get_LeaderAbility())
       opponentTerrainStatsBonusLeaderType = Workshop_getArrayValue(typeKey, settings:get_opponentTerrainStatsBonus(LeaderType):get_LeaderAbility())
       neutralTerrainStatsBonusLeaderType = Workshop_getArrayValue(typeKey, settings:get_neutralTerrainStatsBonus(LeaderType):get_LeaderAbility())
       perLostHPStatsBonusLeaderType = Workshop_getArrayValue(typeKey, settings:get_perLostHPStatsBonus(LeaderType):get_LeaderAbility())
       perDifferentUnitStatsBonusLeaderType = Workshop_getArrayValue(typeKey, settings:get_perDifferentUnitStatsBonus(LeaderType):get_LeaderAbility())
       perIdenticalUnitStatsBonusLeaderType = Workshop_getArrayValue(typeKey, settings:get_perIdenticalUnitStatsBonus(LeaderType):get_LeaderAbility())
   end

   return Workshop_GetBonusSum(scen, unit,
                               LeaderType,
                               group, owner, ownerType, player, settings,
                               constantStatsBonus, yourTerrainStatsBonus, opponentTerrainStatsBonus, neutralTerrainStatsBonus, perLostHPStatsBonus, perDifferentUnitStatsBonus, perIdenticalUnitStatsBonus, 
                               constantStatsBonusLeaderType, yourTerrainStatsBonusLeaderType, opponentTerrainStatsBonusLeaderType, neutralTerrainStatsBonusLeaderType, perLostHPStatsBonusLeaderType, perDifferentUnitStatsBonusLeaderType, perIdenticalUnitStatsBonusLeaderType)
end

function Workshop_getBonus_MoveAbility(scen, unit, typeKey, gotGroup)
   local group, owner, ownerType, player, settings = Workshop_Info(unit, gotGroup)

   if settings == nil then
       return 0
   end

   local LeaderType = WorkshopEnum_getGroupLeaderType(group, owner, ownerType)

   local constantStatsBonus = Workshop_getArrayValue(typeKey, settings:get_constantStatsBonus():get_MoveAbility())
   local yourTerrainStatsBonus = Workshop_getArrayValue(typeKey, settings:get_yourTerrainStatsBonus():get_MoveAbility())
   local opponentTerrainStatsBonus = Workshop_getArrayValue(typeKey, settings:get_opponentTerrainStatsBonus():get_MoveAbility())
   local neutralTerrainStatsBonus = Workshop_getArrayValue(typeKey, settings:get_neutralTerrainStatsBonus():get_MoveAbility())
   local perLostHPStatsBonus = Workshop_getArrayValue(typeKey, settings:get_perLostHPStatsBonus():get_MoveAbility())
   local perDifferentUnitStatsBonus = Workshop_getArrayValue(typeKey, settings:get_perDifferentUnitStatsBonus():get_MoveAbility())
   local perIdenticalUnitStatsBonus = Workshop_getArrayValue(typeKey, settings:get_perIdenticalUnitStatsBonus():get_MoveAbility())

   local constantStatsBonusLeaderType = 0
   local yourTerrainStatsBonusLeaderType = 0
   local opponentTerrainStatsBonusLeaderType = 0
   local neutralTerrainStatsBonusLeaderType = 0
   local perLostHPStatsBonusLeaderType = 0
   local perDifferentUnitStatsBonusLeaderType = 0
   local perIdenticalUnitStatsBonusLeaderType = 0

   if LeaderType ~= nil then
       constantStatsBonusLeaderType = Workshop_getArrayValue(typeKey, settings:get_constantStatsBonus(LeaderType):get_MoveAbility())
       yourTerrainStatsBonusLeaderType = Workshop_getArrayValue(typeKey, settings:get_yourTerrainStatsBonus(LeaderType):get_MoveAbility())
       opponentTerrainStatsBonusLeaderType = Workshop_getArrayValue(typeKey, settings:get_opponentTerrainStatsBonus(LeaderType):get_MoveAbility())
       neutralTerrainStatsBonusLeaderType = Workshop_getArrayValue(typeKey, settings:get_neutralTerrainStatsBonus(LeaderType):get_MoveAbility())
       perLostHPStatsBonusLeaderType = Workshop_getArrayValue(typeKey, settings:get_perLostHPStatsBonus(LeaderType):get_MoveAbility())
       perDifferentUnitStatsBonusLeaderType = Workshop_getArrayValue(typeKey, settings:get_perDifferentUnitStatsBonus(LeaderType):get_MoveAbility())
       perIdenticalUnitStatsBonusLeaderType = Workshop_getArrayValue(typeKey, settings:get_perIdenticalUnitStatsBonus(LeaderType):get_MoveAbility())
   end

   return Workshop_GetBonusSum(scen, unit,
                               LeaderType,
                               group, owner, ownerType, player, settings,
                               constantStatsBonus, yourTerrainStatsBonus, opponentTerrainStatsBonus, neutralTerrainStatsBonus, perLostHPStatsBonus, perDifferentUnitStatsBonus, perIdenticalUnitStatsBonus, 
                               constantStatsBonusLeaderType, yourTerrainStatsBonusLeaderType, opponentTerrainStatsBonusLeaderType, neutralTerrainStatsBonusLeaderType, perLostHPStatsBonusLeaderType, perDifferentUnitStatsBonusLeaderType, perIdenticalUnitStatsBonusLeaderType)
end

function Workshop_getBonus_FastRetreat(scen, unit, gotGroup)
   local group, owner, ownerType, player, settings = Workshop_Info(unit, gotGroup)

   if settings == nil then
       return 0
   end

   local LeaderType = WorkshopEnum_getGroupLeaderType(group, owner, ownerType)

   local constantStatsBonus = settings:get_constantStatsBonus():get_FastRetreat()
   local yourTerrainStatsBonus = settings:get_yourTerrainStatsBonus():get_FastRetreat()
   local opponentTerrainStatsBonus = settings:get_opponentTerrainStatsBonus():get_FastRetreat()
   local neutralTerrainStatsBonus = settings:get_neutralTerrainStatsBonus():get_FastRetreat()
   local perLostHPStatsBonus = settings:get_perLostHPStatsBonus():get_FastRetreat()
   local perDifferentUnitStatsBonus = settings:get_perDifferentUnitStatsBonus():get_FastRetreat()
   local perIdenticalUnitStatsBonus = settings:get_perIdenticalUnitStatsBonus():get_FastRetreat()

   local constantStatsBonusLeaderType = 0
   local yourTerrainStatsBonusLeaderType = 0
   local opponentTerrainStatsBonusLeaderType = 0
   local neutralTerrainStatsBonusLeaderType = 0
   local perLostHPStatsBonusLeaderType = 0
   local perDifferentUnitStatsBonusLeaderType = 0
   local perIdenticalUnitStatsBonusLeaderType = 0

   if LeaderType ~= nil then
       constantStatsBonusLeaderType = settings:get_constantStatsBonus(LeaderType):get_FastRetreat()
       yourTerrainStatsBonusLeaderType = settings:get_yourTerrainStatsBonus(LeaderType):get_FastRetreat()
       opponentTerrainStatsBonusLeaderType = settings:get_opponentTerrainStatsBonus(LeaderType):get_FastRetreat()
       neutralTerrainStatsBonusLeaderType = settings:get_neutralTerrainStatsBonus(LeaderType):get_FastRetreat()
       perLostHPStatsBonusLeaderType = settings:get_perLostHPStatsBonus(LeaderType):get_FastRetreat()
       perDifferentUnitStatsBonusLeaderType = settings:get_perDifferentUnitStatsBonus(LeaderType):get_FastRetreat()
       perIdenticalUnitStatsBonusLeaderType = settings:get_perIdenticalUnitStatsBonus(LeaderType):get_FastRetreat()
   end

   return Workshop_GetBonusSum(scen, unit,
                               LeaderType,
                               group, owner, ownerType, player, settings,
                               constantStatsBonus, yourTerrainStatsBonus, opponentTerrainStatsBonus, neutralTerrainStatsBonus, perLostHPStatsBonus, perDifferentUnitStatsBonus, perIdenticalUnitStatsBonus, 
                               constantStatsBonusLeaderType, yourTerrainStatsBonusLeaderType, opponentTerrainStatsBonusLeaderType, neutralTerrainStatsBonusLeaderType, perLostHPStatsBonusLeaderType, perDifferentUnitStatsBonusLeaderType, perIdenticalUnitStatsBonusLeaderType)
end

