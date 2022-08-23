/**
 *  Purpose          :    This trigger is to handle all the pre abd post processing operations for Bank__c object.
 *
 *  Created By       :   Prem Chand
 *
 *  Created Date     :    2022/07/24
 *
 *  Revision Logs    :    V_1.0 - Created - 2022/07/24
 *
 **/
trigger Bank_Trigger on Bank__c (before insert,before update, after insert, after update) {
    if(Trigger.isBefore){
        System.debug('Checking in Before trigger Operations::');
        if(Trigger.isInsert){
            BankTriggerHandler.openAccount(Trigger.New);
            BankTriggerHandler.createRandomAccountNumber(Trigger.New);
            BankTriggerHandler.minimumBalanceRequired(Trigger.New);
        }
        if(Trigger.isUpdate){
            BankTriggerHandler.exceptionFieldUpdate(Trigger.new, Trigger.oldMap);
        }
    }
    if(Trigger.isAfter){
        System.debug('Checking in After trigger Operations::');
        if(Trigger.isInsert){
            BankTriggerHandler.createBankAccountEmailNotification(Trigger.new);
        }
    }
    if(Trigger.isUpdate){
        BankTriggerHandler.phoneNoUpdateEmailNotification(Trigger.new, Trigger.oldMap);
    }
}