
bloodSorcerer_Mods = {}
local bloodSorcerer_Mods_List = {}
for i=1, 99 do
	bloodSorcerer_Mods[i] = Id.new("g024um"..1100 + i)
	bloodSorcerer_Mods_List[bloodSorcerer_Mods[i].value] = 1
end

function _bloodsorcerer_info_isBuff(modValue)
	if bloodSorcerer_Mods_List[modValue] ~= nil then
		return true
	else
		return false
	end
end

function _bloodsorcerer_info_addMods(dest)
	for i = 1, #bloodSorcerer_Mods do
		dest[#dest + 1] = bloodSorcerer_Mods[i].value
	end
	return dest
end
