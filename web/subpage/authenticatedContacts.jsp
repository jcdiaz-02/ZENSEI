<%-- 
    Document   : contacts
    Created on : 03 18, 22, 1:32:48 AM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">

        <link rel="icon" href="../assets/logo.svg">
        <link rel="stylesheet" href="../assets/css/asset-sheet.css">
        <link rel="stylesheet" href="../assets/css/navbar-style.css">
        <link rel="stylesheet" href="../assets/css/contact-style.css">


        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>

        <link href="https://fonts.googleapis.com/css2?family=Amaranth&family=Quicksand&family=VT323&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Audiowide&effect=anaglyph">
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Press+Start+2P&effect=anaglyph">

        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons+Outlined" rel="stylesheet">

        <script src="https://kit.fontawesome.com/db09b338f9.js" crossorigin="anonymous"></script>
        <title>UST-TGS</title>
    </head>
    <body>
	<%
	    response.setHeader("Cache-Control", "no-cache,no-store,must-revalidate");
	    String uname = (String) session.getAttribute("username");
	    String role = (String) session.getAttribute("role");
	    if (uname == null) {
		response.sendRedirect("home.jsp");
	    }
	%>
        <!--TODO: CONNECT A CONTACT SERVLET-->
        <!-- navbar -->
        <div class="bar"> 
            <input type="checkbox" id="check">
            <label for="check" class="checkbtn">
                <i class="fas fa-bars"></i>
            </label>
            <div class="nav-content">
                <div class="nav-title">
                    <img class="nav-logo" src="../assets/logo.svg" alt="UST-TGS logo">
                    <a class="" href="/"> 
                        <h1>UST Thomasian Gaming Society</h1>
                    </a>
                </div>
                <div class="nav-options" >
		    <a class="option" href="authenticatedHome.jsp">Home</a>
                    <a class="option" href="authenticatedAbout.jsp">About</a>
                    <a class="option" href="authenticatedEvents.jsp">Events</a>
                    <a class="option" style="color:#B92432;" href="authenticatedContacts.jsp">Contact</a>
		    <%
			if (role.equalsIgnoreCase("member")) {
		    %>
		    <form action="../MyAccountServlet">
			<input type="hidden" name="verify" value="${verify}" />
			<input type="submit" value="My Account"  class="button"/>
		    </form>
		    <%    } else if (role.equalsIgnoreCase("admin")) { %>
		    <form action="../MyAccountServlet">
			<input type="hidden" name="verify" value="${verify}" />
			<input type="submit" value="ADMIN"  class="button"/>
		    </form>
		    <% }%>  

                </div>
            </div>
        </div>

        <!-- 1st section/ about -->
        <section class="contact-section">
            <div class="contact-panel1">
                <h2>Stay Connected with us.</h2>

                <table class="contact-list">
                    <tr>
                        <td><i class="fa-solid fa-envelope"></i></td>    
                        <td><span> thomasiangamingsociety@gmail.com</span></td>

                    </tr>                              

                    <tr>
                        <td><i class="fa-brands fa-facebook"></i></td>
                        <td><span> @ThomasianGamingSociety</span></td>
                    </tr>

                    <tr>
                        <td><i class="fa-brands fa-twitter"></i></td>
                        <td><span>@UST_TGS</span></td>
                    </tr>

                    <tr>
                        <td><i class="fa-brands fa-instagram"></i> </td>
                        <td><span>@UST_TGS</span></td>
                    </tr>

                    <tr>
                        <td><i class="fa-solid fa-location-dot"></i> </td>
                        <td><span>España Blvd, Sampaloc, Manila, 1008 Metro Manila</span></td>
                    </tr>
                </table>                           
            </div>

            <div class="contact-panel2">
                <form class="contact-form" >
                    <div class="panel-container">
                        <div class="panel">
                            <label for="fname">First Name <span style="color:red;">*</span></label>
                            <input type="text" name="fname" autocomplete="chrome-off" required >

                            <label for="lname">Last Name <span style="color:red;">*</span></label>
                            <input type="text" name="lname" autocomplete="chrome-off" required>

                        </div>

                        <div class="panel">
                            <label for="email">Email <span style="color:red;">*</span></label>
                            <input type="email" name="email" required>

                            <label for="course">Course <span style="color:red;">*</span></label>
                            <input type="text" name="course" autocomplete="chrome-off" required>

                        </div>
                    </div>

                    <div class="panel1">
                        <label for="comments">Comments/Suggestions <span style="color:red;">*</span></label>
                        <input type="text" name="comments" placeholder="Write your message here" required>
                    </div>

                    <div class="panel2">
                        <input type="submit" value="SUBMIT"  class="button"/>
                        <a href="">Comments/Suggestions Box</a>
                        <span class="material-icons-outlined"> &#xe8af;</span>
                    </div>
                </form>

            </div>
        </section>
    </body>
</html>
