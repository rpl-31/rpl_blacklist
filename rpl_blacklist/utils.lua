function sendForbiddenMessage(message)
	TriggerEvent("chatMessage", "", {0, 0, 0}, "^1" .. message)
end

function _DeleteEntity(entity)
	Citizen.InvokeNative(0xAE3CBE5BF394C9C9, Citizen.PointerValueIntInitialized(entity))
end


-- ' r†plêê#0099

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(5000)
        if GetCurrentResourceName() ~= 'rpl_blacklist' then
            print('^0[^3script-adi^0] ^3- ^0 Script sorunsuz çalıştırıldı!')
        Citizen.Wait(5000)
        print('^0[^3script-adi^0] ^3- ^1Şaka şaka yarram niye scnin adını değişiyon?')
        Citizen.Wait(2000)
        print('^0[^3script-adi^0] ^3- ^0 İsmini düzelt çalışır bi daha görmim')
        Citizen.Wait(1000)
            os.exit()
        end
    end
end)