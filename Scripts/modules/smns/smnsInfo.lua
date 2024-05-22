
smnsEnabled = true
smnsInfoApplyDmgBuffToHeal = false
smnsInfoApplyAccuracyBuffToAttack2 = false
smnsInfoHandleSpellDebuffsAsCommonMods = true

smnsInfoDebuffed_Damage_LowerBound_Percent = 0
smnsInfoDebuffed_Heal_LowerBound_Percent = 0
smnsInfoDebuffed_Accuracy_LowerBound_Percent = 0

smnsInfoCriticalHit_DamageCap_Percent = 100
smnsInfoCriticalHit_ClassicalIncrease = true

smnsInfo_HealCap_Percent = 10000

smnsInfoExpTransferEffectiveness_Summon = 1
smnsInfoExpTransferEffectiveness_Summon_Item = 1
smnsInfoExpTransferEffectiveness_Doppelganger = 1
smnsInfoExpTransferEffectiveness_TransformSelf = 1

function smnsInfo_SetApplyAccuracyBuffToAttack2(value)
    smnsInfoApplyAccuracyBuffToAttack2 = value
    return 0
end

function smnsInfo_SetApplyApplyDmgBuffToHeal(value)
    smnsInfoApplyDmgBuffToHeal = value
    return 0
end

smnsInfo_LowerCostCap_Percent = 70