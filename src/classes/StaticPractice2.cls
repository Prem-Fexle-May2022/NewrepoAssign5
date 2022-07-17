/**  Purpose         :    This class is Static Practice
  *  Created By      :    Prem Chand
  *  Created Date    :    2022/07/01
  *  Revision Logs   :    V_1.0 - Created - 2022/07/01
  **/
public with sharing class StaticPractice2 {
   
   private String name, firstName, lastName;                       // Create non static variable
   private Static Integer a;                                // create static variable

   /** 
    * Created By    :    Prem Chand
    * Purpose       :    This method is non parameterized Constructor
    * Params        :    void
    * Return        :    Void
    **/
   private StaticPractice2(){                             // Create a private constructor

        firstName = 'Ajay';
        lastName = 'Singh';
   }
   static                                              // Create a static block
   {
         a=10;
   }

   /** 
    * Created By    :    Prem Chand
    * Purpose       :    This method is Show Name
    * Params        :    void
    * Return        :    Void
    **/
   public void show_Name(){                          // non static method

      System.debug('My Name is::'+name);             // Direct can not be call this Method beacuse constructor is private
   }

   /** 
    * Created By    :    Prem Chand
    * Purpose       :    This method is Static method 
    * Params        :    void
    * Return        :    Void
    **/
   public static void s1(){

       System.debug('Value of a is::'+a);               // output is--> 10
   }

   /** 
    * Created By    :    Prem Chand
    * Purpose       :    This method is Static method 
    * Params        :    void
    * Return        :    Void
    **/
   public static StaticPractice2 s2(){             // Create static method and return type is  StaticPractice2

        return new StaticPractice2();               // create a object and return

        // Calling method

        /*
           StaticPractice2 obj = StaticPractice2.s2();
            obj.show_Name();
         */
   }
}