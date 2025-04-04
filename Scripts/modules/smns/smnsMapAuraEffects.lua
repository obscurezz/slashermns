require('GroupInfo')
require('smns_new_mods_id')

-- group - группа в радиусе поиска
-- groupModifiers - модификаторы на живых юнитах, которые работают, пока юниты живы
-- groupModifiersDead - модификаторы на мертвых юнитах, которые работают, пока юниты мертвы

function BloodRavenSetDeboost(group, groupModifiers, groupModifiersDead)
	if _GroupInfo_UnitModifierAmount(groupModifiers, BloodRavenFlag) > 0 
	and _GroupInfo_UnitModifierAmount(groupModifiers, BloodRavenCuirass) > 0
	and _GroupInfo_UnitModifierAmount(groupModifiers, BloodRavenCama) > 0
	and _GroupInfo_UnitModifierAmount(groupModifiers, BloodRavenScythe) > 0
	then
		return 1
	end
	return 0
end

function _BloodRaven_Set_Deboost_Effect(unit)
	local effectFunction_1 = BloodRavenSetDeboost
	local radius = 1
	local for_what_diplomacy_apply = {diplomacyStatus_War}

	return _unitAura_NearestGroupsAuraEffect(unit, effectFunction_1, radius, for_what_diplomacy_apply)
end

function BloodRavenIniDeboost(group, groupModifiers, groupModifiersDead)
	if _GroupInfo_UnitModifierAmount(groupModifiers, BloodRavenFlag) > 0 then
		return -5
	end
	return 0
end

function _BloodRaven_Deboost_Effect(unit)
	local effectFunction_1 = BloodRavenIniDeboost
	local radius = 1
	local for_what_diplomacy_apply = {diplomacyStatus_War}

	return _unitAura_NearestGroupsAuraEffect(unit, effectFunction_1, radius, for_what_diplomacy_apply)
end

function PhoienixFireDeboost(group, groupModifiers, groupModifiersDead)
	if _GroupInfo_UnitModifierAmount(groupModifiers, PhoenixShield) > 0 then
		return -25
	end
	return 0
end

function _Phoenix_Deboost_Effect(unit)
	local effectFunction_1 = PhoienixFireDeboost
	local radius = 1
	local for_what_diplomacy_apply = {diplomacyStatus_War}

	return _unitAura_NearestGroupsAuraEffect(unit, effectFunction_1, radius, for_what_diplomacy_apply)
end

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

function ForestSealDeboost(group, groupModifiers, groupModifiersDead)
	if _GroupInfo_UnitModifierAmount(groupModifiers, ForestSeal) > 0 then
		return 25
	end

	return 0
end

function _ForestSeal_Deboost_Effect(unit)
	local effectFunction_1 = ForestSealDeboost
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
		return -3 * _GroupInfo_UnitModifierAmount(groupModifiers, EndlessStorm)
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

function FlamethrowerDeboostFunction(group, groupModifiers, groupModifiersDead)
	if _GroupInfo_UnitModifierAmount(groupModifiers, FlamethrowerDeboost) > 0 then
		return 1
	end
	return 0
end

function _Flamethrower_Deboost_Effect(unit)
	local effectFunction_1 = FlamethrowerDeboostFunction
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

function KriomantDeboostFunction(group, groupModifiers, groupModifiersDead)
	if _GroupInfo_UnitModifierAmount(groupModifiers, KriomantDeboost) > 0 then
		return 1
	end
	return 0
end

function _Kriomant_Deboost_Effect(unit)
	local effectFunction_1 = KriomantDeboostFunction
	local radius = 1
	local for_what_diplomacy_apply = {diplomacyStatus_War}
	
	return _unitAura_NearestGroupsAuraEffect(unit, effectFunction_1, radius, for_what_diplomacy_apply)
end

function DodgeBannerFunction(group, groupModifiers, groupModifiersDead)
	if _GroupInfo_UnitModifierAmount(groupModifiers, DodgeBanner) > 0 then
		return 15
	end
	return 0
end

function _DodgeBanner_Deboost_Effect(unit)
	local effectFunction_1 = DodgeBannerFunction
	local radius = 1
	local for_what_diplomacy_apply = {diplomacyStatus_War}
	
	return _unitAura_NearestGroupsAuraEffect(unit, effectFunction_1, radius, for_what_diplomacy_apply)
end

function DraugDeboost(group, groupModifiers, groupModifiersDead)
	if _GroupInfo_UnitModifierAmount(groupModifiers, DraugDedamage) > 0 then
		return -10
	end
	return 0
end

function _Draug_Deboost_Effect(unit)
	local effectFunction_1 = DraugDeboost
	local radius = 1
	local for_what_diplomacy_apply = {diplomacyStatus_War}
	
	return _unitAura_NearestGroupsAuraEffect(unit, effectFunction_1, radius, for_what_diplomacy_apply)
end
