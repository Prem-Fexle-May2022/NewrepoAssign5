/**  Purpose         :    This class is Constructor
  *  Created By      :    Prem Chand
  *  Created Date    :    2022/07/04
  *  Revision Logs   :    V_1.0 - Created - 2022/07/04
  **/
public with sharing class Constructor {

    private String countryName;                      
    private Integer countryPopulation;

    /**
     * Created By    :    Prem Chand
     * Purpose       :    This method is parameterized constructor
     * Params        :    String , Integer
     * Return        :    Void
     **/
    public Constructor(String countryName, Integer countryPopulation){               // countryName = 'US' , countryPopulation = 200000000

        this.countryName = countryName;                           // using This key Word
        this.countryPopulation = countryPopulation;
    }

    /**
     * Created By    :    Prem Chand
     * Purpose       :    This method is non parameterized constructor
     * Params        :    void
     * Return        :    Void
     **/
    public Constructor(){

        countryName = 'India';
        countryPopulation = 138000000;
        System.debug(countryname );                             // output---> India
        System.debug(countryPopulation );                      //  output---> 138000000
    }

    /**
     * Created By    :    Prem Chand
     * Purpose       :    This method is Print Class Values
     * Params        :    void
     * Return        :    Void
     **/
    public void printClassVariables(){

        System.debug('Country Name: ' + countryName);                   // Country Name: US
        System.debug('Country Population: ' + countryPopulation);       // Country Population: 200000000
        
        //Constructor c1 = new Constructor('Iceland',356991 );
        //c1.printClassVariables();
    }
}