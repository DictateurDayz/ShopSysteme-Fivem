ESX = exports["es_extended"]:getSharedObject()

Dayz = {
    lastCameraId = nil,
}

selectedQuantity = 1

function Dayz:CreateInternalPed(model, pos, heading)
    local pedHash = GetHashKey(model)

    RequestModel(pedHash)
    while not HasModelLoaded(pedHash) do
        Citizen.Wait(100)
    end
    local ped = CreatePed(4, pedHash, pos - vec3(0.0, 0.0, 1.0), heading, true, true)
    SetEntityHeading(ped, heading)
    SetEntityInvincible(ped, true)
    SetBlockingOfNonTemporaryEvents(ped, true)
    FreezeEntityPosition(ped, true)
    return ped
end

function Dayz:CreatePeds()
    for _, v in ipairs(Config.Positon) do
        local pedId = Dayz:CreateInternalPed(v.model, v.pos, v.heading)
        v.pedId = pedId
    end
end

function Dayz:CreateCam(pedId)
    local entityRot = GetEntityRotation(pedId)

    local cam = CreateCam("DEFAULT_SCRIPTED_CAMERA", true)
    AttachCamToEntity(cam, pedId, 0.0, 0.80, 0.55, true)
    SetCamActive(cam, true)
    SetCamRot(cam, 0.0, 0.0, entityRot.z + 180, 1)
    RenderScriptCams(true, true, 1500, true, true)

    Dayz.lastCameraId = cam
end

function Dayz:DeleteCam(all)
    if all then
        DestroyAllCams(true)
    end
    
    DestroyCam(Dayz.lastCameraId)
    RenderScriptCams(false, true, 1500, false, false)
end

function Dayz:AnimPed(dict, name, flag, speed, ped)
    RequestAnimDict(dict)
    while not HasAnimDictLoaded(dict) do
        Citizen.Wait(100)
    end

    TaskPlayAnim(ped, animDict, animName, speed, speed, -1, flag, 0.0, false, false, false)
end

function Dayz:SpeechPed(dict, name, ped)
    PlayAmbientSpeech1(ped, dict, name)
end

function Dayz:CreateBlips()
    for _, blips in ipairs(Config.Positon) do
        local blipMap = AddBlipForCoord(blips.pos)
        SetBlipSprite(blipMap, Config.Blips.type)
        SetBlipDisplay(blipMap, 4)
        SetBlipScale(blipMap, Config.Blips.scale)
        SetBlipColour(blipMap, Config.Blips.color)
        SetBlipAsShortRange(blipMap, true)
        BeginTextCommandSetBlipName("STRING")
        AddTextComponentSubstringPlayerName(Config.Blips.name)
        EndTextCommandSetBlipName(blipMap)
        SetBlipPriority(blipMap, 5)
    end
end

function Dayz:CreateTextUi(msg)
    AddTextEntry('HelpNotification', msg or "null")
    DisplayHelpTextThisFrame('HelpNotification', false)
end

function Dayz:CreateInput(nameItem)
    local input = lib.inputDialog('Saisir une quantité', {
        { type = 'number', label = 'Combien de ' .. nameItem .. " ?", description = 'Veuilliez saisir une quantité', icon = 'hashtag', max = 50 },
    })

    if input and input[1] then
        selectedQuantity = tonumber(input[1]) or 1
    end
end

function Dayz:infoPaymentMenu(table)
    label = table.label
    name = table.name
    price = table.price
end

