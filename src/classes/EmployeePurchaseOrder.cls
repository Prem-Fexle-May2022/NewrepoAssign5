/**  Purpose         :   This Class is the provide Employee Discount.
  *  Created By      :    Prem Chand
  *  Created Date    :    2022/07/06
  *  Revision Logs   :    V_1.0 - Created - 2022/07/06
  **/
public with sharing class EmployeePurchaseOrder implements PurchaseOrder {

    /** 
    * Created By    :    Prem Chand
    * Purpose       :    This method is Provide Employee Discount.
    * Params        :    void
    * Return        :    Double
    **/
    public Double Discount(){
        System.debug('This provide discount to Employee::');
        return .10;
    }
}