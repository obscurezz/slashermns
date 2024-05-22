-- ¬ ›“ŒÃ ‘¿…À≈ Õ»◊≈√Œ “–Œ√¿“‹ Õ≈ Õ”∆ÕŒ
-- ÒÏÓÚË ‚ workshop_commonlib.lua

require('workshop_unit_stats_settings_class')
require('workshop_special_settings_class')
require('workshop_enums')

-- Meta class

local defaultUnitType = GroupLeaderType.Any

WorkshopPlayer = {race = nil,
		  opponentTerrain = {}, 
		  neutralTerrain = {},  
		  constantStatsBonus = nil, 
		  yourTerrainStatsBonus = nil, 
		  opponentTerrainStatsBonus = nil, 
		  neutralTerrainStatsBonus = nil, 
		  perLostHPStatsBonus = nil, 
		  perDifferentUnitStatsBonus = nil, 
		  perIdenticalUnitStatsBonus = nil, 
		  specialSettings = nil}

-- Derived class method new

function WorkshopPlayer:new(obj)
   obj = obj or {}
   setmetatable(obj, self)
   self.__index = self
   return obj
end
function WorkshopPlayer:init()
   self.constantStatsBonus = WorkshopPlayer_GenCatSettings(1)
   self.yourTerrainStatsBonus = WorkshopPlayer_GenCatSettings(1)
   self.opponentTerrainStatsBonus = WorkshopPlayer_GenCatSettings(1)
   self.neutralTerrainStatsBonus = WorkshopPlayer_GenCatSettings(1)
   self.perLostHPStatsBonus = WorkshopPlayer_GenCatSettings(1)
   self.perDifferentUnitStatsBonus = WorkshopPlayer_GenCatSettings(1)
   self.perIdenticalUnitStatsBonus = WorkshopPlayer_GenCatSettings(1)
   self.specialSettings = WorkshopPlayer_GenCatSettings(2)
end
function WorkshopPlayer_GenCatSettings(settingsType)
   local result = {}
   for i,v in ipairs(GroupLeaderTypeArray) do
   	if settingsType == 1 then
   		result[v] = WorkshopStatsSettings:new(nil)
   	elseif settingsType == 2 then
   		result[v] = WorkshopSpecialSettings:new(nil)
   	else
   		result = nil
   	end
   end
   return result
end

-- Derived class methods

function WorkshopPlayer:get_race()
   return self.race
end
function WorkshopPlayer:set_race(value)
   self.race = value
end

function WorkshopPlayer:get_opponentTerrain()
   return self.opponentTerrain
end
function WorkshopPlayer:set_opponentTerrain(value)
   self.opponentTerrain = {}
   if value ~= nil then
   	for i=1, #value do
   		self.opponentTerrain[value[i]] = 1
   	end
   end
end

function WorkshopPlayer:get_neutralTerrain()
   return self.neutralTerrain
end
function WorkshopPlayer:set_neutralTerrain(value)
   self.neutralTerrain = {}
   if value ~= nil then
   	for i=1, #value do
   		self.neutralTerrain[value[i]] = 1
   	end
   end
end

function WorkshopPlayer:get_constantStatsBonus(unitType)
   if unitType == nil then
   	unitType = defaultUnitType
   end
   return self.constantStatsBonus[unitType]
end
function WorkshopPlayer:set_constantStatsBonus(value, unitType)
   if unitType == nil then
   	unitType = defaultUnitType
   end
   self.constantStatsBonus[unitType] = value
end

function WorkshopPlayer:get_yourTerrainStatsBonus(unitType)
   if unitType == nil then
   	unitType = defaultUnitType
   end
   return self.yourTerrainStatsBonus[unitType]
end
function WorkshopPlayer:set_yourTerrainStatsBonus(value, unitType)
   if unitType == nil then
   	unitType = defaultUnitType
   end
   self.yourTerrainStatsBonus[unitType] = value
end

function WorkshopPlayer:get_opponentTerrainStatsBonus(unitType)
   if unitType == nil then
   	unitType = defaultUnitType
   end
   return self.opponentTerrainStatsBonus[unitType]
end
function WorkshopPlayer:set_opponentTerrainStatsBonus(value, unitType)
   if unitType == nil then
   	unitType = defaultUnitType
   end
   self.opponentTerrainStatsBonus[unitType] = value
end

function WorkshopPlayer:get_neutralTerrainStatsBonus(unitType)
   if unitType == nil then
   	unitType = defaultUnitType
   end
   return self.neutralTerrainStatsBonus[unitType]
end
function WorkshopPlayer:set_neutralTerrainStatsBonus(value, unitType)
   if unitType == nil then
   	unitType = defaultUnitType
   end
   self.neutralTerrainStatsBonus[unitType] = value
end

function WorkshopPlayer:get_perLostHPStatsBonus(unitType)
   if unitType == nil then
   	unitType = defaultUnitType
   end
   return self.perLostHPStatsBonus[unitType]
end
function WorkshopPlayer:set_perLostHPStatsBonus(value, unitType)
   if unitType == nil then
   	unitType = defaultUnitType
   end
   self.perLostHPStatsBonus[unitType] = value
end

function WorkshopPlayer:get_perDifferentUnitStatsBonus(unitType)
   if unitType == nil then
   	unitType = defaultUnitType
   end
   return self.perDifferentUnitStatsBonus[unitType]
end
function WorkshopPlayer:set_perDifferentUnitStatsBonus(value, unitType)
   if unitType == nil then
   	unitType = defaultUnitType
   end
   self.perDifferentUnitStatsBonus[unitType] = value
end

function WorkshopPlayer:get_perIdenticalUnitStatsBonus(unitType)
   if unitType == nil then
   	unitType = defaultUnitType
   end
   return self.perIdenticalUnitStatsBonus[unitType]
end
function WorkshopPlayer:set_perIdenticalUnitStatsBonus(value, unitType)
   if unitType == nil then
   	unitType = defaultUnitType
   end
   self.perIdenticalUnitStatsBonus[unitType] = value
end

function WorkshopPlayer:get_specialSettings(unitType)
   if unitType == nil then
   	unitType = defaultUnitType
   end
   return self.specialSettings[unitType]
end
function WorkshopPlayer:set_specialSettings(value, unitType)
   if unitType == nil then
   	unitType = defaultUnitType
   end
   self.specialSettings[unitType] = value
end
