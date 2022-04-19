<%--
    Document   : AuthenticationErrorPass
    Created on : 02 28, 21, 6:20:10 PM
    Author     : Jane
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Authentication Error</title>
        
    </head>
    <body class="background1 err-container">
       
        <main>
            <div class="err-flex">
                <div class="err-flex-content">
                    <h1 class="err-title">Authentication Error</h1>
                    <p class="err-reason">
                        The password is incorrect!
                    </p>
                    <div class="err-wrap">
                        <a class="err-btn" href="login/login.jsp">SIGN IN AGAIN</a>
                    </div>
                </div>
            </div>
        </main>
        
    </body>
</html>
