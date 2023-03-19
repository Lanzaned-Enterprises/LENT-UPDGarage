-- [[ Variables ]] --
local QBCore = exports['qb-core']:GetCoreObject()

-- [[ Functions ]] --
function GeneratePlate()
    local plate = QBCore.Shared.RandomInt(1) .. QBCore.Shared.RandomStr(2) .. QBCore.Shared.RandomInt(3) .. QBCore.Shared.RandomStr(2)
    local result = MySQL.scalar.await('SELECT plate FROM player_vehicles WHERE plate = ?', {plate})
    if result then
        return GeneratePlate()
    else
        return plate:upper()
    end
end

-- [[ Events ]]
RegisterNetEvent('LENT-UPDShop:Server:PurchaseVehicle', function(label, vehicle, hash, price, garage)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local cid = Player.PlayerData.citizenid
    local plate = GeneratePlate()

    if Player.PlayerData.money.cash >= price then
        Player.Functions.RemoveMoney('cash', price)

        MySQL.insert('INSERT INTO player_vehicles (license, citizenid, vehicle, hash, mods, plate, garage, state) VALUES (?, ?, ?, ?, ?, ?, ?, ?)', {
            Player.PlayerData.license,
            cid,
            vehicle,
            hash,
            '{}',
            plate,
            garage,
            1
        })

        TriggerClientEvent('QBCore:Notify', src, 'You bought a ' .. label .. ' for $' .. price, 'success')
        TriggerClientEvent('vehiclekeys:client:SetOwner', src, plate)
        TriggerClientEvent('LENT-UPDShop:Client:PhoneEmail', src, label, vehicle, hash, price, garage)
    else
        TriggerClientEvent('QBCore:Notify', src, 'You do not have enough money', 'error')
    end
end)

-- [[ Routing Buckets ]] --
RegisterNetEvent('LENT-UPDGarage:Server:SetBucket', function(location)
    local src = source
    if location == "lspd" then
        SetPlayerRoutingBucket(src, 600)
    elseif location == "bcso" then
        SetPlayerRoutingBucket(src, 700)
    end
end)

RegisterNetEvent('LENT-UPDGarage:Server:RemoveBucket', function()
    local src = source
    SetPlayerRoutingBucket(src, 0)
end)