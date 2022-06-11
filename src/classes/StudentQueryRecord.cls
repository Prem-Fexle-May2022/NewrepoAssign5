public class StudentQueryRecord {
    public StudentQueryRecord(){
        //********   One Record Query    *****
        
     //  Student__c st = [SELECT id, Name, Father_Name__c, State__c from Student__c  limit 1]; // One Record Query..
     //  System.debug('My Record is::'+st);
       
       //***** Multiple Record Query   ********
       
        list<Student__c> list1 = new list<Student__c>();
        list1 = [SELECT Id, Name, Father_Name__c,State__c, City__c, Email_Id__c,X4th_sem_Percentage__c from Student__c limit5];
        System.debug('My Record is:: '+list1);
         System.debug('My Record Size:: '+list1.size());
       /* for(Student__c s : list1)
        {
            System.debug(s);
        }*/
        
    }

}