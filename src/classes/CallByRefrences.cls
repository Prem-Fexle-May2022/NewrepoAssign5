/**  Purpose         :    This class is Call By References
  *  Created By      :    Prem Chand
  *  Created Date    :    2022/07/04
  *  Revision Logs   :    V_1.0 - Created - 2022/07/04
  **/
 public with sharing class CallByRefrences {

    // ********************************************  LIST  ******************************************** 

   /** 
    * Created By    :    Prem Chand
    * Purpose       :    This method is how to create List and pass Refrence another methods
    * Params        :    String
    * Return        :    Void
    **/
   public static void studentList1(String s1, String s2){               // s1 = 'Prem', s2 = 'Punnet'         

       List<String> list1 = new List<String>();              // Create New List
       list1.add(s1);                                         // s1 = Prem
       list1.add(s2);                                         // s2 = Punnet
       System.debug('My First List is:: '+list1);             // My First List is:: (Prem, Punnet)

       studentList2(list1);
       System.debug('My Second List is:: '+list1);           // |My Second List is:: (Prem, Punnet, Ram, Shyam)

       studentList3(list1);
       System.debug('My Third List is:: '+list1);            // My Final List is:: (Prem, Punnet, Ram, Shyam, Sunil, Kumar Satyam)
   }

   /** 
    * Created By    :    Prem Chand
    * Purpose       :    This method is how to recive List and add More Elements in List
    * Params        :    List<Integer> list1
    * Return        :    Void
    **/
   public static void studentList2(List<String> list2){

       System.debug('My Old List is::'+list2);           // My Old List is::(Prem, Punnet)
       list2.add('Ram');
       list2.add('Shyam');
       System.debug('After adding New List Second is:: '+list2);   // After adding New List Second is:: (Prem, Punnet, Ram, Shyam)
   }

   /** 
    * Created By    :    Prem Chand
    * Purpose       :    This method is how to recive List and add More Elements in List
    * Params        :    List<Integer> list2
    * Return        :    Void
    **/
   public static void studentList3(List<String> list3){
       List<String> list4 = new List<String>{'Sunil','Kumar Satyam'};
       list3.addAll(list4);
       System.debug('My Final List is:: '+list3);        // My Final List is:: (Prem, Punnet, Ram, Shyam, Sunil, Kumar Satyam)
   }

    // ********************************************  SET  ******************************************** 

   /** 
    * Created By    :    Prem Chand
    * Purpose       :    This method is Set Collection and how to create set and pass Refrence another methods
    * Params        :    Integer
    * Return        :    Void
    **/
   public static void integerSetValue1(Integer a, Integer b){               // a = 10, b = 20

       Set<Integer> set1 = new Set<Integer>();
       set1.add(a);
       set1.add(b);
       System.debug('My set1 Values is:: '+set1);                      // My set1 Values is:: {10, 20}

       integerSetValue2(set1);
       System.debug('My New set1 Values is:: '+set1);                 // My New set1 Values is:: {10, 20, 30, 40}

       integerSetValue3(set1);
       System.debug('My New set1 Values is:: '+set1);                // My New Set1 Value is:: {10, 20, 30, 40, 50, 60}
   }

   /** 
    * Created By    :    Prem Chand
    * Purpose       :    This method is Set Collection and how to recieve another Set
    * Params        :    Set<Integer> set1
    * Return        :    Void
    **/
   public static void integerSetValue2(set<Integer> set2){

       System.debug('My Old Set Value is::'+set2);                    // My Old Set Value is::{10, 20}
       set2.add(30);
       set2.add(40);
       System.debug('My set2 New values is:: '+set2);                 // My set2 New values is:: {10, 20, 30, 40}
   } 

   /** 
    * Created By    :    Prem Chand
    * Purpose       :    This method is Set Collection and how to recieve another Set
    * Params        :    Set<Integer> set2
    * Return        :    Void
    **/
   public static void integerSetValue3(set<Integer> set3){

       System.debug('My Old Set Value is::'+set3);                    // My Old Set Value is::{10, 20, 30, 40}
       Set<Integer> set4 = new Set<Integer>{50,60};
       set3.addAll(set4);
       System.debug('My New Set Value is::'+set3);                   // My New Set Value is::{10, 20, 30, 40, 50, 60}
   }

    // ********************************************  MAP  ******************************************** 

   /** 
    * Created By    :    Prem Chand
    * Purpose       :    This method is how to create Map and pass Refrence another methods
    * Params        :    Integer,String
    * Return        :    Void
    **/
   public static void nameOfStudent1(Integer rollNumber, String studentName){    // rollNumber = 10, studentName = 'Prem'

       Map<Integer,String> nameListOfMap = new Map<Integer,String>();
       nameListOfMap.put(rollNumber,studentName);
       System.debug('Student Name and Roll Number:: '+nameListOfMap);              // Student Name and Roll Number:: {10=Prem}

       nameOfStudent2(nameListOfMap);                               // Call By Reference
       System.debug('Student Name and Roll Number:: '+nameListOfMap);                   // Student Name and Roll Number:: {2=Om Prakash, 3=Punnet, 10=Prem}
       nameOfStudent3(nameListOfMap);                               // Call By Reference
       System.debug('Student Name and Roll Number:: '+nameListOfMap);                   //  Student Name and Roll Number:: {2=Om Prakash, 3=Punnet, 5=Ajay, 6=Mahendra, 10=Prem}
   }

   /** 
    * Created By    :    Prem Chand
    * Purpose       :    This method is how to receive map values and Add new Values
    * Params        :    Integer,String
    * Return        :    Void
    **/
   public static void nameOfStudent2(map<Integer,String> nameListOfMap1){

       System.debug('Student Name and Roll Number:: '+nameListOfMap1);        // Student Name and Roll Number:: {10=Prem}
       nameListOfMap1.put(2,'Om Prakash');
       nameListOfMap1.put(3,'Punnet');
       System.debug('Student Name and Roll Number:: '+nameListOfMap1);      // Student Name and Roll Number:: {2=Om Prakash, 3=Punnet, 10=Prem}
   }

   /** 
    * Created By    :    Prem Chand
    * Purpose       :    This method is how to receive map values and create new map and copy values one map to another map
    * Params        :    Integer,String
    * Return        :    Void
    **/
   public static void nameOfStudent3(map<Integer,String> nameListOfMap2){

       System.debug('Student Name and Roll Number:: '+nameListOfMap2);        // Student Name and Roll Number:: {2=Om Prakash, 3=Punnet, 10=Prem}

       Map<Integer,String> nameListOfMap3 = new Map<Integer,String>{5=>'Ajay', 6=>'Mahendra'};
       System.debug('Student Name and Roll Number:: '+nameListOfMap3);             // Student Name and Roll Number:: {5=Ajay, 6=Mahendra}
       nameListOfMap2.putAll(nameListOfMap3);
   }
}