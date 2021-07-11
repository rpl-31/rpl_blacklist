-- ' r†plêê#0099 
weaponblacklist = {
	"WEAPON_MINIGUN",
	"WEAPON_SNIPERRIFLE"
	
	
}

disableallweapons = false

Citizen.CreateThread(function()
	while true do
		Wait(1)

		playerPed = GetPlayerPed(-1)
		if playerPed then
			nothing, weapon = GetCurrentPedWeapon(playerPed, true)

			if disableallweapons then
				RemoveAllPedWeapons(playerPed, true)
			else
				if isWeaponBlacklisted(weapon) then
					RemoveWeaponFromPed(playerPed, weapon)
					exports['mythic_notify']:SendAlert('error', 'Bu silah sunucu yönetimi tarafından blackliste alınmıştır .', 8000, { ['background-color'] = '#0E506C', ['color'] = '#FFFFFF' })
				end
			end
		end
	end
end)

function isWeaponBlacklisted(model)
	for _, blacklistedWeapon in pairs(weaponblacklist) do
		if model == GetHashKey(blacklistedWeapon) then
			return true
		end
	end

	return false
end