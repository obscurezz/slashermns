package.path = ".\\Scripts\\?.lua;.\\Scripts\\exp\\?.lua;.\\Scripts\\modifiers\\?.lua;.\\Scripts\\modifiers\\drawing\\?.lua;.\\Scripts\\modifiers\\items\\?.lua;.\\Scripts\\modifiers\\leaderMods\\?.lua;.\\Scripts\\modifiers\\perks\\?.lua;.\\Scripts\\modifiers\\smns\\?.lua;.\\Scripts\\modifiers\\smns\\items\\?.lua;.\\Scripts\\modifiers\\smns\\perks\\?.lua;.\\Scripts\\modifiers\\smns\\spells\\?.lua;.\\Scripts\\modifiers\\smns\\units\\?.lua;.\\Scripts\\modifiers\\spells\\?.lua;.\\Scripts\\modifiers\\units\\?.lua;.\\Scripts\\modifiers\\units\\bloodsorcerer\\?.lua;.\\Scripts\\modifiers\\units\\multiplicative_stats\\?.lua;.\\Scripts\\modifiers\\units\\torhoth\\?.lua;.\\Scripts\\modules\\?.lua;.\\Scripts\\modules\\smns\\?.lua;.\\Scripts\\workshop\\?.lua;.\\Scripts\\workshop\\classes\\?.lua"
require('barrantor_info')

function getModifierDisplay(unit, prev)
	if _Barrantor_Info_RandomTargetBonusStage(unit) == 3 then
		return false
	else
		return prev
	end
end

function getModifierDescTxt(unit, prev)
	local randomTargetBonusStage = _Barrantor_Info_RandomTargetBonusStage(unit)
	if unit.baseImpl.level > 1 then
		if randomTargetBonusStage == 1 then
			return Id.new("x012tg1271")
		else
			return Id.new("x012tg1272")
		end
	else
		if randomTargetBonusStage == 1 then
			return Id.new("x012tg1274")
		else
			return Id.new("x012tg1275")
		end
	end
end
