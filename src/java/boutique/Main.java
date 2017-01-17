/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package boutique;

/**
 *
 * @author User
 */
public class Main {
    public static void main(String[] args)
    {
        ConnexionBase c=new ConnexionBase();
            try
            {
               
                c.modifArticle(13,"adidas",3,"600000");

            }
            catch(Exception e)
            {
                System.out.print(e.getMessage());

            }
        
    }
    
}
