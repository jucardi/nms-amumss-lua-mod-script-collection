NMS_MOD_DEFINITION_CONTAINER = 
{
  ["MOD_FILENAME"] 			= "OldTerrainRockColors.pak",
  ["MOD_DESCRIPTION"]		= "",
  ["MOD_AUTHOR"]				= "CodenameAwesome",
  ["MODIFICATIONS"] 		=
	{
		{
			["MBIN_CHANGE_TABLE"] = 
			{ 
				{
					["MBIN_FILE_SOURCE"] 	= {
						"METADATA/SIMULATION/SOLARSYSTEM/BIOMES/BARREN/BARRENCOLOURPALETTES.MBIN",
						"METADATA/SIMULATION/SOLARSYSTEM/BIOMES/DEAD/DEADCOLOURPALETTES.MBIN",
						"METADATA/SIMULATION/SOLARSYSTEM/BIOMES/FROZEN/FROZENCOLOURPALETTES.MBIN",
						"METADATA/SIMULATION/SOLARSYSTEM/BIOMES/LAVA/LAVACOLOURPALETTES.MBIN",
						"METADATA/SIMULATION/SOLARSYSTEM/BIOMES/LUSH/LUSHCOLOURPALETTES.MBIN",
						"METADATA/SIMULATION/SOLARSYSTEM/BIOMES/LUSH/LUSHULTRACOLOURPALETTES.MBIN",
						"METADATA/SIMULATION/SOLARSYSTEM/BIOMES/RADIOACTIVE/RADIOCOLOURPALETTES.MBIN",
						"METADATA/SIMULATION/SOLARSYSTEM/BIOMES/SCORCHED/SCORCHCOLOURPALETTES.MBIN",
						"METADATA/SIMULATION/SOLARSYSTEM/BIOMES/SWAMP/SWAMPCOLOURPALETTES.MBIN",
						"METADATA/SIMULATION/SOLARSYSTEM/BIOMES/TOXIC/TOXICCOLOURPALETTES.MBIN",
						"METADATA/SIMULATION/SOLARSYSTEM/BIOMES/TOXIC/TOXICEGGSCOLOURPALETTES.MBIN",
						"METADATA/SIMULATION/SOLARSYSTEM/BIOMES/TOXIC/TOXICSPORESCOLOURPALETTES.MBIN",
						"METADATA/SIMULATION/SOLARSYSTEM/BIOMES/TOXIC/TOXICTENTACLESCOLOURPALETTES.MBIN",
						"METADATA/SIMULATION/SOLARSYSTEM/BIOMES/WEIRD/HOUDINIPROPS/HOUDINIPROPSCOLOURPALETTES.MBIN",
						"METADATA/SIMULATION/SOLARSYSTEM/COLOURS/BASECOLOURPALETTES.MBIN",
						
					},
					["EXML_CHANGE_TABLE"] = {
						{
							["SPECIAL_KEY_WORDS"] = {"Rock","GcPaletteData.xml"},
							["REPLACE_TYPE"] = "ALL",
							["VALUE_CHANGE_TABLE"] 	= 
							{
								{"NumColours",	"All"},
							}	
						},
					}
				},
				{
					["MBIN_FILE_SOURCE"] 	= {
						"METADATA/SIMULATION/SOLARSYSTEM/BIOMES/FROZEN/FROZENTILETYPES.MBIN",
						"METADATA/SIMULATION/SOLARSYSTEM/BIOMES/LUSH/LUSHTILETYPES.MBIN",
						"METADATA/SIMULATION/SOLARSYSTEM/BIOMES/SWAMP/SWAMPTILETYPES.MBIN",
						"METADATA/SIMULATION/SOLARSYSTEM/COLOURS/BASETILETYPES.MBIN",
						
					},
					["EXML_CHANGE_TABLE"] = 
					{
						{
							["PRECEDING_KEY_WORDS"] = {"TileTypeSets"},
							["SEC_SAVE_TO"] = "TILETYPES"
						},
						{
							["SEC_EDIT"] = "TILETYPES",
							["REMOVE"] = "HBOS"
						},
						{
							["SEC_EDIT"] = "TILETYPES",
							["SPECIAL_KEY_WORDS"] = {"Palette","RockDark"},
							["REPLACE_TYPE"] = "ALL",
							["VALUE_CHANGE_TABLE"] 	= 
							{
								{"Palette",	"Rock"},
								{"ColourAlt",	"Primary"},
							}	
						},
						{
							["SEC_EDIT"] = "TILETYPES",
							["SPECIAL_KEY_WORDS"] = {"Palette","RockLight"},
							["REPLACE_TYPE"] = "ALL",
							["VALUE_CHANGE_TABLE"] 	= 
							{
								{"Palette",	"Rock"},
								{"ColourAlt",	"Primary"},
							}	
						},
						{
							["SEC_EDIT"] = "TILETYPES",
							["SPECIAL_KEY_WORDS"] = {"Palette","RockSaturated"},
							["REPLACE_TYPE"] = "ALL",
							["VALUE_CHANGE_TABLE"] 	= 
							{
								{"Palette",	"Rock"},
								{"ColourAlt",	"Primary"},
							}	
						},
						{
							["PRECEDING_KEY_WORDS"] = {"TileTypeSets"},
							["SEC_ADD_NAMED"] = "TILETYPES"
						}
					},
				},
			}
		},
	}
}