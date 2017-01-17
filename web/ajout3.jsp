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
              String quantite=request.getParameter("quantite");
              String date=request.getParameter("date");
             //connexion.insertQuantiteArticle(nomArticle,quantite,date);
             response.sendRedirect("AjoutQuantite.jsp?message=Insertion  reussi");
       %>
             <h1><% out.print(nomArticle);%></h1>
             <h1><% out.print(quantite);%></h1>
             <h1><% out.print(date);%></h1>
          <% } 
           catch(Exception e)
           {
               out.print(e.getMessage());
           }
          
      %>
    </body>
    
</html>
