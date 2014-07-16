<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>L'espace professionnel des huissiers de justice</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="EPSI">

    <!-- styles -->

<link href="<c:url value="/resources/assets/css/baillifswap.css" />" rel="stylesheet">
<link href="<c:url value="/resources/assets/css/baillifswap-responsive.css" />" rel="stylesheet">
<script type="text/javascript" src="<c:url value="/resources/assets/js/jquery.min.js" />"></script>
    <link href="<c:url value="/resources/assets/css/ie.css" />" rel="stylesheet"/>


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
            <%@ include file="/WEB-INF/views/includes/head.jsp" %>

            <!-- Header ends -->

            <div class="row-fluid">

                <!-- Sidebar statrt -->
                <%@ include file="/WEB-INF/views/includes/slidebar.jsp" %>

                <!-- Sidebar end -->

                <!-- Body start -->
                <div class="span10">

                    <div class="row-fluid">
                        <div class="span12">
                            <section class="utopia-widget">
                                <div class="utopia-widget-title">
                                    <img src="<c:url value="/resources/assets/img/icons/font.png" />" class="utopia-widget-icon">
                                    <span>Comment ça fonctionne</span>
                                </div>

                                <div class="utopia-widget-content">
                                    <h3>Comment ça marche</h3>
                                    <p>Explication de fonctionnement avec des imrpimes écran</p>
                                </div>
                            </section>
                        </div>
                    </div>


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
