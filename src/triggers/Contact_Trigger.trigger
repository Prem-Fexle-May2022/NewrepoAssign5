/**
 *  Purpose          :    This trigger is to handle all the pre abd post processing operations for Bank__c object.
 *
 *  Created By       :   Prem Chand
 *
 *  Created Date     :    2022/08/13
 *
 *  Revision Logs    :    V_1.0 - Created - 2022/08/13
 *
 **/
trigger Contact_Trigger on Contact (before insert, before update) {
	
    if(Trigger.isBefore){
        if(Trigger.isInsert || Trigger.isUpdate){
            ContactTriggerHelper.updateStatus(Trigger.new, Trigger.oldMap);
        }
    }
}