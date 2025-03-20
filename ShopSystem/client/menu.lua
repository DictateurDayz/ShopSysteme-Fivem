ESX = exports["es_extended"]:getSharedObject()

local menuState = false
local mainMenuShop = RageUI.CreateMenu(Config.titlemenu, Config.subtitle, 0, 0, Config.TextureDictionary,Config.TextureName)

-- Création des sous-menus
local foodSubMenu = RageUI.CreateSubMenu(mainMenuShop, Config.titleFoodMenu, Config.subtitleFoodMenu)
local drinkSubMenu = RageUI.CreateSubMenu(mainMenuShop, Config.titleDrinkMenu, Config.subtitleDrinkMenu)
local otherSubMenu = RageUI.CreateSubMenu(mainMenuShop, Config.titleOtherMenu, Config.subtitleOtherMenu)
local paymentMenu = RageUI.CreateSubMenu(mainMenuShop, Config.titlePaymentMenu, Config.subtitlePaymentMenu)

--- CheckBox Variable

local checkMoney = false
local checkBank = false

--- TimeOut

local cooldown = true

mainMenuShop.Closed = function()
    menuState = false;
    Dayz:DeleteCam(true)
end

function openMenuShop(currentConfigShop)
    if menuState then return end

    menuState = true
    RageUI.Visible(mainMenuShop, true)

    CreateThread(function()
        while menuState do
            if not playerInShopZone then
                RageUI.Visible(mainMenuShop, false)
                RageUI.Visible(foodSubMenu, false)
                RageUI.Visible(drinkSubMenu, false)
                RageUI.Visible(otherSubMenu, false)
                RageUI.Visible(paymentMenu, false)
                menuState = false
                Dayz:DeleteCam(true)
                break
            end

            RageUI.IsVisible(mainMenuShop, function()
                RageUI.Separator("Bienvenue au " .. Config.mainColor .. "24/7")
                RageUI.Line()

                RageUI.Button(Config.titleFoodMenu, Config.descriptionFoodMenu, { RightLabel = Config.RightLabel }, true,
                    {}, foodSubMenu)
                RageUI.Button(Config.titleDrinkMenu, Config.descriptionDrinkMenu, { RightLabel = Config.RightLabel },
                    true, {}, drinkSubMenu)
                RageUI.Button(Config.titleOtherMenu, Config.descriptionOtherMenu, { RightLabel = Config.RightLabel },
                    true, {}, otherSubMenu)
            end)

            RageUI.IsVisible(foodSubMenu, function()
                RageUI.Separator("Un envie de nourriture ? c'est ici")
                RageUI.Line()
                for _, v in ipairs(Config.Food) do
                    RageUI.Button(v.label, nil, { RightLabel = "~g~" .. v.price .. Config.MoneyType }, true, {
                        onSelected = function()
                            Dayz:infoPaymentMenu(v)
                            Dayz:CreateInput(v.label)
                        end
                    }, paymentMenu)
                end
            end)

            RageUI.IsVisible(drinkSubMenu, function()
                RageUI.Separator("petit soif ? vous êtes au bon endroit !")
                RageUI.Line()
                for _, v in ipairs(Config.Drink) do
                    RageUI.Button(v.label, nil, { RightLabel = "~g~" .. v.price .. Config.MoneyType }, true, {
                        onSelected = function()
                            Dayz:infoPaymentMenu(v)
                            Dayz:CreateInput(v.label)
                        end
                    }, paymentMenu)
                end
            end)

            RageUI.IsVisible(otherSubMenu, function()
                RageUI.Separator("Fan de tech et de gadjet, c'est ici")
                RageUI.Line()
                for _, v in ipairs(Config.Other) do
                    RageUI.Button(v.label, nil, { RightLabel = "~g~" .. v.price .. Config.MoneyType }, true, {
                        onSelected = function()
                            Dayz:infoPaymentMenu(v)
                            Dayz:CreateInput(v.label)
                        end
                    }, paymentMenu)
                end
            end)

            RageUI.IsVisible(paymentMenu, function()
                RageUI.Separator(("Article choisie : %s %s"):format(Config.mainColor, label))
                RageUI.Separator(("Prix de l'article : ~g~ %s%s"):format(price, Config.MoneyType))
                RageUI.Line()

                RageUI.Checkbox("Payer en Liquide", nil, checkMoney, {}, {
                    onChecked = function()
                        checkMoney = true
                    end,
                    onUnChecked = function()
                        checkMoney = false
                    end
                })
                RageUI.Checkbox("Payer en Banque", nil, checkBank, {}, {
                    onChecked = function()
                        checkBank = true
                    end,
                    onUnChecked = function()
                        checkBank = false
                    end
                })

                RageUI.Line()

                RageUI.Button("Payer votre commande", nil, { RightLabel = ("~g~ %s%s (x%s)"):format((tonumber(price) or 0) * (tonumber(selectedQuantity) or 1), Config.MoneyType, selectedQuantity or 1) }, cooldown, {
                    onSelected = function()
                        if checkBank and not checkMoney then
                            TriggerServerEvent("Dayz:BuyItem", price, name, label, selectedQuantity, checkMoney, checkBank, Config.MoneyType, currentConfigShop)
                            RageUI.Visible(mainMenuShop, false)
                            RageUI.Visible(foodSubMenu, false)
                            RageUI.Visible(drinkSubMenu, false)
                            RageUI.Visible(otherSubMenu, false)
                            RageUI.Visible(paymentMenu, false)
                            menuState = false
                            Dayz:DeleteCam(true)
                        elseif checkMoney and not checkBank then
                            TriggerServerEvent("Dayz:BuyItem", price, name, label, selectedQuantity, checkMoney, checkBank, Config.MoneyType, currentConfigShop)
                            RageUI.Visible(mainMenuShop, false)
                            RageUI.Visible(foodSubMenu, false)
                            RageUI.Visible(drinkSubMenu, false)
                            RageUI.Visible(otherSubMenu, false)
                            RageUI.Visible(paymentMenu, false)
                            menuState = false
                            Dayz:DeleteCam(true)
                        elseif not checkBank and not checkMoney then
                            cooldown = false
                            ESX.ShowNotification("Veuillez sélectionner ~r~un mode de paiement.~s~")
                            Dayz:AnimPed("anim@heists@ornate_bank@chat_manager", "fail", 76, -1, 1.5, currentConfigShop.pedId)
                            Dayz:SpeechPed("GENERIC_INSULT_HIGH", "SPEECH_PARAMS_FORCE_SHOUTED", currentConfigShop.pedId)
                            Citizen.SetTimeout(1000, function ()
                                cooldown = true
                            end)
                        elseif checkBank and checkMoney then
                            cooldown = false
                            ESX.ShowNotification("Veuillez choisir ~r~un seul mode de paiement.~s~")
                            Dayz:AnimPed("anim@heists@ornate_bank@chat_manager", "fail", 76, -1, 1.5, currentConfigShop.pedId)
                            Dayz:SpeechPed("GENERIC_INSULT_HIGH", "SPEECH_PARAMS_FORCE_SHOUTED", currentConfigShop.pedId)
                            Citizen.SetTimeout(1000, function ()
                                cooldown = true
                            end)
                        end
                    end
                })
            end)



            Wait(0)
        end
    end)
end
