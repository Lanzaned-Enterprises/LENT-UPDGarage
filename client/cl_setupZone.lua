AddEventHandler('onResourceStop', function(resourceName)
    if GetCurrentResourceName() == resourceName then
        DeleteZones()
    end
end)

local ZoneSpawned = false 
local ZoneCreated = {}

local hasCreatedPolyZones = false
local Poly = {
    -- [[ Misc Zones ]] -- 
    ["UPDShopExit"] = {
        ["name"] = "UPDShopExit",
        ["coords"] = vector3(208.11, -999.09, -99.0),
        ["height"] = 1.45, ["width"] = 1.0, ["heading"] = 0, ["debug"] = false,
        ["minZ"] = -101.6,
        ["maxZ"] = -97.6,
        ["type"] = "client", ["event"] = "LENT-GovernmnetJob:Client:ShopOptions",
        ["icon"] = "fa-solid fa-exit", ["label"] = "Shop Options",
    },
    ["UPDShopComputer"] = {
        ["name"] = "UPDShopComputer",
        ["coords"] = vector3(206.79, -994.08, -99.0),
        ["height"] = 0.4, ["width"] = 0.6, ["heading"] = 45, ["debug"] = false,
        ["minZ"] = -102.6,
        ["maxZ"] = -98.6,
        ["type"] = "client", ["event"] = "LENT-UPDShop:Client:OpenPreview",
        ["icon"] = "fa-solid fa-image", ["label"] = "Select Vehicle",
    },
}

-- [[ PolyZones ]] --
CreateThread(function()
    if not hasCreatedPolyZones then
        for k, v in pairs(Poly) do
            if ZoneSpawned then
                return
            end
    
            for k, v in pairs(Poly) do
                if not ZoneCreated[k] then
                    ZoneCreated[k] = {}
                end
    
                ZoneCreated[k] = exports['qb-target']:AddBoxZone(v["name"], v["coords"], v["height"], v["width"], { 
                    name = v["name"],
                    heading = v["heading"],
                    debugPoly = v["debug"],
                    minZ = v["minZ"],
                    maxZ = v["maxZ"],
                }, { 
                    options = { 
                        {
                            type = v["type"],
                            event = v["event"],
                            icon = v["icon"],
                            label = v["label"], 
                            job = v["job"],
                        },
                    },
                    distance = v["distance"]
                })  
                -- print("Created: " .. k)
            end
    
            ZoneSpawned = true
        end
    end
end)

function DeleteZones()
    if ZoneSpawned then
        for k, v in pairs(ZoneCreated) do
            print("Deleted: " .. k .. " Removing: " .. v["name"])
            exports['qb-target']:RemoveZone(k)
            exports['qb-target']:RemoveZone(v["name"])
        end
    end
end