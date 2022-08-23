/**  Purpose         :   This Class is DistrictTriggerHelper
  *  Created By      :    Prem Chand
  *  Created Date    :    2022/08/14
  *  Revision Logs   :    V_1.0 - Created - 2022/08/14
  **/
public without sharing class DistrictTriggerHelper {

    /**
     * Created By    :    Prem Chand
     * Purpose       :    This method is updatingDistrictCountOnStates
     * Params        :    List<District__c> newDistricts, Map<Id, District__c> oldDistricts
     * Return        :    Void
    **/
    public static void updatingDistrictCountOnStates(List<District__c> newList, Map<Id, District__c> oldMap){

        //Map to hold States to be updated
        Map<Id, State__c> mapOfStatesToBeUpdated = new Map<Id, State__c>();

        //Traversing on Districts
        for(District__c district : (newList != null ? newList : oldMap.values())){

            //Check for Insert
            if(oldMap == null){
                if(district.State__c != null){ //Checking if District is linked to any State
                    mapOfStatesToBeUpdated.put(district.State__c, new State__c(Id = district.State__c, Total_District_By_Trigger__c = 0));
                }
            }

            //Check for Update
            else if(oldMap != null){

                //Checking if State__c is changed
                if(district.State__c != oldMap.get(district.Id).State__c && district.State__c != null){
                    
                    //Holding states to be updated in a map
                    mapOfStatesToBeUpdated.put(oldMap.get(district.Id).State__c, new State__c(Id = oldMap.get(district.Id).State__c, Total_District_By_Trigger__c = 0));
                    mapOfStatesToBeUpdated.put(district.State__c, new State__c(Id = district.State__c, Total_District_By_Trigger__c = 0));
                }

                //If a District is deleted
                if(newList == null){
                    mapOfStatesToBeUpdated.put(district.State__c, new State__c(Id = district.State__c, Total_District_By_Trigger__c = 0));
                }
            }
        }

        //Checking if the list of states to be updated is empty
        if(!mapOfStatesToBeUpdated.values().isEmpty()){
            
            //Getting District records using Aggregate SOQL
            for(AggregateResult aggDistrict : [SELECT COUNT(Id) totalDistricts, State__c state FROM District__c WHERE State__c IN: mapOfStatesToBeUpdated.keySet() GROUP BY State__c]){
                
                //Updating the district count on state
                mapOfStatesToBeUpdated.get((Id)aggDistrict.get('state')).Total_District_By_Trigger__c = (Decimal)aggDistrict.get('totalDistricts');
            }
            
            //Update States
            update mapOfStatesToBeUpdated.values();
        }   
    }
}