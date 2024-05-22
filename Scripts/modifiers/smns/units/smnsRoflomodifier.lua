require('GroupInfo')
require('common')

local roflomodifier_20230518 = Id.new('g070um0168').value

function smnsRoflomodifier_20230518_basePower1(unit, currentResult)
	if _GroupInfo_UnitHasModifierValue(unit, roflomodifier_20230518) then
		currentResult = 100
	end
	if _GroupInfo_stackHasModifierAmount(roflomodifier_20230518) == 1 then
		if _GroupInfo_UnitHasModifierValue(unit, roflomodifier_20230518) then
			local group = _GroupInfo_getCurrentGroup()
			if group ~= nil then
				local units = group.units
				local n = 0
				for i = 1, #units do
					if units[i] ~= nil and units[i].hp > 0  then
						n = n + 1
					end
				end
				return currentResult - 10 * ( n - 1 )
			end
		else
			return currentResult * 1.1
		end
	end
	return currentResult
end


function smnsRoflomodifier_20230518_lowerCost(unit, currentResult)
	if _GroupInfo_stackHasModifierAmount(roflomodifier_20230518) == 0 then
		return currentResult
	end
	local maxBonus = 0
	local group = _GroupInfo_getCurrentGroup()
	local units = group.units
	for i = 1, #units do
		if _GroupInfo_UnitHasModifierValue(units[i], roflomodifier_20230518) then
			maxBonus = math.max( maxBonus, 20 + 5 * ( units[i].impl.level - units[i].baseImpl.level ) )
		end
	end
	return currentResult + maxBonus
end


function smnsRoflomodifier_20230518_changeTargets(unit, targetsAreAllies, targets, battle)
	if #targets > 0 and targetsAreAllies == false then
		local targetGroupSlots = _common_getUnitsInBattle(targets, battle)
		if #targetGroupSlots > 0 then
			local unitWithModifierLine = nil
			local unitWithModifierSlot = nil
			local unitWithModifierAmount = 0
			for i = 1, #targetGroupSlots do
				if _GroupInfo_UnitHasModifierValue(targetGroupSlots[i].unit, roflomodifier_20230518) then
					if unitWithModifierLine == nil or unitWithModifierLine > targetGroupSlots[i].line then
						unitWithModifierLine = targetGroupSlots[i].line
						unitWithModifierSlot = i
					end
					unitWithModifierAmount = unitWithModifierAmount + 1
				end
			end
			if unitWithModifierAmount > 0 then
				if targetGroupSlots[unitWithModifierSlot].unit.impl.small then
					if unitWithModifierAmount ~= 1 then
						return targets
					end
				else
					if unitWithModifierAmount ~= 2 then
						return targets
					end
				end
				local frontLine = nil
				local n = 0
				for i = 1, #targetGroupSlots do
					if unitWithModifierLine == targetGroupSlots[i].line then
						n = n + 1
					end
					if frontLine == nil or frontLine > targetGroupSlots[i].line then
						frontLine = targetGroupSlots[i].line
					end
				end
				if n > 1 and frontLine == unitWithModifierLine then
					local result = {}
					n = 0
					for i = 1, #targets do
						if not _GroupInfo_UnitHasModifierValue(targets[i].unit, roflomodifier_20230518) then
							n = n + 1
							result[n] = targets[i]
						end
					end
					return result
				end
			
			end
		end
	end
	return targets
end



