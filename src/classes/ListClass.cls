/**  Purpose         :    This class is used to how to initialize and assign value to List
     *  Created By      :    Prem Chand
     *  Created Date    :    2022/06/27
     *  Revision Logs   :    V_1.0 - Created - 2022/06/27
     **/
public with sharing class ListClass {

  /** 
    * Created By    :    Prem Chand
    * Purpose       :    This method is how Initialization List
    * Params        :    Void
    * Return        :    Void
    */
    public static void list_InitializingMethod(){

        List<Integer> list1 = new List<Integer>();                            // Creating & Initializing an Integer list
        list1.add(2);
        list1.add(5);
        list1.add(10);                                                       // Adding values to the List
        list1.add(4);
        System.debug(list1);                                                 // (2,5,10,4)
        
        // Initializing and adding values together

        List<Integer> list2 = new List<Integer>{5,10,8,25};
        System.debug(list2);                                                // (5,10,8,25)

        // String Type List

        List<String> list3 = new List<String>{'Hello','World!!','Wel-Come'};
        System.debug(list3);                                             // (Hello, World!!, Wel-Come)
    }

  /** 
    * Created By    :    Prem Chand
    * Purpose       :    This method is how used to List Array Notation
    * Params        :    Void
    * Return        :    Void
    */
    public static void list_ArrayNotation(){

        Integer[] list4 = new Integer[4];
        list4[0] = 20;
        list4[1] = 30;
        list4[2] = 40;
        list4[3] = 50;
        System.debug('List is::'+list4);                                       // List is::(20, 30, 40, 50)  
       
        // more elements add  
       // list4[4] = 60;                                                           Error
        list4.add(60);
        list4.add(70);
        System.debug('List is::'+list4);                                       // List is::(20, 30, 40, 50, 60, 70)          
        
        // Accessing Nth element of a list

        System.debug(list4[2]);                                                    // 40            
    }

  /** 
    * Created By    :    Prem Chand
    * Purpose       :    This method is how used to Different types List Methods
    * Params        :    Void
    * Return        :    Void
    */
    public static void list_Methods(){

        List<Integer> l1 = new List<Integer>{100,200,300,400,500,10,5};
        System.debug(l1.size());                                                  // size() method  ans--> 7
        System.debug(l1.get(2));                                                  // get() method   ans--> 300

        l1.remove(2);                                                             // remove() method
        System.debug(l1[2]);                                                   // or   System.debug(l1.get(2));  ans--> 400
        System.debug(l1);                                                      // 100,200,400,500,10,5

        List<Integer> l2 = l1.clone();                                          // clone method
        System.debug(l2);                                                       // 100,200,400,500,10,5
        
        l2.add(0,50);                                                           // add(index,element) method
        System.debug(l2);                                                      // (50, 100, 200, 400, 500,10,5)

        l2.set(0,25);                                                          // set(index,element) method
        System.debug(l2);                                                      // (25, 100, 200, 400, 500,10,5)

        l2.sort();                                                             // sort() method
        System.debug('Sorted List is::'+l2);                                  // Sorted List is::(5, 10, 25, 100, 200, 400, 500)

        System.debug(l2.isEmpty());                                          // isEmpty() method return---> true or false

        l2.clear();                                                          // clear() method
        System.debug(l2);                                                  
        System.debug(l2.isEmpty());                                          // true
    }

  /** 
    * Created By    :    Prem Chand
    * Purpose       :    This method is how used to set methods
    * Params        :    Void
    * Return        :    Void
    */
    public static void contains_Methods(){

        List<String> myStrings = new List<String>{'Prem', 'Nikhil','Manish','Sahil','Kamlesh'};
        Boolean result;
        result = myStrings.contains('Kamlesh');                                             // contains(listElement) method
        System.debug(result);                                                              // true

        result = myStrings.contains('kamlesH');                                           // contains(listElement) method  (case sensitive)
        System.debug(result);                                                            // false


        result = myStrings.contains('Aman');
        System.debug(result);                                                            // false
    }

  /** 
    * Created By    :    Prem Chand
    * Purpose       :    This method is how used to indexOf() Method
    * Params        :    Void
    * Return        :    Void
    */
    public static void indexof_Method(){

        List<String> myStrings = new List<String>{'a', 'b', 'c','d'};
        Integer result = myStrings.indexOf('a');
        System.debug(myStrings);                                                         // (a, b, c, d)
        System.debug(result);                                                          // 0

        Integer result1 = myStrings.indexOf('c'); 
        System.debug(result1);                                                         // 2

        Integer result2 = myStrings.indexOf('d');
        System.debug(result2);                                                         // 3
    }

  /** 
    * Created By    :    Prem Chand
    * Purpose       :    This method is how  Nested Lists Initializing
    * Params        :    Void
    * Return        :    Void
    */
    public static void nested_InitializingMethod(){

        List<List<Integer>> list1 = new List<List<Integer>>();
        List<Integer> l1 = new List<Integer>{8,10,45};
        List<Integer> l2 = new List<Integer>{10,20,30};
        List<Integer> l3 = new List<Integer>{77,88,99};
        List<Integer> l4 = new List<Integer>{55,65,75};
        list1.add(l1);
        list1.add(l2);
        list1.add(l3);
        list1.add(l4);
        System.debug(list1);                                                       // ((8, 10, 45), (10, 20, 30), (77, 88, 99), (55, 65, 75))            
    }
}