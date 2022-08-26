/**
 *  Purpose          :    This trigger is to handle all the pre and post processing operations for Account object.
 *
 *  Created By       :   Prem Chand
 *
 *  Created Date     :    2022/08/13
 *
 *  Revision Logs    :    V_1.0 - Created - 2022/08/13
 *
 **/
trigger Trigger_Account2 on Account (before insert, before update) {
    
    if(Trigger.isBefore){
        if(Trigger.isInsert || Trigger.isUpdate){
            AccountTriggerHelperClass.updateStatus(Trigger.new, Trigger.oldMap);
        }
    }
}