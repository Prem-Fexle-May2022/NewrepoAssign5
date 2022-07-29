/**
 *  Purpose         :    This class is used to Relationship Query
 *  Created By      :    Prem Chand
 *  Created Date    :    2022/07/20
 *  Revision Logs   :    V_1.0 - Created - 2022/07/20
**/
public with sharing class RelationshipSoqlClass {

    /************************************* COUSTOM OBJECT ****************************************/
    /**
     * Created By    :    Prem Chand
     * Purpose       :    This Method is use to show how to make a Query from Child to Parent
     * Params        :    void
     * Return        :    Void
    **/
    public static void childToParentQuery(){             // Parent Object--> Bank,  Child Object--> Branch
        List<Branch__c> branchList = [SELECT Id, Name,IFSC_Code_No__c,Bank__r.Name FROM Branch__c];
        for(Branch__c detailsOfBranch : branchList){
            System.debug(detailsOfBranch);   // output--> (Branch__c:{Id=a0K5i000000QSnJEAW, Name=Mansarovar, IFSC_Code_No__c=Pnb001542, Bank__c=a0J5i000000Qn1TEAS}, Branch__c:{Id=a0K5i000000QSnIEAW, Name=Vaishli Nagar, IFSC_Code_No__c=SBIN0000712, Bank__c=a0J5i000000Qn1OEAS})
                                            // output--> (Branch__c:{Id=a0K5i000000QSnJEAW, Name=Mansarovar, IFSC_Code_No__c=Pnb001542, Bank__c=a0J5i000000Qn1TEAS}, Branch__c:{Id=a0K5i000000QSnIEAW, Name=Vaishli Nagar, IFSC_Code_No__c=SBIN0000712, Bank__c=a0J5i000000Qn1OEAS})
        }

        // only show Branch Name
        for(Branch__c detailsOfBranch : branchList){
            System.debug(detailsOfBranch.Name);     // output--> Mansarovar, Vaishli Nagar
        }

        // only show Country Name
          for(Branch__c detailsOfBranch : branchList){
            System.debug(detailsOfBranch.Bank__r.Name);  // output--> Punjab Bank ,State Bank Of India
        }
    }

    /**
     * Created By    :    Prem Chand
     * Purpose       :    This Method is use to show how to make a Query from Parent to Child
     * Params        :    void
     * Return        :    Void
    **/
    public static void parentToChildQuery(){
        List<Bank__c> bankList = [SELECT Id,Name,(SELECT Name,IFSC_Code_No__c FROM Branches__r) FROM Bank__c];   
        for(Bank__c detailsBank : bankList){
            System.debug(detailsBank);   // output--> Bank__c:{Id=a0J5i000000Qn1OEAS, Name=State Bank Of India}
                                         // oytput--> Bank__c:{Id=a0J5i000000Qn1TEAS, Name=Punjab Bank}
        }

        // only Show Bank Name
        for(Bank__c detailsBank : bankList){
            System.debug(detailsBank.Name);    // output-->  Punjab Bank ,State Bank Of India
        }

        // Another way

        for(Bank__c u: [select Name,(select Name, IFSC_Code_No__c from Branches__r) from Bank__c])
        {   
            for(Branch__c c: u.Branches__r){
                System.debug('Bank Name:'+u.Name+'   Branch Name:'+c.Name);    // output--> Bank Name:State Bank Of India   Branch Name:Vaishli Nagar
                                                                               // ouput--> Bank Name:Punjab Bank   Branch Name:Mansarovar
            }
        }
    }
     
    /***************************** Standard and Custom Object Query  ******************************************/

    /**
     * Created By    :    Prem Chand
     * Purpose       :    This Method is use to show how to make a Query from Child to Parent
     * Params        :    void
     * Return        :    Void
    **/
    public static void childToParent(){   

        //Account-->Standard Object(Child) and Branch---> Custom object(Parent)

        List<Account> accList = [SELECT Id, Name,ChooseBranch__r.Name,ChooseBranch__r.IFSC_Code_No__c FROM Account  WHERE Name LIKE 'Branch%'];
        for(Account ac : accList){
            System.debug(ac); // output--> Account:{Id=0015i00000KjAJWAA3, Name=BranchRelatedAccount2, ChooseBranch__c=a0K5i000000QSnIEAW}
        }
    }

     /**
     * Created By    :    Prem Chand
     * Purpose       :    This Method is use to show how to make a Query from Parent to Child
     * Params        :    void
     * Return        :    Void
    **/
    public static void parentToChild(){   

        //Account-->Standard Object(Child) and Branch---> Custom object(Parent)
         List<Branch__c> branchList = [SELECT Name,IFSC_Code_No__c, (SELECT Name From Accounts__r Where Name Like 'Branch%') FROM Branch__c];
         for(Branch__c listOfBranch : branchList){
            System.debug(listOfBranch); // output--> Branch__c:{Name=Mansarovar, IFSC_Code_No__c=Pnb001542, Id=a0K5i000000QSnJEAW}
                                        // output--> Branch__c:{Name=Vaishli Nagar, IFSC_Code_No__c=SBIN0000712, Id=a0K5i000000QSnIEAW}
        }
    }
}