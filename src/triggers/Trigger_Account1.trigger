/**
 *  Purpose          :    This trigger is to handle all the pre abd post processing operations for Account object.
 *
 *  Created By       :   Prem Chand
 *
 *  Created Date     :    2022/07/21
 *
 *  Revision Logs    :    V_1.0 - Created - 2022/07/21
 *
 **/
trigger Trigger_Account1 on Account (before insert, before update, before delete, after insert, after update, after delete, after undelete) {
     
    if(Trigger.isBefore){
        System.debug('Checking in Before trigger Operations:: ');
        if(Trigger.isInsert){
            System.debug('Check insert map:: trigger.newMap:: '+trigger.newMap);  // Check insert map:: trigger.newMap:: null
            System.debug('Check insert map:: trigger.oldMap:: '+trigger.oldMap); // Check insert map:: trigger.oldMap:: null
        }
        if(Trigger.isUpdate){
            System.debug('Check update map:: trigger.newMap:: '+trigger.newMap); // Check update map:: trigger.newMap:: {0015i00000LDN10AAH=Account:{Id=0015i00000LDN10AAH, IsDeleted=false, MasterRecordId=null, Name=TriggerMapDemo1
            System.debug('Check update map:: trigger.oldMap:: '+trigger.oldMap);// |Check update map:: trigger.oldMap:: {0015i00000LDN10AAH=Account:{Id=0015i00000LDN10AAH, IsDeleted=false, MasterRecordId=null, Name=TriggerMapDemo
            System.debug('Check update map:: trigger.newMap:: '+trigger.newMap.keySet());// Check update map:: trigger.newMap:: {0015i00000LDN10AAH}
            System.debug('Check update map:: trigger.oldMap:: '+trigger.oldMap.keySet());// |Check update map:: trigger.oldMap:: {0015i00000LDN10AAH}
            System.debug('Check update map:: trigger.newMap:: '+trigger.newMap.get('0015i00000LDN10AAH'));// Check update map:: trigger.newMap:: Account:{Id=0015i00000LDN10AAH, IsDeleted=false, MasterRecordId=null, Name=TriggerMapDemo4
            System.debug('Check update map:: trigger.oldMap:: '+trigger.oldMap.get('0015i00000LDN10AAH'));// Check update map:: trigger.oldMap:: Account:{Id=0015i00000LDN10AAH, IsDeleted=false, MasterRecordId=null, Name=TriggerMapDemo3
        }
        if(Trigger.isDelete){
            System.debug('Check Delete map:: trigger.newMap:: '+trigger.newMap);// Check Delete map:: trigger.newMap:: null
            System.debug('Check Delete map:: trigger.oldMap:: '+trigger.oldMap);// |Check Delete map:: trigger.oldMap:: {0015i00000LDN10AAH=Account:{Id=0015i00000LDN10AAH, IsDeleted=false, MasterRecordId=null, Name=TriggerMapDemo4
            System.debug('Check update map:: trigger.newMap:: '+trigger.oldMap.keySet());//Check update map:: trigger.newMap:: {0015i00000LDN10AAH}
       }
    }
    if(Trigger.isAfter){
        System.debug('Checking in After trigger Operations:: ');
        if(Trigger.isInsert){
            System.debug('Check After insert map ::: Trigger.newMap '+ Trigger.newMap);//Check After insert map ::: Trigger.newMap {0015i00000LDNemAAH=Account:{Id=0015i00000LDNemAAH, IsDeleted=false, MasterRecordId=null, Name=TriggerDemo12
        	System.debug('Check After insert map ::: Trigger.oldMap '+ Trigger.oldMap);// Check After insert map ::: Trigger.oldMap null
            System.debug('Check After insert map:: trigger.newMap:: '+trigger.newMap.keySet());//Check After insert map:: trigger.newMap:: {0015i00000LDNemAAH}
          //  System.debug('Check After insert map:: trigger.oldMap:: '+trigger.oldMap.keySet()); error because old map is null
        }
        if(Trigger.isUpdate){
            System.debug('Check After update map ::: Trigger.newMap '+ Trigger.newMap);//DEBUG|Check After update map ::: Trigger.newMap {0015i00000LDNemAAH=Account:{Id=0015i00000LDNemAAH, IsDeleted=false, MasterRecordId=null, Name=TriggerDemo1222
        	System.debug('Check After update map ::: Trigger.oldMap '+ Trigger.oldMap);//DEBUG|Check After update map ::: Trigger.oldMap {0015i00000LDNemAAH=Account:{Id=0015i00000LDNemAAH, IsDeleted=false, MasterRecordId=null, Name=TriggerDemo12
            System.debug('Check After update map:: trigger.newMap:: '+trigger.newMap.keySet());//Check After update map:: trigger.newMap:: {0015i00000LDNemAAH}
            System.debug('Check After update map:: trigger.oldMap:: '+trigger.oldMap.keySet());//Check After update map:: trigger.oldMap:: {0015i00000LDNemAAH}
        }
        if(Trigger.isDelete){
            System.debug('Check After Delete map ::: Trigger.newMap '+ Trigger.newMap);//Check After Delete map ::: Trigger.newMap null
        	System.debug('Check After Delete map ::: Trigger.oldMap '+ Trigger.oldMap);//Check After Delete map ::: Trigger.oldMap {0015i00000LDNemAAH=Account:{Id=0015i00000LDNemAAH, IsDeleted=false, MasterRecordId=null, Name=TriggerDemo1222
        }
        if(Trigger.isUndelete){
             System.debug('Check After undelete map ::: Trigger.newMap '+ Trigger.newMap);//Check After undelete map ::: Trigger.newMap {0015i00000LDNemAAH=Account:{Id=0015i00000LDNemAAH, IsDeleted=false, MasterRecordId=null, Name=TriggerDemo1222, Type=null, 
        	System.debug('Check After undelete map ::: Trigger.oldMap '+ Trigger.oldMap);//Check After undelete map ::: Trigger.oldMap null
            System.debug('Check After undelete map:: trigger.newMap:: '+trigger.newMap.keySet());//|Check After undelete map:: trigger.newMap:: {0015i00000LDNemAAH}
        }
    }
}