NMS_MOD_DEFINITION_CONTAINER = 
{
["MOD_FILENAME"] 			= "No Speed Halo 3.0.pak", 
["MOD_AUTHOR"]				= "Lo2k",
["LUA_AUTHOR"]				= "Lo2k",
["NMS_VERSION"]				= "4.65",
["MOD_DESCRIPTION"]			= "This mods removes ship speed effect",
["MODIFICATIONS"] 			= 
	{
		{
			["MBIN_CHANGE_TABLE"] 	= 
			{ 
				{
					["MBIN_FILE_SOURCE"] 	= "MODELS\EFFECTS\WARP\SPEEDTUNNEL\SPEEDTUNNELMAT.MATERIAL.MBIN",
					["EXML_CHANGE_TABLE"] 	= 
					{
						{
							["SPECIAL_KEY_WORDS"] = {"Name","gMaterialColourVec4"},
							["VALUE_CHANGE_TABLE"] 	= 
							{
								{"t",	"0"}  -- Set to 1 for Vanilla or 0.06 for Almost
							}	
						}
					}
				}
			}
		}
	}	
}
