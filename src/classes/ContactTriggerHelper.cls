/**  Purpose         :   This Class is ContactTriggerHelper
  *  Created By      :    Prem Chand
  *  Created Date    :    2022/08/13
  *  Revision Logs   :    V_1.0 - Created - 2022/08/13
 **/
public with sharing class ContactTriggerHelper {
    
    /**
     * Created By    :    Prem Chand
     * Purpose       :    This method is updateStatus
     * Params        :    void
     * Return        :    Void
    **/
    public static void updateStatus(List<Contact> newList, Map<Id,Contact> oldMap){
        Map<Id, Contact> mapOfAccIdWithContact = new Map<Id, Contact>();
        // Insert or Update case
        if(newList != null){
            for(Contact con : newList){
                if(String.isBlank(con.Status__c) && con.AccountId != null){
                    mapOfAccIdWithContact.put(con.AccountId, con);       
                }
            }
            if(!mapOfAccIdWithContact.isEmpty()){
                for(Account acc : [SELECT Status__c FROM Account WHERE Id IN: mapOfAccIdWithContact.keySet()]){
                    mapOfAccIdWithContact.get(acc.Id).Status__c = acc.Status__c;
                }
			}
        }
    }
}