<%-- 
    Document   : login
    Created on : 02 28, 22, 12:46:41 AM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">

        <link rel="icon" href="assets/logo.svg">
        <link rel="stylesheet" href="assets/css/asset-sheet.css">
        <link rel="stylesheet" href="assets/css/navbar-style.css">
        <link rel="stylesheet" href="assets/css/login-style.css">

        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>

        <link href="https://fonts.googleapis.com/css2?family=Amaranth&family=VT323&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Audiowide&effect=anaglyph">
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Press+Start+2P&effect=anaglyph">

        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons+Outlined" rel="stylesheet">
        <title>UST-TGS</title>
    </head>
    <body>
	<!-- navbar -->
        <div class="bar"> 
            <div class="nav-content">
                <div class="nav-title">
                    <img class="nav-logo" src="assets/logo.svg" alt="UST-TGS logo">
                    <a class="" href="/"> 
                        <h1>UST Thomasian Gaming Society</h1>
                    </a>
                </div>
                <div class="nav-options" >
                    <a class="option" href="home.jsp">Home</a>
                    <a class="option" href="subpage/about.jsp">About</a>
                    <a class="option" href="EventPage.jsp">Events</a>
                    <a class="option" href="ContactPage.jsp">Contact</a>
                    <button class="button " href="/">Login</button>

                </div>
            </div>
        </div>

        <section class="login-section">
            <div class="login-container">
                <%

		    response.setHeader("Cache-Control", "no-cache,no-store,must-revalidate");
                %>
                <h2>Welcome Back</h2>
                <h3>Don't have an account yet? <a href="signup/signup.jsp">Sign up</a></h3>


                <div class="input-container">
                    <form class="lg-form" method="POST" action="LoginServlet">
			<label for="uname"><b>Username</b></label>

			<div class="input">
			    <span class="material-icons input-icon" style="color:#FF5757;">&#xe887;</span>
			    <input type="text" placeholder="Enter Username" name="uname">
			</div>

			<label for="psw"><b>Password</b></label>
			<div class="input">
			    <span class="material-icons input-icon" style="color:#23B461;">&#xe32a;</span>
			    <input type="password" placeholder="Enter Password" name="psw">
			    <span class="material-icons-outlined psw-show">visibility_off</span>
			</div>



			<button type="submit">LOGIN</button>
                    </form>
                </div>



                <a href="/">Forgot Password?</a>
            </div>
        </section>       
    </body>
</html>
