<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Upload image</title>
</head>
<body>
	<form method="POST"  action="${pageContext.request.contextPath}/medias/upload" enctype="multipart/form-data">
		<input type="file" name="files[]" multiple>
		<input type="submit"> 
	</form>
</body>
</html>