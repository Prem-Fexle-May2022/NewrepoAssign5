/**  Purpose         :    This class is Static Practice
  *  Created By      :    Prem Chand
  *  Created Date    :    2022/07/01
  *  Revision Logs   :    V_1.0 - Created - 2022/07/01
  **/
public with sharing class StaticPractice1 {

    public Integer i;                                     // Create a non static variable
    public static Integer s=100;                              // Create a Static Variable
    static                                                 // Static block
    {
      s=100;
    }

    {                                                      // Initializer block
    i=10;
    }

    /** 
     * Created By    :    Prem Chand
     * Purpose       :    This method is Non Static method
     * Params        :    void
     * Return        :    Void
     **/
    public void non_StaticMethod(){                  // Create a non Static method

        System.debug('i am Non Static Method and Access Static variable');      // Non Static method Access Static and non Static variables

        System.debug('Sum is::'+(s+i));              // output---> 110
    }

    /** 
     * Created By    :    Prem Chand
     * Purpose       :    This method is Static method
     * Params        :    void
     * Return        :    Void
     **/
    public static void static_Method(){                     // Create a static method

        System.debug('i am Static Method and Access non static variable');

      //  System.debug('Multiply is::'+(s*i));     Error Because Static method can not be access non static variable
         
      StaticPractice1 obj = new StaticPractice1();   // First create a object then Access non static variable..

     // System.debug('Multiply is::'+(s*i));          // Again Error....Here non static variable can not be access Direct( Complie time Error)

     // Access method is static method to non static variable is ( (object.variable name))

     System.debug('Multiply is::'+(s*obj.i));        // No error    output is----> 1000
    }

   /** 
    * Created By    :    Prem Chand
    * Purpose       :    This method is Non Static method 
    * Params        :    void
    * Return        :    Void
    **/
    public void non_StaticMethod1(){
     
        System.debug('i am non Static Method1 and call from Static method');
        Static_Method();                                   // call for static method (No Error) we can Access static method from non static method
    }

    /** 
     * Created By    :    Prem Chand
     * Purpose       :    This method is Static method
     * Params        :    void
     * Return        :    Void
     **/
    public static void static_Method1(){
     
        System.debug('i am  Static_Method1 and call from non Static method');

        // non_StaticMethod1();    Compile time Error (we can not be directlly call static method to non static method)
        
        // first create a object

        StaticPractice1 obj = new StaticPractice1();      // Create a object

         // Accesss method static method to non static method   (object.Method Name)
         
       obj.non_StaticMethod();                         // No error its work   
                                                     
       obj.non_StaticMethod1();
    }
}