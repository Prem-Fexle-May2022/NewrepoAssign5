/**  Purpose         :   This Class is the provide Customer Discount.
  *  Created By      :    Prem Chand
  *  Created Date    :    2022/07/06
  *  Revision Logs   :    V_1.0 - Created - 2022/07/06
  **/
public with sharing class CustomerPurchaseOrder implements PurchaseOrder {

  /** 
    * Created By    :    Prem Chand
    * Purpose       :    This method is Provide Customer Discount.
    * Params        :    void
    * Return        :    Double
    **/
    public Double discount(){
        System.debug('This provide discount to customer::');
        return .05;
    }
}