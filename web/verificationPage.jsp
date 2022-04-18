<%-- 
    Document   : about
    Created on : 02 25, 22, 10:33:45 PM
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
        <link rel="stylesheet" href="assets/css/about-style.css">
        <link rel="stylesheet" href="assets/css/verify-style.css">


        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>

        <link href="https://fonts.googleapis.com/css2?family=Amaranth&family=VT323&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Audiowide&effect=anaglyph">
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Press+Start+2P&effect=anaglyph">

        <link href="https://fonts.googleapis.com/icon?family=Material+Icons+Outlined" rel="stylesheet">
        <title>UST-TGS</title>

    </head>
    <body>
        <%
            session.setAttribute("uname", session.getAttribute("uname"));
            session.setAttribute("psw", session.getAttribute("pass"));
            session.setAttribute("email", session.getAttribute("email"));
            session.setAttribute("code", session.getAttribute("code"));
            String button = (String) session.getAttribute("button");
        %>
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
                    <a class="option" href="/subpage/about.jsp">About</a>
                    <a class="option" href="/subpage/events.jsp">Events</a>
                    <a class="option" href="/subpage/contact.jsp">Contact</a>
                    <form style="color:#B92432;" action="login.jsp">
                        <input type="submit" value="Login"  class="button"/>
                    </form>

                </div>
            </div>
        </div>

        <!-- 1st section/ about -->
        <section class="verify-section">
            <div class="verify-container">

                <h2>Verify Your Identity</h2>


                <% if (button.equals("signup")) {%>
                <div class="verify-signup-code"> 
                    <p>We have sent a verification code to your email-</p>
                    <p class="verify-email" ><c:out value="${email}"/></p>
                </div>

                <form class="input-container" action="SignUpServlet">
                    <label for="vcode"><b>Validate OTP</b></label>    
                    <div class="input">
                        <input type="text" placeholder="enter verification code" name="verify" required>
                    </div>
                    <h3><%request.getAttribute("Incorrect");%></h3>
                    <button class="button">CONTINUE</button>
                </form>


                <%} else if (button.equals("login")) {%>

                <div class="verify-login-code">
                    <p>For added security, we need to verify your email address. We have sent a verification code to  
                        <span class="verify-email">juan.delacruz.cics@ust.edu.ph</span>
                    </p>

                    <p>If the email does not arrive soon, check your spam folder or have us <a>send it again.</a></p>

                </div>  

                <form class="input-container" action="LoginServlet">
                    <label for="vcode"><b>Validate OTP</b></label>    
                    <div class="input">
                        <input type="text" placeholder="enter verification code" name="verify" required>
                    </div>
                    <h3><%request.getAttribute("Incorrect");%></h3>
                    <button class="button">CONTINUE</button>
                </form>
                <%}%>

            </div>
        </div>
    </section>
</body>
</html>
