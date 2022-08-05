/**  Purpose         :   This Class is BankTriggerHelper
  *  Created By      :    Prem Chand
  *  Created Date    :    2022/07/24
  *  Revision Logs   :    V_1.0 - Created - 2022/07/24
 **/
public with sharing class BankTriggerHelper {

   /** 
    * Created By    :    Prem Chand
    * Purpose       :    This method is used to Open Account
    * Params        :    List<Bank__c>
    * Return        :    Void
    **/
    public static void openAccount(List<Bank__c> newBankList){
        for(Bank__c bankList : newBankList){
            if(bankList.Select_Bank__c == null || bankList.Account_Type__c == null){
                bankList.addError('Sorry! you can not Open Account in Bank, Please check mendotary requirement Field Thanku!!');
            }
            else if(bankList.Account_Type__c == 'Saving Account' && bankList.Minimum_Balance__c < 1000){
                bankList.addError('Minimum Balance should be greater than or equal to 1000');
            }
            else if(bankList.Account_Type__c == 'Current Account' && bankList.Minimum_Balance__c < 5000){
                bankList.addError('Minimum Balance should be greater than or equal to 5000');
            }
            else if(bankList.Account_Type__c == 'FD Account' && bankList.Minimum_Balance__c < 10000){
                bankList.addError('Minimum Balance should be greater than or equal to 10000');
            }
            else if(bankList.Minimum_Balance__c == null){
                bankList.addError('Minimum Balance can not be Null');
            }
        }
    }

   /**
    * Created By    :    Prem Chand
    * Purpose       :    This method is used to Create Random Account Number
    * Params        :    List<Bank__c>
    * Return        :    Void
    **/
    public static void createRandomAccountNumber(List<Bank__c> newListOfBank){
        for(Bank__c objBank : newListOfBank){
           if(objBank.Select_Bank__c != NULL && objBank.Account_Type__c != NULL){
               if(objBank.Account_Number__c == Null){
                   String accNumber = String.valueOf(Integer.valueof(Math.random()*1000000000)) + String.valueOf(Integer.valueof(Math.random()*10000000));
                        if(objBank.Account_Type__c =='Saving Account'){
                            objBank.Account_Number__c = 'SA-'+accNumber;
                    }
                   else if(objBank.Account_Type__c =='Current Account'){
                        objBank.Account_Number__c = 'CA-'+accNumber;
                    }
                   else{
                        objBank.Account_Number__c = 'FD-'+accNumber;
                    }
                }
            }
        }
    }

   /** 
    * Created By    :    Prem Chand
    * Purpose       :    This method is used to Exception Field Update
    * Params        :    List<Bank__c>, Trigger.oldMap
    * Return        :    Void
    **/
    public static void exceptionFieldUpdate(List<Bank__c> newListOfBank, Map<Id,Bank__c> oldMapOfBank){
        for(Bank__c objBank : newListOfBank){
            if(objBank.Name != oldMapOfBank.get(objBank.Id).Name){
                objBank.addError('Account holder Name Can not be Change....Sorry!!');
            }
            else if(objBank.Account_Number__c != oldMapOfBank.get(objBank.Id).Account_Number__c){
                objBank.addError('Account Number Can Not be Change.... Sorry!!');
            }
            else if(objBank.Account_Type__c != oldMapOfBank.get(objBank.Id).Account_Type__c){
                objBank.addError('Account Type Can Not be Change.....Sorry!!');
            }
            else if(objBank.Select_Bank__c != oldMapOfBank.get(objBank.Id).Select_Bank__c){
                 objBank.addError('Bank Can not be change.....Sorry!!');
            }
        }
    }

   /** 
    * Created By    :    Prem Chand
    * Purpose       :    This method is used to sendEmailNotification
    * Params        :    List<Bank__c>
    * Return        :    Void
    **/
    public static void createBankAccountEmailNotification(List<Bank__c> newListOfBank){
        List<Messaging.Email> emailList = new List<Messaging.Email>();
        for(Bank__c bank : newListOfBank){
            if(bank.Email__c != null){
                Messaging.SingleEmailMessage emailMsg = new Messaging.SingleEmailMessage();
                String[] toAddress = new String[]{bank.Email__c};
                emailMsg.setToAddresses(toAddress);
                String emailSub = 'Welcome'+bank.Name;
                emailMsg.setSubject(emailSub);
                String disName = 'Prem Chand';
                emailMsg.setSenderDisplayName(disName);
                String content = bank.Name +',<br/><br/>'+bank.Account_Type__c+' Created <br/><br/>'+
                'Thank You! <br/><br/>';
                emailMsg.setHtmlBody(content);
                emailList.add(emailMsg);
            }
        }
        Messaging.sendEmail(emailList);
    }

   /** 
    * Created By    :    Prem Chand
    * Purpose       :    This method is used to Phone Number Update send Email Notification
    * Params        :    List<Bank__c>, Map<Id,Bank__c> mapOfBank
    * Return        :    Void
    **/
    public static void phoneNoUpdateEmailNotification(List<Bank__c> newListOfBank, Map<Id,Bank__c> oldMapOfBank){
        for(Bank__c objBank : newListOfBank){
            System.debug(objBank.Phone_Number__c != oldMapOfBank.get(objBank.Id).Phone_Number__c && objBank.Phone_Number__c != NULL);
            if(objBank.Phone_Number__c != oldMapOfBank.get(objBank.Id).Phone_Number__c && objBank.Phone_Number__c != NULL){
                Messaging.SingleEmailMessage emailMessage = new Messaging.SingleEmailMessage();
                String[] toAddress = new String[]{objBank.Email__c};
                emailMessage.setToAddresses(toAddress);
                emailMessage.setSubject('Welcome '+objBank.Name);
                emailMessage.setSenderDisplayName(objBank.Select_Bank__c);
                emailMessage.setPlainTextBody('Your Phone Number '+objBank.Phone_Number__c +' is Successfully Update....Thanku!!');
                Messaging.sendEmail(new Messaging.SingleEmailMessage[] { emailMessage });
            }
        }
    }
}