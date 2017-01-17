<%-- 
    Document   : ajout2
    Created on : 27 oct. 2016, 15:12:05
    Author     : User
--%>

<%@ page import=" boutique.ConnexionBase" %>
<%@ page import="boutique.Categorie" %>
<% ConnexionBase connexion=new ConnexionBase();%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Magasin</title>
    </head>
    <body>
       <%
          try
          {
              String nomArticle= request.getParameter("nom");
            int idcat= Integer.parseInt(request.getParameter("idCat"));
            String img=request.getParameter("url");
            int prix=Integer.parseInt(request.getParameter("prix"));
            connexion.insertArticle(idcat,nomArticle,img,prix);
           response.sendRedirect("ListeArticle.jsp");
          
          }
           catch(Exception e)
           {
               out.print(e.getMessage());
           }
          
      %>
    </body>
</html>
