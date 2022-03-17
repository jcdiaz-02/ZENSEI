<%-- 
    Document   : samplejsp
    Created on : Mar 18, 2022, 12:26:25 AM
    Author     : merki
--%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>pass: <c:out value="${pass}"/></h1>
	<h1>email: <c:out value="${email}"/></h1>
    </body>
</html>
