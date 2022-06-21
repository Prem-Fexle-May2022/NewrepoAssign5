public class NumberPattern {
    public static void show_Pattern()
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

}