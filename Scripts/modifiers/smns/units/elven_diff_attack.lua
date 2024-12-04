package.path = ".\\Scripts\\?.lua;.\\Scripts\\exp\\?.lua;.\\Scripts\\modules\\?.lua;.\\Scripts\\modifiers\\?.lua;.\\Scripts\\modules\\smns\\?.lua;.\\Scripts\\modifiers\\items\\?.lua;.\\Scripts\\modifiers\\units\\?.lua"
require('GroupInfo')
require('smns_new_mods_id')

function getModifierDisplay(unit, prev)
	return prev
end

function getModifierDescTxt(unit, prev)
	return prev
end

function getAttackReach(unit, prev)
	_get_Group_and_Mods(unit)
	
	local group = _GroupInfo_getCurrentGroup()
	local slots = group.slots
	local s
	local u
	local n = 0
	local FSlots = {}
	for i = 1, #slots do
		s = slots[i]
		u = s.unit
		if u ~= nil then
			n = n + 1
			FSlots[n] = slots[i]
		end
	end
	local FrontLine = _common_GetFrontline(FSlots)
	for i = 1, #slots do
		s = slots[i]
		u = s.unit
		if u ~= nil and u.id.value == unit.id.value then
			if s.line == FrontLine then
				return 27
            else
                return 50
			end
			break
		end
	end
end
