<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="ISO-8859-1"%>

<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>Edit Client</title>
<link href="../../resources/css/main.css" rel="stylesheet"
	type="text/css" />
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
<script type="text/javascript">
	$(document)
			.ready(
					function() {

						$('#editClientForm')
								.submit(
										function(event) {

											var firstname = $('#firstName').val();
											var lastname = $('#lastName').val();
											var tel = $('#tel').val();
											var email = $('#email').val();
											var birthday = $('#birthday').val();
											var profession = $('#profession').val();
											var adress = $('#adress').val();
											var zip = $('#zip').val();
											var city = $('#city').val();
											var country = $('#country').val();
											     
											var json = {
												"firstName" : firstname,
												"lastName" : lastname,
												"tel" : tel,
												"email" : email,
												"birthday" : birthday,
												"profession" : profession,
												"adress" : adress,
												"zip" : zip,
												"city" : city,
												"country" : country
											};

											$
													.ajax({
														url : $(
																"#editClientForm")
																.attr("action"),
														data : JSON
																.stringify(json),
														type : "PUT",

														beforeSend : function(
																xhr) {
															xhr
																	.setRequestHeader(
																			"Accept",
																			"application/json");
															xhr
																	.setRequestHeader(
																			"Content-Type",
																			"application/json");
														},
														success : function(
																client) {
															var respContent = "";

															respContent += "<span class='success'>Client was edited: [";
															respContent += client.firstName+ " : ";
															respContent += client.lastName+ " : ";
															respContent += client.tel+ " : ";
															respContent += client.email+ " : ";
															respContent += client.birthday+ " : ";
															respContent += client.profession+ " : ";
															respContent += client.adress+ " : ";
															respContent += client.zip+ " : ";
															respContent += client.city+ " : ";
															respContent += client.country+ "]</span>";
															$(
																	"#clientFromResponse")
																	.html(
																			respContent);
														},
														
											        	error: function(jqXHR, textStatus, errorThrown) {
											        		var respBody = $.parseJSON(jqXHR.responseText);
											        		var respContent = "";
											        		
											        		respContent += "<span class='error-main'>";
											        		respContent += respBody.message;
											        		respContent += "</span>";
											        		
											        		$("#clientFromResponse").html(respContent);
											        		
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
		<h1>Edit Client</h1>
		<div id="clientFromResponse">
			<p>Here you can edit Client info:</p>
			<div id="clientFromResponse"></div>
		</div>
		<form:form id="editClientForm" method="PUT" commandName="client"
			action="${pageContext.request.contextPath}/clients/edit/${client.id}.json">
			<table>
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
					<td>Date de naissance:</td>
					<td><form:input path="birthday" /></td>
					<td class="birthday-info"></td>
				</tr>
				<tr>
					<td>Profession:</td>
					<td><form:input path="profession" /></td>
					<td class="profession-info"></td>
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
					<td class="ciy-info"></td>
				</tr>
				<tr>
					<td>Pays:</td>
					<td><form:input path="country" /></td>
					<td class="country-info"></td>
				</tr>
				<tr>
					<td><input type="submit" value="Edit" /></td>
					<td></td>
				</tr>
			</table>
		</form:form>
		<a href="${pageContext.request.contextPath}/index.html">Home page</a>
	</div>
</body>
</html>