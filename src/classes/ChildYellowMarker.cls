/*
 *  Purpose          :    This class is Child Class
 *  Created By       :    Prem Chand
 *  Created Date     :    2022/06/28
 *  Revision Logs    :    V_1.0 - Created - 2022/06/28
 */
public with sharing class ChildYellowMarker extends SuperClass {

      /* 
     * Created By    :    Prem Chand
     * Purpose       :    This method is override
     * Params        :    Void
     * Return        :    Void
     */
    public override void marker_Name(){
        System.debug('Here is Yello Marker::');
    }
}