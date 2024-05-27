
elftree_Mods = {}
local elftree_Mods_List = {}
for i=1, 17 do
	elftree_Mods[i] = Id.new("g030um"..1000 + i)
	elftree_Mods_List[elftree_Mods[i].value] = 1
end

function _elftree_info_isBuff(modValue)
	if elftree_Mods_List[modValue] ~= nil then
		return true
	else
		return false
	end
end

function _elftree_info_addMods(dest)
	for i = 1, #elftree_Mods do
		dest[#dest + 1] = elftree_Mods[i].value
	end
	return dest
end
