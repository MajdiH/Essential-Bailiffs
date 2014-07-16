<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <title>Bienvenue à l''espace professionnel des huissiers de justice</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="">
        <meta name="author" content="EPSI">

        <!-- styles -->

        <link href="../assets/css/baillifswap.css" rel="stylesheet">
        <link href="../assets/css/baillifswap-responsive.css" rel="stylesheet">
        <link href="../assets/css/ie.css" rel="stylesheet"/>

        <script type="text/javascript" src="../assets/js/jquery.min.js"></script>


        <!--[if IE 8]>
        <link href="../assets/css/ie8.css" rel="stylesheet">
        <![endif]-->

        <!-- Le HTML5 shim, for IE6-8 support of HTML5 elements -->
        <!--[if lt IE 9]>
        <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
        <![endif]-->

        <!--[if gte IE 9]>
          <style type="text/css">
            .gradient {
               filter: none;
            }
          </style>
        <![endif]-->

    </head>

    <body>

        <div class="container-fluid">

            <!-- Header starts -->
            <div class="row-fluid">
                <div class="span12">

                    <div class="header-top">

                        <div class="header-wrapper">

                            <a href="#" class="utopia-logo"><img src="../assets/img/logo.png" alt=""></a>

                            <div class="header-right">

                                <div class="header-divider">&nbsp;</div>

                                 <div class="visible-phone header-divider">
                                        <a href="obeservations/select-observation.html"><img src="../assets/img/icons/camera.png" alt="Search"></a>

                                </div>

                                <div class="search-panel header-divider visible-desktop">
                                    <div class="search-box">
                                        <img src="../assets/img/icons/zoom.png" alt="Search">
                                        <form action="" method="post">
                                            <input type="text" name="search" placeholder="Recherche"/>
                                        </form>
                                    </div>
                                </div>

                                <div class="user-panel header-divider">
                                    <div class="user-info">
                                        <img src="../assets/img/icons/user.png" alt="">
                                        <a href="#">Jean Valjean</a>
                                    </div>

                                    <div class="user-dropbox">
                                        <ul>
                                            <li class="user"><a href="../users/edit/1">Profile</a></li>
                                            <li class="settings"><a href="">Paramètres</a></li>
                                            <li class="logout"><a href="../logout.html">Déconnexion</a></li>
                                        </ul>
                                    </div>

                                </div><!-- User panel end -->

                            </div><!-- End header right -->

                        </div><!-- End header wrapper -->

                    </div><!-- End header -->

                </div>

            </div>

            <!-- Header ends -->

            <div class="row-fluid">

                <!-- Sidebar statrt -->
                <div class="span2 sidebar-container">

                    <div class="sidebar">

                        <div class="navbar sidebar-toggle">
                            <div class="container">

                                <a class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse">
                                    <span class="icon-bar"></span>
                                    <span class="icon-bar"></span>
                                    <span class="icon-bar"></span>
                                </a>

                            </div>
                        </div>

                        <div class="nav-collapse collapse leftmenu">

                           <ul>
                                <li class="current"><a class="dashboard smronju" href="../dashboard.html" title="Dashboard"><span>Tableau de bord</span></a></li>
                                <li><a class="users" href="../clients/all-clients.html" title="Clients"><span>Clients</span></a>
                                <li><a class="tables" href="../obeservations/all-observations.html" title="Observations"><span>Constats</span></a>
                                <li><a class="tables" href="../pictures/all-pictures.html" title="Pictures"><span>Images</span></a>
                            </ul>
                            <ul style="margin-top:10px">
                                <li><a class="users" href="../users/all-users.html" title="Baillifs"><span>Huissiers</span></a>   
                                <li><a class="users" href="../users/all-users.html" title="Tables"><span>Secretaires</span></a>    
                            </ul>
                            <ul style="margin-top:10px">
                                <li><a class="tables" href="../pages/howisworking.html" title="How is working d"><span>Comment ça fonctionne</span></a>
                            </ul>

                        </div>

                    </div>
                </div>

                <!-- Sidebar end -->

                <!-- Body start -->
                <div class="span10">

                    <div class="row-fluid">
                        <div class="span12">
                            <ul class="breadcrumb">
                                <li>
                                    <a href="#">Home</a> <span class="divider">/</span>
                                </li>
                                <li>
                                    <a href="#">Utilisateurs</a> <span class="divider">/</span>
                                </li>
                                <li>
                                    Nouveau
                                </li>
                            </ul>
                        </div>
                    </div>

                    <section id="formElement" class="utopia-widget utopia-form-box section">
                        <div class="utopia-widget-title">
                            <img src="../assets/img/icons2/software24.png" class="utopia-widget-icon">
                            <span>Ajouter un utilisateur</span>
                        </div>

                        <div class="row-fluid">
                            <div class="utopia-widget-content">
                                <div class="span12 utopia-form-freeSpace">
                                    <form class="form-horizontal">
                                        <fieldset>
                                            <div class="control-group ">
                                                <label class="control-label" for="username">Login</label>

                                                <div class="controls">
                                                    <input id="username" name="username" class="span6" type="text">
                                                     
                                                </div>
                                            </div>
                                            <div class="control-group ">
                                                <label class="control-label" for="password">Mot de passe</label>

                                                <div class="controls">
                                                    <input id="password" name="password" class="span6" type="password">
                                                     
                                                </div>
                                            </div>
                                            <div class="control-group ">
                                                <label class="control-label" for="firstName">Prénom</label>

                                                <div class="controls">
                                                    <input id="firstName" name="firstName" class="span6" type="text">
                                                     
                                                </div>
                                            </div>
                                            <div class="control-group ">
                                                <label class="control-label" for="lastName">Nom</label>

                                                <div class="controls">
                                                    <input id="lastName" name="lastName" class="span6" type="text">
                                                     
                                                </div>
                                            </div>
                                            <div class="control-group ">
                                                <label class="control-label" for="tel">Telephone</label>

                                                <div class="controls">
                                                    <input id="tel" name="tel" class="span3" type="text">
                                                     
                                                </div>
                                            </div>
                                            <div class="control-group ">
                                                <label class="control-label" for="email">Email</label>

                                                <div class="controls">
                                                    <input id="email" name="email" class="span6" type="text">
                                                     
                                                </div>
                                            </div>
                                            
                                            <div class="control-group ">
                                                <label class="control-label" for="adress">Adresse</label>

                                                <div class="controls">
                                                    <input id="adress" name="adress" class="span6" type="text">
                                                     
                                                </div>
                                            </div>
                                            <div class="control-group ">
                                                <label class="control-label" for="zip">Code postal</label>

                                                <div class="controls">
                                                    <input id="zip" name="zip" class="span2" type="text">
                                                     
                                                </div>
                                            </div>
                                            <div class="control-group ">
                                                <label class="control-label" for="city">Ville</label>

                                                <div class="controls">
                                                    <input id="city" name="city" class="span3" type="text">
                                                     
                                                </div>
                                            </div>
                                            <div class="control-group ">
                                                <label class="control-label" for="country">Pays</label>

                                                <div class="controls">
                                                    <input id="country" name="country" class="span3" type="text">
                                                     
                                                </div>
                                            </div>
                                            <div class="control-group ">

                                                <div class="controls">
                                                    <button class="btn btn-success span3" href="javascript:void(0)">Ajouter</button>
                                                </div>
                                            </div>
                                        </fieldset>
                                    </form>
                                </div>


                            </div>
                        </div>
                    </section>


                </div><!-- Body end -->
            </div>

            <!-- Maincontent end -->

        </div> <!-- end of container -->

        <!-- javascript placed at the end of the document so the pages load faster -->
        <script type="text/javascript" src="assets/js/utopia.js"></script>
        <script type="text/javascript" src="assets/js/header.js?v1"></script>
        <script type="text/javascript" src="assets/js/sidebar.js"></script>
    </body>
</html>
