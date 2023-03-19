-- [[ Start of Config ]] --
Config = {}

-- [[ Job Related ]] --
Config.JobNames = {
    ['doj'] = "upd",
    ['sasp'] = "sasp",
    ['lspd'] = "police",
    ['bcso'] = "bcso",
    ['doc'] = "doc",
} -- Leave as is if using LENT-GovernmentJob

-- [[ Vehicle Purchase Config ]] --
-- [These must be in qb-core/shared/vehicles.lua]
Config.BuyList = {
    ['doj'] = {

    },
    ['sasp'] = {
        ['sp14charger'] = {
            ['Label'] = "2014 Dodge Charger",
            ['Vehicle'] = 'sp14charger',
            ['Hash'] = `sp14charger`,
            ['Price'] = 0,
        },
    },
    ['lspd'] = {
        ['valor1bb'] = {
            ['Label'] = "2009 Dodge Charger",
            ['Vehicle'] = 'valor1bb',
            ['Hash'] = `valor1bb`,
            ['Price'] = 20000,
            ['Garage'] = "police",
        },
        ['valor5bb'] = {
            ['Label'] = "",
            ['Vehicle'] = 'valor5bb',
            ['Hash'] = `valor5bb`,
            ['Price'] = 0,
            ['Garage'] = "police",
        },
        ['valor4bb'] = {
            ['Label'] = "",
            ['Vehicle'] = 'valor4bb',
            ['Hash'] = `valor4bb`,
            ['Price'] = 0,
            ['Garage'] = "police",
        },
        ['valor11bb'] = {
            ['Label'] = "",
            ['Vehicle'] = 'valor11bb',
            ['Hash'] = `valor11bb`,
            ['Price'] = 0,
            ['Garage'] = "police",
        },
        ['valor2bb'] = {
            ['Label'] = "",
            ['Vehicle'] = 'valor2bb',
            ['Hash'] = `valor2bb`,
            ['Price'] = 0,
            ['Garage'] = "police",
        },
        ['valor7bb'] = {
            ['Label'] = "",
            ['Vehicle'] = 'valor7bb',
            ['Hash'] = `valor7bb`,
            ['Price'] = 0,
            ['Garage'] = "police",
        },
        ['valor12bb'] = {
            ['Label'] = "",
            ['Vehicle'] = 'valor12bb',
            ['Hash'] = `valor12bb`,
            ['Price'] = 0,
            ['Garage'] = "police",
        },
        ['valor14bb'] = {
            ['Label'] = "",
            ['Vehicle'] = 'valor14bb',
            ['Hash'] = `valor14bb`,
            ['Price'] = 0,
            ['Garage'] = "police",
        },
        ['valor6bb'] = {
            ['Label'] = "",
            ['Vehicle'] = 'valor6bb',
            ['Hash'] = `valor6bb`,
            ['Price'] = 0,
            ['Garage'] = "police",
        },
        ['valor13bb'] = {
            ['Label'] = "",
            ['Vehicle'] = 'valor13bb',
            ['Hash'] = `valor13bb`,
            ['Price'] = 0,
            ['Garage'] = "police",
        },
        ['valor8bb'] = {
            ['Label'] = "",
            ['Vehicle'] = 'valor8bb',
            ['Hash'] = `valor8bb`,
            ['Price'] = 0,
            ['Garage'] = "police",
        },
        ['valor10bb'] = {
            ['Label'] = "",
            ['Vehicle'] = 'valor10bb',
            ['Hash'] = `valor10bb`,
            ['Price'] = 0,
            ['Garage'] = "police",
        },
        ['valor9bb'] = {
            ['Label'] = "",
            ['Vehicle'] = 'valor9bb',
            ['Hash'] = `valor9bb`,
            ['Price'] = 0,
            ['Garage'] = "police",
        },
        ['pdbmw'] = {
            ['Label'] = "",
            ['Vehicle'] = 'pdbmw',
            ['Hash'] = `pdbmw`,
            ['Price'] = 0,
            ['Garage'] = "police",
        },
        ['pdharley'] = {
            ['Label'] = "",
            ['Vehicle'] = 'pdharley',
            ['Hash'] = `pdharley`,
            ['Price'] = 0,
            ['Garage'] = "police",
        },
        ['pdkawaski'] = {
            ['Label'] = "",
            ['Vehicle'] = 'pdkawaski',
            ['Hash'] = `pdkawaski`,
            ['Price'] = 0,
            ['Garage'] = "police",
        },
    },
    ['bcso'] = {
        ['sh1'] = {
            ['Label'] = "2011 Crown Victoria",
            ['Vehicle'] = 'sh1',
            ['Hash'] = `sh1`,
            ['Price'] = 20000,
            ['Garage'] = "bcso",
        },
        ['sh2'] = {
            ['Label'] = "2013 Chevrolet Impala",
            ['Vehicle'] = 'sh2',
            ['Hash'] = `sh2`,
            ['Price'] = 27000,
            ['Garage'] = "bcso",
        },
        ['sh3'] = {
            ['Label'] = "2013 Ford Explorer",
            ['Vehicle'] = 'sh3',
            ['Hash'] = `sh3`,
            ['Price'] = 26000,
            ['Garage'] = "bcso",
        },
        ['sh5'] = {
            ['Label'] = "2018 Mustang",
            ['Vehicle'] = 'sh5',
            ['Hash'] = `sh5`,
            ['Price'] = 50000,
            ['Garage'] = "bcso",
        },
        ['sh6'] = {
            ['Label'] = "2010 Dodge Charger",
            ['Vehicle'] = 'sh6',
            ['Hash'] = `sh6`,
            ['Price'] = 32000,
            ['Garage'] = "bcso",
        },
        ['sh7'] = {
            ['Label'] = "2016 Chevrolet Camaro",
            ['Vehicle'] = 'sh7',
            ['Hash'] = `sh7`,
            ['Price'] = 40000,
            ['Garage'] = "bcso",
        },
        ['sh8'] = {
            ['Label'] = "2018 Dodge Demon",
            ['Vehicle'] = 'sh8',
            ['Hash'] = `sh8`,
            ['Price'] = 87000,
            ['Garage'] = "bcso",
        },
        ['sh9'] = {
            ['Label'] = "2018 Ford Taurus",
            ['Vehicle'] = 'sh9',
            ['Hash'] = `sh9`,
            ['Price'] = 29000,
            ['Garage'] = "bcso",
        },
        ['sh10'] = {
            ['Label'] = "2018 Dodge Charger",
            ['Vehicle'] = 'sh10',
            ['Hash'] = `sh10`,
            ['Price'] = 30000,
            ['Garage'] = "bcso",
        },
        ['sh12'] = {
            ['Label'] = "2014 Dodge Charger",
            ['Vehicle'] = 'sh12',
            ['Hash'] = `sh12`,
            ['Price'] = 27000,
            ['Garage'] = "bcso",
        },
        ['sh13'] = {
            ['Label'] = "2014 Chevrolet Tahoe",
            ['Vehicle'] = 'sh13',
            ['Hash'] = `sh13`,
            ['Price'] = 40000,
            ['Garage'] = "bcso",
        },
        ['sh14'] = {
            ['Label'] = "2015 F-150",
            ['Vehicle'] = 'sh14',
            ['Hash'] = `sh14`,
            ['Price'] = 27000,
            ['Garage'] = "bcso",
        },
        ['sh15'] = {
            ['Label'] = "2016 Ford Explorer",
            ['Vehicle'] = 'sh15',
            ['Hash'] = `sh15`,
            ['Price'] = 17000,
            ['Garage'] = "bcso",
        },
        ['sh16'] = {
            ['Label'] = "2014 Ram",
            ['Vehicle'] = 'sh16',
            ['Hash'] = `sh16`,
            ['Price'] = 36000,
            ['Garage'] = "bcso",
        },
        ['sh17'] = {
            ['Label'] = "2020 Chevrolet Tahoe",
            ['Vehicle'] = 'sh17',
            ['Hash'] = `sh17`,
            ['Price'] = 50000,
            ['Garage'] = "bcso",
        },
        ['sh18'] = {
            ['Label'] = "2018 Dodge Durango",
            ['Vehicle'] = 'sh18',
            ['Hash'] = `sh18`,
            ['Price'] = 25000,
            ['Garage'] = "bcso",
        },
        ['sh19'] = {
            ['Label'] = "2020 Ford Explorer",
            ['Vehicle'] = 'sh19',
            ['Hash'] = `sh19`,
            ['Price'] = 49000,
            ['Garage'] = "bcso",
        },
        ['shbike1'] = {
            ['Label'] = "Generic Sheriff BMW",
            ['Vehicle'] = 'shbike1',
            ['Hash'] = `shbike1`,
            ['Price'] = 8000,
            ['Garage'] = "bcso",
        },
        ['shbike2'] = {
            ['Label'] = "Generic Sheriff Harley",
            ['Vehicle'] = 'shbike2',
            ['Hash'] = `shbike2`,
            ['Price'] = 10000,
            ['Garage'] = "bcso",
        },
    },
    ['doc'] = {

    },
} 

-- [[ Delete List ]] --
-- [When changing car / leaving these vehicles should be deleted]
Config.LEOVehicleList = {
    ['sasp'] = {
        `sp14charger`,
    },
    ['police'] = {
        `valor1bb`, -- 09Charger
        `valor5bb`, -- 11CVPI
        `valor4bb`, -- 13Caprice 
        `valor11bb`, -- 13Explorer 
        `valor2bb`, -- 14Charger 
        `valor7bb`, -- 14Tahoe 
        `valor12bb`, -- 16Explorer
        `valor14bb`, -- 18F150 
        `valor6bb`, -- 18Taurus 
        `valor13bb`, -- 20Explorer 
        `valor8bb`, -- 20Tahoe 
        `valor10bb`, -- 21Durango 
        `valor9bb`, -- 21Tahoe 

        `pdbmw`,
        `pdharley`,
        `pdkawaski`,
    },
    ['bcso'] = {
        `sh1`,
        `sh2`,
        `sh3`,
        `sh4`,
        `sh5`,
        `sh6`,
        `sh7`,
        `sh8`,
        `sh9`,
        `sh10`,
        `sh12`,
        `sh13`,
        `sh14`,
        `sh15`,
        `sh16`,
        `sh17`,
        `sh18`,
        `sh19`,
        `shbike1`,
        `shbike2`,
    },
}