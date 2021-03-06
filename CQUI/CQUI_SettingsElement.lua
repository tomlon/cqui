--Custom localizations are temporarily disabled due to reloads breaking them at the moment. Localizations are complete, so remember to enable them once Firaxis fixes this!

include("Civ6Common");

-- Members
local m_tabs; --Add new options tabs to this in Initialize function
local bindings_options = {
  --{"LOC_CQUI_BINDINGS_STANDARD", 0},
  --{"LOC_CQUI_BINDINGS_CLASSIC", 1},
  --{"LOC_CQUI_BINDINGS_ENHANCED", 2}
  {"Standard", 0},
  {"Classic", 1},
  {"Enhanced", 2}
};

local resource_icon_style_options = 
{
  {"Solid", 0},
  {"Transparent", 1},
  {"Hidden", 2}
};

--Used to switch active panels/tabs in the settings panel
function ShowTab(button, panel)
  -- Unfocus all tabs and hide panels
  for i, v in ipairs(m_tabs) do
    v[2]:SetHide(true);
    v[1]:SetSelected(false);
  end 
  button:SetSelected(true);
  panel:SetHide(false);   
  --Controls.WindowTitle:SetText(Locale.Lookup("LOC_CQUI_NAME") .. ": " .. Locale.ToUpper(button:GetText()));
  Controls.WindowTitle:SetText("CQUI: " .. Locale.ToUpper(button:GetText()));
end

--Populates the status message panel checkboxes with appropriate strings
function InitializeGossipCheckboxes()
  Controls.LOC_GOSSIP_AGENDA_KUDOSCheckbox:SetText(Locale.Lookup("LOC_GOSSIP_AGENDA_KUDOS", "X", "Y", "Z", "1", "2", "3"));
  Controls.LOC_GOSSIP_AGENDA_WARNINGCheckbox:SetText(Locale.Lookup("LOC_GOSSIP_AGENDA_WARNING", "X", "Y", "Z", "1", "2", "3"));
  Controls.LOC_GOSSIP_ALLIEDCheckbox:SetText(Locale.Lookup("LOC_GOSSIP_ALLIED", "X", "Y", "Z", "1", "2", "3"));
  Controls.LOC_GOSSIP_ANARCHY_BEGINSCheckbox:SetText(Locale.Lookup("LOC_GOSSIP_ANARCHY_BEGINS", "X", "Y", "Z", "1", "2", "3"));
  Controls.LOC_GOSSIP_ARTIFACT_EXTRACTEDCheckbox:SetText(Locale.Lookup("LOC_GOSSIP_ARTIFACT_EXTRACTED", "X", "Y", "Z", "1", "2", "3"));
  Controls.LOC_GOSSIP_BARBARIAN_INVASION_STARTEDCheckbox:SetText(Locale.Lookup("LOC_GOSSIP_BARBARIAN_INVASION_STARTED", "X", "Y", "Z", "1", "2", "3"));
  Controls.LOC_GOSSIP_BARBARIAN_RAID_STARTEDCheckbox:SetText(Locale.Lookup("LOC_GOSSIP_BARBARIAN_RAID_STARTED", "X", "Y", "Z", "1", "2", "3"));
  Controls.LOC_GOSSIP_BEACH_RESORT_CREATEDCheckbox:SetText(Locale.Lookup("LOC_GOSSIP_BEACH_RESORT_CREATED", "X", "Y", "Z", "1", "2", "3"));
  Controls.LOC_GOSSIP_CHANGE_GOVERNMENTCheckbox:SetText(Locale.Lookup("LOC_GOSSIP_CHANGE_GOVERNMENT", "X", "Y", "Z", "1", "2", "3"));
  Controls.LOC_GOSSIP_CITY_BESIEGEDCheckbox:SetText(Locale.Lookup("LOC_GOSSIP_CITY_BESIEGED", "X", "Y", "Z", "1", "2", "3"));
  Controls.LOC_GOSSIP_CITY_LIBERATEDCheckbox:SetText(Locale.Lookup("LOC_GOSSIP_CITY_LIBERATED", "X", "Y", "Z", "1", "2", "3"));
  Controls.LOC_GOSSIP_CITY_RAZEDCheckbox:SetText(Locale.Lookup("LOC_GOSSIP_CITY_RAZED", "X", "Y", "Z", "1", "2", "3"));
  Controls.LOC_GOSSIP_CLEAR_CAMPCheckbox:SetText(Locale.Lookup("LOC_GOSSIP_CLEAR_CAMP", "X", "Y", "Z", "1", "2", "3") .. " (" .. Locale.Lookup("LOC_IMPROVEMENT_BARBARIAN_CAMP_NAME") .. ")");
  Controls.LOC_GOSSIP_CITY_STATE_INFLUENCECheckbox:SetText(Locale.Lookup("LOC_GOSSIP_CITY_STATE_INFLUENCE", "X", "Y", "Z", "1", "2", "3"));
  Controls.LOC_GOSSIP_CONQUER_CITYCheckbox:SetText(Locale.Lookup("LOC_GOSSIP_CONQUER_CITY", "X", "Y", "Z", "1", "2", "3"));
  Controls.LOC_GOSSIP_CONSTRUCT_DISTRICTCheckbox:SetText(Locale.Lookup("LOC_GOSSIP_CONSTRUCT_DISTRICT", "X", "Y", "Z", "1", "2", "3") .. "  (" .. Locale.Lookup("LOC_DISTRICT_NAME") .. ")");
  Controls.LOC_GOSSIP_CREATE_PANTHEONCheckbox:SetText(Locale.Lookup("LOC_GOSSIP_CREATE_PANTHEON", "X", "Y", "Z", "1", "2", "3"));
  Controls.LOC_GOSSIP_CULTURVATE_CIVICCheckbox:SetText(Locale.Lookup("LOC_GOSSIP_CULTURVATE_CIVIC", "X", "Y", "Z", "1", "2", "3"));
  Controls.LOC_GOSSIP_DECLARED_FRIENDSHIPCheckbox:SetText(Locale.Lookup("LOC_GOSSIP_DECLARED_FRIENDSHIP", "X", "Y", "Z", "1", "2", "3"));
  Controls.LOC_GOSSIP_DELEGATIONCheckbox:SetText(Locale.Lookup("LOC_GOSSIP_DELEGATION", "X", "Y", "Z", "1", "2", "3"));
  Controls.LOC_GOSSIP_DENOUNCEDCheckbox:SetText(Locale.Lookup("LOC_GOSSIP_DENOUNCED", "X", "Y", "Z", "1", "2", "3"));
  Controls.LOC_GOSSIP_EMBASSYCheckbox:SetText(Locale.Lookup("LOC_GOSSIP_EMBASSY", "X", "Y", "Z", "1", "2", "3"));
  Controls.LOC_GOSSIP_ERA_CHANGEDCheckbox:SetText(Locale.Lookup("LOC_GOSSIP_ERA_CHANGED", "X", "Y", "Z", "1", "2", "3"));
  Controls.LOC_GOSSIP_FIND_NATURAL_WONDERCheckbox:SetText(Locale.Lookup("LOC_GOSSIP_FIND_NATURAL_WONDER", "X", "Y", "Z", "1", "2", "3"));
  Controls.LOC_GOSSIP_FOUND_CITYCheckbox:SetText(Locale.Lookup("LOC_GOSSIP_FOUND_CITY", "X", "Y", "Z", "1", "2", "3"));
  Controls.LOC_GOSSIP_FOUND_RELIGIONCheckbox:SetText(Locale.Lookup("LOC_GOSSIP_FOUND_RELIGION", "X", "Y", "Z", "1", "2", "3"));
  Controls.LOC_GOSSIP_GREATPERSON_CREATEDCheckbox:SetText(Locale.Lookup("LOC_GOSSIP_GREATPERSON_CREATED", "X", "Y", "Z", "1", "2", "3") .. " (" .. Locale.Lookup("LOC_GREAT_PEOPLE_TAB_GREAT_PEOPLE") .. ")");
  Controls.LOC_GOSSIP_LAUNCHING_ATTACKCheckbox:SetText(Locale.Lookup("LOC_GOSSIP_LAUNCHING_ATTACK", "X", "Y", "Z", "1", "2", "3"));
  Controls.LOC_GOSSIP_WAR_PREPARATIONCheckbox:SetText(Locale.Lookup("LOC_GOSSIP_WAR_PREPARATION", "X", "Y", "Z", "1", "2", "3"));
  Controls.LOC_GOSSIP_INQUISITION_LAUNCHEDCheckbox:SetText(Locale.Lookup("LOC_GOSSIP_INQUISITION_LAUNCHED", "X", "Y", "Z", "1", "2", "3"));
  Controls.LOC_GOSSIP_LAND_UNIT_LEVELCheckbox:SetText(Locale.Lookup("LOC_GOSSIP_LAND_UNIT_LEVEL", "X", "Y", "Z", "1", "2", "3"));
  Controls.LOC_GOSSIP_MAKE_DOWCheckbox:SetText(Locale.Lookup("LOC_GOSSIP_MAKE_DOW", "X", "Y", "Z", "1", "2", "3"));
  Controls.LOC_GOSSIP_NATIONAL_PARK_CREATEDCheckbox:SetText(Locale.Lookup("LOC_GOSSIP_NATIONAL_PARK_CREATED", "X", "Y", "Z", "1", "2", "3") .. " (" .. Locale.Lookup("LOC_NATIONAL_PARK_NAME", "") .. " )");
  Controls.LOC_GOSSIP_NEW_RELIGIOUS_MAJORITYCheckbox:SetText(Locale.Lookup("LOC_GOSSIP_NEW_RELIGIOUS_MAJORITY", "X", "Y", "Z", "1", "2", "3"));
  Controls.LOC_GOSSIP_PILLAGECheckbox:SetText(Locale.Lookup("LOC_GOSSIP_PILLAGE", "X", "Y", "Z", "1", "2", "3"));
  Controls.LOC_GOSSIP_POLICY_ENACTEDCheckbox:SetText(Locale.Lookup("LOC_GOSSIP_POLICY_ENACTED", "X", "Y", "Z", "1", "2", "3"));
  Controls.LOC_GOSSIP_RECEIVE_DOWCheckbox:SetText(Locale.Lookup("LOC_GOSSIP_RECEIVE_DOW", "X", "Y", "Z", "1", "2", "3"));
  Controls.LOC_GOSSIP_RELIC_RECEIVEDCheckbox:SetText(Locale.Lookup("LOC_GOSSIP_RELIC_RECEIVED", "X", "Y", "Z", "1", "2", "3"));
  Controls.LOC_GOSSIP_RESEARCH_AGREEMENTCheckbox:SetText(Locale.Lookup("LOC_GOSSIP_RESEARCH_AGREEMENT", "X", "Y", "Z", "1", "2", "3"));
  Controls.LOC_GOSSIP_RESEARCH_TECHCheckbox:SetText(Locale.Lookup("LOC_GOSSIP_RESEARCH_TECH", "X", "Y", "Z", "1", "2", "3"));
  Controls.LOC_GOSSIP_SPY_DISRUPT_ROCKETRY_DETECTEDCheckbox:SetText(Locale.Lookup("LOC_GOSSIP_SPY_DISRUPT_ROCKETRY_DETECTED", "X", "Y", "Z", "1", "2", "3"));
  Controls.LOC_GOSSIP_SPY_DISRUPT_ROCKETRY_UNDETECTEDCheckbox:SetText(Locale.Lookup("LOC_GOSSIP_SPY_DISRUPT_ROCKETRY_UNDETECTED", "X", "Y", "Z", "1", "2", "3"));
  Controls.LOC_GOSSIP_SPY_GREAT_WORK_HEIST_DETECTEDCheckbox:SetText(Locale.Lookup("LOC_GOSSIP_SPY_GREAT_WORK_HEIST_DETECTED", "X", "Y", "Z", "1", "2", "3"));
  Controls.LOC_GOSSIP_SPY_GREAT_WORK_HEIST_UNDETECTEDCheckbox:SetText(Locale.Lookup("LOC_GOSSIP_SPY_GREAT_WORK_HEIST_UNDETECTED", "X", "Y", "Z", "1", "2", "3"));
  Controls.LOC_GOSSIP_SPY_RECRUIT_PARTISANS_DETECTEDCheckbox:SetText(Locale.Lookup("LOC_GOSSIP_SPY_RECRUIT_PARTISANS_DETECTED", "X", "Y", "Z", "1", "2", "3"));
  Controls.LOC_GOSSIP_SPY_RECRUIT_PARTISANS_UNDETECTEDCheckbox:SetText(Locale.Lookup("LOC_GOSSIP_SPY_RECRUIT_PARTISANS_UNDETECTED", "X", "Y", "Z", "1", "2", "3"));
  Controls.LOC_GOSSIP_SPY_SABOTAGE_PRODUCTION_DETECTEDCheckbox:SetText(Locale.Lookup("LOC_GOSSIP_SPY_SABOTAGE_PRODUCTION_DETECTED", "X", "Y", "Z", "1", "2", "3"));
  Controls.LOC_GOSSIP_SPY_SABOTAGE_PRODUCTION_UNDETECTEDCheckbox:SetText(Locale.Lookup("LOC_GOSSIP_SPY_SABOTAGE_PRODUCTION_UNDETECTED", "X", "Y", "Z", "1", "2", "3"));
  Controls.LOC_GOSSIP_SPY_SIPHON_FUNDS_DETECTEDCheckbox:SetText(Locale.Lookup("LOC_GOSSIP_SPY_SIPHON_FUNDS_DETECTED", "X", "Y", "Z", "1", "2", "3"));
  Controls.LOC_GOSSIP_SPY_SIPHON_FUNDS_UNDETECTEDCheckbox:SetText(Locale.Lookup("LOC_GOSSIP_SPY_SIPHON_FUNDS_UNDETECTED", "X", "Y", "Z", "1", "2", "3"));
  Controls.LOC_GOSSIP_SPY_STEAL_TECH_BOOST_DETECTEDCheckbox:SetText(Locale.Lookup("LOC_GOSSIP_SPY_STEAL_TECH_BOOST_DETECTED", "X", "Y", "Z", "1", "2", "3"));
  Controls.LOC_GOSSIP_SPY_STEAL_TECH_BOOST_UNDETECTEDCheckbox:SetText(Locale.Lookup("LOC_GOSSIP_SPY_STEAL_TECH_BOOST_UNDETECTED", "X", "Y", "Z", "1", "2", "3"));
  Controls.LOC_GOSSIP_TRADE_DEALCheckbox:SetText(Locale.Lookup("LOC_GOSSIP_TRADE_DEAL", "X", "Y", "Z", "1", "2", "3"));
  Controls.LOC_GOSSIP_TRADE_RENEGECheckbox:SetText(Locale.Lookup("LOC_GOSSIP_TRADE_RENEGE", "X", "Y", "Z", "1", "2", "3"));
  Controls.LOC_GOSSIP_TRAIN_SETTLERCheckbox:SetText(Locale.Lookup("LOC_GOSSIP_TRAIN_SETTLER", "X", "Y", "Z", "1", "2", "3"));
  Controls.LOC_GOSSIP_TRAIN_UNITCheckbox:SetText(Locale.Lookup("LOC_GOSSIP_TRAIN_UNIT", "X", "Y", "Z", "1", "2", "3"));
  Controls.LOC_GOSSIP_TRAIN_UNIQUE_UNITCheckbox:SetText(Locale.Lookup("LOC_GOSSIP_TRAIN_UNIQUE_UNIT", "X", "Y", "Z", "1", "2", "3"));
  Controls.LOC_GOSSIP_PROJECT_STARTEDCheckbox:SetText(Locale.Lookup("LOC_GOSSIP_PROJECT_STARTED", "X", "Y", "Z", "1", "2", "3") .. " (" .. Locale.Lookup("LOC_PROJECT_NAME") .. ")");
  Controls.LOC_GOSSIP_START_VICTORY_STRATEGYCheckbox:SetText(Locale.Lookup("LOC_GOSSIP_START_VICTORY_STRATEGY", "X", "Y", "Z", "1", "2", "3") .. " (" .. Locale.Lookup("LOC_VICTORY_DEFAULT_NAME") .. ")");
  Controls.LOC_GOSSIP_STOP_VICTORY_STRATEGYCheckbox:SetText(Locale.Lookup("LOC_GOSSIP_STOP_VICTORY_STRATEGY", "X", "Y", "Z", "1", "2", "3") .. " (" .. Locale.Lookup("LOC_VICTORY_DEFAULT_NAME") .. ")");
  Controls.LOC_GOSSIP_WMD_BUILTCheckbox:SetText(Locale.Lookup("LOC_GOSSIP_WMD_BUILT", "X", "Y", "Z", "1", "2", "3"));
  Controls.LOC_GOSSIP_WMD_STRIKECheckbox:SetText(Locale.Lookup("LOC_GOSSIP_WMD_STRIKE", "X", "Y", "Z", "1", "2", "3"));
  Controls.LOC_GOSSIP_WONDER_STARTEDCheckbox:SetText(Locale.Lookup("LOC_GOSSIP_WONDER_STARTED", "X", "Y", "Z", "1", "2", "3") .. " (" .. Locale.Lookup("LOC_WONDER_NAME") .. ")");

  PopulateCheckBox(Controls.LOC_GOSSIP_AGENDA_KUDOSCheckbox, "CQUI_LOC_GOSSIP_AGENDA_KUDOS");
  PopulateCheckBox(Controls.LOC_GOSSIP_AGENDA_WARNINGCheckbox, "CQUI_LOC_GOSSIP_AGENDA_WARNING");
  PopulateCheckBox(Controls.LOC_GOSSIP_ALLIEDCheckbox, "CQUI_LOC_GOSSIP_ALLIED");
  PopulateCheckBox(Controls.LOC_GOSSIP_ANARCHY_BEGINSCheckbox, "CQUI_LOC_GOSSIP_ANARCHY_BEGINS");
  PopulateCheckBox(Controls.LOC_GOSSIP_ARTIFACT_EXTRACTEDCheckbox, "CQUI_LOC_GOSSIP_ARTIFACT_EXTRACTED");
  PopulateCheckBox(Controls.LOC_GOSSIP_BARBARIAN_INVASION_STARTEDCheckbox, "CQUI_LOC_GOSSIP_BARBARIAN_INVASION_STARTED");
  PopulateCheckBox(Controls.LOC_GOSSIP_BARBARIAN_RAID_STARTEDCheckbox, "CQUI_LOC_GOSSIP_BARBARIAN_RAID_STARTED");
  PopulateCheckBox(Controls.LOC_GOSSIP_BEACH_RESORT_CREATEDCheckbox, "CQUI_LOC_GOSSIP_BEACH_RESORT_CREATED");
  PopulateCheckBox(Controls.LOC_GOSSIP_CHANGE_GOVERNMENTCheckbox, "CQUI_LOC_GOSSIP_CHANGE_GOVERNMENT");
  PopulateCheckBox(Controls.LOC_GOSSIP_CITY_BESIEGEDCheckbox, "CQUI_LOC_GOSSIP_CITY_BESIEGED");
  PopulateCheckBox(Controls.LOC_GOSSIP_CITY_LIBERATEDCheckbox, "CQUI_LOC_GOSSIP_CITY_LIBERATED");
  PopulateCheckBox(Controls.LOC_GOSSIP_CITY_RAZEDCheckbox, "CQUI_LOC_GOSSIP_CITY_RAZED");
  PopulateCheckBox(Controls.LOC_GOSSIP_CLEAR_CAMPCheckbox, "CQUI_LOC_GOSSIP_CLEAR_CAMP");
  PopulateCheckBox(Controls.LOC_GOSSIP_CITY_STATE_INFLUENCECheckbox, "CQUI_LOC_GOSSIP_CITY_STATE_INFLUENCE");
  PopulateCheckBox(Controls.LOC_GOSSIP_CONQUER_CITYCheckbox, "CQUI_LOC_GOSSIP_CONQUER_CITY");
  PopulateCheckBox(Controls.LOC_GOSSIP_CONSTRUCT_DISTRICTCheckbox, "CQUI_LOC_GOSSIP_CONSTRUCT_DISTRICT");
  PopulateCheckBox(Controls.LOC_GOSSIP_CREATE_PANTHEONCheckbox, "CQUI_LOC_GOSSIP_CREATE_PANTHEON");
  PopulateCheckBox(Controls.LOC_GOSSIP_CULTURVATE_CIVICCheckbox, "CQUI_LOC_GOSSIP_CULTURVATE_CIVIC");
  PopulateCheckBox(Controls.LOC_GOSSIP_DECLARED_FRIENDSHIPCheckbox, "CQUI_LOC_GOSSIP_DECLARED_FRIENDSHIP");
  PopulateCheckBox(Controls.LOC_GOSSIP_DELEGATIONCheckbox, "CQUI_LOC_GOSSIP_DELEGATION");
  PopulateCheckBox(Controls.LOC_GOSSIP_DENOUNCEDCheckbox, "CQUI_LOC_GOSSIP_DENOUNCED");
  PopulateCheckBox(Controls.LOC_GOSSIP_EMBASSYCheckbox, "CQUI_LOC_GOSSIP_EMBASSY");
  PopulateCheckBox(Controls.LOC_GOSSIP_ERA_CHANGEDCheckbox, "CQUI_LOC_GOSSIP_ERA_CHANGED");
  PopulateCheckBox(Controls.LOC_GOSSIP_FIND_NATURAL_WONDERCheckbox, "CQUI_LOC_GOSSIP_FIND_NATURAL_WONDER");
  PopulateCheckBox(Controls.LOC_GOSSIP_FOUND_CITYCheckbox, "CQUI_LOC_GOSSIP_FOUND_CITY");
  PopulateCheckBox(Controls.LOC_GOSSIP_FOUND_RELIGIONCheckbox, "CQUI_LOC_GOSSIP_FOUND_RELIGION");
  PopulateCheckBox(Controls.LOC_GOSSIP_GREATPERSON_CREATEDCheckbox, "CQUI_LOC_GOSSIP_GREATPERSON_CREATED");
  PopulateCheckBox(Controls.LOC_GOSSIP_LAUNCHING_ATTACKCheckbox, "CQUI_LOC_GOSSIP_LAUNCHING_ATTACK");
  PopulateCheckBox(Controls.LOC_GOSSIP_WAR_PREPARATIONCheckbox, "CQUI_LOC_GOSSIP_WAR_PREPARATION");
  PopulateCheckBox(Controls.LOC_GOSSIP_INQUISITION_LAUNCHEDCheckbox, "CQUI_LOC_GOSSIP_INQUISITION_LAUNCHED");
  PopulateCheckBox(Controls.LOC_GOSSIP_LAND_UNIT_LEVELCheckbox, "CQUI_LOC_GOSSIP_LAND_UNIT_LEVEL");
  PopulateCheckBox(Controls.LOC_GOSSIP_MAKE_DOWCheckbox, "CQUI_LOC_GOSSIP_MAKE_DOW");
  PopulateCheckBox(Controls.LOC_GOSSIP_NATIONAL_PARK_CREATEDCheckbox, "CQUI_LOC_GOSSIP_NATIONAL_PARK_CREATED");
  PopulateCheckBox(Controls.LOC_GOSSIP_NEW_RELIGIOUS_MAJORITYCheckbox, "CQUI_LOC_GOSSIP_NEW_RELIGIOUS_MAJORITY");
  PopulateCheckBox(Controls.LOC_GOSSIP_PILLAGECheckbox, "CQUI_LOC_GOSSIP_PILLAGE");
  PopulateCheckBox(Controls.LOC_GOSSIP_POLICY_ENACTEDCheckbox, "CQUI_LOC_GOSSIP_POLICY_ENACTED");
  PopulateCheckBox(Controls.LOC_GOSSIP_RECEIVE_DOWCheckbox, "CQUI_LOC_GOSSIP_RECEIVE_DOW");
  PopulateCheckBox(Controls.LOC_GOSSIP_RELIC_RECEIVEDCheckbox, "CQUI_LOC_GOSSIP_RELIC_RECEIVED");
  PopulateCheckBox(Controls.LOC_GOSSIP_RESEARCH_AGREEMENTCheckbox, "CQUI_LOC_GOSSIP_RESEARCH_AGREEMENT");
  PopulateCheckBox(Controls.LOC_GOSSIP_RESEARCH_TECHCheckbox, "CQUI_LOC_GOSSIP_RESEARCH_TECH");
  PopulateCheckBox(Controls.LOC_GOSSIP_SPY_DISRUPT_ROCKETRY_DETECTEDCheckbox, "CQUI_LOC_GOSSIP_SPY_DISRUPT_ROCKETRY_DETECTED");
  PopulateCheckBox(Controls.LOC_GOSSIP_SPY_DISRUPT_ROCKETRY_UNDETECTEDCheckbox, "CQUI_LOC_GOSSIP_SPY_DISRUPT_ROCKETRY_UNDETECTED");
  PopulateCheckBox(Controls.LOC_GOSSIP_SPY_GREAT_WORK_HEIST_DETECTEDCheckbox, "CQUI_LOC_GOSSIP_SPY_GREAT_WORK_HEIST_DETECTED");
  PopulateCheckBox(Controls.LOC_GOSSIP_SPY_GREAT_WORK_HEIST_UNDETECTEDCheckbox, "CQUI_LOC_GOSSIP_SPY_GREAT_WORK_HEIST_UNDETECTED");
  PopulateCheckBox(Controls.LOC_GOSSIP_SPY_RECRUIT_PARTISANS_DETECTEDCheckbox, "CQUI_LOC_GOSSIP_SPY_RECRUIT_PARTISANS_DETECTED");
  PopulateCheckBox(Controls.LOC_GOSSIP_SPY_RECRUIT_PARTISANS_UNDETECTEDCheckbox, "CQUI_LOC_GOSSIP_SPY_RECRUIT_PARTISANS_UNDETECTED");
  PopulateCheckBox(Controls.LOC_GOSSIP_SPY_SABOTAGE_PRODUCTION_DETECTEDCheckbox, "CQUI_LOC_GOSSIP_SPY_SABOTAGE_PRODUCTION_DETECTED");
  PopulateCheckBox(Controls.LOC_GOSSIP_SPY_SABOTAGE_PRODUCTION_UNDETECTEDCheckbox, "CQUI_LOC_GOSSIP_SPY_SABOTAGE_PRODUCTION_UNDETECTED");
  PopulateCheckBox(Controls.LOC_GOSSIP_SPY_SIPHON_FUNDS_DETECTEDCheckbox, "CQUI_LOC_GOSSIP_SPY_SIPHON_FUNDS_DETECTED");
  PopulateCheckBox(Controls.LOC_GOSSIP_SPY_SIPHON_FUNDS_UNDETECTEDCheckbox, "CQUI_LOC_GOSSIP_SPY_SIPHON_FUNDS_UNDETECTED");
  PopulateCheckBox(Controls.LOC_GOSSIP_SPY_STEAL_TECH_BOOST_DETECTEDCheckbox, "CQUI_LOC_GOSSIP_SPY_STEAL_TECH_BOOST_DETECTED");
  PopulateCheckBox(Controls.LOC_GOSSIP_SPY_STEAL_TECH_BOOST_UNDETECTEDCheckbox, "CQUI_LOC_GOSSIP_SPY_STEAL_TECH_BOOST_UNDETECTED");
  PopulateCheckBox(Controls.LOC_GOSSIP_TRADE_DEALCheckbox, "CQUI_LOC_GOSSIP_TRADE_DEAL");
  PopulateCheckBox(Controls.LOC_GOSSIP_TRADE_RENEGECheckbox, "CQUI_LOC_GOSSIP_TRADE_RENEGE");
  PopulateCheckBox(Controls.LOC_GOSSIP_TRAIN_SETTLERCheckbox, "CQUI_LOC_GOSSIP_TRAIN_SETTLER");
  PopulateCheckBox(Controls.LOC_GOSSIP_TRAIN_UNITCheckbox, "CQUI_LOC_GOSSIP_TRAIN_UNIT");
  PopulateCheckBox(Controls.LOC_GOSSIP_TRAIN_UNIQUE_UNITCheckbox, "CQUI_LOC_GOSSIP_TRAIN_UNIQUE_UNIT");
  PopulateCheckBox(Controls.LOC_GOSSIP_PROJECT_STARTEDCheckbox, "CQUI_LOC_GOSSIP_PROJECT_STARTED");
  PopulateCheckBox(Controls.LOC_GOSSIP_START_VICTORY_STRATEGYCheckbox, "CQUI_LOC_GOSSIP_START_VICTORY_STRATEGY");
  PopulateCheckBox(Controls.LOC_GOSSIP_STOP_VICTORY_STRATEGYCheckbox, "CQUI_LOC_GOSSIP_STOP_VICTORY_STRATEGY");
  PopulateCheckBox(Controls.LOC_GOSSIP_WMD_BUILTCheckbox, "CQUI_LOC_GOSSIP_WMD_BUILT");
  PopulateCheckBox(Controls.LOC_GOSSIP_WMD_STRIKECheckbox, "CQUI_LOC_GOSSIP_WMD_STRIKE");
  PopulateCheckBox(Controls.LOC_GOSSIP_WONDER_STARTEDCheckbox, "CQUI_LOC_GOSSIP_WONDER_STARTED");
end

--Used to convert between slider steps and production item height
--Minimum value is 24, maximum is 128. This translates to the 0th step and the 104th
local ProductionItemHeightConverter = {
  ToSteps = function(value)
    local out = value - 24;
    if(out < 0) then out = 0;
    elseif(out > 104) then out = 104; end
    return out;
  end,
  ToValue = function(steps)
    local out = steps + 24;
    if(out > 128) then out = 128; end
    return out;
  end
};

function Initialize()
  --Adding/binding tabs...
  m_tabs = {
    {Controls.GeneralTab, Controls.GeneralOptions},
    {Controls.BindingsTab, Controls.BindingsOptions},
    {Controls.PopupsTab, Controls.PopupsOptions},
    {Controls.GossipTab, Controls.GossipOptions},
    {Controls.ProductionTab, Controls.ProductionOptions},
    {Controls.HiddenTab, Controls.HiddenOptions}
  };
  for i, tab in ipairs(m_tabs) do
    local button = tab[1];
    local panel = tab[2];
    button:RegisterCallback(Mouse.eLClick, function() ShowTab(button, panel); end);
  end
  --Populating/binding comboboxes...
  --PopulateComboBox(Controls.BindingsPullDown, bindings_options, "CQUI_BindingsMode", Locale.Lookup("LOC_CQUI_BINDINGS_DROPDOWN_TOOLTIP"));
  PopulateComboBox(Controls.BindingsPullDown, bindings_options, "CQUI_BindingsMode", "Standard: Unchanged[NEWLINE]Classic: Civ V binds[NEWLINE]Enhanced: Civ V Binds with the following changes[NEWLINE]  WASD camera control[NEWLINE]  Q/E unit/city cycling[NEWLINE]  Shift toggles city/unit selection[NEWLINE]  Quarry/Airstrike are moved to alt-key + Q/S[NEWLINE]  NOTE:UNBIND W/E IN SETTINGS OR THINGS WON'T WORK!");
  -- PopulateComboBox(Controls.ResourceIconStyle, resource_icon_style_options, "CQUI_ResourceDimmingStyle", "LOC_CQUI_GENERAL_RESOURCEDIMMINGSTYLE", "LOC_CQUI_GENERAL_RESOURCEDIMMINGSTYLE_TOOLTIP");
  PopulateComboBox(Controls.ResourceIconStyle, resource_icon_style_options, "CQUI_ResourceDimmingStyle", "Solid: always draw resource icons[NEWLINE]Transparent: improved resource icons are transparent[NEWLINE]Hidden: improved resource icons are hidden");
  
  --Populating/binding checkboxes...
  PopulateCheckBox(Controls.ProductionQueueCheckbox, "CQUI_ProductionQueue");
  RegisterControl(Controls.ProductionQueueCheckbox, "CQUI_ProductionQueue", UpdateCheckbox);
  PopulateCheckBox(Controls.ShowLuxuryCheckbox, "CQUI_ShowLuxuries");
  PopulateCheckBox(Controls.ShowCultureGrowthCheckbox, "CQUI_ShowCultureGrowth", "This can also be toggled by clicking on the growth emblem in the cityview");
  --PopulateCheckBox(Controls.ShowCultureGrowthCheckbox, "CQUI_ShowCultureGrowth", Locale.Lookup("LOC_CQUI_GENERAL_SHOWCULTUREGROWTH_TOOLTIP"));
  --PopulateCheckBox(Controls.SmartbannerCheckbox, "CQUI_Smartbanner", Locale.Lookup("LOC_CQUI_GENERAL_SMARTBANNER_TOOLTIP"));
  PopulateCheckBox(Controls.SmartbannerCheckbox, "CQUI_Smartbanner", "Displays new icons in the city banner. A food icon is displayed whenever there are unlocked citizens being automatically assigned by the AI city governor. District icons indicate built districts");
  PopulateCheckBox(Controls.ToggleYieldsOnLoadCheckbox, "CQUI_ToggleYieldsOnLoad");
  --PopulateCheckBox(Controls.TechVisualCheckbox, "CQUI_TechPopupVisual", Locale.Lookup("LOC_CQUI_POPUPS_TECHVISUAL_TOOLTIP"));
  PopulateCheckBox(Controls.TechVisualCheckbox, "CQUI_TechPopupVisual", "Toggles the popup that appears whenever a new tech or civic is achieved");
  --PopulateCheckBox(Controls.TechAudioCheckbox, "CQUI_TechPopupAudio", Locale.Lookup("LOC_CQUI_POPUPS_TECHAUDIO_TOOLTIP"));
  PopulateCheckBox(Controls.TechAudioCheckbox, "CQUI_TechPopupAudio", "Toggles the popup audio that plays whenever a new tech or civic is achieved. Is fully indepenedent of the visual component and can play even when there is no visible popup");
  -- PopulateCheckBox(Controls.TrimGossipCheckbox, "CQUI_TrimGossip", Locale.Lookup("LOC_CQUI_GOSSIP_TRIMMESSAGE_TOOLTIP"));
  PopulateCheckBox(Controls.TrimGossipCheckbox, "CQUI_TrimGossip", "Removes the mostly useless start of the gossip message describing where the information came from");

  PopulateSlider(Controls.ProductionItemHeightSlider, Controls.ProductionItemHeightText, "CQUI_ProductionItemHeight", ProductionItemHeightConverter);

  InitializeGossipCheckboxes();
  
  --Setting up panel controls
  ShowTab(m_tabs[1][1], m_tabs[1][2]); --Show General Settings on start
  LuaEvents.CQUI_SettingsInitialized(); --Tell other elements that the settings have been initialized and it's safe to try accessing settings now
end

Initialize();
