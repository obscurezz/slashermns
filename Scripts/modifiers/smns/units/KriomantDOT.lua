package.path = ".\\Scripts\\?.lua;.\\Scripts\\exp\\?.lua;.\\Scripts\\modules\\?.lua;.\\Scripts\\modifiers\\?.lua;.\\Scripts\\modules\\smns\\?.lua;.\\Scripts\\modifiers\\smns\\units\\?.lua"

require('GroupInfo')


function getModifierDisplay(unit, prev)
	return prev
end

function getModifierDescTxt(unit, prev)
	return prev
end

-- function getAttack2Id(unit, prev)
--     _get_Group_and_Mods(unit)
--     if _GroupInfo_stackHasModifierAmount(Id.new('g070um0148').value) > 0 then
--         if unit.impl.level - unit.baseImpl.level + 1 == 1 then
--             return Id.new('g070aa0132')
--         elseif unit.impl.level - unit.baseImpl.level + 1 == 2 then
-- 			return Id.new('g070aa0133')
-- 		elseif unit.impl.level - unit.baseImpl.level + 1 == 3 then
-- 			return Id.new('g070aa0134')
-- 		elseif unit.impl.level - unit.baseImpl.level + 1 == 4 then
-- 			return Id.new('g070aa0135')
-- 		elseif unit.impl.level - unit.baseImpl.level + 1 == 5 then
-- 			return Id.new('g070aa0136')
-- 		elseif unit.impl.level - unit.baseImpl.level + 1 == 6 then
-- 			return Id.new('g070aa0137')
-- 		elseif unit.impl.level - unit.baseImpl.level + 1 == 7 then
-- 			return Id.new('g070aa0138')
-- 		elseif unit.impl.level - unit.baseImpl.level + 1 == 8 then
-- 			return Id.new('g070aa0139')
-- 		elseif unit.impl.level - unit.baseImpl.level + 1 == 9 then
-- 			return Id.new('g070aa0140')
-- 		elseif unit.impl.level - unit.baseImpl.level + 1 == 10 then
-- 			return Id.new('g070aa0141')
-- 		elseif unit.impl.level - unit.baseImpl.level + 1 == 11 then
-- 			return Id.new('g070aa0142')
-- 		elseif unit.impl.level - unit.baseImpl.level + 1 == 12 then
-- 			return Id.new('g070aa0143')
-- 		elseif unit.impl.level - unit.baseImpl.level + 1 == 13 then
-- 			return Id.new('g070aa0144')
-- 		elseif unit.impl.level - unit.baseImpl.level + 1 == 14 then
-- 			return Id.new('g070aa0145')
-- 		elseif unit.impl.level - unit.baseImpl.level + 1 == 15 then
-- 			return Id.new('g070aa0146')
-- 		elseif unit.impl.level - unit.baseImpl.level + 1 == 16 then
-- 			return Id.new('g070aa0147')
-- 		elseif unit.impl.level - unit.baseImpl.level + 1 == 17 then
-- 			return Id.new('g070aa0148')
-- 		elseif unit.impl.level - unit.baseImpl.level + 1 == 18 then
-- 			return Id.new('g070aa0149')
-- 		elseif unit.impl.level - unit.baseImpl.level + 1 == 19 then
-- 			return Id.new('g070aa0150')
-- 		elseif unit.impl.level - unit.baseImpl.level + 1 == 20 then
-- 			return Id.new('g070aa0151')
-- 		elseif unit.impl.level - unit.baseImpl.level + 1 == 21 then
-- 			return Id.new('g070aa0152')
-- 		elseif unit.impl.level - unit.baseImpl.level + 1 == 22 then
-- 			return Id.new('g070aa0153')
-- 		end	
--     end
--     return prev
-- end
