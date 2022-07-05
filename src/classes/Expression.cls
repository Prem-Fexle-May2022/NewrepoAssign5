/**        
  *  Purpose         :    This class is Expression Operator and Type Casting
  *  Created By      :    Prem Chand
  *  Created Date    :    2022/06/28
  *  Revision Logs   :    V_1.0 - Created - 2022/06/28
 **/
public with sharing class Expression {

    /**  
      * Created By    :    Prem Chand
      * Purpose       :    This Method is how to use unary operator
      * Params        :    Void
      * Return        :    Void
     **/
    public void unary_Method(){

        //Unary Expression -
        Integer a = 10;
        Integer b = 5;
        Boolean d = true;
        Boolean e = false;
        System.debug('Unary Expression'); 
        System.debug(~a);           //(minus of total positive value which starts from 0)  
        System.debug(~b);           // (positive of total minus, positive starts from 0)  
        System.debug(!d);           // (opposite of boolean value)  
        System.debug(!e);           //(opposite of boolean value)
    }

     /**  
      * Created By    :    Prem Chand
      * Purpose       :    This Method is how to use Arithmetic Operations
      * Params        :    Void
      * Return        :    Void
     **/
    public void arithmetic_Method(){
        
        //Arithmetic Expression -
        Integer a = 10, b = 5;
        System.debug('Arithmetic Expression');
        System.debug(a+b);  
        System.debug(a-b); 
        System.debug(a*b); 
        System.debug(a/b); 
    }

     /**  
      * Created By    :    Prem Chand
      * Purpose       :    This Method is how to use Right shift or Left shift Operator
      * Params        :    Void
      * Return        :    Void
     **/
    public void right_Left_Shift_Method(){
        
        //Left Shift Expression -
        Integer a = 5, b = 2;
        System.debug('Left Shift Expression'); 
        System.debug(a<<b);   // for ex - 10*2^2=10*4=40   

        //Right Shift Expression -
        System.debug('Right Shift Expression');
        System.debug(a>>b);   //for ex - 10/2^2=10/4=2  
    }

     /**  
      * Created By    :    Prem Chand
      * Purpose       :    This Method is how to use AND or OR Operator
      * Params        :    Void
      * Return        :    Void
     **/
    public void and_Or_Method(){

        // AND Expression -
        Integer a = 15 , b = 20,c = 45;
        System.debug('AND Expression'); 
        System.debug(a<b&&a<c);
        System.debug(a<b&a<c);

        // OR Expressiono -
        System.debug('OR Expression'); 
        System.debug(a>b||a++<c);
        System.debug(a>b|a++<c);
    }

     /**  
      * Created By    :    Prem Chand
      * Purpose       :    This Method is how to use Ternary Operator
      * Params        :    Void
      * Return        :    Void
     **/
    public void ternary_Method(){

        //Ternary Expression
        Integer a = 20, b = 10;
        System.debug('Ternary Expression');
        Integer min=(a<b)?a:b;  
        System.debug(min); 
    }

     /**  
      * Created By    :    Prem Chand
      * Purpose       :    This Method is how to use Assignment Operator
      * Params        :    Void
      * Return        :    Void
     **/
    public void assignment_Method(){

        // Assigment Expreesion -
        Integer a = 100, b = 50, c = 20;
        System.debug('Assigment Expression');
        System.debug(a += b);
        System.debug(b -= c);
        System.debug(c *= a);
        System.debug(b /= a);
        System.debug(c *= a*b);
        System.debug(b += a-c );
    }

     /**  
      * Created By    :    Prem Chand
      * Purpose       :    This Method is how to use Relation Operator
      * Params        :    Void
      * Return        :    Void
     **/
    public void relation_Method(){

        //Relation Expreession -
        Integer a = 5,b = 50, c = 40;
        System.debug('Relation Expression'); 
        System.debug(a == b);
        System.debug(c != b);  
        System.debug(c > a);  
        System.debug(b < a);  
        System.debug(a >= c);  
        System.debug(b <= c);
    }

     /**  
      * Created By    :    Prem Chand
      * Purpose       :    This Method is how to use Role of Conversion Method
      * Params        :    Void
      * Return        :    Void
     **/
    public void role_Of_Conversion_Method(){

        //Role of Conversion -
        Integer a = 15, b = 25;
        System.debug('Role of Conversion'); 
        Double mywide1 = a; // Widening(Automatic) casting: integer to double
        Decimal mywide2 = b;
        
        System.debug(mywide1);
        System.debug(mywide2); 

        Double mynarrow1 = 9.78d;
        Integer mynarrow2 = (Integer) mynarrow1; // Narrowing(Manual) casting: double to integer
        Long mynarrow3 = (Long) mynarrow1;
        
        System.debug(mynarrow2);
        System.debug(mynarrow3);

        Decimal mywide3 = mynarrow2;
        
        System.debug(mywide3);
    }

    /**  
      * Created By    :    Prem Chand
      * Purpose       :    This Method using safeOperator.
      * Params        :    void
      * Return        :    Void
     **/
    public static void safeOperator(){                               // This Method is Static
        
        String a=NULL;
        String b='abc';
        System.debug(a==null? b:a);
        Account acc =new Account();
        acc.Name='test';
        insert acc;
        System.debug([SELECT ID , Name FROM Account where ID=:acc.ID]?.NAME);
    }
}