/**
 *  Purpose         :    This class is used to SOQL
 *  Created By      :    Prem Chand
 *  Created Date    :    2022/07/16
 *  Revision Logs   :    V_1.0 - Created - 2022/07/16
 **/
public with sharing class SoqlQueryClass {

    /**
     * Created By    :    Prem Chand
     * Purpose       :    This method is Child to Parent SOQL using Standard Object
     * Params        :    void
     * Return        :    Void
    **/
    public static void child_To_ParentQueryMethod(){  
        
        List<Contact> conList = [SELECT FirstName, lastName, Account.Name,Account.NumberOfEmployees FROM Contact Limit 1];   // Standard Object
        
        System.debug(conList);   // Child to Parent Query Standard Object
    }

    /**
     * Created By    :    Prem Chand
     * Purpose       :    This method is Child to Parent SOQL using Custom Object
     * Params        :    void
     * Return        :    Void
    **/
    public static void child_To_ParentQueryMethod1(){

        List<State__c> stList = [SELECT Name, Country__r.Name, Country__r.Country_Code__c FROM State__c];   // Custom Object
        System.debug(stList);
    }

    /**
     * Created By    :    Prem Chand
     * Purpose       :    This method is Parent to Child SOQL Using Standard Object
     * Params        :    void
     * Return        :    Void
    **/
    public static void parentTo_ChildQueryMethod(){
        List<Account> accList1 = [SELECT Name,NumberOfEmployees,(SELECT lastName,Email,Phone FROM Contacts) FROM Account]; // Standard Object
        System.debug(accList1);

    }

    /**
     * Created By    :    Prem Chand
     * Purpose       :    This method is Child to Parent SOQL Using Custom Object
     * Params        :    void
     * Return        :    Void
    **/
    public static void parentTo_ChildQueryMethod1(){
        List<State__c> accList2 = [SELECT Name,State_Code__c,(SELECT Name,District_Pin_Code__c,Identification__c FROM Districts__r) FROM State__c]; // Custom Object
        System.debug(accList2);

    }
}