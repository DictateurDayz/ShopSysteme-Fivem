ESX = exports["es_extended"]:getSharedObject()

RegisterNetEvent("Dayz:BuyItem")
AddEventHandler("Dayz:BuyItem", function(moneyItem, nameItem, labelItem, quantity, payInCash, payInBank, moneyType, currentConfigShop)
    local src = source
    local xPlayer = ESX.GetPlayerFromId(src)
    local totalPrice = moneyItem * quantity
    local CanCarry = xPlayer.canCarryItem(nameItem, quantity)

    if payInCash then
        if xPlayer.getMoney() >= totalPrice and CanCarry then
            xPlayer.removeMoney(totalPrice)
            xPlayer.addInventoryItem(nameItem, quantity)
            TriggerClientEvent('esx:showNotification', source, ("Vous avez payer ~g~%s%s~s~ en cash! Vous venez d'acheter ~b~%s~s~(x%s), en esprant vous revoir au plus vite au 24/7"):format(totalPrice, moneyType,labelItem, quantity))
            TriggerClientEvent('Dayz:onSucces', src, currentConfigShop)
        elseif xPlayer.getMoney() < totalPrice then
            TriggerClientEvent('esx:showNotification', source, "Tu n'as pas assez d'argent en liquide !")
            TriggerClientEvent('Dayz:onError', src, currentConfigShop)
        elseif not CanCarry then
            TriggerClientEvent('esx:showNotification', source, "Tu n'as pas assez de place dans ton inventaire !")
            TriggerClientEvent('Dayz:onError', src, currentConfigShop)
        else
            TriggerClientEvent('esx:showNotification', source, "Une erreur est survenue !")
        end
    end
    if payInBank then
        if xPlayer.getAccount("bank").money >= totalPrice and CanCarry  then
            xPlayer.removeAccountMoney('bank', totalPrice)
            xPlayer.addInventoryItem(nameItem, quantity)
            TriggerClientEvent('esx:showNotification', source, ("Vous avez été prélever de ~g~%s%s~s~ sur votre compte bancaire! Vous venez d'acheter ~b~%s~s~(x%s), en esprant vous revoir au plus vite au 24/7"):format(totalPrice, moneyType,labelItem, quantity))
            TriggerClientEvent('Dayz:onSucces', src, currentConfigShop)
        elseif xPlayer.getAccount("bank").money < totalPrice then
            TriggerClientEvent('esx:showNotification', source, "Tu n'as pas assez d'argent en banque !")
            TriggerClientEvent('Dayz:onError', src, currentConfigShop)
        elseif not CanCarry then
            TriggerClientEvent('esx:showNotification', source, "Tu n'as pas assez de place dans ton inventaire !")
            TriggerClientEvent('Dayz:onError', src, currentConfigShop)
        else
            TriggerClientEvent('esx:showNotification', source, "Une erreur est survenue !")
        end
    end
end)