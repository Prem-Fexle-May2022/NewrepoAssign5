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
    public static void sum(Integer firstNum,Integer secondNum){

         Integer s = firstNum+secondNum;        
         System.debug(s);
    }
      
    /** 
     *    Created By    :    Prem Chand
     *    Purpose       :    This method is Overloading
     *    Params        :    Integer
     *    Return        :    Void
     **/
    public static void sum(Integer firstNum,Integer secondNum,Integer thridNum){
      
         Integer s = firstNum+secondNum+thridNum;        
         System.debug(s);
    }
}