/**  Purpose         :    This class is How Use to  DML Statements in Apex 
  *  Created By      :    Prem Chand
  *  Created Date    :    2022/07/15
  *  Revision Logs   :    V_1.0 - Created - 2022/07/15
 **/
public with sharing class DmlClass1 {

    /**
      * Created By    :    Prem Chand
      * Purpose       :    This method is Insert Statement
      * Argument      :    void
      * Return        :    Void
     **/
    public void insert_Method(){
        Account[] accts = new List<Account>();
        for(Integer i=0;i<2;i++) {
            Account a = new Account(Name='PAcme' + i, BillingCity='San Francisco');
            accts.add(a);
        }
        insert accts;        
        System.debug(accts);    // (Account:{Name=PAcme0, BillingCity=San Francisco}, Account:{Name=PAcme1, BillingCity=San Francisco}, Account:{Name=PAcme2, BillingCity=San Francisco})
    }

    /**
      * Created By    :    Prem Chand
      * Purpose       :    This method is Update Statement
      * Argument      :    void
      * Return        :    Void
      **/
    public void update_Method(){
    List<Account> accList = [SELECT Name From Account WHERE Createddate = TODAY limit 2];   // Example--> Ram
       
        for(Account ac : accList){
            ac.Name = ac.Name +' Updated';
        }
        update accList;
        System.debug(accList);   // Ram Update
    }

    /**
     * Created By    :    Prem Chand
     * Purpose       :    This method is Upser Statement
     * Argument      :    void
     * Return        :    Void
    **/
    public void upsert_Method(){
        List<Account> accList1 =[SELECT Name,NumberOfEmployees FROM Account WHERE Createddate = TODAY];
        for(Account a : accList1){
            a.NumberOfEmployees = 2050;
        }
        for(Integer i=0; i<=3; i++){
            Account a = new Account(Name = 'Ram');
            accList1.add(a);
        }
        upsert accList1;
    }
}