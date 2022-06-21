public class LeftTrianglePattern{
    public static void show_Pattern(){
         for(Integer i=1;i<=5;i++)
       {
           String s = ' ';
            for(Integer j=1;j<=5;j++)
           {
             if(j>=6-i)
                s=s+'X';
            else
               s=s+'_';
          }
           System.debug(s);
      }
    }
}