public with sharing class StaticPractice3 {
  private Integer a = 10;
  private Static String name ='Prem Chand';

  public static  void staic_M1(){                    // create static method

    StaticPractice1.static_Method();                 // static method to calling other class static method call

    StaticPractice1 obj = new StaticPractice1 ();           // static method to calling other class non static method  
    obj.non_StaticMethod1();   
  }

  public void nonStaic_M1(){

    StaticPractice1.static_Method();                // nonstatic method to calling other class static method call

    StaticPractice1 obj = new StaticPractice1 ();           //static method to calling other class non static method  
    obj.non_StaticMethod1();                                // without create object not calling non static method
  }
}
