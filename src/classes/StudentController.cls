public class StudentController {
    public static void insert_Method()
    {
        //***** Registrar Record Type *******
        //***** Student Personal Info *********
       
        Student__c st = new Student__c();
        st.recordTypeId = '0125i000000PkGKAA0';    // Registrar Record Type id..
        st.Name = 'Om Prakash';
        st.Roll_Number__c = 11;
        st.Student_Mobile_Number__c = '7777774444';
        st.Email_Id__c = 'Om@om.com';
        st.Father_Name__c = 'Jaisa Ram';
        st.Father_Mobile_Number__c = '9414555555';
        st.Home_Phone__c = '01586202136';
        st.Address__c = 'Village- Kuni, Teh- Nawa City, Dist- Nagaur';
        st.Grade__c = 'A';
        
        //******* Class Informations ******
        
        st.Stream__c = 'Computer Science.';
        st.Section__c = 'A';
        st.Class__c = '1st Year.';
        
        //****** Fees Details *******
        
        st.Current_Year__c = Date.Today();         // st.Current_Year__c = Date.Today();  ToDAY Date Assign.....
        st.Pending_Fees_Amount__c = 0;
        st.Pending_Exam_Fees__c = 0;
        st.Is_Donation__c = true;
        st.Donation_Amount__c = 5000;
        st.Fees_Submitted__c = true;
        st.Exam_Fees_Submitted__c = true;
        
        //*******Bank Details**********
        
        st.Bank_Name__c = 'Bank Of Baroda';
       // st.Account_Number__c = Decimal.valueOf('3081457884578');      // st.Account_Number__c = '30814544444'; It's Error
        st.IFSC_Code__c = 'bib000514';                                // st.Account_Number__c = Integer.valueOf('30814544222'); Run Time Error.
        st.Bank_Phone_Number__c = '+9114145786245';
        st.State__c = 'Rajasthan';
        st.City__c = 'Rajkot';
        st.Account_Number__c = 30814544444.0;
        insert st;
        System.debug('My Record is:: '+st.id);
    }
    
}