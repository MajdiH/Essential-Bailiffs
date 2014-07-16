<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="ISO-8859-1"%>

<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>Create new User</title>
<link href="../resources/css/main.css" rel="stylesheet" type="text/css" />
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
<script type="text/javascript">
	$(document)
			.ready(
					function() {

						$('#newUserForm')
								.submit(
										function(event) {

											var username = $('#username').val();
											var password = $('#password').val();
											var firstname = $('#firstName').val();
											var lastname = $('#lastName').val();
											var tel = $('#tel').val();
											var email = $('#email').val();
											var adress = $('#adress').val();
											var zip = $('#zip').val();
											var city = $('#city').val();
											var country = $('#country').val();
											     
											var json = {
												"username" : username,
												"password" : password,
												"firstName" : firstname,
												"lastName" : lastname,
												"tel" : tel,
												"email" : email,
												"adress" : adress,
												"zip" : zip,
												"city" : city,
												"country" : country
											};

											$
													.ajax({
														url : $(
																"#newUserForm")
																.attr("action"),
														data : JSON
																.stringify(json),
														type : "POST",

														beforeSend: function(xhr) {
											        		xhr.setRequestHeader("Accept", "application/json");
											        		xhr.setRequestHeader("Content-Type", "application/json");
											        		$(".error").remove();
											        	},
														success : function(user) {
															var respContent = "";
															respContent += "<span class='success'>User was created: [";
															respContent += user.username+ "]</span>";

															$("#userFromResponse").html(respContent);
														},
													
										        	error: function(jqXHR, textStatus, errorThrown) {
										        		var respBody = $.parseJSON(jqXHR.responseText);
										        		var respContent = "";
										        		
										        		respContent += "<span class='error-main'>";
										        		respContent += respBody.message;
										        		respContent += "</span>";
										        		
										        		$("#userFromResponse").html(respContent);
										        		
										        		$.each(respBody.fieldErrors, function(index, errEntity) {
										        			var tdEl = $("."+errEntity.fieldName+"-info");
										        			tdEl.html("<span class=\"error\">"+errEntity.fieldError+"</span>");
										        		});
										        	}
													});

											event.preventDefault();
										});

					});
</script>
</head>
<body>
	<div id="container">
		<h1>Create new User</h1>
		<div>
			<p>Here you can create new User:</p>
			<div id="userFromResponse"></div>
		</div>
		<form:form id="newUserForm"
			action="${pageContext.request.contextPath}/users/create.json"
			commandName="user">
			<table>
				<tr>
					<td>Username:</td>
					<td><form:input path="username" /></td>
					<td class="username-info"></td>
				</tr>
				<tr>
					<td>Password:</td>
					<td><form:input path="password" /></td>
					<td class="password-info"></td>
				</tr>
				<tr>
					<td>Nom:</td>
					<td><form:input path="firstName" /></td>
					<td class="firstName-info"></td>
				</tr>
				<tr>
					<td>Prenom:</td>
					<td><form:input path="lastName" /></td>
					<td class="lastName-info"></td>
				</tr>
				<tr>
					<td>Tel:</td>
					<td><form:input path="tel" /></td>
					<td class="tel-info"></td>
				</tr>
				<tr>
					<td>Email:</td>
					<td><form:input path="email" /></td>
					<td class="email-info"></td>
				</tr>
				
				<tr>
					<td>Adress:</td>
					<td><form:input path="adress" /></td>
					<td class="adress-info"></td>
				</tr>
				<tr>
					<td>Code postal:</td>
					<td><form:input path="zip" /></td>
					<td class="zip-info"></td>
				</tr>
				<tr>
					<td>Ville:</td>
					<td><form:input path="city" /></td>
					<td class="city-info"></td>
				</tr>
				<tr>
					<td>Pays:</td>
					<td><form:input path="country" /></td>
					<td class="country-info"></td>
				</tr>
				<tr>
					<td><input type="submit" value="Create" /></td>
					<td></td>
				</tr>
			</table>
		</form:form>
		<a href="${pageContext.request.contextPath}/index.html">Home page</a>
	</div>
</body>
</html>