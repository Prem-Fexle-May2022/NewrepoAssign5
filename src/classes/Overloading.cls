/**    Purpose         :    This class is Method Overloading
  *    Created By      :    Prem Chand
  *    Created Date    :    2022/06/28
  *    Revision Logs   :    V_1.0 - Created - 2022/06/28
  **/
public with sharing class Overloading {
   
    /**  
     *    Created By    :    Prem Chand
     *    Purpose       :    This method is Overloading
     *    Params        :    Integer
     *    Return        :    Void
     **/
    public static void sum(Integer firstNum,Integer secondNum){              // firstNum = 10, secondNum = 20

         Integer s = firstNum+secondNum;        
         System.debug(s);  // 30
    }
      
    /** 
     *    Created By    :    Prem Chand
     *    Purpose       :    This method is Overloading
     *    Params        :    Integer
     *    Return        :    Void
     **/
    public static void sum(Integer firstNum,Integer secondNum,Integer thridNum){  // firstNum = 10, secondNum = 20 , thridNum = 30
      
         Integer s = firstNum+secondNum+thridNum;        
         System.debug(s);    // 60
    }
}