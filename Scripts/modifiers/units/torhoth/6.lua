package.path = ".\\Scripts\\?.lua;.\\Scripts\\exp\\?.lua;.\\Scripts\\modifiers\\?.lua;.\\Scripts\\modifiers\\drawing\\?.lua;.\\Scripts\\modifiers\\items\\?.lua;.\\Scripts\\modifiers\\leaderMods\\?.lua;.\\Scripts\\modifiers\\perks\\?.lua;.\\Scripts\\modifiers\\smns\\?.lua;.\\Scripts\\modifiers\\smns\\items\\?.lua;.\\Scripts\\modifiers\\smns\\perks\\?.lua;.\\Scripts\\modifiers\\smns\\spells\\?.lua;.\\Scripts\\modifiers\\smns\\units\\?.lua;.\\Scripts\\modifiers\\spells\\?.lua;.\\Scripts\\modifiers\\units\\?.lua;.\\Scripts\\modifiers\\units\\bloodsorcerer\\?.lua;.\\Scripts\\modifiers\\units\\multiplicative_stats\\?.lua;.\\Scripts\\modifiers\\units\\torhoth\\?.lua;.\\Scripts\\modules\\?.lua;.\\Scripts\\modules\\smns\\?.lua;.\\Scripts\\workshop\\?.lua;.\\Scripts\\workshop\\classes\\?.lua"
require('setValue')

function getModifierDisplay(unit, prev)
    return prev
end

function getModifierDescTxt(unit, prev)
    return prev
end

function getArmor(unit, prev)
   return svFlatEffectArmor(unit, prev, 15)
end

function getAttackPower(unit, prev)
   return svMultimplicativeEffectPower1(unit, prev, 1.35)
end

function getAttackDamage(unit, prev)
   return svMultimplicativeEffectDamage1(unit, prev, 1.35)
end

function getAttack2Power(unit, prev)
   return svMultimplicativeEffectPower2(unit, prev, 1.35)
end

function getAttack2Damage(unit, prev)
   return svMultimplicativeEffectDamage2(unit, prev, 1.35)
end
