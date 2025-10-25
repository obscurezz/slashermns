package.path = ".\\Scripts\\?.lua;.\\Scripts\\exp\\?.lua;.\\Scripts\\modifiers\\?.lua;.\\Scripts\\modifiers\\drawing\\?.lua;.\\Scripts\\modifiers\\items\\?.lua;.\\Scripts\\modifiers\\leaderMods\\?.lua;.\\Scripts\\modifiers\\perks\\?.lua;.\\Scripts\\modifiers\\smns\\?.lua;.\\Scripts\\modifiers\\smns\\items\\?.lua;.\\Scripts\\modifiers\\smns\\perks\\?.lua;.\\Scripts\\modifiers\\smns\\spells\\?.lua;.\\Scripts\\modifiers\\smns\\units\\?.lua;.\\Scripts\\modifiers\\spells\\?.lua;.\\Scripts\\modifiers\\units\\?.lua;.\\Scripts\\modifiers\\units\\bloodsorcerer\\?.lua;.\\Scripts\\modifiers\\units\\multiplicative_stats\\?.lua;.\\Scripts\\modifiers\\units\\torhoth\\?.lua;.\\Scripts\\modules\\?.lua;.\\Scripts\\modules\\smns\\?.lua;.\\Scripts\\workshop\\?.lua;.\\Scripts\\workshop\\classes\\?.lua"
require('unitAuraCustomDesc')
require('setValue')

function getModifierDisplay(unit, prev)
	return prev
end

function getModifierDescTxt(unit, prev)
	return prev
end

function _get_Lowest_Torhoth_Level(unit)
	local H = {}
	local group = _GroupInfo_getCurrentGroup()
    local units = group.units
	for i = 1, #units do
        u = units[i]
        if u ~= nil and u.hp > 0 and _GroupInfo_UnitHasModifierValue(u, Id.new('g040um0004').value) then
			table.insert(H, u)
		end
	end

	local lowest = H[1]
	for i = 1, #H do
		if H[i].impl.level < lowest.impl.level then
			lowest = H[i]
		end
	end
	if lowest then
		return lowest.impl.level - lowest.baseImpl.level
	else
		return 0
	end
end

function getArmor(unit, prev)
   return svFlatEffectArmor(unit, prev, 5 + 3 * _get_Lowest_Torhoth_Level(unit))
end

function getAttackPower(unit, prev)
   return svMultimplyPower1(unit, prev, 0.15 + 0.03 * _get_Lowest_Torhoth_Level(unit))
end

function getAttackDamage(unit, prev)
   return svMultimplyDamage1(unit, prev, 0.15 + 0.03 * _get_Lowest_Torhoth_Level(unit))
end

function getAttack2Power(unit, prev)
   local res = prev
   if unit.impl.attack2 ~= nil then
       smnsInfo_SetApplyAccuracyBuffToAttack2(true)
      res = svMultimplyPower2(unit, prev, 0.15 + 0.03 * _get_Lowest_Torhoth_Level(unit))
       smnsInfo_SetApplyAccuracyBuffToAttack2(false)
      return res
   end
   return prev
end

function getAttack2Damage(unit, prev)
   if statsCheck_isDirectDmgType(unit.impl.attack2.type) then 
      return svMultimplyDamage2(unit, prev, 0.15 + 0.03 * _get_Lowest_Torhoth_Level(unit))
   end
   return prev
end