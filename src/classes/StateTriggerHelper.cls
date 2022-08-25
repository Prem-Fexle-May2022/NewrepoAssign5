/**  Purpose         :   This Class is StateTriggerHelper
  *  Created By      :    Prem Chand
  *  Created Date    :    2022/08/14
  *  Revision Logs   :    V_1.0 - Created - 2022/08/14
  **/
public with sharing class StateTriggerHelper {

    /**
     * Created By    :    Prem Chand
     * Purpose       :    This method is updatingDistrictCountOnStates
     * Params        :    List<State__c> newStates, Map<Id, State__c> oldStates
     * Return        :    Void
    **/
    public static void  updatingStateAndDistrictCountOnCountry(List<State__c> newList, Map<Id, State__c> oldMap){

        // Map to be hold Country updated
        Map<Id, Country__c> mapOfCountryToBeUpdated = new Map<Id, Country__c>();
 
        // Traversing on State
        for(State__c State : (newList != null ? newList : oldMap.values())){
        
            // check for Insert
            if(oldMap == null){
                if(State.Country__c != null){
                    mapOfCountryToBeUpdated.put(State.Country__c, new Country__c(Id = State.Country__c, Total_Number_Of_District_By_Trigger__c = 0 , Total_Number_Of_State_By_Trigger__c = 0));
                }
            }
            // check for Update
            else if(oldMap != null){
                if(State.Country__c != oldMap.get(State.Id).Country__c && State.Country__c != null || State.Total_District_By_Trigger__c != oldMap.get(State.Id).Total_District_By_Trigger__c){
                    mapOfCountryToBeUpdated.put(oldMap.get(State.Id).Country__c, new Country__c(Id = oldMap.get(State.Id).Country__c, Total_Number_Of_District_By_Trigger__c = 0, Total_Number_Of_State_By_Trigger__c = 0));
                    mapOfCountryToBeUpdated.put(State.Country__c, new Country__c(Id = State.Country__c, Total_Number_Of_District_By_Trigger__c = 0, Total_Number_Of_State_By_Trigger__c = 0));
                }
                if(newList == null){
                    mapOfCountryToBeUpdated.put(State.Country__c, new Country__c(Id = State.Country__c, Total_Number_Of_District_By_Trigger__c = 0, Total_Number_Of_State_By_Trigger__c = 0));
                }
            }
        }
     
        //Check if map is empty or not
        if(!mapOfCountryToBeUpdated.values().isEmpty()){
            for(AggregateResult aggDistrictState : [SELECT Country__c, COUNT(Id)totalStateId, SUM(Total_District_By_Trigger__c)TotalDistrict FROM State__c WHERE Country__c IN: mapOfCountryToBeUpdated.keySet() GROUP BY Country__c]){
                System.debug(aggDistrictState);
                mapOfCountryToBeUpdated.get((Id)aggDistrictState.get('country__c')).Total_Number_Of_District_By_Trigger__c = (Decimal)aggDistrictState.get('TotalDistrict') != null ? (Decimal)aggDistrictState.get('TotalDistrict') : 0;
                mapOfCountryToBeUpdated.get((Id)aggDistrictState.get('country__c')).Total_Number_Of_State_By_Trigger__c = (Decimal)aggDistrictState.get('totalStateId');	
            }
            update mapOfCountryToBeUpdated.values();
            List<Country__c> cntname = [SELECT Name FROM Country__c WHERE Id IN: mapOfCountryToBeUpdated.keySet()];
            new CountryMapDynamicFill(); // create class ref
            for(Country__c countryName :cntname){
                CountryMapDynamicFill.countryJSONGenerator(countryName.Name);// pass only country name
                System.debug(countryName); // only country name print
            }
          
        }
    }
}