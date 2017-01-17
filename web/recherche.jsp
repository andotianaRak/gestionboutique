<%-- 
    Document   : recherche.jsp
    Created on : 10 nov. 2016, 10:48:07
    Author     : User
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.Connection"%>
<%@page import="boutique.ConnexionBase"%>
<%@page import="boutique.Article"%>
<%@page import="boutique.Categorie"%>
<%
ConnexionBase connexion=new ConnexionBase();
Categorie[]listeCat;
Article[] listeArticle;
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
         <div class="table-responsive">
                    <table class="table table-bordered table-hover table-striped">
                        <thead>
                            <tr>
                                <th>Articles</th>
                                <th>Categorie</th>
                                <th>Prix Unitaire</th>
                             </tr>
                        </thead>
                        <tbody>
                            <%
                             String cat= request.getParameter("idCat");
                             String mot=request.getParameter("motCle");
                             listeArticle = connexion.RechercheArticle(cat,mot);

                            for(int i=0; i<listeArticle.length; i++) { %>
                            <tr>
                                <td> 
                                <% out.print(listeArticle[i].getNomCategorie()); %>
                                </td>
                                <td> 
                                <% out.print(listeArticle[i].getNomArticle()); %>
                                </td>
                                <td> 
                                prix
                                </td>
                            </tr>
                            <% } %>
                        </tbody>
                    </table>
                </div>
    </body>
</html>
