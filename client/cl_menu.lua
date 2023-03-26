RegisterNetEvent('LENT-UPDGarage:Client:OpenMenu', function(data)
    if data.department == "doj" then
        local vehicleList = {}
        vehicleList[#vehicleList + 1] = {
            isMenuHeader = true,
            header = 'Unified Police Vehicle Shop',
        }
        for k, v in pairs(Config.BuyList['doj']) do
            vehicleList[#vehicleList + 1] = { -- insert data from our loop into the menu
            header = v["Label"],
            params = {
                event = 'LENT-UPD:Client:VehicleOptions', -- event name
                args = {
                    label = v["Label"],
                    vehicle = v["Vehicle"],
                    hash = v["Hash"],
                    price = v["Price"],
                    garage = v["Garage"],
                }
            }
        }
        end
        
        exports['qb-menu']:openMenu(vehicleList)
    elseif data.department == "sasp" then
        local vehicleList = {}
        vehicleList[#vehicleList + 1] = {
            isMenuHeader = true,
            header = 'Unified Police Vehicle Shop',
        }
        for k, v in pairs(Config.BuyList['sasp']) do
            vehicleList[#vehicleList + 1] = { -- insert data from our loop into the menu
            header = v["Label"],
            params = {
                event = 'LENT-UPD:Client:VehicleOptions', -- event name
                args = {
                    label = v["Label"],
                    vehicle = v["Vehicle"],
                    hash = v["Hash"],
                    price = v["Price"],
                    garage = v["Garage"],
                }
            }
        }
        end
        
        exports['qb-menu']:openMenu(vehicleList)
    elseif data.department == "police" then
        local vehicleList = {}
        vehicleList[#vehicleList + 1] = {
            isMenuHeader = true,
            header = 'Unified Police Vehicle Shop',
        }
        for k, v in pairs(Config.BuyList['lspd']) do
            vehicleList[#vehicleList + 1] = { -- insert data from our loop into the menu
            header = v["Label"],
            params = {
                event = 'LENT-UPD:Client:VehicleOptions', -- event name
                args = {
                    label = v["Label"],
                    vehicle = v["Vehicle"],
                    hash = v["Hash"],
                    price = v["Price"],
                    garage = v["Garage"],
                }
            }
        }
        end

        exports['qb-menu']:openMenu(vehicleList)
    elseif data.department == "bcso" then
          local vehicleList = {}
        vehicleList[#vehicleList + 1] = {
            isMenuHeader = true,
            header = 'Unified Police Vehicle Shop',
        }
        for k, v in pairs(Config.BuyList['bcso']) do
            vehicleList[#vehicleList + 1] = { -- insert data from our loop into the menu
            header = v["Label"],
            params = {
                event = 'LENT-UPD:Client:VehicleOptions', -- event name
                args = {
                    label = v["Label"],
                    vehicle = v["Vehicle"],
                    hash = v["Hash"],
                    price = v["Price"],
                    garage = v["Garage"],
                }
            }
        }
        end
        
        exports['qb-menu']:openMenu(vehicleList)
    elseif data.department == "doc" then
        local vehicleList = {}
        vehicleList[#vehicleList + 1] = {
            isMenuHeader = true,
            header = 'Unified Police Vehicle Shop',
        }
        for k, v in pairs(Config.BuyList['doc']) do
            vehicleList[#vehicleList + 1] = { -- insert data from our loop into the menu
            header = v["Label"],
            params = {
                event = 'LENT-UPD:Client:VehicleOptions', -- event name
                args = {
                    label = v["Label"],
                    vehicle = v["Vehicle"],
                    hash = v["Hash"],
                    price = v["Price"],
                    garage = v["Garage"],
                }
            }
        }
        end
        
        exports['qb-menu']:openMenu(vehicleList)
    end
end)

RegisterNetEvent('LENT-UPD:Client:VehicleOptions', function(data)
    exports['qb-menu']:openMenu({
        {
            header = 'Unified Police Vehicle Shop',
            isMenuHeader = true,
        },
        {
            header = 'Spawn Vehicle',
            params = {
                event = 'LENT-UPDShop:Client:SpawnVehicle',
                args = {
                    vehicle = data.hash
                }
            }
        },
        {
            header = 'Purchase Vehicle',
            txt = "Vehicle Cost: " .. data.price,
            params = {
                event = 'LENT-UPDShop:Client:PurchaseDialog',
                args = {
                    label = data.label,
                    vehicle = data.vehicle,
                    hash = data.hash,
                    price = data.price,
                    garage = data.garage,
                }
            }  
        }
    })
end)