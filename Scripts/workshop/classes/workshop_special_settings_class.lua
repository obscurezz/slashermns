-- ¬ ›“ŒÃ ‘¿…À≈ Õ»◊≈√Œ “–Œ√¿“‹ Õ≈ Õ”∆ÕŒ
-- ÒÏÓÚË ‚ workshop_commonlib.lua

require('workshop_enums')

-- Meta class

WorkshopSpecialSettings = {damageUnitsRangeRestriction = nil, 
                           neutralsSelectTargetsRandomly = nil, 
                           damageSpreadMode = nil, 
                           damageSpreadApplyPower = nil, 
                           damageSpreadUpperMulti = nil, 
                           damageSpreadLowerMulti = nil, 
                           healSpreadMode = nil, 
                           healSpreadUpperMulti = nil, 
                           healSpreadLowerMulti = nil, 
                           healHitChance = nil, 
                           healMissMulti = nil, 
                           playersBuffersAreDebuffers = nil, 
                           playersDebuffersAreBuffers = nil} 

-- Derived class method new

function WorkshopSpecialSettings:new(obj)
   obj = obj or {}
   setmetatable(obj, self)
   self.__index = self
   return obj
end

-- Derived class methods

function WorkshopSpecialSettings:get_damageUnitsRangeRestriction()
   return self.damageUnitsRangeRestriction
end
function WorkshopSpecialSettings:set_damageUnitsRangeRestriction(value)
   self.damageUnitsRangeRestriction = value
end
function WorkshopSpecialSettings_default_damageUnitsRangeRestriction()
   return RangeRestriction.NoRestriction
end

function WorkshopSpecialSettings:get_neutralsSelectTargetsRandomly()
   return self.neutralsSelectTargetsRandomly
end
function WorkshopSpecialSettings:set_neutralsSelectTargetsRandomly(value)
   self.neutralsSelectTargetsRandomly = value
end
function WorkshopSpecialSettings_default_neutralsSelectTargetsRandomly()
   return false
end

function WorkshopSpecialSettings:get_damageSpreadMode()
   return self.damageSpreadMode
end
function WorkshopSpecialSettings:set_damageSpreadMode(value)
   self.damageSpreadMode = value
end
function WorkshopSpecialSettings_default_damageSpreadMode()
   return SpreadMode.NoSpread
end

function WorkshopSpecialSettings:get_damageSpreadApplyPower()
   return self.damageSpreadApplyPower
end
function WorkshopSpecialSettings:set_damageSpreadApplyPower(value)
   self.damageSpreadApplyPower = value
end
function WorkshopSpecialSettings_default_damageSpreadApplyPower()
   return true
end

function WorkshopSpecialSettings:get_damageSpreadUpperMulti()
   return self.damageSpreadUpperMulti
end
function WorkshopSpecialSettings:set_damageSpreadUpperMulti(value)
   self.damageSpreadUpperMulti = value
end
function WorkshopSpecialSettings_default_damageSpreadUpperMulti()
   return 1.0
end

function WorkshopSpecialSettings:get_damageSpreadLowerMulti()
   return self.damageSpreadLowerMulti
end
function WorkshopSpecialSettings:set_damageSpreadLowerMulti(value)
   self.damageSpreadLowerMulti = value
end
function WorkshopSpecialSettings_default_damageSpreadLowerMulti()
   return 1.0
end

function WorkshopSpecialSettings:get_healSpreadMode()
   return self.healSpreadMode
end
function WorkshopSpecialSettings:set_healSpreadMode(value)
   self.healSpreadMode = value
end
function WorkshopSpecialSettings_default_healSpreadMode()
   return SpreadMode.NoSpread
end

function WorkshopSpecialSettings:get_healSpreadUpperMulti()
   return self.healSpreadUpperMulti
end
function WorkshopSpecialSettings:set_healSpreadUpperMulti(value)
   self.healSpreadUpperMulti = value
end
function WorkshopSpecialSettings_default_healSpreadUpperMulti()
   return 0.2
end

function WorkshopSpecialSettings:get_healSpreadLowerMulti()
   return self.healSpreadLowerMulti
end
function WorkshopSpecialSettings:set_healSpreadLowerMulti(value)
   self.healSpreadLowerMulti = value
end
function WorkshopSpecialSettings_default_healSpreadLowerMulti()
   return 0.2
end

function WorkshopSpecialSettings:get_healHitChance()
   return self.healHitChance
end
function WorkshopSpecialSettings:set_healHitChance(value)
   self.healHitChance = value
end
function WorkshopSpecialSettings_default_healHitChance()
   return 100
end

function WorkshopSpecialSettings:get_healMissMulti()
   return self.healMissMulti
end
function WorkshopSpecialSettings:set_healMissMulti(value)
   self.healMissMulti = value
end
function WorkshopSpecialSettings_default_healMissMulti()
   return 0.0
end

function WorkshopSpecialSettings:get_playersBuffersAreDebuffers()
   return self.playersBuffersAreDebuffers
end
function WorkshopSpecialSettings:set_playersBuffersAreDebuffers(value)
   self.playersBuffersAreDebuffers = value
end
function WorkshopSpecialSettings_default_playersBuffersAreDebuffers()
   return false
end

function WorkshopSpecialSettings:get_playersDebuffersAreBuffers()
   return self.playersDebuffersAreBuffers
end
function WorkshopSpecialSettings:set_playersDebuffersAreBuffers(value)
   self.playersDebuffersAreBuffers = value
end
function WorkshopSpecialSettings_default_playersDebuffersAreBuffers()
   return false
end
