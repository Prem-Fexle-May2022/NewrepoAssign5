public class StudentController1 {                                            //****  Teacher RecordType  *******


    public static void set_Record()                                         // Create Static Method....
    { 
         List<Student__c> list1 = new List<Student__c>();                  // Create a Student List...
        
        //******** Student Personal Info. ***********
        
        Student__c std = new Student__c();
        std.RecordTypeId = '0125i000000PkGFAA0';                           // Registrat Record Type Id....
        std.Name = 'Sunil Choudhary';
        std.Roll_Number__c = 10121;
        std.Student_Mobile_Number__c = '+916666445522';
        std.Email_Id__c = 'sunil@s.com';
        std.Address__c = 'Chirawa, Dist-Jhunjhunu, Rajasthan(India)';
        std.Father_Name__c = 'Manni Ram Dangi';
        std.Father_Mobile_Number__c = '+917777441100';
        std.Home_Phone__c = '01577215454';
        std.Grade__c = 'A';
        
        //******** Class Info. ********
        
        
        std.Stream__c = 'Computer Science.';
        std.Section__c = 'B';
        std.Class__c = '4th Year.';
        
        //******* Fees Details ********
        
        std.Current_Year__c = date.parse('11/06/2022');
        std.Fees_Submitted__c = True;
        std.Exam_Fees_Submitted__c = false;
        std.Pending_Exam_Fees__c =525;
        std.Pending_Fees_Amount__c =20000;
        
        //******* Semester Details ********
        
        std.X1st_sem_Percentage__c = 82.62;
        std.X1st_Sem_Back__c = false;
        std.X2nd_Sem_Percentage__c =85.53;
        std.X3rd_Sem_Back__c = true;
        std.X3rd_Sem_Subject_in_which_back__c = 'Subject Code- 0005;Subject Code- 0006';
        std.X4th_sem_Percentage__c = 68.59;
        std.X4th_Sem_Back__c = true;
        std.X4th_Sem_Subject_in_which_back__c = 'Subject Code- 0009;Subject Code- 0011';
        list1.add(std);
        insert list1;
        System.debug('My record is:: '+std.id);
    }
        
}