/*
 *  Purpose          :    This class shows how a primitive argument of type Integer is passed by value into another method.
 *  Created By       :    Prem Chand
 *  Created Date     :    2022/06/28
 *  Revision Logs    :    V_1.0 - Created - 2022/06/28
 */

public with sharing class CallByValue {
    /*
    * Created By    :    Prem Chand
    * Purpose       :    This method is used to pass the integer value to another method
    * Params        :    Void
    * Return        :    Void
    */
    public static void passByValue() {
        Integer a = 100, b = 45;
        Integer result = maxNum(a,b);                          // Passing actual value
        System.debug('Maximum value is:: '+result);
        
    }

   /*
    * Created By    :    Prem Chand
    * Purpose       :    This method is used to return the result to the previous method. 
    * Params        :    Integer
    * Return        :    Integer 
    */
     public static integer maxNum(Integer a,Integer b){
        if(a>b){return a;}
        else{ return b;}
    }
}