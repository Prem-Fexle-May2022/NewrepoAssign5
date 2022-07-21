/**
 *  Purpose         :    This class is used to How to Map Fill Dynamically
 *  Created By      :    Prem Chand
 *  Created Date    :    2022/07/16
 *  Revision Logs   :    V_1.0 - Created - 2022/07/16
 **/
public  with sharing class CountryMapDynamicFill {
    
    public static Map<String,Map<String,List<String>>> mapOfCombinationCountryStateAndDistrict = new Map<String,Map<String,List<String>>>();
    public Static Map<String,Map<String,List<String>>> mapOfAllCountryStateAndDistrict= new Map<String,Map<String,List<String>>>();
    
    public static List<AggregateResult> listOfAggResultForStates = new List<AggregateResult>();

    /**
     * Created By    :    Prem Chand
     * Purpose       :    This method is Constructor
     * Params        :    String
     * Return        :    Void
    **/
    public CountryMapDynamicFill(String startingFirstChar){
        
        List<State__c> listofCombinationCountryData = [SELECT Name,(SELECT Name FROM Districts__r WHERE Name LIKE :startingFirstChar+'%'),
                                   Country__r.Name FROM State__c WHERE Name LIKE :startingFirstChar+'%'and Country__r.Name LIKE :startingFirstChar+'%' ORDER BY Country__r.Name ASC];
        
        for(State__c stateList :listofCombinationCountryData)
        {	
            for(District__c district : stateList.Districts__r){
                if(mapOfCombinationCountryStateAndDistrict.containsKey(stateList.Country__r.Name)){
                    if(mapOfCombinationCountryStateAndDistrict.get(stateList.Country__r.Name).containsKey(stateList.Name))
                    mapOfCombinationCountryStateAndDistrict.get(stateList.Country__r.Name).get(stateList.Name).add(district.Name);
                	else
                    mapOfCombinationCountryStateAndDistrict.get(stateList.Country__r.Name).put(stateList.Name, new List<String>{district.Name});
                }
                else
                mapOfCombinationCountryStateAndDistrict.put(stateList.Country__r.Name, new Map<String,List<String>>{stateList.Name => new List<String>{district.Name}});
            }
        }
		System.debug('Map of Combination after querying data: => ' + mapOfCombinationCountryStateAndDistrict);   
    }

    /**
     * Created By    :    Prem Chand
     * Purpose       :    This method is Show All Countries Information
     * Params        :    void
     * Return        :    Void
    **/
    public void show_AllCountryData(){
        List<State__c> lsitofDistrictStateAndCountry = [SELECT Name,(SELECT Name FROM Districts__r),Country__r.Name FROM State__c];
            for(State__c st : lsitofDistrictStateAndCountry){
                for(District__c district : st.Districts__r ){
                    if(mapOfAllCountryStateAndDistrict.containsKey(st.Country__r.Name)){
                        if(mapOfAllCountryStateAndDistrict.get(st.Country__r.Name).containsKey(st.Name)){
                            mapOfAllCountryStateAndDistrict.get(st.Country__r.Name).get(st.Name).add(district.Name);
                        }
                        else{
                            mapOfAllCountryStateAndDistrict.get(st.Country__r.Name).put(st.Name,new List<String>{district.Name});
                        }
                    }
                    else{
                        mapOfAllCountryStateAndDistrict.put(st.Country__r.Name, New Map<String,List<String>>{st.Name => new List<String>{district.Name}});
                    }
                }
            }
        System.debug('Map Of Show All Country  State And District => '+mapOfAllCountryStateAndDistrict);
    }

    /**
      * Created By    :    Prem Chand
      * Purpose       :    This method is used to show District Name whose length is Greater or Equal to passing integer vlue as a argument.
      * Params        :    String
      * Return        :    Void
    **/
    public void lenghtDistrict(Integer len){
        Map<String,List<String>> mapOfStateWithDistrict = new Map<String,List<String>>();
        List<String> districtList = new List<String>();
        for( Map<String,List<String>> tampMapStateDistrict : mapOfAllCountryStateAndDistrict.values()){
            for(List<String> tempDistrictList :tampMapStateDistrict.values()){
                for(String distric :tempDistrictList){
                    if(distric.length() >= len){
                        districtList.add(distric);
                    }
                }
            }
        }
        if(!districtList.isEmpty())
        System.debug('Length Based on Districts::=> '+districtList);
        else
            System.debug('There are no districts with length of name greater or equal to that required.');
    }
    
    /**
     * Created By    :    Prem Chand
     * Purpose       :    This method is AggregateQuery Result
     * Params        :    void
     * Return        :    Void
    **/
    public void aggregate_Query_Method(){

        // Total number of District on State
        List<AggregateResult> listOfAggResultForStates = [SELECT COUNT(Id) totalDistricts, State__c stateId FROM District__c GROUP BY State__c];
            List<State__c> listOfStateToUpdate = new List<State__c>();
            for(AggregateResult agg : listOfAggResultForStates){
                State__c st = new State__c();
                st.Total_Number_of_District__c = (Integer)agg.get('totalDistricts');
                st.Id = (Id)agg.get('stateId');
                listOfStateToUpdate.add(st);
            }
        if(!listOfStateToUpdate.isEmpty()){
            update listOfStateToUpdate;
        } 

        // Total No. of States on Country
        List<AggregateResult> listOfAggResultOfStateForCountry = [SELECT Country__c CountryId,COUNT(Id)TotalState FROM State__c GROUP BY Country__c];
           List<Country__c> listOfCountryToUpdate = new List<Country__c>();
           for(AggregateResult agg1 : listOfAggResultOfStateForCountry){
                Country__c st1 = new Country__c();
                st1.Id = (Id)agg1.get('CountryId');
                st1.Total_Number_of_States__c = (Integer)agg1.get('TotalState');
                listOfCountryToUpdate.add(st1);
            }
            if(!listOfCountryToUpdate.isEmpty()){
                update listOfCountryToUpdate;
            } 

        // Total No. of Districts on    
        List<AggregateResult> listOfAggResultOfDistrictForCountry = [SELECT Country__c CountryId,COUNT(Id)cntId,Sum(Total_Number_of_District__c)TotalDistrict FROM State__c GROUP BY Country__c];
            List<Country__c> listOfCountryUpdate = new List<Country__c>();
            for(AggregateResult agg1 : listOfAggResultOfDistrictForCountry){
                Country__c st1 = new Country__c();
                 st1.Id = (Id)agg1.get('CountryId');
                 st1.Total_Number_of_Districts__c = Integer.valueOf(agg1.get('TotalDistrict'));
                 listOfCountryUpdate.add(st1);
            }
        if(!listOfCountryUpdate.isEmpty()){
            update listOfCountryUpdate;
        }
    }

    /**
     * Created By    :    Prem Chand
     * Purpose       :    This Class is Wrapper Class
     * Params        :    void
     * Return        :    Void
    **/
    public class States{
        public string stateName{get; set;}
        public List<Districts> districtsList{get; set;}
    }
    
    public class Districts{
        public string districtName{get; set;}
    }
    
    public class Country{
        public string countryName{get; set;}
        public List<States> statesList{get; set;}
        public Integer totalDistrictsOnCountry{get; set;}
        public Integer totalStatesOnCountry{get; set;}
    }

    /**
     * Created By    :    Prem Chand
     * Purpose       :    This method is JSON Generator
     * Params        :    void
     * Return        :    Void
    **/
    public void countryJSONGenerator(String countryName){
      
        Country objCountry = new Country();          // Create Country Class Object
        objCountry.countryName = countryName;
        objCountry.statesList = new List<States>();         // Create State List

        List<AggregateResult> listOfAggResultOfStateForCountry = [SELECT COUNT(Id)TotalState FROM State__c WHERE Country__r.Name = :countryName GROUP BY Country__r.Name];
        objCountry.totalStatesOnCountry = (Integer)listOfAggResultOfStateForCountry[0].get('TotalState');
        
        List<AggregateResult> listOfAggResultOfDistrictForCountry = [SELECT COUNT(Id)TotalDistrict FROM District__c WHERE State__r.Country__r.Name = :countryName GROUP BY State__r.Country__r.Name];
        objCountry.totalDistrictsOnCountry = (Integer)listOfAggResultOfDistrictForCountry[0].get('TotalDistrict');
        for(String state : mapOfAllCountryStateAndDistrict.get(countryName).keySet()){
            States stateObj = new States();
            stateObj.stateName = state;
            stateObj.districtsList = new List<Districts>();
            
            for(String district : mapOfAllCountryStateAndDistrict.get(countryName).get(state)){
                Districts districtObj = new Districts();
                districtObj.districtName = district;
				stateObj.districtsList.add(districtObj);
			}
            
            objCountry.statesList.add(stateObj);
        }
        
        String jsonData = JSON.serialize(objCountry);
        System.debug('JSON DATA: ' + jsonData);

        Country__c obj = [SELECT Name,JSON_Data_Format__c FROM Country__c WHERE Name =:countryName];
        obj.JSON_Data_Format__c = jsonData;
        update obj;
    }
}