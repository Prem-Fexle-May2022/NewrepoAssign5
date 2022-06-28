/*
 *  Purpose         :    This class is used to how to initialize and assign value to map Collection
 *  Created By      :    Prem Chand
 *  Created Date    :    2022/06/27
 *  Revision Logs   :    V_1.0 - Created - 2022/06/27
 */
public with sharing class MapCollection {

    public static void map_Initialization(){

        // Creating & Initalizing a Map

        Map<Integer, String> mmap = new Map<Integer, String>();

        // Adding Values to map

        mmap.put(11, 'Sunil');
        mmap.put(10, 'Nikhil');
        mmap.put(31, 'Kamlesh');
        mmap.put(32, 'Sunil');                                             // Duplicate value store in map
        System.debug(mmap);                                               // |{10=Nikhil, 11=Sunil, 31=Kamlesh, 32=Sunil}

        // Duplicate key

        mmap.put(11, 'Prem');                                              // use duplicate key
        System.debug(mmap);                                                // will override the value on key 11

        // Initializing and assigning value together

        Map<Integer, String> nameCollection = new Map<Integer, String>{1 => 'Vijay', 2 => 'Ajay', 3 => 'Sanjay', 5 => 'Om Parkash', 4 => 'Sunil'};
        System.debug(nameCollection);                                       // {1=Vijay, 2=Ajay, 3=Sanjay, 4=Sunil, 5=Om Parkash}
    }

  /** 
    * Created By    :    Prem Chand
    * Purpose       :    This method is how Initialization List
    * Params        :    Void
    * Return        :    Void
    */
    public static void methodsOfMap(){

        Map<Integer, String> m1 = new Map<Integer, String>();
        m1.put(1,'Rahul');
        m1.put(5,'Shyam');
        System.debug(m1);                                                    // {1=Rahul, 5=Shyam}

        Map<Integer, String> m2 = new Map<Integer, String>();
        m2.put(2,'Ram');
        m2.put(3,'Mukesh');
        m2.put(4,'Punnet');
        System.debug(m2);                                                   // {2=Ram, 3=Mukesh, 4=Punnet}

        m1.putAll(m2);                                                      // use putAll() Method
        System.debug(m1);                                                    // {1=Rahul, 2=Ram, 3=Mukesh, 4=Punnet, 5=Shyam}
        System.debug(m1.get(2));                                             // use get(key) method      output--> Ram

        // Create list

        List<String> newList = new List<String>();
        newList = m1.values();                                                // use values() method  (map value store in List)
        System.debug(newList);                                                // (Rahul, Shyam, Ram, Mukesh, Punnet)
        System.debug(m1.size());                                              // size() method       output---> 5
        System.debug(m1.isEmpty());                                           // isEmpty() method    output---> false

        m1.remove(2);                                                         // remove(key) method use  (value and key remove)
        System.debug(m1);                                                     // {1=Rahul, 3=Mukesh, 4=Punnet, 5=Shyam}
        m1.clear();                                                           // clear() method use
        System.debug(m1);                                                     // remove key and values
    }
}