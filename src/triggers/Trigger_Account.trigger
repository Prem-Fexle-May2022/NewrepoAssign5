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
trigger Trigger_Account on Account (before insert, before update, before delete, after insert, after update, after delete, after undelete) {

    if(Trigger.isBefore){
        System.debug('Checking in Before Trigger Operations');
        if(Trigger.isInsert){
            System.debug('Check Insert List ::: Trigger.New ' + Trigger.New); // Check Insert List ::: Trigger.New (Account:{Id=null, IsDeleted=false, MasterRecordId=null, Name=Suresh
            System.debug('Check Insert List ::: Trigger.old '+ Trigger.old); //  Check Insert List ::: Trigger.old null
        }
        if(Trigger.isUpdate){
            System.debug('Check Update List ::: Trigger.New '+ Trigger.New); // |Check Update List ::: Trigger.New (Account:{Id=0015i00000KjaDaAAJ, IsDeleted=false, MasterRecordId=null, Name=SureshNew
            System.debug('Check Update List ::: Trigger.old '+ Trigger.old); // Check Update List ::: Trigger.old (Account:{Id=0015i00000KjaDaAAJ, IsDeleted=false, MasterRecordId=null, Name=Suresh
        }
        if(Trigger.isDelete){
            System.debug('Check Delete List ::: Trigger.New '+ Trigger.New); // Check Delete List ::: Trigger.New null
            System.debug('Check Delete List ::: Trigger.old '+ Trigger.old); // Check Delete List ::: Trigger.old (Account:{Id=0015i00000KjaDaAAJ, IsDeleted=false, MasterRecordId=null, Name=SureshNew
        }
    }
    if(Trigger.isAfter){
        System.debug('Checking in After trigger Operations::');
        if(Trigger.isInsert){
            System.debug('After Insert Record is:::');
            System.debug('Check After insert List ::: Trigger.new '+ Trigger.new);// |Check After insert List ::: Trigger.new (Account:{Id=0015i00000KjaDaAAJ, IsDeleted=false, MasterRecordId=null, Name=Suresh
            System.debug('Check After insert List ::: Trigger.old '+ Trigger.old);//Check After insert List ::: Trigger.old null
        }
        System.debug('After Update Record is:::');
        if(Trigger.isUpdate){
            System.debug('Check After update List ::: Trigger.new '+ Trigger.new);// Check After update List ::: Trigger.new (Account:{Id=0015i00000KjaDaAAJ, IsDeleted=false, MasterRecordId=null, Name=SureshNew
            System.debug('Check After update List ::: Trigger.old '+ Trigger.old);//Check After update List ::: Trigger.old (Account:{Id=0015i00000KjaDaAAJ, IsDeleted=false, MasterRecordId=null, Name=Suresh
        }
        System.debug('After delete Record is:::');
        if(Trigger.isDelete){
            System.debug('Check After delete List ::: Trigger.new '+ Trigger.new);// Check After delete List ::: Trigger.new null
            System.debug('Check After delete List ::: Trigger.old '+ Trigger.old);// |Check After delete List ::: Trigger.old (Account:{Id=0015i00000KjaDaAAJ, IsDeleted=false, MasterRecordId=null, Name=SureshNew+
        }
        System.debug('After Undelete Record is:::');
        if(Trigger.isUndelete){
            System.debug('Check After undelete List ::: Trigger.new '+ Trigger.new); // Check After undelete List ::: Trigger.new (Account:{Id=0015i00000KjaDaAAJ, IsDeleted=false, MasterRecordId=null, Name=SureshNew
            System.debug('Check After undelete List ::: Trigger.old '+ Trigger.old); // Check After undelete List ::: Trigger.old null
        }
    }
}