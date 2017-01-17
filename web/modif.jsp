<%-- 
    Document   : index
    Created on : 20 oct. 2016, 11:00:46
    Author     : User
--%>

<%@page import="java.sql.Connection"%>
<%@page import="boutique.ConnexionBase"%>
<%@page import="boutique.Article"%>
<%@page import="boutique.Categorie"%>
<%
ConnexionBase connexion=new ConnexionBase();
connexion=new ConnexionBase();              
try
{

    int idart=Integer.parseInt(request.getParameter("id"));
    String nomart=request.getParameter("nom");
    int idcat= Integer.parseInt(request.getParameter("idCat"));
    String prix=request.getParameter("prix");
    connexion.modifArticle(idart,nomart, idcat, prix);
    response.sendRedirect("ListeArticle.jsp");

}
catch(Exception e)
{
   e.printStackTrace();

}

             
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Gestion Magasin</title>
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/sb-admin.css" rel="stylesheet">
    <link href="css/plugins/morris.css" rel="stylesheet">
    <link href="font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
</head>

<body>

   

</body>

</html>

