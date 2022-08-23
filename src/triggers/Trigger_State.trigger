/**
 *  Purpose          :    This trigger is to handle all the pre abd post processing operations for State__c object.
 *
 *  Created By       :   Prem Chand
 *
 *  Created Date     :    2022/08/14
 *
 *  Revision Logs    :    V_1.0 - Created - 2022/08/14
 *
 **/
trigger Trigger_State on State__c (after insert, after update, after delete) {

    if(Trigger.isAfter ){
        if(Trigger.isInsert || Trigger.isUpdate || Trigger.isDelete){
            StateTriggerHelper.updatingStateAndDistrictCountOnCountry(Trigger.new, Trigger.oldmap);
        }
    }
}