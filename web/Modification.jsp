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
Categorie[]listeCat;
String id=request.getParameter("idarticle");
String nomarticle=request.getParameter("nom");
String prixarticle=request.getParameter("prix");
String categorie=request.getParameter("cat");
String image=request.getParameter("im");
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
                <a class="navbar-brand" href="index.jsp">Admin</a>
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
                        <a href="ListeArticle.jsp"><i class="fa fa-bar-chart fa-2x"></i>  Liste des Articles</a>
                    </li>
                    <li>
                        <a href="ListeCategorie.jsp"><i class="fa fa-bar-chart fa-2x"></i>  Liste des Categories</a>
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
                <div class="row">
                    <div class="col-lg-3">
                        <div class="panel panel-yellow">
                            <div class="panel-heading">
                                <div class="row">
                                    <div class="col-xs-3">
                                        <i class="fa fa-shopping-cart fa-5x"></i>
                                    </div>
                                    <div class="col-xs-9 text-right">
                                         <div class="huge">20</div>
                                        <div>Produits vendus</div>
                                    </div>
                                </div>
                            </div>
                            <a href="#">
                                <div class="panel-footer">
                                    <span class="pull-left">Voir detail</span>
                                    <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                                    <div class="clearfix"></div>
                                </div>
                            </a>
                        </div>
                    </div>
                    <div class="col-lg-3">
                        <div class="panel panel-primary">
                            <div class="panel-heading">
                                <div class="row">
                                    <div class="col-xs-3">
                                        <i class="fa fa-list-alt fa-5x"></i>
                                    </div>
                                    <div class="col-xs-9 text-right">
                                         <div class="huge">20</div>
                                        <div>Nombre Categorie</div>
                                    </div>
                                </div>
                            </div>
                            <a href="#">
                                <div class="panel-footer">
                                    <span class="pull-left">Voir detail</span>
                                    <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                                    <div class="clearfix"></div>
                                </div>
                            </a>
                        </div>
                    </div>
                    <div class="col-lg-3">
                        <div class="panel panel-green">
                            <div class="panel-heading">
                                <div class="row">
                                    <div class="col-xs-3">
                                        <i class="fa fa-user fa-5x"></i>
                                    </div>
                                    <div class="col-xs-9 text-right">
                                         <div class="huge">20</div>
                                        <div>Nombre Employés</div>
                                    </div>
                                </div>
                            </div>
                            <a href="#">
                                <div class="panel-footer">
                                    <span class="pull-left">Voir detail</span>
                                    <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                                    <div class="clearfix"></div>
                                </div>
                            </a>
                        </div>
                    </div>
                    <div class="col-lg-3">
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                <div class="row">
                                    <div class="col-xs-3">
                                        <i class="fa fa-users fa-5x"></i>
                                    </div>
                                    <div class="col-xs-9 text-right">
                                        <div class="huge">20</div>
                                        <div> Clients Inscrits</div>
                                    </div>
                                </div>
                            </div>
                            <a href="#">
                                <div class="panel-footer">
                                    <span class="pull-left">Voir detail</span>
                                    <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                                    <div class="clearfix"></div>
                                </div>
                            </a>
                        </div>
                    </div>
                </div>
		<div id="row">
                    <div class="col-lg-12">
                         <div class="panel panel-primary">
                            <div class="panel-heading">
                                <h3 class="panel-title">Modification Article:</h3>
                            </div>
                        <div class="panel-body">
                       
                        <form role="form" method="get" action="modif.jsp">
                            <div class="form-group">
                                <label>Nom Article:</label>
                                <input class="form-control" placeholder="" name="nom" value="<% out.print(nomarticle);%>">
				<label>Categorie Initiale</label>
                                <input class="form-control" placeholder="" name="nom" value="<% out.print(categorie);%>" style="width:200px;" disabled="disabled" >
                                <label>Categorie:</label>
                                <select class="form-control" name="idCat" id="select">
                                <%
                                    listeCat= connexion.getCategorie();
                                    for(int i=0; i<listeCat.length; i++) { 
                                 %>
                                <option value="<% out.print(listeCat[i].getIdCategorie());%>"> <% out.println(listeCat[i].getNomCategorie()); %>  </option>;
                                <% }%>
                                </select>
                                <label>Prix Unitaire:</label>
                                <input class="form-control" placeholder="" name="prix" value="<%out.print(prixarticle); %>">
                                <br>
                                <input type="hidden" name="id" value="<% out.print(id);%>">
                                <input type="submit" class="btn btn-primary" value="Modifier" name="btnmodif">
                            </div>
			</form>
                        </div>
                        
                    </div>
                   
                </div>
                <!-- /.row -->
               
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
    

</body>

</html>

