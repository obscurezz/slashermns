-- ¬ ›“ŒÃ ‘¿…À≈ Õ»◊≈√Œ “–Œ√¿“‹ Õ≈ Õ”∆ÕŒ
-- ÒÏÓÚË ‚ workshop_commonlib.lua

-- Meta class

WorkshopStatsSettings = {baseHitPoint_Percent = 0, 
                         baseAttack1Power_Percent = 0, 
                         baseAttack2Power_Percent = 0, 
                         baseAttack1Damage_Percent = 0, 
                         baseAttack2Damage_Percent = 0, 
                         baseAttack1Heal_Percent = 0, 
                         baseAttack2Heal_Percent = 0, 
                         baseAttackInitiative_Percent = 0, 
                         baseRegen_Flat = 0, 
                         baseArmor_Flat = 0, 
                         baseNegotiate_Flat = 0, 
                         XpGain_Percent = 0, 
                         Movement_Percent = 0, 
                         Movement_Flat = 0, 
                         Attack1CritDamage_Flat = 0, 
                         Attack2CritDamage_Flat = 0, 
                         Attack1CritPower_Flat = 0, 
                         Attack2CritPower_Flat = 0, 
                         Attack1Drain_Flat = 0, 
                         Attack2Drain_Flat = 0, 
                         Scout_Flat = 0, 
                         Leadership_Flat = 0, 
                         LowerCost_Flat = 0, 
                         ImmuneToSource_Once = {}, 
                         ImmuneToSource_Always = {}, 
                         ImmuneToAttack_Once = {}, 
                         ImmuneToAttack_Always = {}, 
                         LeaderAbility = {}, 
                         MoveAbility = {}, 
                         FastRetreat = 0}

-- Derived class method new

function WorkshopStatsSettings:new(obj)
   obj = obj or {}
   setmetatable(obj, self)
   self.__index = self
   return obj
end

-- Derived class methods

function WorkshopStatsSettings:get_baseHitPoint_Percent()
   return self.baseHitPoint_Percent
end
function WorkshopStatsSettings:set_baseHitPoint_Percent(value)
   self.baseHitPoint_Percent = value
end

function WorkshopStatsSettings:get_baseAttack1Power_Percent()
   return self.baseAttack1Power_Percent
end
function WorkshopStatsSettings:set_baseAttack1Power_Percent(value)
   self.baseAttack1Power_Percent = value
end

function WorkshopStatsSettings:get_baseAttack2Power_Percent()
   return self.baseAttack2Power_Percent
end
function WorkshopStatsSettings:set_baseAttack2Power_Percent(value)
   self.baseAttack2Power_Percent = value
end

function WorkshopStatsSettings:get_baseAttack1Damage_Percent()
   return self.baseAttack1Damage_Percent
end
function WorkshopStatsSettings:set_baseAttack1Damage_Percent(value)
   self.baseAttack1Damage_Percent = value
end

function WorkshopStatsSettings:get_baseAttack2Damage_Percent()
   return self.baseAttack2Damage_Percent
end
function WorkshopStatsSettings:set_baseAttack2Damage_Percent(value)
   self.baseAttack2Damage_Percent = value
end

function WorkshopStatsSettings:get_baseAttack1Heal_Percent()
   return self.baseAttack1Heal_Percent
end
function WorkshopStatsSettings:set_baseAttack1Heal_Percent(value)
   self.baseAttack1Heal_Percent = value
end

function WorkshopStatsSettings:get_baseAttack2Heal_Percent()
   return self.baseAttack2Heal_Percent
end
function WorkshopStatsSettings:set_baseAttack2Heal_Percent(value)
   self.baseAttack2Heal_Percent = value
end

function WorkshopStatsSettings:get_baseAttackInitiative_Percent()
   return self.baseAttackInitiative_Percent
end
function WorkshopStatsSettings:set_baseAttackInitiative_Percent(value)
   self.baseAttackInitiative_Percent = value
end

function WorkshopStatsSettings:get_baseRegen_Flat()
   return self.baseRegen_Flat
end
function WorkshopStatsSettings:set_baseRegen_Flat(value)
   self.baseRegen_Flat = value
end

function WorkshopStatsSettings:get_baseArmor_Flat()
   return self.baseArmor_Flat
end
function WorkshopStatsSettings:set_baseArmor_Flat(value)
   self.baseArmor_Flat = value
end

function WorkshopStatsSettings:get_baseNegotiate_Flat()
   return self.baseNegotiate_Flat
end
function WorkshopStatsSettings:set_baseNegotiate_Flat(value)
   self.baseNegotiate_Flat = value
end

function WorkshopStatsSettings:get_XpGain_Percent()
   return self.XpGain_Percent
end
function WorkshopStatsSettings:set_XpGain_Percent(value)
   self.XpGain_Percent = value
end

function WorkshopStatsSettings:get_Movement_Percent()
   return self.Movement_Percent
end
function WorkshopStatsSettings:set_Movement_Percent(value)
   self.Movement_Percent = value
end

function WorkshopStatsSettings:get_Movement_Flat()
   return self.Movement_Flat
end
function WorkshopStatsSettings:set_Movement_Flat(value)
   self.Movement_Flat = value
end

function WorkshopStatsSettings:get_Attack1CritDamage_Flat()
   return self.Attack1CritDamage_Flat
end
function WorkshopStatsSettings:set_Attack1CritDamage_Flat(value)
   self.Attack1CritDamage_Flat = value
end

function WorkshopStatsSettings:get_Attack2CritDamage_Flat()
   return self.Attack2CritDamage_Flat
end
function WorkshopStatsSettings:set_Attack2CritDamage_Flat(value)
   self.Attack2CritDamage_Flat = value
end

function WorkshopStatsSettings:get_Attack1CritPower_Flat()
   return self.Attack1CritPower_Flat
end
function WorkshopStatsSettings:set_Attack1CritPower_Flat(value)
   self.Attack1CritPower_Flat = value
end

function WorkshopStatsSettings:get_Attack2CritPower_Flat()
   return self.Attack2CritPower_Flat
end
function WorkshopStatsSettings:set_Attack2CritPower_Flat(value)
   self.Attack2CritPower_Flat = value
end

function WorkshopStatsSettings:get_Attack1Drain_Flat()
   return self.Attack1Drain_Flat
end
function WorkshopStatsSettings:set_Attack1Drain_Flat(value)
   self.Attack1Drain_Flat = value
end

function WorkshopStatsSettings:get_Attack2Drain_Flat()
   return self.Attack2Drain_Flat
end
function WorkshopStatsSettings:set_Attack2Drain_Flat(value)
   self.Attack2Drain_Flat = value
end

function WorkshopStatsSettings:get_Scout_Flat()
   return self.Scout_Flat
end
function WorkshopStatsSettings:set_Scout_Flat(value)
   self.Scout_Flat = value
end

function WorkshopStatsSettings:get_Leadership_Flat()
   return self.Leadership_Flat
end
function WorkshopStatsSettings:set_Leadership_Flat(value)
   self.Leadership_Flat = value
end

function WorkshopStatsSettings:get_LowerCost_Flat()
   return self.LowerCost_Flat
end
function WorkshopStatsSettings:set_LowerCost_Flat(value)
   self.LowerCost_Flat = value
end

function WorkshopStatsSettings:get_ImmuneToSource_Once()
   return self.ImmuneToSource_Once
end
function WorkshopStatsSettings:set_ImmuneToSource_Once(value)
   self.ImmuneToSource_Once = value
end

function WorkshopStatsSettings:get_ImmuneToSource_Always()
   return self.ImmuneToSource_Always
end
function WorkshopStatsSettings:set_ImmuneToSource_Always(value)
   self.ImmuneToSource_Always = value
end

function WorkshopStatsSettings:get_ImmuneToAttack_Once()
   return self.ImmuneToAttack_Once
end
function WorkshopStatsSettings:set_ImmuneToAttack_Once(value)
   self.ImmuneToAttack_Once = value
end

function WorkshopStatsSettings:get_ImmuneToAttack_Always()
   return self.ImmuneToAttack_Always
end
function WorkshopStatsSettings:set_ImmuneToAttack_Always(value)
   self.ImmuneToAttack_Always = value
end

function WorkshopStatsSettings:get_LeaderAbility()
   return self.LeaderAbility
end
function WorkshopStatsSettings:set_LeaderAbility(value)
   self.LeaderAbility = value
end

function WorkshopStatsSettings:get_MoveAbility()
   return self.MoveAbility
end
function WorkshopStatsSettings:set_MoveAbility(value)
   self.MoveAbility = value
end

function WorkshopStatsSettings:get_FastRetreat()
   return self.FastRetreat
end
function WorkshopStatsSettings:set_FastRetreat(value)
   self.FastRetreat = value
end
