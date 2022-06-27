/*
 *  Purpose          :    This class is used to verify code coverage
 *  Created By       :    Prem hand
 *  Created Date     :    2022/06/25
 *  Revision Logs    :    V_1.0 - Created - 2022/06/25
 */
@isTest 
private class HelloWorldTestClass {
    
   /*
    * Created By    :    Prem Chand
    * Purpose       :    This method is used for checking the changes in books price.
    * Params        :    Void
    * Return        :    Void
    */
    static testMethod void validateHelloWorld() {
       Book__c b = new Book__c(Name='Behind the Cloud', Price__c=100);
       System.debug('Price before inserting new book: ' + b.Price__c);

       // Insert book
       insert b;
    
       // Retrieve the new book
       b = [SELECT Price__c FROM Book__c WHERE Id =:b.Id];
       System.debug('Price after trigger fired: ' + b.Price__c);

       // Test that the trigger correctly updated the price
       System.assertEquals(90, b.Price__c);
    }
}