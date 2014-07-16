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
                <div class="span10 body-container">

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
                                    Liste
                                </li>
                            </ul>
                        </div>
                    </div>
                    <div id="clientFromResponse">
					</div>
                    
                    <div class="row-fluid">

                        <div class="span12">
                            <section class="utopia-widget">
                                <div class="utopia-widget-title">
                                    <img src="<c:url value="/resources/assets/img/icons/paragraph_justify.png" />" class="utopia-widget-icon">
                                    <span>Liste des utilisateurs</span>
                                </div>
                                <div class="utopia-widget-content">
                                    <div class="pull-right">
                                        <a class="btn btn-success" href="${pageContext.request.contextPath}/users/create">
                                            <i class="icon-plus-sign icon-white"></i>
                                            Ajouter un utilisateur
                                        </a>
                                    </div>
                                </div>
                                <div class="utopia-widget-content">
                                </div>

                                <div class="utopia-widget-content">

                                    <table class="table table-bordered">
                                        <colgroup>
                                            <col class="utopia-col-0">
                                            <col class="utopia-col-1">
                                            <col class="utopia-col-0">
                                            <col class="utopia-col-1">
                                            <col class="utopia-col-0">
                                            <col class="utopia-col-1">
                                        </colgroup>
                                        <thead>
                                            <tr>

                                                <th>#</th>
                                                <th>Nom</th>
                                                <th>Prénom</th>
                                                <th class="visible-desktop">Tél</th>
                                                <th class="visible-desktop">Email</th>
                                                <th>Actions</th>
                                            </tr>
                                        </thead>

                                        <tbody>
										<c:forEach var="user" items="${users}">
										<tr>
												<td>${user.id}</td>
                                                <td>${user.firstName}</td>
                                                <td>${user.lastName}</td>
                                                <td class="visible-desktop">${user.tel}</td>
                                                <td class="visible-desktop">${user.email}</td>
                                                <td>
                                                    <a class="btn btn-info visible-desktop" href="${pageContext.request.contextPath}/user/${user.id}">
                                                        <i class="icon-info-sign icon-white"></i>
                                                        Détails
                                                    </a>
													<a class="btn-mini btn-info visible-phone visible-tablet" href="${pageContext.request.contextPath}/user/${user.id}">
                                                        <i class="icon-info-sign icon-white"></i>
                                                    </a>

                                                    <a class="btn btn-primary visible-desktop" href="${pageContext.request.contextPath}/users/edit/${user.id}">
                                                        <i class="icon-pencil icon-white"></i>
                                                        Modifier
                                                    </a>
													<a class="btn-mini btn-primary visible-phone visible-tablet" href="${pageContext.request.contextPath}/users/edit/${user.id}">
                                                        <i class="icon-pencil icon-white"></i>
                                                    </a>

                                                    <a class="btn btn-danger visible-desktop" href="${pageContext.request.contextPath}/users/delete/${user.id}.json">
                                                        <i class="icon-trash icon-white"></i>
                                                        Supprimer
                                                    </a>
													<a class="btn-mini btn-danger visible-phone visible-tablet" href="${pageContext.request.contextPath}/users/delete/${user.id}.json">
                                                        <i class="icon-trash icon-white"></i>
                                                    </a>
                                                </td>
                                            </tr>
											</c:forEach>
                                        </tbody>
                                    </table>

                                    
                                </div>
                            </section>
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
<script type="text/javascript">
   
    $(document).ready(function() {
    	
		var deleteLink = $("a:contains('Supprimer')");
      
		$(deleteLink).click(function(event) {
			$.ajax({
				url: $(event.target).attr("href"),
			  	type: "DELETE",
			  	
			  	beforeSend: function(xhr) {
			  		xhr.setRequestHeader("Accept", "application/json");
			  		xhr.setRequestHeader("Content-Type", "application/json");
			  	},
			  	success: function(client) {
			  		var respContent = "";
			  		var rowToDelete = $(event.target).closest("tr");
			  		
			  		rowToDelete.remove();
			  		var respContent = "<div class='alert alert-success'><a class='close' data-dismiss='alert' href='#'>×</a><div class='error'>";
					respContent += "l'<strong>utilisateur</strong> est bien supprimé : [";
					respContent += client.firstName+ " : ";
					respContent += client.lastName+ " : ";
					respContent += client.tel+ " : ";
					respContent += client.email+ "]</div></div>";

					$("#clientFromResponse").html(respContent);
					sleep(2000);
					window.location='/users';  	
			  				
			  	}
			});
  
			event.preventDefault();
		});
       
});   
</script>
    </body>
</html>
