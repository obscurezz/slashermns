package.path = ".\\Scripts\\?.lua;.\\Scripts\\exp\\?.lua;.\\Scripts\\modules\\?.lua;.\\Scripts\\modifiers\\?.lua;.\\Scripts\\modules\\smns\\?.lua"
require('GroupInfo')

function getModifierDisplay(unit, prev)
	return prev
end

function getModifierDescTxt(unit, prev)
	return prev
end

--function getAttackReach(unit, prev)
--	local Druid = Id.new('g070um0035').value
--	_get_Group_and_Mods(unit)
--	if _GroupInfo_stackHasModifierAmount(Id.new('g070um0035').value) > 0 then
--		return 11
--	end
--	return prev
	
--end

-- function getAttack2Id(unit, prev)
-- 	_get_Group_and_Mods(unit)
-- 	if _GroupInfo_stackHasModifierAmount(Id.new('g070um0035').value) > 0 then
-- 		return Id.new('g070aa0127')
-- 	end
-- 	return prev
-- end

function getAttackDamage(unit, prev)
	_get_Group_and_Mods(unit)
	if _GroupInfo_stackHasModifierAmount(Id.new('g070um0035').value) > 0 then
		return svMultimplyDamage1(unit, prev, 0.35)
	end
	return prev
end