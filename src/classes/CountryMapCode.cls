/**
 *  Purpose         :    This class is used to show different control statment.
 *  Created By      :    Prem Chand
 *  Created Date    :    2022/07/7
 *  Revision Logs   :    V_1.0 - Created - 2022/07/7
 **/

public with sharing class CountryMapCode {
    static Map<String,Map<String,Map<String, List<String>>>> mapOfCountryCodeWithCountryName;
    //static Map<String, Map<String, List<String>>> countryMap= new Map<String, Map<String, List<String>>>();
    static Set<String> codeOfCountry = mapOfCountryCodeWithCountryName.keySet();
    /**
      * Created By    :    Prem Chand
      * Purpose       :    This method is used to create a MAP of different country with their states and cities.
      * Params        :    Map<String,Map<String,Map<String, List<String>>>>
      * Return        :    Void
      **/
    public static void country_Map() {     
       // List of District of different state of India
        List<String> districtofRajasthan = new List<String>{'Ajmer','Jaipur','Udiapur','Sikar'};
        List<String> districtofAssam = new List<String>{'Cachar','Dhubri','Nagaon','Tinsukia'};
        List<String> districtofGujrat = new List<String>{'Ahmedabad','Mehsana','Vadodara','Surat'};
        List<String> dcistrictofBihar = new List<String>{'Aurangabad','Patna','Saran','Buxar'};
        // Map of District with State of India
        Map<String, List<String>> stateWithDistrictMapOfIndia = new Map<String, List<String>>{'Rajasthan'=>districtofRajasthan, 'Assam'=>districtofAssam,'Gujrat'=>districtofGujrat,'Bihar'=>dcistrictofBihar};
        //Map of State with Country of India
        Map<String,Map<String, List<String>>> indiaWithStateMap = new Map<String,Map<String, List<String>>>{'India'=>stateWithDistrictMapOfIndia};

        
        //List of District of different state of China
        List<String> districtofBeijing = new List<String>{'Shandong','Sichuan', 'Yunnan'};
        List<String> districtofShanghai = new List<String>{'Anhui', 'Jiangsu'};
        //Map of District with State of China
        Map<String, List<String>> stateWithDistrictMapOfChina = new Map<String, List<String>>{'Beijing'=>districtofBeijing,'Shanghai'=>districtofShanghai};
        //Map of State with Countary of China
        Map<String,Map<String, List<String>>> chinaWithStateMap = new Map<String,Map<String, List<String>>>{'China'=>stateWithDistrictMapOfChina};

        // List of District of different state of Russia
        List<String> districtofAdygea = new List<String>{'Giaginsky','Maykopsky','Shovgenovsky'};
        List<String> districtofChechnya = new List<String>{'Naursky','Groznensky','Achkhoy'};
        // Map of District with State of Russia
        Map<String, List<String>>stateWithDistrictMapOfRussia = new Map<String, List<String>>{'Adygea'=>districtofAdygea ,'Chechnya'=>districtofChechnya};
        //Map of State with Country of Russia
        Map<String,Map<String, List<String>>> russiaWithStateMap = new Map<String,Map<String, List<String>>>{'Russia'=>stateWithDistrictMapOfRussia};


        // List of District of different state of US
        List<String>districtofNewYork = new List<String>{'Bronx', 'Brooklyn', 'Manhattan,'};
        List<String> districtofUtah = new List<String>{'Uintah','ParkCity','Davis'};
        // Map of District with State of US
        Map<String, List<String>> stateWithDistrictMapOfUS = new Map<String, List<String>>{'NewYork'=>districtofNewYork,'Utah'=>districtofUtah};
        //Map of State with Country of US
        Map<String,Map<String, List<String>>> usWithStateMap = new Map<String,Map<String, List<String>>>{'US'=>stateWithDistrictMapOfUS};
        
        
        //Map of Different with Contry Code
        mapOfCountryCodeWithCountryName = new Map<String,Map<String,Map<String, List<String>>>>{'1' =>usWithStateMap, '7' =>russiaWithStateMap, '86' =>chinaWithStateMap,'91' =>indiaWithStateMap};
        System.debug(mapOfCountryCodeWithCountryName);       
    }
     /**
      * Created By    :    Prem Chand
      * Purpose       :    This method is used to show country,State,District Name string with passing letter as a argument.
      * Argument      :    Stirng
      * Return        :    Void
      **/
    public static void startCountryNameWith(String firstCountryLetter ){ // firstCountryLetter = U
       
        for(String code:mapOfCountryCodeWithCountryName.keySet()){
            Map<String,Map<String, List<String>>> countryNameMap = mapOfCountryCodeWithCountryName.get(code);
            System.debug(countryNameMap);//Countaries with their states and district
            for(String countryName:countryNameMap.keySet()){
                System.debug(countryName);//{US,Russia,China,India}
               if(countryName.startsWith(firstCountryLetter)){
                  Map<String, List<String>> mapState = countryNameMap.get(countryName);
					System.debug(mapState);//{NewYork=(Bronx, Brooklyn, Manhattan,), Utah=(Uintah, ParkCity, Davis)}
                   for(String stateName:mapState.keySet()){
                       System.debug(stateName);// {NewYork, Utah}
                       if(stateName.startsWith(firstCountryLetter)){
                            List<String> mapDistrict = mapState.get(stateName);
                            System.debug(mapDistrict);//(Uintah, ParkCity, Davis)
                           for(String districtName:mapDistrict){
                                if(districtName.startsWith(firstCountryLetter)){
                                    System.debug(districtName);//Uintah
                                }
                            }
                        }
                    }
                }
            }
       }
    } 
      /**
      * Created By    :    Prem Chand
      * Purpose       :    This method is used to show District Name whose length is equal to passing integer vlue as a argument.
      * Argument      :    Integer
      * Return        :    Void
      **/
    public static void largestDistrictName(Integer lengthOfDistrict){ // lengthOfDistrict=10
      
        List<String> addAllDistrictName = new List<String>();
        List<String> showDistrictName = new List<String>();
        for(String code:mapOfCountryCodeWithCountryName.keySet()) {
            Map<String,Map<String, List<String>>> countryNameWithStateAndDistrictMap = mapOfCountryCodeWithCountryName.get(code);
            System.debug(countryNameWithStateAndDistrictMap);//Countaries with their states and districts.
            for(String country:countryNameWithStateAndDistrictMap.keySet()){
                Map<String, List<String>> stateNameWithDistrictMap = countryNameWithStateAndDistrictMap.get(country);
                System.debug(stateNameWithDistrictMap);//All states with their districts.
                for(String state:stateNameWithDistrictMap.keySet()){
                    List<String> districtNameList =  stateNameWithDistrictMap.get(state);
                    System.debug(districtNameList);
                    addAllDistrictName.addAll(districtNameList);
                }
            }
        }
            for(String district_Name:addAllDistrictName){
            if(district_Name.length()>=lengthOfDistrict){
                showDistrictName.add(district_Name);   
            }
        }
        System.debug('District Name of given lenght'+showDistrictName);
        //District Name of given lenght(Manhattan,, Shovgenovsky, Groznensky, Aurangabad)
    }
     /**
      * Created By    :    Prem Chand
      * Purpose       :    This method is used to show available country code in this Map by passing vlue as a argument.
      * Argument      :    Sring
      * Return        :    Void
      **/
    public static void countryCode_Method(String countryCode){
        
        if(mapOfCountryCodeWithCountryName.containsKey(countryCode)){
            System.debug('This map contains given country code'); 
        }
        else{
           System.debug('This map does not contain given country code'); 
        } 
     
	} 
      /**
      * Created By    :    Prem Chand
      * Purpose       :    This method is used to show available country name in this Map by passing vlue as a argument.
      * Argument      :    Sring
      * Return        :    Void
      **/
    public static void countryName_Method(String countryName){
        for(String code:mapOfCountryCodeWithCountryName.keySet()){
       	 Map<String,Map<String, List<String>>> countryWithCodeMap = mapOfCountryCodeWithCountryName.get(code);   
        	if(countryWithCodeMap.keySet().contains(countryName)){
            		System.debug('This map contains given country Name'); 
        		}
        		else{
           			System.debug('This map does not contain given country Name'); 
       			}         
        }            
    }
      /**
      * Created By    :    Prem Chand
      * Purpose       :    This method is used to show available state name in this Map by passing vlue as a argument.
      * Argument      :    Sring
      * Return        :    Void
      **/
    public static void stateName_Method(String stateName){
       
        for(String code:mapOfCountryCodeWithCountryName.keySet()){
            Map<String,Map<String, List<String>>> countryNameMap = mapOfCountryCodeWithCountryName.get(code);
            for(String countryName:countryNameMap.keySet()){
                if(countryNameMap.get(countryName).containsKey(stateName)){
            		System.debug('This map contains given state Name'); 
        		}
        		else{
           			System.debug('This map does not contain given state Name'); 
       			}
            }
        }
    } 
        /**
      * Created By    :    Prem Chand
      * Purpose       :    This method is used to show available district name in this Map by passing vlue as a argument.
      * Argument      :    Sring
      * Return        :    Void
      **/
    public static void districtName_Method(String districtName){
      
        List<String> passingDistrictNameList = new List<String>();
        for(String code:mapOfCountryCodeWithCountryName.keySet()) {
            Map<String,Map<String, List<String>>> countryNameWithStateAndDistrictMap = mapOfCountryCodeWithCountryName.get(code);
            for(String country:countryNameWithStateAndDistrictMap.keySet()){
                Map<String, List<String>> stateNameWithDistrictMap = countryNameWithStateAndDistrictMap.get(country);
                   for(String state:stateNameWithDistrictMap.keySet()){
                    List<String> districtNameList =  stateNameWithDistrictMap.get(state); 
                    passingDistrictNameList.addAll(districtNameList);
               	 	}
            	}
    	}
        if(passingDistrictNameList.contains(DistrictName)){
            System.debug('This map contains given District Name'); 
        }
            else{
               System.debug('This map does not contain given District Name'); 
            }
	}    
}