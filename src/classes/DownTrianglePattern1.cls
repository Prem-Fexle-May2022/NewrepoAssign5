public class DownTrianglePattern1 {
     public static void show_Pattern(){
        for(Integer i=1;i<=5;i++)
        {
            string s = '';
            for(Integer j=1;j<=9;j++)
            {
                if(i==1 || i==j || i+j==10)
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