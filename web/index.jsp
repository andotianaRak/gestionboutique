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
Article[] listeArticle;
Article[] liste;
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
                        <a href="ListeArticle.jsp"><i class="fa fa-list fa-2x"></i> Liste des Articles</a>
                    </li>
                      <li>
                        <a href="ListeCategorie.jsp"><i class="fa fa-tags fa-2x"></i> Liste des Categories</a>
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
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                <h3 class="panel-title"><i class="fa fa-search"></i>Recherche Simple:</h3>
                            </div>
                        <div class="panel-body">
                            <form  style="width:500px;" action="#" method="GET">
                                <div class="form-group input-group">
                                    <div class="row">
                                        <div class="col-lg-4">
                                                <select class="form-control" name="champ" id="select">
                                                     <option value="nomCategorie">Categorie</option>
                                                    <option value="nomArticle">Article</option>
                                                </select>
                                        </div>
                                        <div class="col-lg-4">
                                            <input type="text" class="form-control" name="motCle">
                                        </div>
                                        <div class="col-lg-4">
                                            <input class="btn btn-default" type="submit" value="Rechercher" name="test">
                                        </div>
                                    </div>
                                </div>
                            </form>
                            <div class="table-responsive">
                                <table class="table table-bordered table-hover table-striped">
                                    <thead>
                                        <tr>
                                            <th>Numero</th>
                                            <th>Categorie</th>
                                            <th>Article</th>
                                         </tr>
                                    </thead>
                                        <tbody>
                                            <%
                                             String req= request.getParameter("champ");
                                             String mot=request.getParameter("motCle");
                                             listeArticle = connexion.RechercheArticle(req,mot);

                                            for(int i=0; i<listeArticle.length; i++) { %>
                                            <tr>
                                                <td> 
                                                <% out.print(listeArticle[i].getIdArticle()); %>
                                                </td>
                                                <td> 
                                                <% out.print(listeArticle[i].getNomCategorie()); %>
                                                </td>
                                                <td> 
                                                <% out.print(listeArticle[i].getNomArticle()); %>
                                                </td>

                                            </tr>
                                            <% } %>
                                        </tbody>
                                </table>
                            </div>
                         </div>
                        </div>
                    </div>
                </div>
                <!-- /.row -->
                <div id="row">
                    <div class="col-lg-12">
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                <h3 class="panel-title"><i class="fa fa-search-plus"></i> Recherche Avancée:</h3>
                            </div>
                        <div class="panel-body">
                            <form  action="#" method="GET">
                                <div class="form-group input-group">
                                    <div class="row">
                                        <div class="col-lg-3">
                                            <input type="text" class="form-control" name="nomArticle" placeholder="Nom Article" >
                                        </div>
                                        <div class="col-lg-3">
                                           <input type="text" class="form-control"  placeholder="Categorie" name="idCat">
                                       </div>
                                        <div class="col-lg-2">
                                            <input type="text" class="form-control"  placeholder="Prix Min" name="prix1">
                                        </div>
                                        <div class="col-lg-2">
                                            <input type="text" class="form-control"  placeholder="Prix Max" name="prix2">
                                        </div>
                                        <div class="col-lg-2">
                                           <input class="btn btn-default" type="submit" value="Rechercher" name="test2">
                                       </div>
                                        </div>
                                    </div>
                            </form>
                            <div class="table-responsive">
                            <table class="table table-bordered table-hover table-striped">
                                <thead>
                                    <tr>
                                        <th>Numero</th>
                                        <th>Categorie</th>
                                        <th>Article</th>
                                        <th>Prix</th>
                                     </tr>
                                </thead>
                                <tbody>
                                <%
                                if(request.getParameter("test2")!=null)
                                {

                                    String champ1=champ1= request.getParameter("nomArticle" );
                                    String champ2=request.getParameter("idCat");
                                    String champ3=request.getParameter("prix1");
                                    String champ4=request.getParameter("prix2");
                                    try
                                    {
                                        liste = connexion.RechercheAvance(champ1,champ2,champ3,champ4);
                                         for(int i=0; i<liste.length; i++) { %>
                                        <tr>
                                            <td> 
                                            <% out.print(liste[i].getIdArticle()); %>
                                            </td>
                                            <td> 
                                            <% out.print(liste[i].getNomCategorie()); %>
                                            </td>
                                            <td> 
                                            <% out.print(liste[i].getNomArticle()); %>
                                            </td>
                                            <td> 
                                            <% out.print(liste[i].getPrixArticle()); %>
                                            </td>
                                        </tr>
                                        <% }
                                    }
                                    
                                    catch(Exception e)
                                    {
                                        e.printStackTrace();
                                    }
                                   
                                }
                              
                                %>
                                </tbody>
                            </table>
                         </div>
                    </div>
                        </div>
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
    

</body>

</html>

