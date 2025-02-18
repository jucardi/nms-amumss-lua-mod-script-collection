ModeName = "MaxUpgradeFreighterSlotAllClasses48"
Author = "Jackty89"
Description = "Tiny mod that allows any class of freighter to be upgraded to 48/48"

InventoryTablePath = "METADATA\\REALITY\\TABLES\\INVENTORYTABLE.MBIN"

NMS_MOD_DEFINITION_CONTAINER =
{
    ["MOD_FILENAME"] 			= ModeName..".pak",
    ["MOD_DESCRIPTION"]			= Description,
    ["MOD_AUTHOR"]				= Author,
    ["MODIFICATIONS"] 			=
    {
        {
            ["MBIN_CHANGE_TABLE"] 	=
            {
                {
                    ["MBIN_FILE_SOURCE"] 	= InventoryTablePath,
                    ["EXML_CHANGE_TABLE"] 	=
                    {
                        {
                            ["PRECEDING_KEY_WORDS"] = {"ShipInventoryMaxUpgradeSize","Freighter","MaxInventoryCapacity"},
                            ["REPLACE_TYPE"] 		= "ALL",
                            ["VALUE_MATCH_TYPE"] 	= "NUMBER",
                            ["VALUE_CHANGE_TABLE"] 	=
                            {
                                {"24","48"},
                                {"32","48"},
                                {"40","48"}
                            }
                        },
                        {
                            ["PRECEDING_KEY_WORDS"] = {"ShipInventoryMaxUpgradeSize","Freighter","MaxTechInventoryCapacity"},
                            ["REPLACE_TYPE"] 		= "ALL",
                            ["VALUE_MATCH_TYPE"] 	= "NUMBER",
                            ["VALUE_CHANGE_TABLE"] 	=
                            {
                                {"21","48"},
                                {"14","48"},
                                {"7","48"}
                            }
                        }
                    }
                }
            }
        }
    }
}