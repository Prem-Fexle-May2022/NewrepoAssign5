/*
     *  Purpose         :    This class is used to how to initialize and assign value to Set
     *  Created By      :    Prem Chand
     *  Created Date    :    2022/06/26
     *  Revision Logs   :    V_1.0 - Created - 2022/06/26
     */
public with sharing class SetClass {

   /*
    * Created By    :    Shailendra Sharma
    * Purpose       :    This method is how used to set methods
    * Params        :    Void
    * Return        :    Void
    */
    public static void initializing_Method(){

        // Creating & Initializing an Integer Set

        Set<Integer> s1 = new Set<Integer>();
        
        //Adding value to the set

        s1.add(5);
        s1.add(1);
        s1.add(8);
        System.debug(s1);                      // {1,5,8}

        // Duplicate value Can not store

        Set<Integer> s2 = new Set<Integer>();

        s2.add(15);
        s2.add(11);
        s2.add(11);
        s2.add(4);
        s2.add(8);
        s2.add(15);
        System.debug(s2);                    // {4,8,11,15}

        // A String type Set

        Set<String> s3 = new Set<String>{'Hello','World!!','Welcome'};

        System.debug(s3);                   // {Hello, Welcome, World!!}

        // case-sensitive in set

        Set<String> s4 = new Set<String>{'Hello','World!!','Welcome','hello','world!!'};

        System.debug(s3);                  // {Hello, Welcome, World!!, hello, world!!}
    }

  /** 
    * Created By    :    Prem Chand
    * Purpose       :    This method is how sObject Method
    * Params        :    Void
    * Return        :    Void
    */
    public static void sObject_MethodList(){

        // Uniqueness of sOjects

        Set<Account> sSet = new Set<Account>();
        Account a1 = new Account(Name ='Amazon', NumberofEmployees = 20000);
        Account a2 = new Account(Name ='Walmart', NumberofEmployees = 20000);
        Account a3 = new Account(Name ='Amazon', NumberofEmployees = 20000);
        Account a4 = new Account(Name ='Walmart', NumberofEmployees = 20000);
        sSet.add(a1);
        sSet.add(a2);
        sSet.add(a3);
        sSet.add(a4);
        System.debug(sSet);          
        System.debug(sSet.size());  //2
    }

    public static void set_Methods(){
        
        // List elements add in Set

        Set<Integer> set1 = new Set<Integer>{2,4,10,4};
        System.debug(set1);           // 2,4,10  automatically sorted in set

        List<Integer> list1 = new List<Integer>{7,3,2,8};
        System.debug(list1);          // 7,3,2,8

        set1.addall(list1);         // addall method
        System.debug(set1);         // {2,3,4,7,8,10} automatically sorted in set and Duplicate value not store
    }

  /** 
    * Created By    :    Prem Chand
    * Purpose       :    This method is how use contains Methods
    * Params        :    Void
    * Return        :    Void
    */
    public static void set_Contains_Methods(){

        Set<Integer> set1 = new Set<Integer>{2,4,10,4};
        System.debug(set1);                                                  // 2,4,10  automatically sorted in set
        System.debug(set1.contains(10));                                    // true      contains(setElement) method use
        System.debug(set1.contains(3));                                     // false

        List<Integer> list1 = new List<Integer>{7,3,2,8};
        System.debug(list1);             // 7,3,2,8
        System.debug(set1.containsAll(list1));                              // false     containsAll(listToCompare) method use)

        set1.addall(list1);                                                 // addall method
        System.debug(set1);                                                   // {2, 3, 4, 7, 8, 10}
        System.debug(set1.containsAll(list1));                              // true     containsAll(listToCompare) method use)

        Set<Integer> set2 = new Set<Integer>{5,4,7,2,10};
        Set<Integer> set3 = new Set<Integer>{4,77,100,2,10};
        System.debug(set1.equals(set2));                                    // false       (equals Method)

        Set<Integer> set4 = new Set<Integer>{5,4,7,2,10};
        System.debug(set1.equals(set4));                                    // true       (equals Method)
    }
}