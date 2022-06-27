/*
 *  Purpose          :    This class is showing the Patterns
 *  Created By       :    Prem Chand
 *  Created Date     :    2022/06/25
 *  Revision Logs    :    V_1.0 - Created - 2022/06/25
 */

public with sharing class Patterns {

   /*
    * Created By    :    Prem Chand
    * Purpose       :    This method is used to display Down Number Pattern
    * Params        :    Void
    * Return        :    Void
    */

    public static void number_Pattern()
    {   
        Integer i,k=0;
        for(i=1;i<=5;i++)
        {      
               String s=' ';
            for(Integer j=1;j<=i;j++)
            {   k++;
                  s=s+' ';
                s=s+k;
              
          
            }
          System.debug(s);
        }
    }

   /*
    * Created By    :    Prem Chand
    * Purpose       :    This method is used to display Down Triangle Star Pattern
    * Params        :    Void
    * Return        :    Void
    */

    public static void triangle_StarPattern(){

        for(Integer i=1;i<=5;i++)
        {
            string s = '';
            for(Integer j=1;j<=9;j++)
            {
                if(i==5 || i+j==6 || j-i==4)
                {
                    s=s+'*';
                }
                else
                {
                    s=s+'_';
                }
            }
            System.debug(s);
        }
    }

   /*
    * Created By    :    Prem Chand
    * Purpose       :    This method is used to display Down Triangle Star Pattern
    * Params        :    Void
    * Return        :    Void
    */

  public static void down_TrianglePattern(Integer row)
  {
    if(math.mod(row,2)!=0)
    {
       for(Integer i=1;i<=row;i++)
      {
            string s = '';
            for(Integer j=1;j<=2*row-1;j++)
            {
                if(i==1 || i==j || i+j==(2*row-1)+1)
                {
                    s=s+'*'; 
                }
                else
                {
                    s=s+'_';
                }
            }
            System.debug(s);
       }
    }
   else
         System.debug('Number of rows is Even....So I Can not Print This Pattern');
  }


  public static void pyramid_Pattern(){
    Boolean k=true;
   // Boolean b = Boolean.valueOf('true');
   for(Integer i=1;i<=5;i++)
   { 
       String s='';
       
        
       for(Integer j=1;j<=9;j++)
       {
           if(j>=6-i && j<=4+i && k)
           {
                k=false;
              // Boolean b = Boolean.valueOf('false');
               s=s+'*';
            }
           else{
               s=s+'_';
             k=true;
           }
        }
       System.debug(s);
   }
}

   /*
    * Created By    :    Prem Chand
    * Purpose       :    This method is used to display Reversed Pyramid
    * Params        :    Void
    * Return        :    Void
    */

public static void reversed_Pyramid(){
    for(Integer i=1;i<=5;i++)
    {   String s=' ';
        boolean k=true;
        for(Integer j=1;j<=9;j++)
        {
            if(j>=i && j<=10-i && k)
            {
                s=s+'X';
                k=false;
            }
            else
            {
                s=s+'_';
                k=true;
            }
        }
        System.debug(s);
    }
}

   /* 
    * Created By    :    Prem Chand
    * Purpose       :    This method is used to display Left Triangle Pascal
    * Params        :    Void
    * Return        :    Void
    */


public static void left_Triangle_Pascal(){
    Integer k = 0;
    for(Integer i=1;i<=9;i++)
    {    
          if(i<=5)
             k++;
          else
             k--;
          String s = '';
        for(Integer j=1;j<=5;j++)
        {
            if(j>=6-k)
            {
                s=s+'*';
            }
            else
            {
                s=s+'_';
            }
        }
        System.debug(s);
    }
}
}