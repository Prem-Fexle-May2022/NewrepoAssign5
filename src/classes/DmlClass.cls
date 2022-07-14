/**
 *  Purpose         :    This class is used to show different way Insert Method
 *  Created By      :    Prem Chand
 *  Created Date    :    2022/07/7
 *  Revision Logs   :    V_1.0 - Created - 2022/07/7
 **/
public with sharing class DmlClass {

    /**
      * Created By    :    Prem Chand
      * Purpose       :    This method is used to sObject
      * Argument      :    void
      * Return        :    Void
      **/
    public void dml_sObjectMethod(){

        SObject s = new Account();
        if(s instanceOf Account){
             Account a  = (Account)s;
            a.name = 'Om Prakash';
            insert a;
            System.debug(a);    // Account:{Name=Om Prakash}
        }
    }
    /**
      * Created By    :    Prem Chand
      * Purpose       :    This method is How to insert record in Database
      * Argument      :    void
      * Return        :    Void
     **/
    public void dml_Method1(){
             
        Account acc = new Account();
        acc.Name = 'Sahil Kumar1';
        acc.BillingStreet = 'Sanganer';
        acc.NumberOfEmployees = 50;
        System.debug(acc);            // Account:{Name=Sahil Kumar1, BillingStreet=Sanganer, NumberOfEmployees=50}
        insert acc;             
        System.debug(acc.Id);
    } 

    /**
      * Created By    :    Prem Chand
      * Purpose       :    This method is How to insert record in Database using Constructor
      * Argument      :    void
      * Return        :    Void
     **/
    public void dml_method2(){
        
        Account acc = new Account(Name = 'Dinesh Kumar',Phone = '12345' ,CustomerPriority__c = 'High');
        insert acc;
        System.debug(acc);    // Account:{Name=Dinesh Kumar, Phone=12345, CustomerPriority__c=High, Id=0015i00000JAtskAAD}
        System.debug(acc.Id);
    }   
}