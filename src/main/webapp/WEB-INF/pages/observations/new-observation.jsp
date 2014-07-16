<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="ISO-8859-1"%>

<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>



<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>Create new Client</title>
<link href="../resources/css/main.css" rel="stylesheet" type="text/css" />
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
<script type="text/javascript">
	$(document)
			.ready(
					function() {

						$('#newObservationForm')
								.submit(
										function(event) {

											var userId = $('#userId').val();
											var clientId = $('#clientId').val();
											var createdAt = $('#createdAt')
													.val();
											var statement = $('#statement')
													.val();
											var comment = $('#comment').val();

											var json = {
												"userId" : userId,
												"clientId" : clientId,
												"createdAt" : createdAt,
												"statement" : statement,
												"comment" : comment
											};

											$
													.ajax({
														url : $(
																"#newObservationForm")
																.attr("action"),
														data : JSON
																.stringify(json),
														type : "POST",

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
															$(".error")
																	.remove();
														},
														success : function(
																observation) {
															var respContent = "";
															respContent += "<span class='success'>Observation was created: [";
															respContent += observation.userId
																	+ " : ";
															respContent += observation.clientId
																	+ " : ";
															respContent += observation.createdAt
																	+ " : ";
															respContent += observation.statement
																	+ " : ";
															respContent += observation.comment
																	+ "]</span>";

															$(
																	"#observationFromResponse")
																	.html(
																			respContent);
														},

														error : function(jqXHR,
																textStatus,
																errorThrown) {
															var respBody = $
																	.parseJSON(jqXHR.responseText);
															var respContent = "";

															respContent += "<span class='error-main'>";
															respContent += respBody.message;
															respContent += "</span>";

															$(
																	"#observationFromResponse")
																	.html(
																			respContent);

															$
																	.each(
																			respBody.fieldErrors,
																			function(
																					index,
																					errEntity) {
																				var tdEl = $("."
																						+ errEntity.fieldName
																						+ "-info");
																				tdEl
																						.html("<span class=\"error\">"
																								+ errEntity.fieldError
																								+ "</span>");
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
		<h1>Create new Observation</h1>
		<div>
			<p>Here you can create new Observation:</p>
			<div id="observationFromResponse"></div>
		</div>
		<form:form id="newObservationForm"
 			action="${pageContext.request.contextPath}/observations/create.json"
 			enctype="multipart/form-data"
			commandName="observation">
			<table>
				<tr>
					<td><c:forEach var="client" items="${clientsList}">
					${client.firstName}
					</c:forEach></td>
					<td></td>
					<td></td>
				</tr>
				<tr>
					<td>userId:</td>
					<td><form:input value="${userId}" path="userId" /></td>
					<td class="userId-info"></td>
				</tr>
				<tr>
					<td>clientId:</td>
					<td><form:input path="clientId" /></td>
					<td class="clientId-info"></td>
				</tr>
				<tr>
					<td>CreatedAt:</td>
					<td><form:input path="createdAt" /></td>
					<td class="createdAt-info"></td>
				</tr>
				<tr>
					<td>statement:</td>
					<td><form:input path="statement" /></td>
					<td class="statement-info"></td>
				</tr>
				<tr>
					<td>Comment:</td>
					<td><form:input path="comment" /></td>
					<td class="comment-info"></td>
				</tr>
				<tr>
					<td><input type="file" name="files[]"></td>
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