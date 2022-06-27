/*
 *  Purpose          :    This class is used to apply discount on books
 *  Created By       :    Prem Chand
 *  Created Date     :    2022/06/25
 *  Revision Logs    :    V_1.0 - Created - 2022/06/25
 */

public class MyHelloWorld {

 /*
    * Created By    :    Prem Chand
    * Purpose       :    This method is used for updating the book price by applying discount
    * Params        :    Book__c[] books
    * Return        :    Void
    */
   public static void applyDiscount(Book__c[] books) {
      for (Book__c b :books){
         b.Price__c *= 0.9;
      }
   }
}