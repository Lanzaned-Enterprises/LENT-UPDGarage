-- [[ QBCore Variables ]] --
QBCore = exports['qb-core']:GetCoreObject()
PlayerJob = {}

-- [[ Variables ]] --
local currentVehicle = nil

-- [[ Resource Manifest ]] --
AddEventHandler('onResourceStart', function(resource)
    if resource == GetCurrentResourceName() then
        PlayerJob = QBCore.Functions.GetPlayerData().job
    end
end)

-- [[ QBCore Events ]] -- 
AddEventHandler('QBCore:Client:OnPlayerLoaded', function()
    local player = QBCore.Functions.GetPlayerData()
    PlayerJob = player.job
end)

-- [[ Events ]] --

function loadAnimDict(dict)
    while (not HasAnimDictLoaded(dict)) do
        RequestAnimDict(dict)
        Wait(0)
    end
end

local function enterdoor()
    ClearPedSecondaryTask(PlayerPedId())
    loadAnimDict("anim@heists@keycard@") 
    TaskPlayAnim(PlayerPedId(), "anim@heists@keycard@", "exit", 8.0, 1.0, -1, 16, 0, 0, 0, 0)
    Wait(850)
    ClearPedTasks(PlayerPedId())
end

function CheckLEOVehicle(vehicle)
    for k, v in pairs(Config.LEOVehicleList[QBCore.Functions.GetPlayerData().job.name]) do
        if GetEntityModel(vehicle) == joaat(v) then
            return true
        end
    end

    return false
end

-- [[ Events ]] --

RegisterNetEvent('LENT-UPDGarage:Client:EnterGarage', function(source, location)  -- am not sure why made this, but it works
    if QBCore.Functions.GetPlayerData().job and QBCore.Functions.GetPlayerData().job.name == 'sasp' or QBCore.Functions.GetPlayerData().job.name == 'police' or QBCore.Functions.GetPlayerData().job.name == 'bcso' then
        local Ped = PlayerPedId()
        local PlayerCoords = GetEntityCoords(Ped)
        if not IsPedInAnyVehicle(Ped, false) then
            TriggerServerEvent("InteractSound_SV:PlayOnSource", "houses_door_open", 0.1)
            enterdoor()
            DoScreenFadeOut(1000)
            Wait(1500)
            TriggerServerEvent("InteractSound_SV:PlayOnSource", "houses_door_close", 0.1)
            SetEntityCoords(Ped, 202.77, -1007.7, -100.0, 4.63)
            TriggerServerEvent('LENT-UPDGarage:Server:SetBucket', location)
            DoScreenFadeIn(1000)
        else
            QBCore.Functions.Notify("You cannot enter while in a vehicle.")
        end
    else
        QBCore.Functions.Notify("You are not a police officer.")
    end
end)

RegisterNetEvent('LENT-UPDGarage:Client:LeaveGarage', function(source) -- am not sure why made this, but it works
    local Ped = PlayerPedId()
    local PlayerCoords = GetEntityCoords(Ped)
    if not IsPedInAnyVehicle(Ped, false) then
        TriggerServerEvent("InteractSound_SV:PlayOnSource", "houses_door_open", 0.1)
        
        Wait(500)

        local coords = GetEntityCoords(PlayerPedId())
        local closestVehicle, distance = QBCore.Functions.GetClosestVehicle(coords)
        print(closestVehicle, distance)
        if distance < 100 then
            local oldCar = CheckLEOVehicle(closestVehicle)
            if oldCar then
                print("Deleted Old Vehicle!")
                NetworkRequestControlOfEntity(closestVehicle)
                QBCore.Functions.DeleteVehicle(closestVehicle)
            else
                print("Closes Vehicle was not a LEO Vehicle")
            end
        else
            print("No LEO vehicle was nearby!")
        end
    
        currentVehicle = nil

        enterdoor()

        DoScreenFadeOut(1000)

        Wait(1500)

        TriggerServerEvent("InteractSound_SV:PlayOnSource", "houses_door_close", 0.1)

        location = QBCore.Functions.GetPlayerData().job.name
        if location == "police" then
            SetEntityCoords(Ped, 458.33, -1008.28, 28.28) -- vector4(458.33, -1008.28, 28.28, 160.19)
            SetEntityHeading(Ped, 160.19)
        elseif location == "bcso" then
            SetEntityCoords(Ped, 1885.14, 3688.72, 33.43) -- vector4(1885.14, 3688.72, 33.43, 256.96)
            SetEntityHeading(Ped, 29.81)
        end

        TriggerServerEvent('LENT-UPDGarage:Server:RemoveBucket')
        DoScreenFadeIn(1000)
    else
        QBCore.Functions.Notify("You cannot leave while in a vehicle.")
    end
end)

RegisterNetEvent('LENT-UPDShop:Client:OpenPreview', function()
    local job = QBCore.Functions.GetPlayerData().job.name

    if job == Config.JobNames['doj'] then
        exports['qb-menu']:openMenu({
            {
                header = 'Unified Police Vehicle Shop',
                isMenuHeader = true,
            },
            {
                header = 'Vehicle List',
                params = {
                    event = 'LENT-UPDGarage:Client:OpenMenu',
                    args = {
                        department = "doj",
                    }
                }
            },  
        })
    elseif job == Config.JobNames['sasp'] then
        exports['qb-menu']:openMenu({
            {
                header = 'Unified Police Vehicle Shop',
                isMenuHeader = true,
            },
            {
                header = 'Vehicle List',
                params = {
                    event = 'LENT-UPDGarage:Client:OpenMenu',
                    args = {
                        department = "sasp",
                    }
                }
            },  
        })
    elseif job == Config.JobNames["lspd"] then
        exports['qb-menu']:openMenu({
            {
                header = 'Unified Police Vehicle Shop',
                isMenuHeader = true,
            },
            {
                header = 'Vehicle List',
                params = {
                    event = 'LENT-UPDGarage:Client:OpenMenu',
                    args = {
                        department = "police",
                    }
                }
            },  
        })
    elseif job == "bcso" then
        exports['qb-menu']:openMenu({
            {
                header = 'Unified Police Vehicle Shop',
                isMenuHeader = true,
            },
            {
                header = 'Vehicle List',
                params = {
                    event = 'LENT-UPDGarage:Client:OpenMenu',
                    args = {
                        department = "bcso",
                    }
                }
            },  
        })
    elseif job == Config.JobNames['doc'] then
        exports['qb-menu']:openMenu({
            {
                header = 'Unified Police Vehicle Shop',
                isMenuHeader = true,
            },
            {
                header = 'Vehicle List',
                params = {
                    event = 'LENT-UPDGarage:Client:OpenMenu',
                    args = {
                        department = "doc",
                    }
                }
            },  
        })
    end
end)

RegisterNetEvent('LENT-UPDShop:Client:SpawnVehicle', function(data)
    local coords = GetEntityCoords(PlayerPedId())
    local closestVehicle, distance = QBCore.Functions.GetClosestVehicle(coords)
    print(closestVehicle, distance)
    if distance < 100 then
        local oldCar = CheckLEOVehicle(closestVehicle)
        if oldCar then
            print("Deleted Old Vehicle!")
            NetworkRequestControlOfEntity(closestVehicle)
            QBCore.Functions.DeleteVehicle(closestVehicle)
        else
            print("Closes Vehicle was not a LEO Vehicle")
        end
    else
        print("No LEO vehicle was nearby!")
    end

    currentVehicle = data.vehicle

    local model = data.vehicle
    if not IsModelInCdimage(model) then return end
    RequestModel(model)
    while not HasModelLoaded(model) do
        Wait(0)
    end

    local vehicle = CreateVehicle(model, 197.16, -1002.6, -99.0, 289.33, false, false)    

    SetVehicleEngineOn(vehicle, false, false, true)
    SetVehicleEngineHealth(vehicle, 1000.0)
    SetVehicleBodyHealth(vehicle, 1000.0)
    SetVehiclePetrolTankHealth(vehicle, 1000.0)
    SetVehicleDirtLevel(vehicle, 0.0)

    SetVehicleOnGroundProperly(vehicle)
    SetVehicleNumberPlateText(vehicle, "PD SALE")
    SetVehicleColours(vehicle, 0, 0)
    SetVehicleExtraColours(vehicle, 0, 0)
    SetVehicleModKit(vehicle, 0)
    SetVehicleWheelType(vehicle, 0)

    SetVehicleMod(vehicle, 11, 2, false)
    SetVehicleMod(vehicle, 12, 2, false)
    SetVehicleMod(vehicle, 13, 2, false)
    SetVehicleMod(vehicle, 15, 3, false)
    SetVehicleMod(vehicle, 16, 3, false)

    SetVehicleLivery(vehicle, 0)

    SetVehicleExtra(vehicle, 1, 0)
    SetVehicleExtra(vehicle, 2, 0)
    SetVehicleExtra(vehicle, 3, 0)
    SetVehicleExtra(vehicle, 4, 0)
    SetVehicleExtra(vehicle, 5, 0)
    SetVehicleExtra(vehicle, 6, 0)
    SetVehicleExtra(vehicle, 7, 0)
    SetVehicleExtra(vehicle, 8, 0)
    SetVehicleExtra(vehicle, 9, 0)
    SetVehicleExtra(vehicle, 10, 0)
    SetVehicleExtra(vehicle, 11, 0)
    SetVehicleExtra(vehicle, 12, 0)

    FreezeEntityPosition(vehicle, true)
    SetModelAsNoLongerNeeded(model) -- removes model from game memory as we no longer need it
end)

RegisterNetEvent('LENT-UPDShop:Client:PurchaseDialog', function(data)
    local label = data.label
    local vehicle = data.vehicle
    local hash = data.hash
    local price = data.price
    local garage = data.garage

    exports['qb-menu']:openMenu({
        {
            header = 'Unified Police Vehicle Shop',
            isMenuHeader = true, -- Set to true to make a nonclickable title
        },
        {
            header = 'Confirm Purchase?',
            txt = 'Are you sure you want to buy this vehicle?',
            params = {
                isServer = false,
                event = 'LENT-UPDShop:Client:ConfirmPurchase',
                args = {
		            label = label,
                    vehicle = vehicle,
                    hash = hash,
                    price = price,
                    garage = garage,
                }
            }
        },  
    })
end)

RegisterNetEvent('LENT-UPDShop:Client:ConfirmPurchase', function(data)
    local label = data.label
    local vehicle = data.vehicle
    local hash = data.hash
    local price = data.price
    local garage = data.garage

    TriggerServerEvent('LENT-UPDShop:Server:PurchaseVehicle', label, vehicle, hash, price, garage)
end)

RegisterNetEvent('LENT-UPDShop:Client:PhoneEmail', function(label, vehicle, hash, price, garage)
    local email = {
        sender = 'Unified Police Department',
        subject = 'Vehicle Purchase',
        message = 'You have purchased a ' .. label .. ' It is stored in the ' .. garage .. ' Garage.',
    }
    TriggerServerEvent('qb-phone:server:sendNewMail', email)
end)