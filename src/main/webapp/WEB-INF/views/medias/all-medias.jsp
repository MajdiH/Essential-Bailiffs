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
                                    <a href="#">Medias</a> <span class="divider">/</span>
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
                                    <span>Liste des images</span>
                                </div>


                                <div class="utopia-widget-content">

                                   <div class="utopia-widget-content">
                                    <div class="pull-right">
                                        <a class="btn btn-success" href="${pageContext.request.contextPath}/medias/create">
                                            <i class="icon-plus-sign icon-white"></i>
                                            Ajouter une image
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
                                                <th>Constat</th>
                                                <th>Image</th>
                                                <th>Actions</th>
                                            </tr>
                                        </thead>

                                        <tbody>
                                        	<c:forEach var="media" items="${allMedias}">
                                            <tr>
                                                <td>${media.id }</td>
                                                <td>${media.observationId }</td>
                                                <td>${media.fileName }</td>
                                                <td>
                                                   

                                                    <a class="btn btn-danger visible-desktop" href="${pageContext.request.contextPath}/medias/delete/${media.id}.json"">
                                                        <i class="icon-trash icon-white"></i>
                                                        Supprimer
                                                    </a>
													
						    <a class="btn-mini btn-danger visible-tablet visible-phone" href="${pageContext.request.contextPath}/medias/delete/${media.id}.json"">
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
        <script type="text/javascript" src="assets/js/utopia.js"></script>
        <script type="text/javascript" src="assets/js/header.js?v1"></script>
        <script type="text/javascript" src="assets/js/sidebar.js"></script>
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
			  	success: function(media) {
			  		var respContent = "";
			  		var rowToDelete = $(event.target).closest("tr");
			  		
			  		rowToDelete.remove();
			  		var respContent = "<div class='alert alert-success'><a class='close' data-dismiss='alert' href='#'>×</a><div class='error'>";
					respContent += "le <strong>Media</strong> est bien supprimé : [";
					respContent += media.fileName+ "]</div></div>";

					$("#clientFromResponse").html(respContent);
					sleep(2000);
					window.location='/observations';  	
			  				
			  	}
			});
  
			event.preventDefault();
		});
       
});   
</script>
    </body>
</html>
