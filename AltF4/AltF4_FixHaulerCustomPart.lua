local AddHaulerWingModule = [[
            <Property value="GcModularCustomisationSlotItemData.xml">
              <Property name="ItemID" value="DROPS_WINGCDC" />
              <Property name="DescriptorGroupSalvageRule" value="All" />
              <Property name="DescriptorGroupData">
                <Property value="GcModularCustomisationDescriptorGroupData.xml">
                  <Property name="ActivatedDescriptorGroupID" value="DROPS_WINGCDC" />
                </Property>
              </Property>
              <Property name="SetInventoryClass" value="False" />
              <Property name="InventoryClass" value="GcInventoryClass.xml">
                <Property name="InventoryClass" value="C" />
              </Property>
            </Property>
]]

local AddHaulerWingProduct = [[
      <Property value="GcProductData.xml">
        <Property name="ID" value="DROPS_WINGCDD" />
        <Property name="Name" value="UI_DROPSHIP_WING_CDD_NAME" />
        <Property name="NameLower" value="UI_DROPSHIP_WING_CDD_NAME_L" />
        <Property name="Subtitle" value="VariableSizeString.xml">
          <Property name="Value" value="UI_DROPSHIP_PART_SUB" />
        </Property>
        <Property name="Description" value="VariableSizeString.xml">
          <Property name="Value" value="UI_DROPSHIP_WING_DESC" />
        </Property>
        <Property name="Hint" value="" />
        <Property name="GroupID" value="" />
        <Property name="DebrisFile" value="TkModelResource.xml">
          <Property name="Filename" value="MODELS/EFFECTS/DEBRIS/TERRAINDEBRIS/TERRAINDEBRIS4.SCENE.MBIN" />
          <Property name="ResHandle" value="GcResource.xml">
            <Property name="ResourceID" value="0" />
          </Property>
        </Property>
        <Property name="BaseValue" value="310000" />
        <Property name="Level" value="0" />
        <Property name="Icon" value="TkTextureResource.xml">
          <Property name="Filename" value="TEXTURES/UI/FRONTEND/ICONS/SHIPICONS/SHIPPARTS.DROPSHIPWINGS.CDD.DDS" />
          <Property name="ResHandle" value="GcResource.xml">
            <Property name="ResourceID" value="0" />
          </Property>
        </Property>
        <Property name="HeroIcon" value="TkTextureResource.xml">
          <Property name="Filename" value="" />
          <Property name="ResHandle" value="GcResource.xml">
            <Property name="ResourceID" value="0" />
          </Property>
        </Property>
        <Property name="Colour" value="Colour.xml">
          <Property name="R" value="0.17254902" />
          <Property name="G" value="0.4862745" />
          <Property name="B" value="0.62352943" />
          <Property name="A" value="1" />
        </Property>
        <Property name="Category" value="GcRealitySubstanceCategory.xml">
          <Property name="SubstanceCategory" value="Special" />
        </Property>
        <Property name="Type" value="GcProductCategory.xml">
          <Property name="ProductCategory" value="CustomisationPart" />
        </Property>
        <Property name="Rarity" value="GcRarity.xml">
          <Property name="Rarity" value="Rare" />
        </Property>
        <Property name="Legality" value="GcLegality.xml">
          <Property name="Legality" value="Legal" />
        </Property>
        <Property name="Consumable" value="False" />
        <Property name="ChargeValue" value="0" />
        <Property name="StackMultiplier" value="1" />
        <Property name="DefaultCraftAmount" value="1" />
        <Property name="CraftAmountStepSize" value="1" />
        <Property name="CraftAmountMultiplier" value="1" />
        <Property name="Requirements" />
        <Property name="AltRequirements" />
        <Property name="Cost" value="GcItemPriceModifiers.xml">
          <Property name="SpaceStationMarkup" value="0" />
          <Property name="LowPriceMod" value="0" />
          <Property name="HighPriceMod" value="0" />
          <Property name="BuyBaseMarkup" value="0" />
          <Property name="BuyMarkupMod" value="0" />
        </Property>
        <Property name="RecipeCost" value="1" />
        <Property name="SpecificChargeOnly" value="False" />
        <Property name="NormalisedValueOnWorld" value="0.0007487182" />
        <Property name="NormalisedValueOffWorld" value="0.0007487182" />
        <Property name="TradeCategory" value="GcTradeCategory.xml">
          <Property name="TradeCategory" value="None" />
        </Property>
        <Property name="WikiCategory" value="NotEnabled" />
        <Property name="IsCraftable" value="False" />
        <Property name="DeploysInto" value="" />
        <Property name="EconomyInfluenceMultiplier" value="0.25" />
        <Property name="PinObjective" value="UI_FIND_BUY_OBJ" />
        <Property name="PinObjectiveTip" value="" />
        <Property name="PinObjectiveMessage" value="" />
        <Property name="PinObjectiveScannableType" value="GcScannerIconTypes.xml">
          <Property name="ScanIconType" value="None" />
        </Property>
        <Property name="PinObjectiveEasyToRefine" value="False" />
        <Property name="CookingIngredient" value="False" />
        <Property name="CookingValue" value="0" />
        <Property name="GoodForSelling" value="False" />
        <Property name="GiveRewardOnSpecialPurchase" value="" />
        <Property name="EggModifierIngredient" value="False" />
        <Property name="IsTechbox" value="False" />
        <Property name="CanSendToOtherPlayers" value="True" />
      </Property>
]]

NMS_MOD_DEFINITION_CONTAINER = {
    ["MOD_FILENAME"] = "AltF4_FixHaulerCustomPart.pak",
    ["MOD_AUTHOR"] = "AltF4",
    ["LUA_AUTHOR"] = "AltF4",
    ["NMS_VERSION"] = "4.64",
    ["MOD_DESCRIPTION"] = "Fix Hauler Custom Part.",
    ["MODIFICATIONS"] = {
        {
            ["MBIN_CHANGE_TABLE"] = {
                {
                    ["MBIN_FILE_SOURCE"] = "METADATA\GAMESTATE\PLAYERDATA\MODULARCUSTOMISATIONDATATABLE.MBIN",
                    ["EXML_CHANGE_TABLE"] = {
                        {
                            ["SPECIAL_KEY_WORDS"] = {"ItemID","DROPS_WINGCDB"},
                            ["ADD_OPTION"] = "ADDafterSECTION",
                            ["ADD"] = AddHaulerWingModule
                        },
                    }
                },
                {
                    ["MBIN_FILE_SOURCE"] = "METADATA\REALITY\TABLES\NMS_REALITY_GCPRODUCTTABLE.MBIN",
                    ["EXML_CHANGE_TABLE"] = {
                        {
                            ["SPECIAL_KEY_WORDS"] = {"Name","UI_DROPSHIP_WING_BAB_NAME"},
                            ["LINE_OFFSET"] = -1,
                            ["VALUE_CHANGE_TABLE"] = {
                                {"ID","DROPS_WINGBAB"},
                            }
                        },
                        {
                            ["SPECIAL_KEY_WORDS"] = {"Name","UI_DROPSHIP_WING_BAC_NAME"},
                            ["LINE_OFFSET"] = -1,
                            ["VALUE_CHANGE_TABLE"] = {
                                {"ID","DROPS_WINGBAC"},
                            }
                        },
                        {
                            ["SPECIAL_KEY_WORDS"] = {"ID","POWERCELL2"},
                            ["ADD_OPTION"] = "ADDafterSECTION",
                            ["ADD"] = AddHaulerWingProduct
                        },
                    }
                },
            },
        },
    }
}