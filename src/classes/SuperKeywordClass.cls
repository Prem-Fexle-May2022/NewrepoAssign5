/**  Purpose         :   This Class is Paren Class SuperKeywordClass
  *  Created By      :    Prem Chand
  *  Created Date    :    2022/07/06
  *  Revision Logs   :    V_1.0 - Created - 2022/07/06
  **/
public virtual class SuperKeywordClass {

    public String mySalutation;
    public String myFirstName;
    public String myLastName;

  /** 
    * Created By    :    Prem Chand
    * Purpose       :    This method is non parameterized Constructor
    * Params        :    void
    * Return        :    void
    **/
    public SuperKeywordClass() {

        mySalutation = 'Mr.';
        myFirstName = 'Prem';
        myLastName = 'Chand';
    }

  /** 
    * Created By    :    Prem Chand
    * Purpose       :    This method is parameterized Constructor
    * Params        :    String, String, String 
    * Return        :    void
    **/
    public SuperKeywordClass(String salutation, String firstName, String lastName ) {

        mySalutation = salutation;
        myFirstName = firstName;
        myLastName = lastName;
        System.debug('My name is:: '+mySalutation+ myFirstName+' '+myLastName); // |My name is:: Mr.Kumar Satyam
    }

  /** 
    * Created By    :    Prem Chand
    * Purpose       :    This method is printName
    * Params        :    void
    * Return        :    void
    **/
    public virtual void printName(){

        System.debug('My name is:: '+mySalutation + myLastName);  // My name is:: Mr.Chand
    }

  /** 
    * Created By    :    Prem Chand
    * Purpose       :    This method is printName
    * Params        :    void
    * Return        :    String
    **/
    public virtual String getFirstName(){

        return myFirstName;
    }
}