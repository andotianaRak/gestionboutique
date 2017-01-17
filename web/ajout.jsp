<%-- 
    Document   : ajout
    Created on : 27 oct. 2016, 14:30:04
    Author     : User
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import=" boutique.ConnexionBase" %>
<%@ page import="boutique.Categorie" %>
<% ConnexionBase connexion=new ConnexionBase();%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
       
       <%
           try
           {
               String NomCat= request.getParameter("nomCat");
                connexion.insertCategorie(NomCat);
                 response.sendRedirect("ListeCategorie.jsp");
           }
           catch( Exception e)
           {
               out.println(e.getMessage());
           }
        %>
    </body>
</html>
