local ship = 0
local existship = 0

local Robot = true
local Dropship = true
local Shuttle = true
local Fighter = true
local Royal = true
local Scientific = true
local Alien = true
local Sail = true
local maxSclass = false

local ShipType = {Robot, Dropship, Shuttle, Fighter, Royal, Scientific, Alien, Sail}

inputPrompts = {
    ChangeScriptSettings = {false,
[[  Would you like to change the script's settings?
    Pressing ENTER without a response to any question will use CURRENT settings from the Lua script.
]]},
    generateRobot = {Robot,
[[  Do you want to enable the generation of Interceptors?
    Default: Y | Current: >> ]] .. (Robot and "Y" or "N") .. [[ <<
]]},
    generateDropship = {Dropship,
[[  Do you want to enable the generation of Haulers?
    Default: Y | Current: >> ]] .. (Dropship and "Y" or "N") .. [[ <<
]]},
    generateShuttle = {Shuttle,
[[  Do you want to enable the generation of Shuttles?
    Default: Y | Current: >> ]] .. (Shuttle and "Y" or "N") .. [[ <<
]]},
    generateFighter = {Fighter,
[[  Do you want to enable the generation of Fighters?
    Default: Y | Current: >> ]] .. (Fighter and "Y" or "N") .. [[ <<
]]},
    generateRoyal = {Royal,
[[  Do you want to enable the generation of Exotics?
    Default: Y | Current: >> ]] .. (Royal and "Y" or "N") .. [[ <<
]]},
    generateScientific = {Scientific,
[[  Do you want to enable the generation of Explorers?
    Default: Y | Current: >> ]] .. (Scientific and "Y" or "N") .. [[ <<
]]},
    generateAlien = {Alien,
[[  Do you want to enable the generation of Aliens?
    Default: Y | Current: >> ]] .. (Alien and "Y" or "N") .. [[ <<
]]},
    generateSail = {Sail,
[[  Do you want to enable the generation of Solars?
    Default: Y | Current: >> ]] .. (Sail and "Y" or "N") .. [[ <<
]]},
    ChangeSProbability = {maxSclass,
[[  Do you want to change all the generated ships to S-class?
    Default: N | Current: >> ]] .. (maxSclass and "Y" or "N") .. [[ <<
]]},
}

if GUIF(inputPrompts.ChangeScriptSettings,10) then
    Robot = GUIF(inputPrompts.generateRobot,10)
    Dropship = GUIF(inputPrompts.generateDropship,10)
    Shuttle = GUIF(inputPrompts.generateShuttle,10)
    Fighter = GUIF(inputPrompts.generateFighter,10)
    Royal = GUIF(inputPrompts.generateRoyal,10)
    Scientific = GUIF(inputPrompts.generateScientific,10)
    Alien = GUIF(inputPrompts.generateAlien,10)
    Sail = GUIF(inputPrompts.generateSail,10)
    maxSclass = GUIF(inputPrompts.ChangeSProbability,10)
end

for i=1,#ShipType do
    if ShipType[i] then
        ship = ship + 1
        existship = existship + 1
    else
        ship = ship + 1
    end
end

local SpawnMulti = 2
local min = (ship + 3 - existship)
local max = (ship + 5 - existship)
local maxNumActiveTraders = (ship + 19 + existship) * SpawnMulti * 2

NMS_MOD_DEFINITION_CONTAINER = {
    ["MOD_FILENAME"] = "AltF4_CustomAIshipSpawn.pak",
    ["MOD_AUTHOR"] = "AltF4",
    ["LUA_AUTHOR"] = "AltF4",
    ["NMS_VERSION"] = "4.65",
    ["MOD_DESCRIPTION"] = "Custom AI ship spawn.",
    ["MODIFICATIONS"] = {
        {
            ["MBIN_CHANGE_TABLE"] = {
                -- Remove several ships or add interceptors
                {
                    ["MBIN_FILE_SOURCE"] = "METADATA\SIMULATION\SPACE\AISPACESHIPMANAGER.MBIN",
                    ["EXML_CHANGE_TABLE"] = {
                        -- Add interceptors; Default, do not change this.
                        {
                            ["PRECEDING_FIRST"] = "TRUE",
                            ["PRECEDING_KEY_WORDS"] = {"Civilian"},
                            ["SPECIAL_KEY_WORDS"] = {"Filename","MODELS/COMMON/SPACECRAFT/DROPSHIPS/DROPSHIP_PROC.SCENE.MBIN"},
                            ["SECTION_ACTIVE"] = {2},
                            ["VALUE_CHANGE_TABLE"] = {
                                {"Filename","MODELS/COMMON/SPACECRAFT/SENTINELSHIP/SENTINELSHIP_PROC.SCENE.MBIN"}
                            }
                        },
                    }
                },
                -- Let ships faster
                {
                    ["MBIN_FILE_SOURCE"] = "GCAISPACESHIPGLOBALS.GLOBAL.MBIN",
                    ["EXML_CHANGE_TABLE"] = {
                        {
                            ["VALUE_CHANGE_TABLE"] = {
                                
                                {"MinimumCircleTimeBeforeLanding", 3},        -- 5
                                {"MinimumTimeBetweenOutpostLandings", 1},     -- 3
                                {"FillUpOutposts", "True"},                   -- False
                                {"MaxNumActiveTraders", maxNumActiveTraders}, -- 15
                                {"SpaceStationTraderRequestTime", 1},         -- 20
                                {"TraderArriveSpeed", 3000},                  -- 300
                                {"TraderArriveTime", 1},                      -- 3
                                {"ShipSpawnStationRadius", 1000},             -- 2000
                                {"DockWaitMinTime", 10},                      -- 20
                                {"DockWaitMaxTime", 30},                      -- 60
                            }
                        },
                    }
                },
                -- The waves for planetary trading posts and space stations
                {
                    ["MBIN_FILE_SOURCE"] = "METADATA\SIMULATION\SCENE\EXPERIENCESPAWNTABLE.MBIN",
                    ["EXML_CHANGE_TABLE"] = {
                        {
                            ["PRECEDING_KEY_WORDS"] = {"OutpostSpawns", "Count"},
                            ["VALUE_CHANGE_TABLE"] = {
                                {"x", min}, -- 1
                                {"y", max}, -- 3
                            }
                        },
                        {
                            ["PRECEDING_KEY_WORDS"] = {"OutpostSpawns", "Spread"},
                            ["VALUE_CHANGE_TABLE"] = {
                                {"x", 15}, -- 20
                                {"y", 20}, -- 30
                            }
                        },
                        {
                            ["PRECEDING_KEY_WORDS"] = {"TraderSpawns", "Count"},
                            ["VALUE_CHANGE_TABLE"] = {
                                {"x", min*SpawnMulti}, -- 1
                                {"y", max*SpawnMulti}, -- 1
                            }
                        },
                        {
                            ["PRECEDING_KEY_WORDS"] = {"TraderSpawns", "Spread"},
                            ["VALUE_CHANGE_TABLE"] = {
                                {"x", 10}, -- 100
                                {"y", 15}, -- 100
                            }
                        },
                    }
                },
                -- Change ship spawn frequence
                {
                    ["MBIN_FILE_SOURCE"] = "GCSOLARGENERATIONGLOBALS.GLOBAL.MBIN",
                    ["EXML_CHANGE_TABLE"] = {
                        {
                            ["PRECEDING_KEY_WORDS"] = {"SpaceshipSpawnFreqMultipliers"},
                            ["MATH_OPERATION"] = "*",
                            ["REPLACE_TYPE"] = "ALL",
                            ["VALUE_CHANGE_TABLE"] = {
                                {"IGNORE", 0},
                            }
                        },
                        {
                            ["PRECEDING_KEY_WORDS"] = {"SpaceshipSpawnFreqMultipliers"},
                            ["MATH_OPERATION"] = "+",
                            ["REPLACE_TYPE"] = "ALL",
                            ["VALUE_CHANGE_TABLE"] = {
                                {"IGNORE", 100},
                            }
                        },
                        {
                            ["PRECEDING_KEY_WORDS"] = {"GcAISpaceshipWeightingData.xml"},
                            ["REPLACE_TYPE"] = "ALL",
                            ["VALUE_CHANGE_TABLE"] = {
                                {"Dropship", Dropship and 100 or 0},
                                {"Fighter", Fighter and 100 or 0},
                                {"Scientific", Scientific and 100 or 0},
                                {"Shuttle", Shuttle and 100 or 0},
                                {"Royal", Royal and 100 or 0},
                                {"Alien", Alien and 100 or 0},
                                {"Sail", Sail and 100 or 0},
                                {"Robot", Robot and 100 or 0},
                            }
                        },
                    }
                },
            },
        },
    }
}

if not Robot then
    local addEXMLChangeTable = NMS_MOD_DEFINITION_CONTAINER["MODIFICATIONS"][1]["MBIN_CHANGE_TABLE"][1]["EXML_CHANGE_TABLE"]
    addEXMLChangeTable[#addEXMLChangeTable + 1] = {
                            ["PRECEDING_FIRST"] = "TRUE",
                            ["PRECEDING_KEY_WORDS"] = {"Civilian"},
                            ["SPECIAL_KEY_WORDS"] = {"Filename","MODELS/COMMON/SPACECRAFT/SENTINELSHIP/SENTINELSHIP_PROC.SCENE.MBIN"},
                            ["VALUE_CHANGE_TABLE"] = {
                                {"Filename", ""},
                            }
                        }
end

if not Dropship then
    local addEXMLChangeTable = NMS_MOD_DEFINITION_CONTAINER["MODIFICATIONS"][1]["MBIN_CHANGE_TABLE"][1]["EXML_CHANGE_TABLE"]
    addEXMLChangeTable[#addEXMLChangeTable + 1] = {
                            ["PRECEDING_FIRST"] = "TRUE",
                            ["PRECEDING_KEY_WORDS"] = {"Civilian"},
                            ["SPECIAL_KEY_WORDS"] = {"Filename","MODELS/COMMON/SPACECRAFT/DROPSHIPS/DROPSHIP_PROC.SCENE.MBIN"},
                            ["SECTION_ACTIVE"] = {1},
                            ["VALUE_CHANGE_TABLE"] = {
                                {"Filename", ""},
                            }
                        }
end


if not Shuttle then
    local addEXMLChangeTable = NMS_MOD_DEFINITION_CONTAINER["MODIFICATIONS"][1]["MBIN_CHANGE_TABLE"][1]["EXML_CHANGE_TABLE"]
    addEXMLChangeTable[#addEXMLChangeTable + 1] = {
                            ["PRECEDING_FIRST"] = "TRUE",
                            ["PRECEDING_KEY_WORDS"] = {"Civilian"},
                            ["SPECIAL_KEY_WORDS"] = {"Filename","MODELS/COMMON/SPACECRAFT/SHUTTLE/SHUTTLE_PROC.SCENE.MBIN"},
                            ["REPLACE_TYPE"] = "ONCE",
                            ["VALUE_CHANGE_TABLE"] = {
                                {"Filename", ""},
                            }
                        }
end

if not Fighter then
    local addEXMLChangeTable = NMS_MOD_DEFINITION_CONTAINER["MODIFICATIONS"][1]["MBIN_CHANGE_TABLE"][1]["EXML_CHANGE_TABLE"]
    addEXMLChangeTable[#addEXMLChangeTable + 1] = {
                            ["PRECEDING_FIRST"] = "TRUE",
                            ["PRECEDING_KEY_WORDS"] = {"Civilian"},
                            ["SPECIAL_KEY_WORDS"] = {"Filename","MODELS/COMMON/SPACECRAFT/FIGHTERS/FIGHTER_PROC.SCENE.MBIN"},
                            ["REPLACE_TYPE"] = "ONCE",
                            ["VALUE_CHANGE_TABLE"] = {
                                {"Filename", ""},
                            }
                        }
end

if not Royal then
    local addEXMLChangeTable = NMS_MOD_DEFINITION_CONTAINER["MODIFICATIONS"][1]["MBIN_CHANGE_TABLE"][1]["EXML_CHANGE_TABLE"]
    addEXMLChangeTable[#addEXMLChangeTable + 1] = {
                            ["PRECEDING_FIRST"] = "TRUE",
                            ["PRECEDING_KEY_WORDS"] = {"Civilian"},
                            ["SPECIAL_KEY_WORDS"] = {"Filename","MODELS/COMMON/SPACECRAFT/S-CLASS/S-CLASS_PROC.SCENE.MBIN"},
                            ["REPLACE_TYPE"] = "ONCE",
                            ["VALUE_CHANGE_TABLE"] = {
                                {"Filename", ""},
                            }
                        }
end

if not Scientific then
    local addEXMLChangeTable = NMS_MOD_DEFINITION_CONTAINER["MODIFICATIONS"][1]["MBIN_CHANGE_TABLE"][1]["EXML_CHANGE_TABLE"]
    addEXMLChangeTable[#addEXMLChangeTable + 1] = {
                            ["PRECEDING_FIRST"] = "TRUE",
                            ["PRECEDING_KEY_WORDS"] = {"Civilian"},
                            ["SPECIAL_KEY_WORDS"] = {"Filename","MODELS/COMMON/SPACECRAFT/SCIENTIFIC/SCIENTIFIC_PROC.SCENE.MBIN"},
                            ["REPLACE_TYPE"] = "ONCE",
                            ["VALUE_CHANGE_TABLE"] = {
                                {"Filename", ""},
                            }
                        }
end

if not Alien then
    local addEXMLChangeTable = NMS_MOD_DEFINITION_CONTAINER["MODIFICATIONS"][1]["MBIN_CHANGE_TABLE"][1]["EXML_CHANGE_TABLE"]
    addEXMLChangeTable[#addEXMLChangeTable + 1] = {
                            ["PRECEDING_FIRST"] = "TRUE",
                            ["PRECEDING_KEY_WORDS"] = {"Civilian"},
                            ["SPECIAL_KEY_WORDS"] = {"Filename","MODELS/COMMON/SPACECRAFT/S-CLASS/BIOPARTS/BIOSHIP_PROC.SCENE.MBIN"},
                            ["REPLACE_TYPE"] = "ONCE",
                            ["VALUE_CHANGE_TABLE"] = {
                                {"Filename", ""},
                            }
                        }
end

if not Sail then
    local addEXMLChangeTable = NMS_MOD_DEFINITION_CONTAINER["MODIFICATIONS"][1]["MBIN_CHANGE_TABLE"][1]["EXML_CHANGE_TABLE"]
    addEXMLChangeTable[#addEXMLChangeTable + 1] = {
                            ["PRECEDING_FIRST"] = "TRUE",
                            ["PRECEDING_KEY_WORDS"] = {"Civilian"},
                            ["SPECIAL_KEY_WORDS"] = {"Filename","MODELS/COMMON/SPACECRAFT/SAILSHIP/SAILSHIP_PROC.SCENE.MBIN"},
                            ["REPLACE_TYPE"] = "ONCE",
                            ["VALUE_CHANGE_TABLE"] = {
                                {"Filename", ""},
                            }
                        }
end

if maxSclass then
    local addMBINChangeTable = NMS_MOD_DEFINITION_CONTAINER["MODIFICATIONS"][1]["MBIN_CHANGE_TABLE"]
    addMBINChangeTable[#addMBINChangeTable + 1] = {
            ["MBIN_FILE_SOURCE"] = "METADATA\REALITY\TABLES\INVENTORYTABLE.MBIN",
            ["EXML_CHANGE_TABLE"] = {
                {
                    ["PRECEDING_KEY_WORDS"] = {"ClassProbabilities"},
                    ["REPLACE_TYPE"] = "ALL",
                    ["VALUE_CHANGE_TABLE"] = {
                        {"C", "0"},
                        {"B", "0"},
                        {"A", "0"},
                        {"S", "100"},
                    },
                },
            }
        }
end