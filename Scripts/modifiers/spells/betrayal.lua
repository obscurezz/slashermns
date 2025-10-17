

function getModifierDisplay(unit, prev)
	return prev
end

function getModifierDescTxt(unit, prev)
	return prev
end

-- function getNegotiate(unit, prev)
-- 	_get_Group_and_Mods(unit)
-- 	local mods = _GroupInfo_UnitModifiers(unit)
-- 	local debuffMulti = math.max(0, 1 - 0.01 * _unitAura_SpellDebuffResistance_total(unit, mods))
-- 	return prev - 20 * debuffMulti
-- end

-- function hasAbility(unit, ability, prev)
-- 	if ability == Ability.Incorruptible then
-- 		if prev then
-- 			_get_Group_and_Mods(unit)
-- 			local mods = _GroupInfo_UnitModifiers(unit)
-- 			local debuffMulti = math.max(0, 1 - 0.01 * _unitAura_SpellDebuffResistance_total(unit, mods))
-- 			if debuffMulti == 0 then
-- 				return prev
-- 			end
-- 		end
-- 		return false
-- 	end
-- 	return prev
-- end

function hasAbility(unit, ability, prev)
	if ability == Ability.Incorruptible then
		return false
	end
	return prev
end
