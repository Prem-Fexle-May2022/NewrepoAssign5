/**  Purpose         :    This class is ControlFlowStatement
  *  Created By      :    Prem Chand
  *  Created Date    :    2022/07/28
  *  Revision Logs   :    V_1.0 - Created - 2022/07/28
  **/
public with sharing class ControlFlowStatement {

   /** 
    * Created By    :    Prem Chand
    * Purpose       :    This method is how use Conditional Statements(if,if else,else if)
    * Params        :    Void
    * Return        :    Void
    **/
    Public static void conditional_Statement(){

        Integer a = 100;
        Integer b = 250;
        Boolean result;
        result = a>b;
        if(result)
            System.debug(a+' is Greatest Number');         
        else
            System.debug(b+' is Greatest Number');                      // output---> 250 is Greatest Number

        // Find the Largest Number Among Three Numbers

        Integer p = 25, q = 15, r = 50;
        if(p>q){

            if(p>r)
                System.debug(p+' is Large Number');
            else
                System.debug(r+' is Large Number');                            // 50 is Large Number
        }
        else if(q>r){
            System.debug(q+' is Large Number');
        }
        else
            System.debug(r+' is Large Number');
    }
   
    /** 
     * Created By    :    Prem Chand
     * Purpose       :    This method is how use to if else conditional Statements
     * Params        :    Integer
     * Return        :    Double
     **/
    public static Double electricitybill(Integer units)     //  Integer units = 100
    {     
        // variable to calculate electricity bill to pay  

        double billToPay = 0;  

        // check whether units are less than 100  
        
        if(units < 100){  
            billToPay = units * 1.20;  
        }else if(units < 300){           // check whether the units are less than 300 
            billToPay = 100 * 1.20 + (units - 100) * 2;  
        }else if(units > 300){     // check whether the units are greater than 300    
            billToPay = 100 * 1.20 + 200 * 2 + (units - 300) * 3;  
        }  
        System.debug('The electricity bill for ' +units+ ' is : ' + billToPay);      // The electricity bill for 100 is : 120.0
        return billtopay; 
    }

    /** 
     * Created By    :    Prem Chand
     * Purpose       :    This method is how use to While Loop
     * Params        :    Integer
     * Return        :    Void
     **/
    public static void factorial_Method(Integer value){   // value = 5
        Integer i= value, fact = 1;
        while(i>=1){
           fact *= i;
           i--;
       }
       System.debug('Factorial of '+value+' is '+fact);    // Factorial of 5 is 120
   } 

    /** 
     * Created By    :    Prem Chand
     * Purpose       :    This method is how use to do While Loop
     * Params        :    void
     * Return        :    Void
     **/
    public static void do_WhileMethod(){

        List<Account> accountList = [SELECT Id,Name FROM Account LIMIT 5]; 
        integer j = 0;
        do {
                 accountList[j].Name = 'This is the '+j;
                 system.debug('Updated Description'+accountList[j].Name);                  // Updated DescriptionThis is the 0
                   j++;                                                                     // Increment the counter
            } while (j< 1);                                                          // iterate till 1st record only
}
    /** 
     * Created By    :    Prem Chand
     * Purpose       :    This method is how use to if else and switch
     * Params        :    Integer
     * Return        :    Void
     **/
    public static void account_sObject_Mehtod(){
        sobject assi;
        if (assi instanceof Account) {
            Account a = (Account) assi;
            System.debug('account ' + a);
        } else if (assi instanceof Contact) {
            Contact c = (Contact) assi;
            System.debug('contact ' + c);
        } else {
            System.debug('default');                             // default
        }
        
        //replace the code with switch statement

        switch on assi {
            when Account a {
                System.debug('account ' + a);
            }
            when Contact c {
                System.debug('contact ' + c);
            }
            when null {
                System.debug('null');                            // null
            }
            when else {
                System.debug('default');
            }
        }
    }

    /** 
     * Created By    :    Prem Chand
     * Purpose       :    This method is how use Inhence for Loop
     * Params        :    void
     * Return        :    Void
     **/
    public static void methodforEach(){
        List<Account> accList = [SELECT Id,Name From Account LIMIT 20];
        for(Account acc : accList){
            System.debug('##'+acc);
        }

        Map<Id,Contact> contactMap = new Map<Id,Contact>([SELECT Id,Name FROM Contact LIMIT 20]);
        for(Contact con : contactMap.values()){
            System.debug('===>>>'+con);
        }
        for(Id idd : contactMap.keySet()){
            System.debug('####'+idd);
        }

        Set<String> strSet = new Set<String>();
        strSet.add('One');
        strSet.add('Two');
        strSet.add('Three');
        strSet.add('Four');
        strSet.add('Five');
        strSet.add('Six');
        strSet.add('Seven');
        strSet.add('Eight');
        strSet.add('Nine');
        strSet.add('Ten');

        for(String st : strSet){
            System.debug('!!!'+st);
        }
    }
}