SETTINGS = {
	["ForceBiomeFile"] = false
}

MBIN_CHANGE_TABLE = {}

table.insert(MBIN_CHANGE_TABLE,--To prevent warning
	{
		["MBIN_FILE_SOURCE"] 	= {"METADATA/SIMULATION/SOLARSYSTEM/BIOMES/BIOMEFILENAMES.MBIN",},
		["EXML_CHANGE_TABLE"] = {
			{
				["MATH_OPERATION"] = "*",
				["VALUE_CHANGE_TABLE"] = {
					{"Probability",1}
				}
			},
		}
	})

if SETTINGS["ForceBiomeFile"] then
	table.insert(MBIN_CHANGE_TABLE,
	{
		["MBIN_FILE_SOURCE"] 	= {"METADATA/SIMULATION/SOLARSYSTEM/BIOMES/BIOMEFILENAMES.MBIN",},
		["EXML_CHANGE_TABLE"] = {
			{
				["PRECEDING_KEY_WORDS"] = {"BiomeFiles"},
				["REPLACE_TYPE"] = "ALL",
				["VALUE_CHANGE_TABLE"] = {
					{"Filename",SETTINGS["ForceBiomeFile"]}
				}
			},
		}
	})
end

NMS_MOD_DEFINITION_CONTAINER = 
{
  ["MOD_FILENAME"] = "Must be combined.pak",
  ["MOD_BATCHNAME"] = "Spacefarer-Biomes.pak",
  ["MOD_AUTHOR"] = "CodenameAwesome",
  ["MODIFICATIONS"] 		= 
	{
		{
			["MBIN_CHANGE_TABLE"] = MBIN_CHANGE_TABLE
		},
	}
}