<%-- 
    Document   : viewPersonalRecordverified
    Created on : 03 13, 22, 12:46:41 AM
    Author     : Admin
--%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
	<link rel="stylesheet" href="assets/css/records-personal-style.css">

        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>

        <link href="https://fonts.googleapis.com/css2?family=Amaranth&family=Quicksand&family=VT323&family=Poppins&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Audiowide&effect=anaglyph">
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Press+Start+2P&effect=anaglyph">

        <script language="JavaScript" type="text/javascript" src="/js/jquery-1.2.6.min.js"></script>
        <script language="JavaScript" type="text/javascript" src="/js/jquery-ui-personalized-1.5.2.packed.js"></script>
        <script language="JavaScript" type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.1/moment.min.js"></script>

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
                    <a class="option" href="subpage/authenticatedHome.jsp">Home</a>
                    <a class="option" href="subpage/authenticatedAbout.jsp">About</a>
                    <a class="option" href="subpage/authenticatedEvents.jsp">Events</a>
                    <a class="option" href="subpage/authenticatedContacts.jsp">Contact</a>
                    <%
			if (role.equalsIgnoreCase("member")) {
		    %>
		    <form action="MyAccountServlet">
			<input type="hidden" name="verify" value="${verify}" />
			<input type="submit" value="My Account"  class="button"/>
		    </form>
		    <%    } else if (role.equalsIgnoreCase("admin")) { %>
		    <form action="MyAccountServlet">
			<input type="hidden" name="verify" value="${verify}" />
			<input type="submit" value="ADMIN"  class="button"/>
		    </form>
		    <% }%>   

                </div>
            </div>
        </div>

	<!-- 1st section/ about -->

        <section class="personal-records-section-0">
            <div class="personal-records-container">

                <h3> View Personal Record </h3>
		<form class="personal-records-info-container0" action="/">

                    <div class='personal-records-profile-container'>
                        <span class="material-icons personal-records-photo">
                            account_circle
                        </span>

                        <span class='name-container'>
                            <span class='name'>${name}</span>
                            <span class='dpt'>${course}</span>
                        </span>

                    </div>

                    <div class='personal-records-info-container1'>
                        <label for=''>Email:</label>
                        <input type='email' id='email' name='email' value='<c:out value="${email}"/>' readonly> 

                    </div>

                    <div class='personal-records-info-container1'> 
                        <label for=''>Username:</label>

                        <input type='text' id='uname' name='uname' value='<c:out value="${username}"/>' readonly> 
                        <span class="material-icons edit-icon">
                            edit
                        </span>

                    </div>


                    <div class='personal-records-info-container1'> 
                        <label for=''>Password:</label>

                        <input type='password' id='password' name='password' value='<c:out value="${password}"/>' readonly> 
                        <span class="material-icons edit-icon">
                            edit
                        </span>

                    </div>

                    <div class='personal-records-info-container1'>
                        <label for=''>Age:</label>
                        <input type='number' id='age' name='age' value='<c:out value="${age}"/>' readonly> 

                    </div>

                    <div class='personal-records-info-container1'>
                        <label for=''>Birthday</label>
                        <input type='date' id='birthday' name='birthday' value='<c:out value="${birthday}"/>' readonly> 

                    </div>

                    <div class='personal-records-info-container1'>
                        <label for=''>Gender:</label>
                        <input type='text' id='gender' name='gender' value='<c:out value="${gender}"/>' readonly> 

                    </div>

                    <div class='personal-records-info-container1'>
                        <label for=''>Student Number:</label>
                        <input type='number' id='studentnum' name='studentnum' value='<c:out value="${snumber}"/>' readonly> 

                    </div>

                    <div class='personal-records-info-container1'>
                        <label for=''>Favorite Game:</label>
                        <input type='text' id='favgame' name='favgame' value='<c:out value="${favgame}"/>' readonly> 

                    </div>

                    <div class='personal-records-info-container1'>
                        <label for=''>Contact Number:</label>
                        <input type='number' id='contactnum' name='contactnum' value='<c:out value="${cnumber}"/>' readonly> 

                    </div>

                    <div class='personal-records-info-container1'>
                        <label for=''>Address:</label>
                        <input type='text' id='address' name='address' value='<c:out value="${address}"/>' readonly> 

                    </div>




                    <span class='verification-container'>
                        <span class="material-icons verification-icon" style="color:green;">
                            check_circle
                        </span> 
                        Your account has been verified.
                    </span>

                    <div class="personal-records-buttons"> 
                        <input type="button" onclick="location.href = 'subpage/myAccountPageVerified.jsp';" value="GO BACK" class="button" />
                        <input type="button" onclick="location.href = 'LogoutServlet';" value="LOGOUT" class="button" />
			<button name="pdfbutton" onclick="location.href = 'PDFServlet';" value="ownpdf" class="button"> Print PDF</button>

		    </div>   

            </div>
        </section>
    </body>
</html>