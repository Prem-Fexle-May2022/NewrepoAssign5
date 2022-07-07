/**  Purpose         :   This Class is the Process of Purchase Order
  *  Created By      :    Prem Chand
  *  Created Date    :    2022/07/06
  *  Revision Logs   :    V_1.0 - Created - 2022/07/06
  **/
public with sharing class ProcessPurchaseOrder {

  /** 
    * Created By    :    Prem Chand
    * Purpose       :    This method is non parameterized Constructor
    * Params        :    void
    * Return        :    Double
    **/
    public ProcessPurchaseOrder(){
        PurchaseOrder order1 = new CustomerPurchaseOrder();
        PurchaseOrder order2 = new EmployeePurchaseOrder();

        // Customer Order
        processOrder(order1);

        // Employee Order
        processOrder(order2);
    }

  /** 
    * Created By    :    Prem Chand
    * Purpose       :    This method is processOrder
    * Params        :    PurchaseOrder
    * Return        :    void
    **/
    public void processOrder(PurchaseOrder order){
        System.debug('Check Discount::: '+order.discount());
    }
}