/**  Purpose         :   This Class is Child Class Subclass
  *  Created By      :    Prem Chand
  *  Created Date    :    2022/07/06
  *  Revision Logs   :    V_1.0 - Created - 2022/07/06
  **/
public class Subclass extends SuperKeywordClass {

  /** 
    * Created By    :    Prem Chand
    * Purpose       :    This method is override printName
    * Params        :    void
    * Return        :    void
    **/
    public override void printName(){

        super.printName();                                               // Chid Class  to call Parent Class Method Then using Super Keyword.(super.methodName)

        System.debug('But you can call me:: '+ super.getFirstName());   // Chid Class  to call Parent Class Method Then using Super Keyword.   output---> But you can call me:: Prem
    } 

    /** 
    * Created By    :    Prem Chand
    * Purpose       :    This method is non parameterized Constructor
    * Params        :    void
    * Return        :    void
    **/
    public Subclass(){

        super('Mr.','Kumar','Satyam');      // Child constructor to Parent Class Constructor Call using super keyword
    }
}