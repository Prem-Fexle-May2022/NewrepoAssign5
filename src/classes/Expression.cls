/**
* Description   - Expression Opartor and Type Casting
*
* Created by    - Prem Chand
*
* Created Date  - 28/06/2022
*
* Revision log  -  V_1.0 - Created  - Youe name - Date
*                  V_1.1 - Modified - Youe Name - Date - Details what you modified
*
**/
public with sharing class Expression {
  /**   Description :   Expression Constuctor  Using to calculate all Operator
    *
    *     Created By  :   Prem Chand
    *
    *     Arguments   :   Integer,boolean
    *
    *     Return      :   void
    *
    *     Revision log:   V_1.0 - Created  - Youe name - Date
    *                     V_1.1 - Modified - Youe Name - Date - Details what you modified
    * 
    **/
    public Expression(integer a, integer b, integer c, boolean d, boolean e) {

        //Unary Expression -
        System.debug('Unary Expression'); 
        System.debug(~a);           //(minus of total positive value which starts from 0)  
        System.debug(~b);           // (positive of total minus, positive starts from 0)  
        System.debug(!d);           // (opposite of boolean value)  
        System.debug(!e);           //(opposite of boolean value)
        
        //Arithmetic Expression -
        System.debug('Arithmetic Expression');
        System.debug(a+b);  
        System.debug(a-b); 
        System.debug(a*b); 
        System.debug(a/b); 
        
        //Left Shift Expression -
        System.debug('Left Shift Expression'); 
        System.debug(a<<b);   // for ex - 10*2^2=10*4=40   

        //Right Shift Expression -
        System.debug('Right Shift Expression');
        System.debug(a>>b);   //for ex - 10/2^2=10/4=2  

        // AND Expression -
        System.debug('AND Expression'); 
        System.debug(a<b&&a<c);
        System.debug(a<b&a<c);

        // OR Expressiono -
        System.debug('OR Expression'); 
        System.debug(a>b||a++<c);
        System.debug(a>b|a++<c);

        //Ternary Expression
        System.debug('Ternary Expression');
        Integer min=(a<b)?a:b;  
        System.debug(min); 

        // Assigment Expreesion -
        System.debug('Assigment Expression');
        System.debug(a += b);
        System.debug(b -= c);
        System.debug(c *= a);
        System.debug(b /= a);
        System.debug(c *= a*b);
        System.debug(b += a-c );

        //Relation Expreession -
        System.debug('Relation Expression'); 
        System.debug(a == b);
        System.debug(c != b);  
        System.debug(c > a);  
        System.debug(b < a);  
        System.debug(a >= c);  
        System.debug(b <= c);

        //Role of Conversion -
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
        
    //Safe Navigation
    public static void safeOperator(){
        String a=NULL;
        String b='abc';
        System.debug(a==null? b:a);
        Account acc =new Account();
        acc.Name='test';
        insert acc;
        System.debug([SELECT ID , Name FROM Account where ID=:acc.ID]?.NAME);
    }
}