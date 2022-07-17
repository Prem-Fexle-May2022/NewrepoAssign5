/**
 *  Purpose         :    This class is used to show Country,State and Distric Name.
 *  Created By      :    Prem Chand
 *  Created Date    :    2022/07/13
 *  Revision Logs   :    V_1.0 - Created - 2022/07/13
 **/
public class CountryMapPractice2 {
     public static Map<String,Map<String,Map<String,List<String>>>> countryContainingData = new Map<String,Map<String,Map<String,List<String>>>>();

    /**
       * Created By    :    Prem Chand
       * Purpose       :    This method is that How Fill values in Map
       * Params        :    void
       * Return        :    Void
       **/
    public static void fillCountryMap(){
         countryContainingData.put('+91',new Map<String,Map<String,List<String>>>{'India'=> new Map<String,List<String>>{
                                                                                'Rajasthan'=> new List<String>{'Jaipur','Kota','Ajmer','Sikar'},
                                                                                 'UP'=> new List<String>{'Mathura','Kanpur'},
                                                                                 'Gujarat'=> new List<String>{'Surat','Junagadh'}}});
        countryContainingData.put('+61',new Map<String,Map<String,List<String>>>{'Australia'=> new Map<String,List<String>>{
                                                                                'Queensland'=> new List<String>{'Brisbane','Airdrie'},
                                                                                'South Australia'=> new List<String>{'Hunter','South Coast'}}});
       countryContainingData.put('+1',new Map<String,Map<String,List<String>>>{'US'=> new Map<String,List<String>>{
                                                                                'Arizona'=> new List<String>{'Mesa','Phoenix'},
                                                                                'Florida'=> new List<String>{'Miami','Searland'}}});
       countryContainingData.put('+98',new Map<String,Map<String,List<String>>>{'Nepal'=> new Map<String,List<String>>{
                                                                                'Arun Kshetra'=> new List<String>{'Arundel','Littlehampton'},
                                                                                'Janakpur Kshetra'=> new List<String>{'Dhanusha','Madhesh'}}});
        System.debug(countryContainingData);
    }

    /**
       * Created By    :    Prem Chand
       * Purpose       :    This method is show Combination as a Passing Character.
       * Params        :    String
       * Return        :    Void
       **/
    public static void getCombinations(String charToFormCombinationsWith){
        Map<String, List<String>> countryNamesStartingWithS = new Map<String, List<String>>();
        Map<String, List<String>> mapOfStateWithDistrict = new Map<String, List<String>>();
        Map<String, String> mapOfStateWithCountry = new Map<String, String>();
        List<List<String>> listOfCombinations = new List<List<String>>();
        
        //Finding all the Country Names that start with charToFormCombinationsWith
        for(Map<String, Map<String, List<String>>> tempMap : countryContainingData.values()){
            for(String countryName : tempMap.keySet()){
                if(countryName.startsWith(charToFormCombinationsWith.toUpperCase())){
                    mapOfStateWithDistrict.putAll(tempMap.get(countryName));// This map will contain data for Australia and Aepal
                    countryNamesStartingWithS.put(countryName, new List<String>(tempMap.get(countryName).keySet()));// This map will hold States for the countries with names starting with 'a'
                }
            }
        }
        System.debug(mapOfStateWithDistrict);
        System.debug(countryNamesStartingWithS);
        if(mapOfStateWithDistrict.isEmpty())
            System.debug('This combination is not present in this map');
        else{
            for(String countryName : countryNamesStartingWithS.keySet()){
                for(String state : countryNamesStartingWithS.get(countryName)){
                    mapOfStateWithCountry.put(state, countryName);
                }
            }
            System.debug(mapOfStateWithDistrict);
            for(String state : mapOfStateWithDistrict.keySet()){
                if(state.startsWith(charToFormCombinationsWith.toUpperCase())){
                    for(String dist : mapOfStateWithDistrict.get(state)){
                        if(dist.startsWith(charToFormCombinationsWith.toUpperCase())){
                            listOfCombinations.add(new List<String>{mapOfStateWithCountry.get(state), state, dist});
                        }
                    }
                }
            } 
        }
        if(!listOfCombinations.isEmpty())
        	System.debug(listOfCombinations);
    }

    /**
      * Created By    :    Prem Chand
      * Purpose       :    This method is used to show District Name whose length is Greater or Equal to passing integer vlue as a argument.
      * Params        :    String
      * Return        :    Void
      **/
    public static void getDistrictBasedOnLength(Integer len){
        Map<String, List<String>> mapOfStateWithDistricts = new Map<String, List<String>>();
        List<String> listOfDistrictNamesBasedOnLength = new List<String>();
        
        //Getting map of State With Districts
        for(Map<String, Map<String, List<String>>> mapOfCountry : countryContainingData.values()){
            for(String countryName : mapOfCountry.keySet()){
                mapOfStateWithDistricts.putAll(mapOfCountry.get(countryName));
            }
        }
        
        //Looping over States and then Districts and checking if the length of the name of the district is greater or equal to the required value
        for(String state : mapOfStateWithDistricts.keySet()){
            for(String dist : mapOfStateWithDistricts.get(state)){
                if(dist.length() >= len)
                    listOfDistrictNamesBasedOnLength.add(dist);
            }
        }
        
        if(!listOfDistrictNamesBasedOnLength.isEmpty())
            System.debug(listOfDistrictNamesBasedOnLength);
        else
            System.debug('There are no districts with length of name greater or equal to that required.');
    }

    /**
      * Created By    :    Prem Chand
      * Purpose       :    This method is used to show available country code in this Map by passing vlue as a argument.
      * Params        :    String
      * Return        :    Void
      **/
    public static void country_CodeMethod(String Code){
        if(countryContainingData.containsKey(Code)){
                System.debug('This map contains given country Code');
        }
        else{
                System.debug('This map not contains given country Code');
        }                 
        
    }
    
    /**
      * Created By    :    Prem Chand
      * Purpose       :    This method is used to show available country name in this Map by passing vlue as a argument.
      * Params        :    String
      * Return        :    Void
      **/
    public static void countryName_Method(String countryName){
        Set<String> onlyCountryNameSet = new Set<String>();
        for(String countryCode :countryContainingData.keySet()){
            Map<String,Map<String,List<String>>> countryStateDsitrict = countryContainingData.get(countryCode);
            onlyCountryNameSet.addAll(countryStateDsitrict.keySet());
            // System.debug(onlyCountryNameSet); print All Country name
        }
        if(onlyCountryNameSet.contains(countryName)){
             System.debug('This map contains given country Name'); 
        }
        else{
            System.debug('This map not contains given country Name'); 
        }
    }
}