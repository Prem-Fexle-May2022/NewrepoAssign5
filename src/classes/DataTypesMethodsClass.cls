/**  Purpose         :    This class is Different Types Data Types in Apex
  *  Created By      :    Prem Chand
  *  Created Date    :    2022/06/27
  *  Revision Logs   :    V_1.0 - Created - 2022/06/27
  **/
public with sharing class DataTypesMethodsClass {

    //********************************  Data Types  ********************************
    // Integer

    public static void integerExample(){
        Integer a = 101;
        System.debug(a);
    }

    // Long

    public static void longExample(){
       // Long b = 2147483648;                                        // Compile time Error
        Long b = 2147483648L;  
        System.debug(b);
    }

    // Double

    public static void doubleExample(){
         double c;
         c = 25.324;
         System.debug(c);
    }

    // Decimal

    public static void decimalExample(){
        decimal d = 545.21;
        System.debug(d);
    }

    // Date

    public static void dateExample(){
        Date d1;
        d1 = Date.newInstance(2022,06,24);
        System.debug(d1);
    }

    // Time

    public static void timeExample(){
        Time t;
        t = Time.newInstance(06,15,00,15);                           // (HH,MM,SS,MS)
        System.debug(t);
    }

    // DateTime

    public static void dateTimeExample(){
        Datetime dt = DateTime.newInstance(2022,06,24,06,15,00);     // (YYYY,MM,DD,HH,MM,SS)
        System.debug(dt);
    }

    // Boolean

    public static void booleanExample(){
        Boolean c;
        Integer a = 10, b = 5;
        c = a>b;
        System.debug(c);        // True
        c = a<b;
        System.debug(c);       // False
    }

    // String

    public static void stringExample(){
        String s1 = 'Prem';
        String s2 = 'Chand';
        String s3 = s1+s2; 
        System.debug(s3);
    }

    // ID

    public static void idExample(){
        ID i = '0015i000007uDlx';                                        
        System.debug(i);                                              // output ID i = '0015i000007uDlxAAE'(Automatic convert into 18 digits)
    }
    
     
    //********************************   Methods    *********************************************************************

    // Date Methods

    public static void date_Methods(){
        Date d1;
        d1 = Date.today();                                           // Current Date
        System.debug(d1);

        d1 = Date.newInstance(2022,06,25);                          //(YYYY,MM,DD)
        System.debug(d1);

        System.debug(d1.toStartOfMonth());
        System.debug(d1.toStartOfWeek());                          // Start to Sunday

        System.debug(d1 = d1.addDays(5));

        System.debug(d1 = d1.addMonths(4));
        System.debug(d1 = d1.addYears(2));

        Date d2 = Date.newInstance(2023,8,15);
        System.debug(d2);
        Integer day = d2.Day();                                  // Return Day of Date
        System.debug(day);  
        day = d2.dayOfYear();                                   // Return Total Days till date
        System.debug(day);  
        
        Date startDate = Date.newInstance(2022, 1, 1);
        Date dueDate = Date.newInstance(2022, 1, 30);
        Integer numberDaysDue = startDate.daysBetween(dueDate);
        System.debug(numberDaysDue);

        System.debug(Date.isLeapYear(2022));                    // Return-----> true and false
    }

    // String Methods

    public static void string_Methods(){
    
        String s = 'prem chand';
        String s2 = s.capitalize();
        System.debug(s2);

        String myString1 = 'Ram';
        String myString2 = 'Ram';
        Integer result =  myString1.compareTo(myString2);         // Equal Strings then return 0
        myString1.compareTo(myString2);
        System.debug(result);
        
        String myString11 = 'Ram';
        String myString12 = 'Shyam';
        Integer result_1 =  myString11.compareTo(myString12);         // Dictionary order then return negative value
        myString1.compareTo(myString12);
        System.debug(result_1);

        String myString_A = 'abcde';
        String myString_B = 'cde';
        Boolean result_2 =  myString_A.contains(myString_B);
        System.debug(result_2);

        String ss1 = '  Prem C hand ';
        String ss2 = ss1.deleteWhitespace();                       // Remove all WhiteSpace
        System.debug(ss2);
    }

    //DateTime Methods

    public static void dateTime_Methods(){
    
        Datetime myDateTime = Datetime.newInstance(2022, 06, 25,10,15,20);
        Datetime newDateTime = myDateTime.addDays(2);                           // Add Day
        System.debug(newDateTime);

        
        DateTime myDateTime1 = DateTime.newInstance(2022, 1, 31, 7, 8, 16);
        DateTime newDateTime1 = myDateTime1.addHours(3);                          //Add Hours
        System.debug(newDateTime1);
        
        DateTime myDateTime2 = DateTime.newInstance(2022, 2, 11, 8, 6, 16);
        DateTime newDateTime2 = myDateTime2.addMinutes(7);                       // Add Minutes
        System.debug(newDateTime2);


        DateTime myDateTime3 = DateTime.newInstance(2021, 7, 19, 10, 7, 12);
        DateTime newDateTime3 = myDateTime3.addSeconds(4);                      // Add Seconds
        System.debug(newDateTime3);


        DateTime myDateTime4 = DateTime.newInstance(2009, 12, 17, 13, 6, 6);
        DateTime newDateTime4 = myDateTime4.addYears(1);                       // Add Years
        System.debug(newDateTime4);


        Datetime myDT = DateTime.newInstance(2022, 5, 4, 19, 37, 55);
        String myDate5 = myDT.format('dd-MM-yyyy h:mm a');
        System.debug(myDate5);


        Datetime myDT1 = DateTime.newInstance(2022, 5, 4, 10, 42, 55);
        String myDate6 = myDT1.format('h:mm a');
        System.debug(myDate6);                                                       // output--->10:42 Am
    }
}