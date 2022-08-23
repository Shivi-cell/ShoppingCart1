
package com.mycompany.shoppingcart.helper;

public class Helper 
{
    public static String get10Words(String des)
    {
        String[] strs = des.split(" ");
        if(strs.length > 10)
        {
            String res = "";
            for(int i=0; i<10; i++)
            {
                res = res+strs[i]+" ";
            }
            return (res+" ...");
        }
        else
        {
            return (des+" ...");
        }
    }
}
