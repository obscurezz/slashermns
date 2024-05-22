
torhoth_Mods = {}
local torhoth_Mods_List = {}
for i=1, 99 do
	torhoth_Mods[i] = Id.new("g024um"..1000 + i)
	torhoth_Mods_List[torhoth_Mods[i].value] = 1
end

function _torhoth_info_isBuff(modValue)
	if torhoth_Mods_List[modValue] ~= nil then
		return true
	else
		return false
	end
end
