package.path = ".\\Scripts\\?.lua;.\\Scripts\\exp\\?.lua;.\\Scripts\\modifiers\\?.lua;.\\Scripts\\modifiers\\drawing\\?.lua;.\\Scripts\\modifiers\\items\\?.lua;.\\Scripts\\modifiers\\leaderMods\\?.lua;.\\Scripts\\modifiers\\perks\\?.lua;.\\Scripts\\modifiers\\smns\\?.lua;.\\Scripts\\modifiers\\smns\\items\\?.lua;.\\Scripts\\modifiers\\smns\\perks\\?.lua;.\\Scripts\\modifiers\\smns\\spells\\?.lua;.\\Scripts\\modifiers\\smns\\units\\?.lua;.\\Scripts\\modifiers\\spells\\?.lua;.\\Scripts\\modifiers\\units\\?.lua;.\\Scripts\\modifiers\\units\\bloodsorcerer\\?.lua;.\\Scripts\\modifiers\\units\\multiplicative_stats\\?.lua;.\\Scripts\\modifiers\\units\\torhoth\\?.lua;.\\Scripts\\modules\\?.lua;.\\Scripts\\modules\\smns\\?.lua;.\\Scripts\\workshop\\?.lua;.\\Scripts\\workshop\\classes\\?.lua"
require('setValue')

function getModifierDisplay(unit, prev)
    return prev
end

function getModifierDescTxt(unit, prev)
    return prev
end

function getArmor(unit, prev)
   return svFlatEffectArmor(unit, prev, 20)
end

function getAttackPower(unit, prev)
   return svMultimplicativeEffectPower1(unit, prev, 1.5)
end

function getAttackDamage(unit, prev)
   return svMultimplicativeEffectDamage1(unit, prev, 1.5)
end

function getAttack2Power(unit, prev)
   local res = prev
   if unit.impl.attack2 ~= nil then
       smnsInfo_SetApplyAccuracyBuffToAttack2(true)
      res = svMultimplicativeEffectPower2(unit, prev, 1.54)
       smnsInfo_SetApplyAccuracyBuffToAttack2(false)
      return res
   end
   return prev
end

function getAttack2Damage(unit, prev)
   if statsCheck_isDirectDmgType(unit.impl.attack2.type) then 
      return svMultimplicativeEffectDamage2(unit, prev, 1.54)
   end
   return prev
end