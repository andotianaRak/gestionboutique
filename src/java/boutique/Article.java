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
public class Article {
    private int idArticle;
    private double prix;
    private String categorie;
    private String nomArticle;
    private String image;
  
   public void setIdArticle(int id)
    {
            this.idArticle=id;
    }
   
    public void setCategorie(String cat)
    {
            this.categorie=cat;
    }
    public void setNomArticle(String n)
    {
            this.nomArticle=n;
    }
     public void setImageArticle(String n)
    {
            this.image=n;
    }
     public void setPrixArticle(double a)
    {
            this.prix=a;
    }
    public int getIdArticle()
    {
        return this.idArticle;
    }
    public String getNomCategorie()
    {
        return this.categorie;
    }
    public String getNomArticle()
    {
        return this.nomArticle;
    }
      public String getImageArticle()
    {
        return this.image;
    }
    public double getPrixArticle()
    {
        return this.prix;
    }
    
}
