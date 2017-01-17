/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package boutique;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;

/**
 *
 * @author User
 */
public class Fonction {
 
    public Connection getConnexion() throws Exception
    {
        Class.forName("org.postgresql.Driver");
        String url = "jdbc:postgresql://localhost:5432/Magasin";
        String user = "postgres";
        String passwd = "andotiana";
        Connection conn = DriverManager.getConnection(url, user, passwd);
        return conn;
    }
    public void insertCategorie(String cat) throws Exception
    {
          Connection c=this.getConnexion();
          Statement st=c.createStatement();
          st.executeUpdate("INSERT INTO Categorie(NomCategorie) VALUES('"+cat+"')");

    }
    public int addition(int a,int b)
    {
        return a+b;
    }
    
}
