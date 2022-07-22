/**
 *  Purpose         :    This class is used to External id Class 
 *  Created By      :    Prem Chand
 *  Created Date    :    2022/07/16
 *  Revision Logs   :    V_1.0 - Created - 2022/07/16
**/
public with sharing class ExternalIdClass {

    /**
     * Created By    :    Prem Chand
     * Purpose       :    This Method is Insert parent Child record
     * Params        :    void
     * Return        :    Void
    **/
    public static void insertParentChild(){
        Date dt = Date.today();
        dt = dt.addDays(7);
        Opportunity newOpportunity = new Opportunity(Name = 'OpportunityWithAccountInsert2', StageName = 'Prospecting', CloseDate = dt);
            
        // Parent refernce Used only for Forgien key reference and doesn't contains any other fields.
        Account acc = new Account(MyExtID__c = 'SPA111111');
        newOpportunity.Account = acc;

       // create the account object to insert and Same as above but has name field and used for the insert.
       Account parentAccount = new Account(Name = 'Prem2',MyExtID__c = 'SPA111111');
        
       // Create the Account and the opportunity
       Database.SaveResult[] results = Database.insert(new SObject[]{parentAccount, newOpportunity});
        
       // Check result
       for(Integer i = 0; i<results.size(); i++){
            if(results[i].isSuccess()){
                System.debug('successfully created ID '+ results[i].getId());  // output--> successfully created ID 0015i00000Kj63bAAB
                                                                               // output-->  successfully created ID 0065i000005m6cRAAQ
            }
            else{
                System.debug('Error : Could not Create sObject '+'for array element '+i +'.');
                System.debug('The Error was '+ results[i].getErrors()[0].getMessage()+'\n');
            }
        }
    }
}