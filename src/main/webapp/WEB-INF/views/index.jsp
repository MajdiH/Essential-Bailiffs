<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
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

<!-- Le HTML5 shim, for IE6-8 support of HTML5 elements -->
<!--[if lt IE 9]>
    <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
    <![endif]-->


</head>

<body>
	<div class="container-fluid">

		<div class="row-fluid">
			<div class="span12">
				<div class="utopia-login-message">
					<h1>Bienvenue à  l'espace professionnel des huissiers de
						justice</h1>
					<p>Identifiez-vous pour avoir accès</p>
				</div>
			</div>
		</div>

		<div class="row-fluid">

			<div class="span12">


				<div class="utopia-login">
					<c:if test="${error == true}">
						<div class="alert alert-error">
							<a class="close" data-dismiss="alert" href="#">×</a>
							<div class="error">
								<strong>login</strong> ou bien <strong>mot de
									passe</strong> invalide.
							</div>
						</div>
					</c:if>
					<h1>Connexion</h1>
					<form action="<c:url value='j_spring_security_check'/>"
						method="post" class="utopia">
						<label>Login:</label> <input type="text" name="j_username"
							id="j_username"
							class="span12 utopia-fluid-input validate[required]"> <label>Mot
							de passe:</label> <input type="password" name="j_password"
							id="j_password"
							class="span12 utopia-fluid-input validate[required]">

						<ul class="utopia-login-action">
							<li><input type="submit" class="btn span4" value="Login">
							</li>
						</ul>

						<label><a href="#">Vous ne pouvez pas accéder à  votre
								compte?</a></label>
					</form>
				</div>
			</div>



		</div>
	</div>
	<!-- end of container -->
<script type="text/javascript" src="<c:url value="/resources/assets/js/utopia.js" />"></script>
<script type="text/javascript" src="<c:url value="/resources/assets/js/header.js?v1" />"></script>
<script type="text/javascript" src="<c:url value="/resources/assets/js/sidebar.js" />"></script>	
</body>
</html>