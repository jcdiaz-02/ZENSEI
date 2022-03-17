<%-- 
    Document   : addRecordAdmin
    Created on : 03 16, 22, 12:46:41 AM
    Author     : Admin
--%>

<%@page import="java.sql.PreparedStatement"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>

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
	<%
	    response.setHeader("Cache-Control", "no-cache,no-store,must-revalidate");
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
                    <a class="option" href="subpage/about.jsp">About</a>
                    <a class="option" href="/">Events</a>
                    <a class="option" href="/">Contact</a>
                    <form style="color:#B92432;" action="MyAccountServlet">
			<input type="hidden" name="verify" value="${verify}" />
                        <input type="submit" value="ADMIN"  class="button"/>
                    </form>

                </div>
            </div>
        </div>

        <section class="login-section">
            <div class="login-container">


                <div class="input-container">
                    <form class="lg-form" method="POST" action="UpdateRecordServlet">

			<div class="input">
			    <h1>Email: </h1><input type="email" placeholder="Enter Email" name="email">
			</div>

			<div class="input">
			    <h1>Username: </h1><input type="text" placeholder= "Enter Username"name="uname">
			</div>

			<div class="input">
			    <h1>Password: </h1><input type="text" placeholder="Enter Password" name="pass">
			</div>
			<div class="input">

			    <h1>Name: </h1><input type="text" placeholder="Enter Name" name="myname">
			</div>
			<div class="input">

			    <h1>Course: </h1><input type="text" placeholder="Enter Course" name="course">
			</div>
			<div class="input">

			    <h1>Age: </h1><input type="number" placeholder="Enter Age" name="age">
			</div>

			<div class="input">

			    <h1>Birthday: </h1><input type="date" placeholder="Enter Birthday" name="birthday">
			</div>

			<div class="input">

			    <h1>Gender: </h1><input type="text" placeholder="Enter Gender" name="gender">
			</div>

			<div class="input">

			    <h1>Student Number: </h1><input type="number" placeholder="Enter Student Number" name="snumber">
			</div>

			<div class="input">

			    <h1>Favorite Game: </h1><input type="text" placeholder="Enter Favorite Game" name="favgame">
			</div>

			<div class="input">

			    <h1>Contact Number: </h1><input type="number" placeholder="Enter Contact Number" name="cnumber">
			</div>

			<div class="input">

			    <h1>Address: </h1><input type="text" placeholder="Enter Address" name="homeaddress">
			</div>
			<div class="input">

			    <h1>Role: </h1><input type="text" placeholder="Enter Role" name="userrole">
			</div>


			<button type="submit" name="recbutton" value="add">Save</button>

		    </form>
		    
		    <form class="lg-form" method="POST" action ="subpage/myAccountPageAdmin.jsp">
                        <button class="button1">Go back</button>
		    </form>

                    <form class="lg-form" method="POST" action ="LogoutServlet">
                        <button class="button1">Logout</button>
		    </form>
                </div>


            </div>
        </section>       
    </body>
</html>
