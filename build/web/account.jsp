<%-- 
    Document   : account
    Created on : 05 21, 21, 10:24:00 AM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%  String avatar="";
            if(session.getAttribute("sAvatar") != null){
                avatar= (String)session.getAttribute("sAvatar");
            }
            else{
                avatar= "assets/flatflow/SVG Circles/supportmale.svg";
            } %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>ZENSEI</title>
        
        <link rel="icon" href="assets/zensei-logo.svg" sizes="any" type="image/svg+xml">
        
        <link rel="stylesheet" href="design/navbar-style.css">
        <link rel="stylesheet" href="design/account-style.css">
          
        <script src="https://kit.fontawesome.com/db09b338f9.js" crossorigin="anonymous"></script>
        <script src="https://code.jquery.com/jquery-3.6.0.js"
        integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk="
        crossorigin="anonymous"></script>
        
        <link rel="preconnect" href="https://fonts.gstatic.com">
        <link href="https://fonts.googleapis.com/css2?family=Teko:wght@700&display=swap" rel="stylesheet">
        
        <link rel="preconnect" href="https://fonts.gstatic.com">
        <link href="https://fonts.googleapis.com/css2?family=Overpass:ital,wght@0,400;0,600;0,700;1,700&display=swap" rel="stylesheet">
        
        
        <script src="assets/menu.js" defer></script>
        <script src="assets/observer2.js" defer></script>
    </head>
    <body>
       <!-- navbar -->
        <%
          // prevent storing in cache after logout
          response.setHeader("Cache-Control","no-cache, no-store, must-revalidate");
          response.setDateHeader("Expire" , 0);
           
          // check if session user is not login'd
          if( session.getAttribute("sUname") == null &&  session.getAttribute("sPassword")== null)
          {
              response.sendRedirect("index.jsp");
          }
         
        %>
        <div class="bar"> 
            <input type="checkbox" id="check">
            <label for="check" class="checkbtn">
                   <i class="fas fa-bars"></i>
            </label>
            
            <div class="nav-content">
                <h1 class="head"> 
                    <%  
                        String head= getServletContext().getInitParameter("header");
                        out.println(head);
                    %>
                </h1> 
                
                <div class="drop-games" onclick="openLibrary()">
                    <div class="drop-games-button" >
                        
                        <div class="game-menu">
                            <p class="select-game">SELECT GAME: </p> 
                            <% String currgame= (String)session.getAttribute("game");%>
                            <p class="current-game"> <%out.println(currgame);%></p> 
                            
                        </div>

                        <div class="select-arrow">
                            <i class="fa fa-chevron-down" aria-hidden="true"></i> 
                        </div>
                    </div>          
                </div>
            
                <div class="nav-option" >
                    
                    <% 
                        String home="", courses="", coaching="";
                        if(session.getAttribute("game") == "LEAGUE OF LEGENDS"){
                            home= "main-lol.jsp";
                            courses= "courses/leagueoflegends-courses.jsp";
                            coaching= "main-lol.jsp#section3";
                        }
                        else if(session.getAttribute("game") == "TEKKEN 7"){
                            home= "main-tekken.jsp";
                            courses= "courses/tekken7-courses.jsp";
                            coaching= "main-tekken.jsp#section3";
                        }
                        else if(session.getAttribute("game") == "VALORANT"){
                            home= "main-valorant.jsp";
                            courses= "courses/valorant-courses.jsp";
                            coaching= "main-valorant.jsp#section3";
                        }%>
                    <a class="option" href="<%out.println(home);%>">HOME</a>
                    <a class="option" href="<%out.println(courses);%>">COURSES</a>
                    <a class="option" href="<%out.println(coaching);%>">COACHING</a>
                    <% 
                           
                           if( session.getAttribute("sRole") == session.getAttribute("guestCheck")  ){
                    %>
                       <button class="get-premium">  <a href="subscribe.jsp"> GET PREMIUM </a></button>
                    <%}%>
                </div>
                
              
                
            </div> 
                
               
            <a class="logo-container" href="" >
                <img class="bar-logo" src="assets/zensei-logo.svg" >
            </a>
                  <% %>
            <div class="profile-menu">
                <img class="profile-head" src="<%out.print(avatar);%>" onclick="openProfileMenu()">
            </div>
                
            <div class="profile-list" id="myProfileMenu">
                 <div class="profile-user"> 
                    
                     <img class="profile-head" src="<%out.print(avatar);%> "> 
                     
                     <%  
                        String role= (String)session.getAttribute("sRole"); 
                        String username= (String)session.getAttribute("sUname"); 
                        if( session.getAttribute("sUname") != null )
                        {
                            out.print(username.toUpperCase());

                        }     
                     %>
                 </div>
                 
                 <div class="menu-list" >   
                    <i class="fa fa-user" aria-hidden="true">  <a href="account.jsp">View Account</a> </i> 
                    <i class="fa fa-history" aria-hidden="true"> <a href="transaction-history.jsp">Transaction History</a></i> 
                    <% 
                           String admin= "admin";
                           if( session.getAttribute("sRole") == session.getAttribute("adminCheck")  ){
                    %>
                           <form method="get" action="PdfServlet">
                                <button type="submit" name="adminPDF" value="adminDL" class="adminPDF-btn">
                                    <i class="fa fa-download" aria-hidden="true"></i>Get Admin Report!
                                </button>
                           </form> 
                          
                    <% } %>
                    <div >
                        <form method="post" action="LogoutServlet">
                            <button type="submit" class="logout-btn"> <i class="fa fa-sign-out" aria-hidden="true"></i>Logout</button>
                        </form>
                    </div>
                 </div>
            </div>
            
        
        </div>
                
                       
        <!-- game library dropdown -->        
        <div class="game-list" id="myLibrary">
                <span onclick="closeLibrary()" class="close" title="Close">&times;</span>
                <p class="game-library"> GAME LIBRARY </p>
                <div class="img-container" >
                    
                        <div class="game-img">
                            <a href="main-lol.jsp" class="games">
                                <img  src="assets/lol/league.jpg">
                                <p>LEAGUE OF LEGENDS</p> 
                            </a>
                        </div>
                     
                        <div class="game-img single-img">
                            <a href="main-tekken.jsp" class="games">
                                <img  src="assets/tekken7/tekken_7.jpg">
                                <p>TEKKEN 7</p> 
                            </a>
                        </div>
                        
                        <div class="game-img single-img" >
                            
                             <a href="main-valorant.jsp" class="games">
                                <img  src="assets/valo/valorant.png">
                                <p>VALORANT</p> 
                            </a>
                        </div>
                </div>
        </div>
        
        <section class="section-1">
            <div class="account-container">
                <div class="account-box">
                    <div class="account-title">
                        <h2>Account Details</h2>
                    </div>
                    <div class="account-details">
                        <div class="username-container">
                            <div class="username-holder">
                                <div class="username">
                                    <span>Username</span>
                                </div>
                                <span class="account-username"><%out.println(username);%></span>
                            </div>
                            <img src="<%out.print(avatar);%>">
                        </div>
                        
                        <div class="username-container">
                            <div class="username-holder">
                                <div class="username">
                                    <span>Account Type</span>
                                </div>
                                <span class="account-username" ><%out.println(role);%></span >
                            </div>
                          
                        </div> 
                        
                        
                       
                        <% 
                           if( session.getAttribute("sRole2") != null  ){
                        %>
                        <p class="account-username">COACH</p>
                        <% }%>
                       
                    </div>
                </div>
            </div>
        </section>
      
        <footer>
            <p>
                <%                 
                   String foot= getServletContext().getInitParameter("footer");
                   out.println(foot); 
                %>
            </p>
        </footer> 
    </body>
</html>
