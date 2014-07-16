<?xml version="1.0" encoding="UTF-8" ?>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="security"
	uri="http://www.springframework.org/security/tags"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>Home page</title>
</head>
<body>
	<div id="container">
		<h1>Home page</h1>
		<p>You have successfully logged in. Your username is <security:authentication property="principal.username"/> and Email : ${email}</p>
		<a href="<c:url value="/j_spring_security_logout" />">Logout</a> <br />
		<p>
			<a href="${pageContext.request.contextPath}/clients/create.html">Create
				new Client</a><br /> <a
				href="${pageContext.request.contextPath}/clients.html">All
				Clients</a><br />
		</p>

		<p>
			<a href="${pageContext.request.contextPath}/observations/create.html">Create
				new Observation</a><br /> <a
				href="${pageContext.request.contextPath}/observations.html">All
				Observations</a><br />
		</p>
		
		<security:authorize access="hasRole('ROLE_ADMIN')">
			<p>
				<a href="${pageContext.request.contextPath}/users/create.html">Create
					new User</a><br /> <a
					href="${pageContext.request.contextPath}/users.html">All Users</a><br />
			</p>
		</security:authorize>
		
		<p>
			<a href="${pageContext.request.contextPath}/medias/create.html">Create
				new Medias</a><br /> <a
				href="${pageContext.request.contextPath}/medias.html">All
				Medias</a><br />
		</p>

	</div>
</body>
</html>