<%-- 
    Document   : profile-page
    Created on : 03 19, 22, 2:59:24 AM
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
        <link rel="stylesheet" href="../assets/css/profile-page-style.css">
  
          
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
    </head>
    <body>
        <!--TODO: CONNECT ACCOUNT AND CHECK IF VERIFIED OR NOT--> 
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
                    <a class="option" href="../home.jsp">Home</a>
                    <a class="option" href="../subpage/about.jsp">About</a>
                    <a class="option" href="../subpage/events.jsp">Events</a>
                    <a class="option" href="../subpage/contact.jsp">Contact</a>
                    <form  action="../login/login.jsp">
                        <input type="submit" value="Login"  class="button"/>
                    </form>

                </div>
            </div>
        </div>
        
        
        <section class="profile-section">
            <div class="profile-container">
                <!-- IF ACCOUNT NOT VERIFIED -->
                <button type="button" onclick="location.href='../account/records-personal-0.jsp';" class="button" style="display:none;">
                    <span class="material-icons-outlined">badge</span> 
                    View Personal Record
                </button>
                
                <!-- IF ACCOUNT VERIFIED -->
                <button type="button" onclick="location.href='../account/records-personal-1.jsp';" class="button">
                    <span class="material-icons-outlined">badge</span> 
                    View Personal Record
                </button>
                
                <button type="button" onclick="location.href='';" class="button">
                    <span class="material-icons-outlined">person_add_alt</span>
                    Add Record
                </button>
                
                <button type="button" onclick="location.href='';" class="button">
                    <span class="material-icons-outlined">power_settings_new</span>
                    Logout
                </button>
                
                <div class="profile-verify-msg">
                    <span class="material-icons" style="color:green;">check_circle</span>
                    <p> Your account has been verified and you can now add your record.</p>
                </div>
                
                <div class="profile-verify-msg" style="display:none;">
                    <span class="material-icons" style="color:red;">cancel</span>
                    <p> Your account has not been verified.</p>
                </div>
            </div>
        </section>       
    </body>
</html>
