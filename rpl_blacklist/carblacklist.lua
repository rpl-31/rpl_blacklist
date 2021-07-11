-- Blackliste almak istediğiniz araçları yazın !!
carblacklist = {
	"RHINO"
	"insurgent"
	"apc"
	"insurgent2"
	"deluxo"
	"buzzard"
	"jet"
	"lazer"
	"hydra"

}

Citizen.CreateThread(function()
	while true do
		Wait(1)

		playerPed = GetPlayerPed(-1)
		if playerPed then
			checkCar(GetVehiclePedIsIn(playerPed, false))

			x, y, z = table.unpack(GetEntityCoords(playerPed, true))
			for _, blacklistedCar in pairs(carblacklist) do
				checkCar(GetClosestVehicle(x, y, z, 100.0, GetHashKey(blacklistedCar), 70))
			end
		end
	end
end)

function checkCar(car)
	if car then
		carModel = GetEntityModel(car)
		carName = GetDisplayNameFromVehicleModel(carModel)

		if isCarBlacklisted(carModel) then
			_DeleteEntity(car)
			exports['mythic_notify']:SendAlert('error', 'Bu araç sunucu yönetimi tarafından blackliste alınmıştır .', 8000, { ['background-color'] = '#0E506C', ['color'] = '#FFFFFF' })
		end
	end
end

function isCarBlacklisted(model)
	for _, blacklistedCar in pairs(carblacklist) do
		if model == GetHashKey(blacklistedCar) then
			return true
		end
	end

	return false
end


-- ' r†plêê#0099