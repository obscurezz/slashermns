
haisa_Mods = {}
local haisa_Mods_List = {}
for i=1, 8 do
	haisa_Mods[i] = Id.new("g040um"..1000 + i)
	haisa_Mods_List[haisa_Mods[i].value] = 1
end

function _haisa_info_isBuff(modValue)
	if haisa_Mods_List[modValue] ~= nil then
		return true
	else
		return false
	end
end

function _haisa_info_addMods(dest)
	for i = 1, #haisa_Mods do
		dest[#dest + 1] = haisa_Mods[i].value
	end
	return dest
end
