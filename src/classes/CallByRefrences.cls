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
   public static void list_Method1(String s1, String s2){

       List<String> list1 = new List<String>();              // Create New List
       list1.add(s1);
       list1.add(s2);
       System.debug('My First List is:: '+list1);           

       List_Method2(list1);
       System.debug('My Second List is:: '+list1);

       List_Method3(list1);
       System.debug('My Third List is:: '+list1);
   }

   /** 
    * Created By    :    Prem Chand
    * Purpose       :    This method is how to recive List and add More Elements in List
    * Params        :    List<Integer> list1
    * Return        :    Void
    **/
   public static void List_Method2(List<String> list2){

       System.debug('My Old List is::'+list2);
       list2.add('Ram');
       list2.add('Shyam');
       System.debug('After adding New List Second is:: '+list2);
   }

   /** 
    * Created By    :    Prem Chand
    * Purpose       :    This method is how to recive List and add More Elements in List
    * Params        :    List<Integer> list2
    * Return        :    Void
    **/
   public static void List_Method3(List<String> list3){
       List<String> list4 = new List<String>{'Sunil','Kumar Satyam'};
       list4.addAll(list3);
       System.debug('My Final List is:: '+list4);
   }

    // ********************************************  SET  ******************************************** 

   /** 
    * Created By    :    Prem Chand
    * Purpose       :    This method is Set Collection and how to create set and pass Refrence another methods
    * Params        :    Integer
    * Return        :    Void
    **/
   public static void set_Method1(Integer a, Integer b){

       Set<Integer> set1 = new Set<Integer>();
       set1.add(a);
       set1.add(b);
       System.debug('My set1 Values is:: '+set1);

       set_Method2(set1);
       System.debug('My New set1 Values is:: '+set1);

       set_Method3(set1);
       System.debug('My New set1 Values is:: '+set1);
   }

   /** 
    * Created By    :    Prem Chand
    * Purpose       :    This method is Set Collection and how to recieve another Set
    * Params        :    Set<Integer> set1
    * Return        :    Void
    **/
   public static void set_Method2(set<Integer> set2){

       System.debug('My Old Set Value is::'+set2);
       set2.add(30);
       set2.add(40);
       System.debug('My set2 New values is:: '+set2);
   }

   /** 
    * Created By    :    Prem Chand
    * Purpose       :    This method is Set Collection and how to recieve another Set
    * Params        :    Set<Integer> set2
    * Return        :    Void
    **/
   public static void set_Method3(set<Integer> set3){

       System.debug('My Old Set Value is::'+set3);
       Set<Integer> set4 = new Set<Integer>{50,60};
       set3.addAll(set4);
       System.debug('My New Set Value is::'+set3);
   }

    // ********************************************  MAP  ******************************************** 

   /** 
    * Created By    :    Prem Chand
    * Purpose       :    This method is how to create Map and pass Refrence another methods
    * Params        :    Integer,String
    * Return        :    Void
    **/
   public static void map_Method1(Integer a, String s){

       Map<Integer,String> nameListOfMap = new Map<Integer,String>();
       nameListOfMap.put(a,s);
       System.debug('Map1 Value is:: '+nameListOfMap);

       map_Method2(nameListOfMap);                               // Call By Reference
       System.debug('Map2 Value is:: '+nameListOfMap);
       map_Method3(nameListOfMap);                               // Call By Reference
       System.debug('Map3 Value is:: '+nameListOfMap);
   }

   /** 
    * Created By    :    Prem Chand
    * Purpose       :    This method is how to receive map values and Add new Values
    * Params        :    Integer,String
    * Return        :    Void
    **/
   public static void map_Method2(map<Integer,String> nameListOfMap1){

       System.debug('Map1 Old Value is::'+nameListOfMap1);
       nameListOfMap1.put(2,'Om Prakash');
       nameListOfMap1.put(3,'Punnet');
       System.debug('New Value in Map::'+nameListOfMap1);
   }

   /** 
    * Created By    :    Prem Chand
    * Purpose       :    This method is how to receive map values and create new map and copy values one map to another map
    * Params        :    Integer,String
    * Return        :    Void
    **/
   public static void map_Method3(map<Integer,String> nameListOfMap2){

       System.debug('Map2 Old Value is::'+nameListOfMap2);

       Map<Integer,String> newMap = new Map<Integer,String>{5=>'Ajay', 6=>'Mahendra'};
       System.debug('New Map Value is:: '+newMap);
       nameListOfMap2.putAll(newMap);
   }
}