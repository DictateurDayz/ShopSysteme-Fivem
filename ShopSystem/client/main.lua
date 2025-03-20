playerInShopZone = false

Citizen.CreateThread(function()
    Dayz:CreatePeds()
    Dayz:CreateBlips()

    while true do
        local Sleep = 1000
        local ped = PlayerPedId()
        local playerPos = GetEntityCoords(ped)
        local InShopZone = false

        for _, shop in pairs(Config.Positon) do
            local dst = #(shop.pos - playerPos)
            if dst <= 2 then
                Sleep = 0
                InShopZone = true
                Dayz:CreateTextUi(Config.textUI)
        
                if IsControlJustReleased(0, 38) then
                    print(shop)
                    openMenuShop(shop)
                    Dayz:CreateCam(shop.pedId)
                    Dayz:SpeechPed("GENERIC_HI", "SPEECH_PARAMS_FORCE", shop.pedId)
                end
            end
        end
        playerInShopZone = InShopZone
        Wait(Sleep)
    end
end)

RegisterNetEvent("Dayz:onSucces")
AddEventHandler("Dayz:onSucces", function(currentConfigShop)
    Dayz:AnimPed("anim@mp_player_intincarthumbs_upstd@rps@", "enter_fp", 32, -1, 1.5, currentConfigShop.pedId)
    Dayz:SpeechPed("GENERIC_THANKS", "SPEECH_PARAMS_FORCE_SHOUTED", currentConfigShop.pedId)
end)

RegisterNetEvent("Dayz:onError")
AddEventHandler("Dayz:onError", function(currentConfigShop)
    Dayz:AnimPed("anim@mp_player_intincarthumbs_upstd@rps@", "enter_fp", 32, -1, 1.5, currentConfigShop.pedId)
    Dayz:SpeechPed("GENERIC_INSULT_HIGH", "SPEECH_PARAMS_FORCE_SHOUTED", currentConfigShop.pedId)
end)



