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
public class Categorie {
    private int idCategorie;
    private String NomCategorie;
    public int getIdCategorie()
    {
        return this.idCategorie;
    }
    public String getNomCategorie()
    {
        return this.NomCategorie;
    }
    public void setIdCategorie( int id)
    {
         this.idCategorie=id;
    }
    public void setNomCategorie(String cat)
    {
         this.NomCategorie=cat;
    }
}
