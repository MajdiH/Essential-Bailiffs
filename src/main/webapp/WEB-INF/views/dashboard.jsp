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
    <link href="assets/css/ie8.css" rel="stylesheet">
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
            <div class="span10 body-container">

                <div class="row-fluid">

                    <!--Chart Icons -->
                    <div class="span3">
                        <div class="utopia-chart-legend">
                            <div class="utopia-chart-icon">
                                <img src="<c:url value="/resources/assets/img/icons2/id.png"/>">
                            </div>
                            <div class="utopia-chart-heading">191</div>
                            <div class="utopia-chart-desc">CLIENTS</div>
                        </div>
                    </div>

                    <div class="span3">
                        <div class="utopia-chart-legend">
                            <div class="utopia-chart-icon">
                                <img src="<c:url value="/resources/assets/img/icons2/notepad.png"/>">
                            </div>
                            <div class="utopia-chart-heading">2191</div>
                            <div class="utopia-chart-desc">CONSTATS</div>
                        </div>
                    </div>
					<security:authorize access="hasRole('ROLE_ADMIN')">
                    <div class="span3">
                        <div class="utopia-chart-legend">
                            <div class="utopia-chart-icon">
                                <img src="<c:url value="/resources/assets/img/icons2/messenger.png"/>">
                            </div>
                            <div class="utopia-chart-heading">12</div>
                            <div class="utopia-chart-desc">SECRETAIRES</div>
                        </div>
                    </div>
					
                    <div class="span3">
                        <div class="utopia-chart-legend">
                            <div class="utopia-chart-icon">
                                <img src="<c:url value="/resources/assets/img/icons2/administrator.png"/>">
                            </div>
                            <div class="utopia-chart-heading">130</div>
                            <div class="utopia-chart-desc">HUISSIERS</div>
                        </div>
                    </div>
                    </security:authorize>
                    <!--Chart Icons End -->
                </div>


                <div class="row-fluid">

                    <div class="span12">

                        
                    </div>

                </div>
            </div>
        <!-- Body end -->

    </div>

    <!-- Maincontent end -->

</div> <!-- end of container -->

<!-- javascript placed at the end of the document so the pages load faster -->
<script type="text/javascript" src="<c:url value="/resources/assets/js/utopia.js" />"></script>
<script type="text/javascript" src="<c:url value="/resources/assets/js/header.js?v1" />"></script>
<script type="text/javascript" src="<c:url value="/resources/assets/js/sidebar.js" />"></script>
</body>
</html>
