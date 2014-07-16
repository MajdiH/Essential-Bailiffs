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
<title>Create new Media</title>
<script src="<c:url value="/resources/assets/js/jquery.1.9.1.min.js" />"></script>
<script src="<c:url value="/resources/assets/js/jquery.fileupload.js" />"></script>

<script type="text/javascript">
	$(document)
			.ready(
					function() {

						$('#newMediasForm')
								.submit(
										function(event) {

											var observationId = $('#observationId').val();
											var files = $('#fileupload').get(0).files;
											$.each(files,function(i,file){
											var json = {"observationId" : observationId,"fileName" : file.name
													,"fileSize" : file.size,"fileType" : file.type};
											$.ajax({
												url : $("#newMediasForm").attr("action"),
												data : JSON.stringify(json),
												type : "POST",

												beforeSend : function(xhr) {
													xhr.setRequestHeader("Accept","application/json");
													xhr.setRequestHeader("Content-Type","application/json");
													$(".error").remove();
												}
											});
											});

											

											event.preventDefault();
										});

					});
</script>
</head>
<body>
	<div id="container">
		<h1>Create new Medias</h1>
		<div>
			<p>Here you can create new Medias:</p>
		</div>
		<form:form id="newMediasForm"
			action="${pageContext.request.contextPath}/medias/create.json"
			commandName="fileMeta">
			<table>

				<tr>
					<td>ObservationId:</td>
					<td><form:input path="observationId" /></td>
				</tr>
				<tr>
					<td><input id="fileupload" type="file" name="files[]" multiple></td>
					<td></td>
				</tr>

				<tr>
					<td><input type="submit" value="Create" /></td>
					<td></td>
				</tr>
			</table>
		</form:form>
	</div>
</body>
</html>