package.path = ".\\Scripts\\?.lua;.\\Scripts\\exp\\?.lua;.\\Scripts\\modifiers\\?.lua;.\\Scripts\\modifiers\\drawing\\?.lua;.\\Scripts\\modifiers\\items\\?.lua;.\\Scripts\\modifiers\\leaderMods\\?.lua;.\\Scripts\\modifiers\\perks\\?.lua;.\\Scripts\\modifiers\\smns\\?.lua;.\\Scripts\\modifiers\\smns\\items\\?.lua;.\\Scripts\\modifiers\\smns\\perks\\?.lua;.\\Scripts\\modifiers\\smns\\spells\\?.lua;.\\Scripts\\modifiers\\smns\\units\\?.lua;.\\Scripts\\modifiers\\spells\\?.lua;.\\Scripts\\modifiers\\units\\?.lua;.\\Scripts\\modifiers\\units\\bloodsorcerer\\?.lua;.\\Scripts\\modifiers\\units\\multiplicative_stats\\?.lua;.\\Scripts\\modifiers\\units\\torhoth\\?.lua;.\\Scripts\\modules\\?.lua;.\\Scripts\\modules\\smns\\?.lua;.\\Scripts\\workshop\\?.lua;.\\Scripts\\workshop\\classes\\?.lua"
require('GroupInfo')
require('setValue')
require('statscheck')

function getModifierDisplay(unit, prev)
	local mods = _GroupInfo_UnitModifiers(unit)
	if _unitAura_FrostbiteResist_cnt(unit, mods) > 0 or not _GroupInfo_UnitIsRangedWithoutBow(unit) then
		return false
	else
		if unit.hp > 0 then
			return true
		else
			return false
		end
	end
end

function getModifierDescTxt(unit, prev)
	return prev
end

function getAttackReach(unit, prev)
	return _RangeInfo_changeToRanged(prev)
end

function getAttackDamage(unit, prev)
	if _GroupInfo_UnitIsRangedWithoutBow(unit) then
		return prev
	else
		return svMultimplyDamage1(unit, prev, -0.2)
	end
end

function getAttack2Damage(unit, prev)
	if _GroupInfo_UnitIsRangedWithoutBow(unit) then
		return prev
	else
		return svMultimplyDamage2(unit, prev, -0.2)
	end
end
