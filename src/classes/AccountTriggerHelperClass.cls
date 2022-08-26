/**  Purpose         :   This Class is AccountTriggerHelperClass
  *  Created By      :    Prem Chand
  *  Created Date    :    2022/08/13
  *  Revision Logs   :    V_1.0 - Created - 2022/08/13
 **/
public with sharing class AccountTriggerHelperClass {

    /**
     * Created By    :    Prem Chand
     * Purpose       :    This method is updateStatus
     * Params        :    void
     * Return        :    Void
    **/
    public static void updateStatus(List<Account> newList, Map<Id,Account> oldMap){
        Map<Id, Account> mapOfAccIdWithAccount = new Map<Id, Account>();
         // Insert or Update case
         if(newList != null){
            for(Account acc : newList){
                if(String.isBlank(acc.Status__c) && acc.Property__c != null){
                    mapOfAccIdWithAccount.put(acc.Property__c, acc);       
                }
            }
            if(!mapOfAccIdWithAccount.isEmpty()){
                for(Property__c property : [SELECT Status__c FROM Property__c WHERE Id IN: mapOfAccIdWithAccount.keySet()]){
                    mapOfAccIdWithAccount.get(property.Id).Status__c = property.Status__c;
                }
			}
        }
    }
}