package.path = ".\\Scripts\\?.lua;.\\Scripts\\exp\\?.lua;.\\Scripts\\modifiers\\?.lua;.\\Scripts\\modifiers\\drawing\\?.lua;.\\Scripts\\modifiers\\items\\?.lua;.\\Scripts\\modifiers\\leaderMods\\?.lua;.\\Scripts\\modifiers\\perks\\?.lua;.\\Scripts\\modifiers\\smns\\?.lua;.\\Scripts\\modifiers\\smns\\items\\?.lua;.\\Scripts\\modifiers\\smns\\perks\\?.lua;.\\Scripts\\modifiers\\smns\\spells\\?.lua;.\\Scripts\\modifiers\\smns\\units\\?.lua;.\\Scripts\\modifiers\\spells\\?.lua;.\\Scripts\\modifiers\\units\\?.lua;.\\Scripts\\modifiers\\units\\bloodsorcerer\\?.lua;.\\Scripts\\modifiers\\units\\multiplicative_stats\\?.lua;.\\Scripts\\modifiers\\units\\torhoth\\?.lua;.\\Scripts\\modules\\?.lua;.\\Scripts\\modules\\smns\\?.lua;.\\Scripts\\workshop\\?.lua;.\\Scripts\\workshop\\classes\\?.lua"
require('setValue')

function getModifierDisplay(unit, prev)
    return prev
end

function getModifierDescTxt(unit, prev)
    return prev
end

function getArmor(unit, prev)
   return svFlatEffectArmor(unit, prev, 11)
end

function getAttackPower(unit, prev)
   return svMultimplyPower1(unit, prev, 0.21)
end

function getAttackDamage(unit, prev)
   return svMultimplyDamage1(unit, prev, 0.21)
end

function getAttack2Power(unit, prev)
   local res = prev
   if unit.impl.attack2 ~= nil then
       smnsInfo_SetApplyAccuracyBuffToAttack2(true)
      res = svMultimplyPower2(unit, prev, 0.21)
       smnsInfo_SetApplyAccuracyBuffToAttack2(false)
      return res
   end
   return prev
end

function getAttack2Damage(unit, prev)
   if statsCheck_isDirectDmgType(unit.impl.attack2.type) then 
      return svMultimplyDamage2(unit, prev, 0.21)
   end
   return prev
end