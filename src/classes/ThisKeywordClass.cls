/**  Purpose         :   This Class is ThisKeyword Class
  *  Created By      :    Prem Chand
  *  Created Date    :    2022/07/06
  *  Revision Logs   :    V_1.0 - Created - 2022/07/06
  **/
public class ThisKeywordClass {

    private Integer a, b;
   
    public ThisKeywordClass(){
        this(100,200);                                       // using this keyword call Parameterized Constructor
        System.debug('Call Deafult Constructor');                 // third output---> Call Deafult Constructor
    }
    
    public ThisKeywordClass(Integer a,Integer b){

        this.a = a;                                          // using this keyword access Instance member variable a
        this.b = b;                                         //  using this keyword access Instance member variable b
        System.debug('Call Parameterized Constructor');          // first output---> Call Parameterized Constructor
        sum();                                              // Call sum() method
    }

    
  /** 
    * Created By    :    Prem Chand
    * Purpose       :    This method is sum
    * Params        :    void
    * Return        :    void
    **/
     public void sum(){

        System.debug('Sum is::'+(a+b));                     // Second output--->  |Sum is::300
    }
}