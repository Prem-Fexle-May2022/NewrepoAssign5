/*
 *  Purpose          :    This class is Super Class
 *  Created By       :    Prem Chand
 *  Created Date     :    2022/06/28
 *  Revision Logs    :    V_1.0 - Created - 2022/06/28
 */
public virtual with sharing class SuperClass {
   
    /* 
     * Created By    :    Prem Chand
     * Purpose       :    This method is override
     * Params        :    Void
     * Return        :    Void
     */
    public virtual void marker_Name(){
        System.debug('Here is Super Marker::');
    }

    /* 
     * Created By    :    Prem Chand
     * Purpose       :    This method is override
     * Params        :    Void
     * Return        :    Void
     */
    public double discount(){
        return  0.5;
    }
}