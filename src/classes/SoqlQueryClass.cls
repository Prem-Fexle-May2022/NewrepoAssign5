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
        
        System.debug(conList);   //  output--> (Contact:{FirstName=Om Prakash, LastName=Choudhary, Id=0035i0000072WMtAAM})
    }

    /**
     * Created By    :    Prem Chand
     * Purpose       :    This method is Child to Parent SOQL using Custom Object
     * Params        :    void
     * Return        :    Void
    **/
    public static void child_To_ParentQueryMethod1(){

        List<State__c> stList = [SELECT Name, Country__r.Name, Country__r.Country_Code__c FROM State__c];   // Custom Object
        System.debug(stList); // output-->  output-->(State__c:{Name=Munster, Country__c=a075i000000iFBZAA2, Id=a0H5i000001i85XEAQ}, State__c:{Name=IrleandState, Country__c=a075i000000iFBZAA2, Id=a0H5i000001i85cEAA}, State__c:{Name=Rajasthan, Country__c=a075i000000i8scAAA, Id=a0H5i000001i2B2EAI}, State__c:{Name=MP, Country__c=a075i000000i8scAAA, Id=a0H5i000001i2B3EAI}, State__c:{Name=IndiaState, Country__c=a075i000000i8scAAA, Id=a0H5i000001i92EEAQ}, State__c:{Name=Sandhikharka, Country__c=a075i000000iGEdAAM, Id=a0H5i000001i91zEAA}, State__c:{Name=M
    }

    /**
     * Created By    :    Prem Chand
     * Purpose       :    This method is Parent to Child SOQL Using Standard Object
     * Params        :    void
     * Return        :    Void
    **/
    public static void parentTo_ChildQueryMethod(){
        List<Account> accList1 = [SELECT Name,NumberOfEmployees,(SELECT lastName,Email,Phone FROM Contacts) FROM Account]; // Standard Object
        System.debug(accList1);  // output--> (Account:{Name=BrachRelatedAccount1, Id=0015i00000KjAIsAAN}, Account:{Name=BranchRelatedAccount2, Id=0015i00000KjAJWAA3}, Account:{Name=TestTrigger, Id=0015i00000KjDDTAA3}, Account:{Name=Test Trigger, Id=0015i00000Kj6rMAAR}, Account:{Name=United Oil & Gas, Singapore, NumberOfEmployees=3000, Id=0015i000007ALxLAAW}, Account:{Name=GenePoint, NumberOfEmployees=265, Id=0015i000007ALxMAAW}, Account:{Name=United Oil & Gas, UK, NumberOfEmployees=24000, Id=0015i000007ALxKAAW}, Account:{Name=Edge C

    }

    /**
     * Created By    :    Prem Chand
     * Purpose       :    This method is Child to Parent SOQL Using Custom Object
     * Params        :    void
     * Return        :    Void
    **/
    public static void parentTo_ChildQueryMethod1(){
        List<State__c> accList2 = [SELECT Name,State_Code__c,(SELECT Name,District_Pin_Code__c,Identification__c FROM Districts__r) FROM State__c]; // Custom Object
        System.debug(accList2); // output--> (State__c:{Name=Munster, State_Code__c=6985545, Id=a0H5i000001i85XEAQ}, State__c:{Name=IrleandState, State_Code__c=2415, Id=a0H5i000001i85cEAA}, State__c:{Name=Rajasthan, State_Code__c=341509, Id=a0H5i000001i2B2EAI}, State__c:{Name=MP, State_Code__c=1021, Id=a0H5i000001i2B3EAI}, State__c:{Name=IndiaState, State_Code__c=4587, Id=a0H5i000001i92EEAQ}, State__c:{Name=Sandhikharka, State_Code__c=25, Id=a0H5i000001i91zEAA}, State__c:{Name=Mangalsen, State_Code__c=1452, Id=a0H5i000001i91uEAA}, State__c:

    }
}