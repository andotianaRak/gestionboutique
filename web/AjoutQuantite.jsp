<%-- 
    Document   : AjoutArticle
    Created on : 27 oct. 2016, 10:13:18
    Author     : User
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import=" boutique.ConnexionBase" %>
<%@ page import="boutique.Categorie" %>
<% ConnexionBase connexion=new ConnexionBase();
Categorie[]listeCat;
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

    <div id="wrapper">

        <!-- Navigation -->
        <nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-ex1-collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="index.html">Admin</a>
            </div>
            <!-- Top Menu Items -->
            <ul class="nav navbar-right top-nav">
             
                
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="fa fa-user"></i> Deconnecter <b class="caret"></b></a>
                </li>
            </ul>
            <!-- Sidebar Menu Items - These collapse to the responsive navigation menu on small screens -->
            <div class="collapse navbar-collapse navbar-ex1-collapse">
                <ul class="nav navbar-nav side-nav">
                    <li class="active">
                        <a href="index.jsp"><i class="fa fa-home fa-2x"></i> Accueil</a>
                    </li>
                     
                    <li>
                        <a href="Stock.html"><i class="fa fa-table fa-2x"></i> Stock </a>
                    </li>
                    <li>
                        <a href="ChiffreAffaire.html"><i class="fa fa-money fa-2x"></i> Chiffre d'affaire</a>
                    </li>
                    <li>
                        <a href="Statistique.html"><i class="fa fa-bar-chart fa-2x"></i>  Statistique des ventes</a>
                    </li>
                    <li>
                        <a href="javascript:;" data-toggle="collapse" data-target="#demo"><i class="fa fa-plus-circle fa-2x"></i>  Ajout<i class="fa fa-fw fa-caret-down"></i></a>
                        <ul id="demo" class="collapse">
                            <li>
                                <a href="AjoutCategorie.jsp">Categorie</a>
                            </li>
                            <li>
                                <a href="AjoutArticle.jsp">Article</a>
                            </li>
                        </ul>
                     </li>
                </ul>
            </div>
            <!-- /.navbar-collapse -->
        </nav>

        <div id="page-wrapper">

            <div class="container-fluid">
				<!-- Page Heading -->
                <div class="row">
                    <div class="col-lg-12">
                        <h3 class="page-header">
                            Ajout quantit&eacute d'article:
                        </h3>
                    </div>
                </div>
		<div class="row">
                    <div class="col-lg-12">
                        <form role="form" method="get" action="ajout3.jsp">
                            <div class="form-group">
                                <label>Nom Article</label>
                                <input class="form-control" placeholder="" name="nom" value="">
				<label>Quantité</label>
                                 <input class="form-control" placeholder="" name="nom" value="">
                                <label>Date d'entree:</label>
                                <input class="form-control" placeholder="" name="date" type="date">
                                <br>
                                <input type="submit" class="btn btn-primary" value="Terminer">
                            </div>
			</form>
                         <% if(request.getParameter("message")!=null) { %>
                          
                                   <div class="alert alert-success" >
                                       <strong><% out.print(request.getParameter("message")); %></strong>
                                    </div>
                                    
                                    <% }
                                    else
                                    {} %>
                    </div>
                </div>
            </div>
            <!-- /.container-fluid -->

        </div>
        <!-- /#page-wrapper -->

    </div>
    <!-- /#wrapper -->

    <!-- jQuery -->
    <script src="js/jquery.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="js/bootstrap.min.js"></script>

    <!-- Morris Charts JavaScript -->
    <script src="js/plugins/morris/raphael.min.js"></script>
    <script src="js/plugins/morris/morris.min.js"></script>
    <script src="js/plugins/morris/morris-data.js"></script>

</body>

</html>
