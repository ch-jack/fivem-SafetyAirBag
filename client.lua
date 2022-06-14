function OpenAirBag(currentCar)
	local boneIndex = GetEntityBoneIndexByName(currentCar, "seat_dside_f")
	local boneCoord = GetWorldPositionOfEntityBone(currentCar, boneIndex)
	local propAirbag = CreateProp(`prop_cs_rub_binbag_01`, boneCoord)
	SetEntityCollision(propAirbag, false, false)
	AttachEntityToEntity(propAirbag, currentCar, boneIndex, vec3(0, 0.66, 0.2), GetEntityForwardVector(currentCar) + vec3(240, 0, 0), 0, 0, 0, 0, 2, 1)
	local particle = "core"
	UseParticleFxAsset(particle)
	if not HasNamedPtfxAssetLoaded(particle) then
		RequestNamedPtfxAsset(particle)
	end
	while not HasNamedPtfxAssetLoaded(particle) do
		Wait(5)
	end
	StartNetworkedParticleFxNonLoopedOnEntity("bang_sand", propAirbag, 0, 0, 0.4, 0.0, 0.0, 0.0, 0.4, 0, 0, 0)
end
