/**
 *  Purpose         :    This class is used to Exception Handling
 *  Created By      :    Prem Chand
 *  Created Date    :    2022/07/16
 *  Revision Logs   :    V_1.0 - Created - 2022/07/16
 **/
public with sharing class ExceptionHandling {

    /**
     * Created By    :    Prem Chand
     * Purpose       :    This method is basic_ExceptionMethod
     * Params        :    Integer
     * Return        :    Void
     **/
    public static void  basic_ExceptionMethod(Integer i){
        try{
            if(i==0){
                Integer a;
                Integer b = a*5;      // Throws Null PointerException
            }
            else{
                Account acc = new Account();
                insert acc;       // Throws DMLException
            }
        }
        catch(NullPointerException npe){
            System.debug('I execute when there is NullPointerException occur is the try block');
        }
        catch(DMLException d){
            System.debug('I execute when there is DMLException occur in the try block');
        }
        catch(Exception e){
            System.debug('I execute when there is any other exception except DMLException occurs in the try block');
        }
        finally{
            System.debug('No Matter whether an exception in the try block occured or not I always Excecute');
        }
    }

    /**
     * Created By    :    Prem Chand
     * Purpose       :    This method is DML Exception
     * Params        :    void
     * Return        :    Void
    **/
    public static void dmlException_Method(){
        /*********************** System Exception ************************************/   
        //  ******** 1.) DML Exception
        try{
            Account a = new Account();
            insert a;
        } 
        catch(DMLException de){
            System.debug('Record can not be inserted '+ de.getMessage()); // output--> Record can not be inserted Insert failed. First exception on row 0; first error: REQUIRED_FIELD_MISSING, Required fields are missing: [Name]: [Name]
        }   
    }

    /**
     * Created By    :    Prem Chand
     * Purpose       :    This method is ListException Method
     * Params        :    void
     * Return        :    Void
    **/
    public static void listException_Method(){
        try{
            List<String> stList = new List<String>{'Kumar Satyam','Prem','Vishal','Shailendra'};
            System.debug(stList.get(0));     // 'Kumar Satyam'
            System.debug(stList.get(1));     // 'Prem'
            System.debug(stList.get(2));     // 'Vishal'
            System.debug(stList.get(3));     // 'Shailendra'
            System.debug(stList.get(4));     // Will throw a ListException as there is no element on index 4
        }
        catch(ListException le){
            System.debug('There is no value on Index: '+le.getMessage());  // output--> There is no value on Index: List index out of bounds: 4
        }
    }

    /**
     * Created By    :    Prem Chand
     * Purpose       :    This method is NullPointerException
     * Params        :    void
     * Return        :    Void
    **/
    public static void nullPointerException_Method(){
        try{
            Account acc;
            acc.Name = 'Sunil';       // Throw nullPointerException as acc does not refer to any object

            List<Integer> listInteger;
            listInteger.add(100);      // Thro nullPointerException as listInteger does not refer to any object
        }
        catch(NullpointerException npe){
            System.debug('There is no object in the refernce variable: '+ npe.getMessage());  // output--> There is no object in the refernce variable: Attempt to de-reference a null object
        }
    }

    /**
     * Created By    :    Prem Chand
     * Purpose       :    This method is QueryException Method
     * Params        :    void
     * Return        :    Void
    **/
    public static void queryException_Method(){
        try{
            Account a = [SELECT Name FROM Account WHERE Name = 'Prem'];     // This Query will return more than one and will throw a QueryException
            
            Account b = [SELECT Name FROM Account WHERE Name = 'Any Company'];   // This will return no Record and will throw a QueryException
        }
        catch(QueryException qe){
            System.debug('There is a Problem With this a Query:: '+ qe.getMessage());  // output--> There is a Problem With this a Query:: List has no rows for assignment to SObject
        }
    }

    /**
     * Created By    :    Prem Chand
     * Purpose       :    This method is sObjectException 
     * Params        :    void
     * Return        :    Void
    **/
    public static void sObjectException_Method(){
        try{
            List<Account> accList = [SELECT Name FROM Account];
            for(Account acc : accList)
            {
                System.debug(acc.NumberOfEmployees);    // You are trying to access the field Which is not Query NumberofEmployees field
                                                      // Hence will throw an sObjectException
            }
        }
        catch(sObjectException soe){
            System.debug('There is a Problem with this a Query:: '+ soe.getMessage()); // output--> There is a Problem with this a Query:: SObject row was retrieved via SOQL without querying the requested field: Account.NumberOfEmployees  
        }  
    }
}