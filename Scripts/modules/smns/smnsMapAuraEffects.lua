require('GroupInfo')
require('smns_new_mods_id')

-- group - группа в радиусе поиска
-- groupModifiers - модификаторы на живых юнитах, которые работают, пока юниты живы
-- groupModifiersDead - модификаторы на мертвых юнитах, которые работают, пока юниты мертвы

function HeritageBannerDeboost(group, groupModifiers, groupModifiersDead)
	if _GroupInfo_UnitModifierAmount(groupModifiers, Id.new('g014um1068').value) > 0 then
		return -2
	end
	return 0
end

function _Heritage_Deboost_Effect(unit)
	local effectFunction_1 = HeritageBannerDeboost
	local radius = 1
	local for_what_diplomacy_apply = {diplomacyStatus_War}

	return _unitAura_NearestGroupsAuraEffect(unit, effectFunction_1, radius, for_what_diplomacy_apply)
end

function GuardResistanceDeboost(group, groupModifiers, groupModifiersDead)
	if _GroupInfo_UnitModifierAmount(groupModifiers, CapitalGuardian) > 0 then
		return 1
	end
	return 0
end

function _Guard_Resistance_Deboost_Effect(unit)
	local effectFunction_1 = GuardResistanceDeboost
	local radius = 1
	local for_what_diplomacy_apply = {diplomacyStatus_War}
	
	return _unitAura_NearestGroupsAuraEffect(unit, effectFunction_1, radius, for_what_diplomacy_apply)
end

function GuardCritDrainDeboost(group, groupModifiers, groupModifiersDead)
	if _GroupInfo_UnitModifierAmount(groupModifiers, CapitalGuardian) > 0 then
		return 33
	end

	return 0
end

function _Guard_CritDrain_Deboost_Effect(unit)
	local effectFunction_1 = GuardCritDrainDeboost
	local radius = 1
	local for_what_diplomacy_apply = {diplomacyStatus_War}
	
	return _unitAura_NearestGroupsAuraEffect(unit, effectFunction_1, radius, for_what_diplomacy_apply)
end

function SpawnTiamatDeboost(group, groupModifiers, groupModifiersDead)
	if _GroupInfo_UnitModifierAmount(groupModifiers, AbyssalFearII) > 0 then
		return -10
	end

	if _GroupInfo_UnitModifierAmount(groupModifiers, AbyssalFearI) > 0 and _GroupInfo_UnitModifierAmount(groupModifiers, AbyssalFearII) == 0 then
		return -7
	end

	return 0
end

function _Spawn_Tiamat_Deboost_Effect(unit)
	local effectFunction_1 = SpawnTiamatDeboost
	local radius = 1
	local for_what_diplomacy_apply = {diplomacyStatus_War}
	
	return _unitAura_NearestGroupsAuraEffect(unit, effectFunction_1, radius, for_what_diplomacy_apply)
end

function GrimtursArmorDeboost(group, groupModifiers, groupModifiersDead)
	if _GroupInfo_UnitModifierAmount(groupModifiers, Grymturs) > 0 then
		return -10
	end
	return 0
end

function _Grymturs_Deboost_Effect(unit)
	local effectFunction_1 = GrimtursArmorDeboost
	local radius = 1
	local for_what_diplomacy_apply = {diplomacyStatus_War}
	
	return _unitAura_NearestGroupsAuraEffect(unit, effectFunction_1, radius, for_what_diplomacy_apply)
end

function StormCentaurDeboost(group, groupModifiers, groupModifiersDead)
	if _GroupInfo_UnitModifierAmount(groupModifiers, EndlessStorm) > 0 then
		return -10
	end
	return 0
end

function _Storm_Deboost_Effect(unit)
	local effectFunction_1 = StormCentaurDeboost
	local radius = 1
	local for_what_diplomacy_apply = {diplomacyStatus_War}
	
	return _unitAura_NearestGroupsAuraEffect(unit, effectFunction_1, radius, for_what_diplomacy_apply)
end

function WyrmDeboostFunction(group, groupModifiers, groupModifiersDead)
	if _GroupInfo_UnitModifierAmount(groupModifiers, Wyrm) > 0 then
		return 1
	end
	return 0
end

function _Wyrm_Deboost_Effect(unit)
	local effectFunction_1 = WyrmDeboostFunction
	local radius = 1
	local for_what_diplomacy_apply = {diplomacyStatus_War}
	
	return _unitAura_NearestGroupsAuraEffect(unit, effectFunction_1, radius, for_what_diplomacy_apply)
end

function RodPlacerFunction(group, groupModifiers, groupModifiersDead)
	if _GroupInfo_UnitModifierAmount(groupModifiers, Heaven) > 0 then
		return 10
	end
	return 0
end

function _Rod_Placer_Effect(unit)
	local effectFunction_1 = RodPlacerFunction
	local radius = 2
	local for_what_diplomacy_apply = {diplomacyStatus_Ownership}
	
	return _unitAura_NearestGroupsAuraEffect(unit, effectFunction_1, radius, for_what_diplomacy_apply)
end