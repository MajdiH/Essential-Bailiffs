<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="ISO-8859-1"%>

<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>All Clients</title>
<link href="resources/css/main.css" rel="stylesheet" type="text/css"/>
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
<script type="text/javascript">
   
    $(document).ready(function() {
    	
		var deleteLink = $("a:contains('Delete')");
      
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
			  		
			  		respContent += "<span class='success'>Client was deleted: [";
			  		respContent += client.firstName + " : ";
			  		respContent += client.lastName + " : " ;
			  		respContent += client.tel + " : " ;
			  		respContent += client.email + "]</span>";
			  		
			  		$("#clientFromResponse").html(respContent);   		
			  	}
			});
  
			event.preventDefault();
		});
       
});   
</script>

</head>
<body>
<div id="container">
<h1>All Clients</h1>
<div>
<p>Here you can see a list of Clients:</p>
<div id="clientFromResponse"></div>
</div>
	<table border="1px" cellpadding="0" cellspacing="0">
	<thead>
	<tr>
	<th>Prenom</th><th>Nom</th><th>Tel</th>
	<th>email</th><th>Date de naissance</th><th>Profession</th>
	<th>Adresse</th><th>code postale</th><th>ville</th><th>Pays</th>
	<th>Actions</th>
	</tr>
	</thead>
	<tbody>
	<c:forEach var="client" items="${clients}">
	<tr>
	<td>${client.firstName}</td>
	<td>${client.lastName}</td>
	<td>${client.tel}</td>
	<td>${client.email}</td>
	<td>${client.birthday}</td>
	<td>${client.profession}</td>
	<td>${client.adress}</td>
	<td>${client.zip}</td>
	<td>${client.city}</td>
	<td>${client.country}</td>
	<td>
	<a href="${pageContext.request.contextPath}/clients/edit/${client.id}.html">Edit</a><br/>
	<a href="${pageContext.request.contextPath}/clients/delete/${client.id}.json">Delete</a><br/>
	</td>
	</tr>
	</c:forEach>
	</tbody>
	</table>

<a href="${pageContext.request.contextPath}/index.html">Home page</a>
</div>
</body>
</html>