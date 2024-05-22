package.path = ".\\Scripts\\?.lua;.\\Scripts\\exp\\?.lua;.\\Scripts\\modifiers\\?.lua;.\\Scripts\\modifiers\\drawing\\?.lua;.\\Scripts\\modifiers\\items\\?.lua;.\\Scripts\\modifiers\\leaderMods\\?.lua;.\\Scripts\\modifiers\\perks\\?.lua;.\\Scripts\\modifiers\\smns\\?.lua;.\\Scripts\\modifiers\\smns\\items\\?.lua;.\\Scripts\\modifiers\\smns\\perks\\?.lua;.\\Scripts\\modifiers\\smns\\spells\\?.lua;.\\Scripts\\modifiers\\smns\\units\\?.lua;.\\Scripts\\modifiers\\spells\\?.lua;.\\Scripts\\modifiers\\units\\?.lua;.\\Scripts\\modifiers\\units\\bloodsorcerer\\?.lua;.\\Scripts\\modifiers\\units\\multiplicative_stats\\?.lua;.\\Scripts\\modifiers\\units\\torhoth\\?.lua;.\\Scripts\\modules\\?.lua;.\\Scripts\\modules\\smns\\?.lua;.\\Scripts\\workshop\\?.lua;.\\Scripts\\workshop\\classes\\?.lua"
require('baroness_info')
require('mRnd')
require('setValue')

local baronessParalizeTxt = Id.new("x000tg5078")
local baronessPerkTxt1 = Id.new("x010tg1807")
local baronessPerkTxt2 = Id.new("x010tg1808")

function getModifierDisplay(unit, prev)
	local uimpl = getScenario():getUnit(unit.id).impl
	local atype = uimpl.attack1.type
	if atype == Attack.Fear then
		return prev
	elseif atype == Attack.Paralyze then
		if 10 * ( uimpl.level - unit.baseImpl.level ) < 100 then
			return prev
		end
	end
	return false
end
function getModifierDescTxt(unit, prev)
	local uimpl = getScenario():getUnit(unit.id).impl
	local atype = uimpl.attack1.type
	if atype == Attack.Fear or atype == Attack.Paralyze then
		if uimpl.level > 2 then
			return baronessPerkTxt2
		else
			return baronessPerkTxt1
		end
	end
	return prev
end

function getAttackInfinite(unit, prev)
	local uimpl = getScenario():getUnit(unit.id).impl
	local atype = uimpl.attack1.type
	if atype == Attack.Paralyze then
		local chance = 10 * ( uimpl.level - unit.baseImpl.level )
		return _mRnd_simpleRndEvent(chance)
	end
	return prev
end

function getAttackNameTxt(unit, prev)
	local uimpl = getScenario():getUnit(unit.id).impl
	local atype = uimpl.attack1.type
	if atype == Attack.Paralyze then
		return baronessParalizeTxt
	end
	return prev
end
