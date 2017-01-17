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
 
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Vector;
public class ConnexionBase {
    
    public String test()
    {
        return "coucocu";
    }
     public Connection getConnexion() throws Exception
    {
        Class.forName("org.postgresql.Driver");
        String url = "jdbc:postgresql://localhost:5432/Magasin";
        String user = "postgres";
        String passwd = "andotiana";

        Connection conn = DriverManager.getConnection(url, user, passwd);
        return conn;
    }
    
   public String essai()
  {
    String val="";
    try
    {
      Connection c=this.getConnexion();
      Statement st=c.createStatement();
      ResultSet rs=st.executeQuery("SELECT NomCategorie from Categorie where id=1");
        while(rs.next())
        {
          val=rs.getObject("NomCategorie").toString();
        }
    }
    catch(Exception e)
    {
      e.printStackTrace();
    }
    return val;

  }
     public Categorie [] getCategorie()
  {
    Vector listeIdCategorie=new Vector();
    Vector listeNomCategorie=new Vector();
    Categorie [] val=null;
      try
      {  
        Connection c=this.getConnexion();
       Statement st=c.createStatement();
        ResultSet rs=st.executeQuery("SELECT * from Categorie");
        while(rs.next())
        {
          listeIdCategorie.add(rs.getInt(1));
          listeNomCategorie.add(rs.getString(2));
        }
        val=new Categorie[listeIdCategorie.size()];
        for(int i=0; i<listeIdCategorie.size(); i++)
        {
          val[i]=new Categorie();
          val[i].setIdCategorie((new Integer(listeIdCategorie.get(i).toString())).intValue());
           val[i].setNomCategorie(listeNomCategorie.get(i).toString());
        }
        System.out.print("tafiditra");
      }
      catch(Exception e)
      {
        e.printStackTrace();
      }
    return val;
  }
   public void insertCategorie(String cat) throws Exception
  {
	Connection c=this.getConnexion();
	Statement st=c.createStatement();
	st.executeUpdate("INSERT INTO Categorie(NomCategorie) VALUES('"+cat+"')");

  }
   public void insertArticle(int idcategorie,String article,String image,double prix) throws Exception
  {

       Connection c=this.getConnexion();
	Statement st=c.createStatement();
        String req="INSERT INTO articles (idCategorie,NomArticle,image) VALUES('" +idcategorie +"','"+article+"','"+image+"')";
            PreparedStatement s = c.prepareStatement(req,Statement.RETURN_GENERATED_KEYS);
            s.executeUpdate();
            ResultSet rs=s.getGeneratedKeys();
            int idArticle=0;
            while(rs.next())
            {
                idArticle=rs.getInt(1);
            }
            st.execute("insert into prix (id,montant) values('"+idArticle+"','"+prix+"')");
  }
   public void insertQuantiteArticle(String article,String quantite,String date) throws Exception
  {
      int id=0;
       Connection c=this.getConnexion();
	Statement st=c.createStatement();
        ResultSet rs=st.executeQuery("SELECT idarticle from articles where nomarticle='"+article+"'");
        while(rs.next())
        {
            id=rs.getInt(1);
        }
         st.execute("insert into entreearticle (idarticle,quantite,date) values('"+id+"','"+quantite+"','"+date+"')");
  }
   public Article[]RechercheArticle(String champ,String nom)
  {
    Vector listeIdArticle=new Vector();
    Vector listeNomArticle=new Vector();
     Vector listeCatArticle=new Vector();
  
    Article[]val=null;
      try
      {  
        Connection c=this.getConnexion();
        Statement st=c.createStatement();
        ResultSet rs=st.executeQuery("SELECT articles.idArticle,Categorie.NomCategorie,articles.NomArticle from articles join Categorie on articles.idCategorie=Categorie.idCategorie  where "+champ+"::text  LIKE '%"+nom+"%'");
        while(rs.next())
        {
          listeIdArticle.add(rs.getInt(1));
          listeCatArticle.add(rs.getString(2));
          listeNomArticle.add(rs.getString(3));
          
        }
        val=new Article[listeIdArticle.size()];
        for(int i=0; i<listeIdArticle.size(); i++)
        {
           val[i]=new Article();
           val[i].setIdArticle((new Integer(listeIdArticle.get(i).toString())).intValue());
           val[i].setCategorie(listeCatArticle.get(i).toString());
           val[i].setNomArticle(listeNomArticle.get(i).toString());
          
        }
        
      }
      catch(Exception e)
      {
        e.printStackTrace();
      }
    return val;
  }
   public Article[]RechercheAvance(String champ1,String champ2,String champ3,String champ4) throws Exception
  {
      Vector listeIdArticle=new Vector();
      Vector listeNomArticle=new Vector();
      Vector listeCatArticle=new Vector();
      Vector listePrixArticle=new Vector();
      String req="SELECT articles.idArticle,categorie.nomcategorie,articles.NomArticle,prix.montant from articles join categorie on articles.idcategorie=categorie.idcategorie  join prix on prix.id=articles.idArticle ";
      Article[]val=null;
       Connection c=this.getConnexion();
       Statement st=c.createStatement();
       if(champ1.compareTo("")!=0)
       {
           req=req+"where articles.NomArticle ILIKE '%"+champ1+"%'";
       }
       if(champ2.compareTo("")!=0)
       {
           if(champ1.compareTo("")!=0)
           {
               req=req+"and categorie.nomcategorie ILIKE '%"+champ2+"%'";
           }
           else
           {
               req=req+"where categorie.nomcategorie ILIKE '%"+champ2+"%'";
           }
           
       }
       if(champ3.compareTo("")!=0)
       {
           if(champ2.compareTo("")!=0)
           {
                req=req+"and prix.montant>='"+champ3+"' ";
           }
           else
           {
                req=req+"where prix.montant>='"+champ3+"' ";
           }
          
       }
       if(champ4.compareTo("")!=0)
       {
           if(champ3.compareTo("")!=0)
           {
               req=req+"and prix.montant<='"+champ4+"'";
           }
           else
           {
               req=req+"where prix.montant<='"+champ4+"'";
           }
          
       }
       ResultSet rs=st.executeQuery(req);
        while(rs.next())
        {
          listeIdArticle.add(rs.getInt(1));
          listeCatArticle.add(rs.getString(2));
          listeNomArticle.add(rs.getString(3));
          listePrixArticle.add(rs.getString(4));
         
        }
        val=new Article[listeIdArticle.size()];
        for(int i=0; i<listeIdArticle.size(); i++)
        {
           val[i]=new Article();
           val[i].setIdArticle((new Integer(listeIdArticle.get(i).toString())).intValue());
           val[i].setCategorie(listeCatArticle.get(i).toString());
           val[i].setNomArticle(listeNomArticle.get(i).toString());
           val[i].setPrixArticle(Double.parseDouble(listePrixArticle.get(i).toString()));
        }
        return val;
   
  }
   public Article [] getAll()
  {
    Vector listeIdArticle=new Vector();
    Vector listeNomArticle=new Vector();
     Vector listeCategorieArticle=new Vector();
     Vector listeImageArticle=new Vector();
    Vector listePrixArticle=new Vector();
    Article [] val=null;
      try
      {  
        Connection c=this.getConnexion();
       Statement st=c.createStatement();
        ResultSet rs=st.executeQuery("SELECT idarticle,nomarticle,image,prix.montant,categorie.nomcategorie from articles join prix on articles.idarticle=prix.id join categorie on categorie.idcategorie=articles.idcategorie");
        while(rs.next())
        {
          listeIdArticle.add(rs.getInt(1));
          listeNomArticle.add(rs.getString(2));
          listeImageArticle.add(rs.getString(3));
          listePrixArticle.add(rs.getString(4));
           listeCategorieArticle.add(rs.getString(5));
        }
        val=new Article[listeIdArticle.size()];
        for(int i=0; i<listeIdArticle.size(); i++)
        {
          val[i]=new Article();
          val[i].setIdArticle((new Integer(listeIdArticle.get(i).toString())).intValue());
          val[i].setNomArticle(listeNomArticle.get(i).toString());
          val[i].setImageArticle(listeImageArticle.get(i).toString());
          val[i].setPrixArticle(Double.parseDouble(listePrixArticle.get(i).toString()));
          val[i].setCategorie(listeCategorieArticle.get(i).toString());
        }

      }
      catch(Exception e)
      {
        e.printStackTrace();
      }
    return val;
  }
    public void modifArticle(int idart,String nom,int idcat,String prix) throws Exception
  {
     
       Connection c=this.getConnexion();
       Statement st=c.createStatement();
       st.executeUpdate("UPDATE articles SET nomarticle='"+nom+"',idcategorie="+idcat+"  where idarticle="+idart );
      st.executeUpdate("UPDATE prix SET montant='"+prix+"'  where id="+idart );
       
  }
     public void modifCategorie(int idcat,String nom) throws Exception
  {
     
       Connection c=this.getConnexion();
       Statement st=c.createStatement();
       st.executeUpdate("UPDATE categorie SET nomcategorie='"+nom+"' where idcategorie="+idcat );
       
  }
    public void deleteCategorie(int idcat) throws Exception
  {
     
       Connection c=this.getConnexion();
       Statement st=c.createStatement();
       st.executeUpdate("delete from categorie where idcategorie="+idcat );
       
  }
      public void deleteArticle(int idart) throws Exception
  {
     
       Connection c=this.getConnexion();
       Statement st=c.createStatement();
       st.executeUpdate("delete from prix where id="+idart);
       st.executeUpdate("delete from articles where idarticle="+idart);
  }
  }
