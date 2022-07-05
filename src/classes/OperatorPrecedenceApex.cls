/**    Purpose         :    This class is OperatorPrecedenceApex
  *    Created By      :    Prem Chand
  *    Created Date    :    2022/06/28
  *    Revision Logs   :    V_1.0 - Created - 2022/06/28
  **/
public with sharing class OperatorPrecedenceApex {

    /**  
      *    Created By    :    Prem Chand
      *    Purpose       :    This method is show operator precedence result
      *    Params        :    void
      *    Return        :    Void
     **/
    public static void show_Result(){

        Integer i;
        i = 3 + 5*(4+3)-1;
        System.debug(i); //37

        i = 4 + 3*6;
        System.debug(i);//22

        i = (3+5)*6 ;
        System.debug(i);//48

        i  = 3*4/2*6 ;
        System.debug(i);//36

        Integer a = 10, b = 5, c = 1, d;
        d = a-++c-++b; 
        System.debug(d); //2
        System.debug(1 + 2 + 'abc');             //   3abc
        System.debug('abc' + 1 + 2);            //    abc12

        Integer x = 5;
        Integer y = 10;
        Integer z = ++x * y--;
        System.debug(z);                         //    60
    }
}