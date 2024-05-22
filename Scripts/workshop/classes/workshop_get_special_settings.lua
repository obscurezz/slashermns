-- ¬ ›“ŒÃ ‘¿…À≈ Õ»◊≈√Œ “–Œ√¿“‹ Õ≈ Õ”∆ÕŒ
-- ÒÏÓÚË ‚ workshop_commonlib.lua

require('workshop_commonlib')
require('workshop_get_bonus')
require('workshop_special_settings_class')
require('statscheck')

function Workshop_getSpecial_getData(scen, unit, gotGroup)
   local group, owner, ownerType, player, settings = Workshop_Info(unit, gotGroup)
   local leaderType
   if settings ~= nil then
       leaderType = WorkshopEnum_getGroupLeaderType(group, owner, ownerType)
   end
   return group, owner, ownerType, player, settings, leaderType
end

------------------------------------------------
------------------------------------------------
------------------------------------------------

function Workshop_getSpecial_damageUnitsRangeRestriction(settings, leaderType)
   if settings == nil then
       return WorkshopSpecialSettings_default_damageUnitsRangeRestriction()
   end
   local specialLeaderType = settings:get_specialSettings(LeaderType):get_damageUnitsRangeRestriction()
   if specialLeaderType ~= nil then
       return specialLeaderType
   end
   local specialAll = settings:get_specialSettings():get_damageUnitsRangeRestriction()
   if specialAll ~= nil then
       return specialAll
   end
   return WorkshopSpecialSettings_default_damageUnitsRangeRestriction()
end

function Workshop_getSpecial_neutralsSelectTargetsRandomly(settings, leaderType)
   if settings == nil then
       return WorkshopSpecialSettings_default_neutralsSelectTargetsRandomly()
   end
   local specialLeaderType = settings:get_specialSettings(LeaderType):get_neutralsSelectTargetsRandomly()
   if specialLeaderType ~= nil then
       return specialLeaderType
   end
   local specialAll = settings:get_specialSettings():get_neutralsSelectTargetsRandomly()
   if specialAll ~= nil then
       return specialAll
   end
   return WorkshopSpecialSettings_default_neutralsSelectTargetsRandomly()
end

function Workshop_getSpecial_damageSpreadMode(settings, leaderType)
   if settings == nil then
       return WorkshopSpecialSettings_default_damageSpreadMode()
   end
   local specialLeaderType = settings:get_specialSettings(LeaderType):get_damageSpreadMode()
   if specialLeaderType ~= nil then
       return specialLeaderType
   end
   local specialAll = settings:get_specialSettings():get_damageSpreadMode()
   if specialAll ~= nil then
       return specialAll
   end
   return WorkshopSpecialSettings_default_damageSpreadMode()
end

function Workshop_getSpecial_damageSpreadApplyPower(settings, leaderType)
   if settings == nil then
       return WorkshopSpecialSettings_default_damageSpreadApplyPower()
   end
   local specialLeaderType = settings:get_specialSettings(LeaderType):get_damageSpreadApplyPower()
   if specialLeaderType ~= nil then
       return specialLeaderType
   end
   local specialAll = settings:get_specialSettings():get_damageSpreadApplyPower()
   if specialAll ~= nil then
       return specialAll
   end
   return WorkshopSpecialSettings_default_damageSpreadApplyPower()
end

function Workshop_getSpecial_damageSpreadUpperMulti(settings, leaderType)
   if settings == nil then
       return WorkshopSpecialSettings_default_damageSpreadUpperMulti()
   end
   local specialLeaderType = settings:get_specialSettings(LeaderType):get_damageSpreadUpperMulti()
   if specialLeaderType ~= nil then
       return specialLeaderType
   end
   local specialAll = settings:get_specialSettings():get_damageSpreadUpperMulti()
   if specialAll ~= nil then
       return specialAll
   end
   return WorkshopSpecialSettings_default_damageSpreadUpperMulti()
end

function Workshop_getSpecial_damageSpreadLowerMulti(settings, leaderType)
   if settings == nil then
       return WorkshopSpecialSettings_default_damageSpreadLowerMulti()
   end
   local specialLeaderType = settings:get_specialSettings(LeaderType):get_damageSpreadLowerMulti()
   if specialLeaderType ~= nil then
       return specialLeaderType
   end
   local specialAll = settings:get_specialSettings():get_damageSpreadLowerMulti()
   if specialAll ~= nil then
       return specialAll
   end
   return WorkshopSpecialSettings_default_damageSpreadLowerMulti()
end

function Workshop_getSpecial_healSpreadMode(settings, leaderType)
   if settings == nil then
       return WorkshopSpecialSettings_default_healSpreadMode()
   end
   local specialLeaderType = settings:get_specialSettings(LeaderType):get_healSpreadMode()
   if specialLeaderType ~= nil then
       return specialLeaderType
   end
   local specialAll = settings:get_specialSettings():get_healSpreadMode()
   if specialAll ~= nil then
       return specialAll
   end
   return WorkshopSpecialSettings_default_healSpreadMode()
end

function Workshop_getSpecial_healSpreadUpperMulti(settings, leaderType)
   if settings == nil then
       return WorkshopSpecialSettings_default_healSpreadUpperMulti()
   end
   local specialLeaderType = settings:get_specialSettings(LeaderType):get_healSpreadUpperMulti()
   if specialLeaderType ~= nil then
       return specialLeaderType
   end
   local specialAll = settings:get_specialSettings():get_healSpreadUpperMulti()
   if specialAll ~= nil then
       return specialAll
   end
   return WorkshopSpecialSettings_default_healSpreadUpperMulti()
end

function Workshop_getSpecial_healSpreadLowerMulti(settings, leaderType)
   if settings == nil then
       return WorkshopSpecialSettings_default_healSpreadLowerMulti()
   end
   local specialLeaderType = settings:get_specialSettings(LeaderType):get_healSpreadLowerMulti()
   if specialLeaderType ~= nil then
       return specialLeaderType
   end
   local specialAll = settings:get_specialSettings():get_healSpreadLowerMulti()
   if specialAll ~= nil then
       return specialAll
   end
   return WorkshopSpecialSettings_default_healSpreadLowerMulti()
end

function Workshop_getSpecial_healHitChance(settings, leaderType)
   if settings == nil then
       return WorkshopSpecialSettings_default_healHitChance()
   end
   local specialLeaderType = settings:get_specialSettings(LeaderType):get_healHitChance()
   if specialLeaderType ~= nil then
       return specialLeaderType
   end
   local specialAll = settings:get_specialSettings():get_healHitChance()
   if specialAll ~= nil then
       return specialAll
   end
   return WorkshopSpecialSettings_default_healHitChance()
end

function Workshop_getSpecial_healMissMulti(settings, leaderType)
   if settings == nil then
       return WorkshopSpecialSettings_default_healMissMulti()
   end
   local specialLeaderType = settings:get_specialSettings(LeaderType):get_healMissMulti()
   if specialLeaderType ~= nil then
       return specialLeaderType
   end
   local specialAll = settings:get_specialSettings():get_healMissMulti()
   if specialAll ~= nil then
       return specialAll
   end
   return WorkshopSpecialSettings_default_healMissMulti()
end

function Workshop_getSpecial_playersBuffersAreDebuffers(settings, leaderType)
   if settings == nil then
       return WorkshopSpecialSettings_default_playersBuffersAreDebuffers()
   end
   local specialLeaderType = settings:get_specialSettings(LeaderType):get_playersBuffersAreDebuffers()
   if specialLeaderType ~= nil then
       return specialLeaderType
   end
   local specialAll = settings:get_specialSettings():get_playersBuffersAreDebuffers()
   if specialAll ~= nil then
       return specialAll
   end
   return WorkshopSpecialSettings_default_playersBuffersAreDebuffers()
end

function Workshop_getSpecial_playersDebuffersAreBuffers(settings, leaderType)
   if settings == nil then
       return WorkshopSpecialSettings_default_playersDebuffersAreBuffers()
   end
   local specialLeaderType = settings:get_specialSettings(LeaderType):get_playersDebuffersAreBuffers()
   if specialLeaderType ~= nil then
       return specialLeaderType
   end
   local specialAll = settings:get_specialSettings():get_playersDebuffersAreBuffers()
   if specialAll ~= nil then
       return specialAll
   end
   return WorkshopSpecialSettings_default_playersDebuffersAreBuffers()
end
