package.path = ".\\Scripts\\?.lua;.\\Scripts\\exp\\?.lua;.\\Scripts\\modifiers\\?.lua;.\\Scripts\\modifiers\\drawing\\?.lua;.\\Scripts\\modifiers\\items\\?.lua;.\\Scripts\\modifiers\\leaderMods\\?.lua;.\\Scripts\\modifiers\\perks\\?.lua;.\\Scripts\\modifiers\\smns\\?.lua;.\\Scripts\\modifiers\\smns\\items\\?.lua;.\\Scripts\\modifiers\\smns\\perks\\?.lua;.\\Scripts\\modifiers\\smns\\spells\\?.lua;.\\Scripts\\modifiers\\smns\\units\\?.lua;.\\Scripts\\modifiers\\spells\\?.lua;.\\Scripts\\modifiers\\units\\?.lua;.\\Scripts\\modifiers\\units\\bloodsorcerer\\?.lua;.\\Scripts\\modifiers\\units\\multiplicative_stats\\?.lua;.\\Scripts\\modifiers\\units\\torhoth\\?.lua;.\\Scripts\\modules\\?.lua;.\\Scripts\\modules\\smns\\?.lua;.\\Scripts\\workshop\\?.lua;.\\Scripts\\workshop\\classes\\?.lua"
require('mRnd')

X010TG1899 = Id.new('x010tg1899')
X010TG1900 = Id.new('x010tg1900')

function getModifierDisplay(unit, prev)
	local chance = 10 * ( unit.impl.level - unit.baseImpl.level )
	if chance < 200 then
		return prev
	else
		return false
	end
end

function getModifierDescTxt(unit, prev)
	local chance = 10 * ( unit.impl.level - unit.baseImpl.level )
	if chance < 100 then
		return X010TG1899
	elseif chance < 200 then
		return X010TG1900
	end
	return prev
end

function getAttackReach(unit, prev)
	local chance = 10 * ( unit.impl.level - unit.baseImpl.level )
	local r = prev
	if chance < 100 then
		if _mRnd_simpleRndEvent(chance) then
			r = 8
		end
	elseif chance < 200 then
		chance = chance - 100
		if _mRnd_simpleRndEvent(chance) then
			r = 24
		else
			r = 8
		end
	else
		r = 24
	end
	if prev == _RangeInfo_changeToRanged(prev) then
		r = _RangeInfo_changeToRanged(r)
	end
	return r
end
