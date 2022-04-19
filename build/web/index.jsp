<%-- 
    Document   : index
    Created on : 05 10, 21, 8:07:35 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>ZENSEI</title>
           
        <link rel="icon" href="assets/zensei-logo.svg" sizes="any" type="image/svg+xml">
        <link rel="stylesheet" href="design/index-style.css">
        <link rel="stylesheet" href="design/loginmodal-style.css">
        
        
        <link rel="preconnect" href="https://fonts.gstatic.com">
        <link href="https://fonts.googleapis.com/css2?family=Teko:wght@700&display=swap" rel="stylesheet">
        <link rel="preconnect" href="https://fonts.gstatic.com">
        <link href="https://fonts.googleapis.com/css2?family=Overpass:ital,wght@0,400;0,600;0,700;1,700&display=swap" rel="stylesheet">
        
        <script src="https://kit.fontawesome.com/db09b338f9.js" crossorigin="anonymous"></script>
        <script src="https://code.jquery.com/jquery-3.2.1.js"></script>
        <script src="assets/observer1.js" defer></script>
       
    </head>

    <body>
        
        <div class="bar"> 
            <h1 class="head"> 
                <%  
                    String head= getServletContext().getInitParameter("header");
                    out.println(head);
                %>
            </h1> 
            <a onclick="openModal()" class="top-login">LOG IN</a>
           
        </div>
            
        <div id="loginModal" class="modal">
            <form class="modal-box" method="post" action="LoginServlet">
               
                    <span onclick="closeModal()" class="close" title="Close">&times;</span>
                    <h2>Login to Account</h2>
                    <span class="label-cont"> Don't have an account? <a href="register.jsp">Sign-up now!</a> </span>
                 
                    <div class='form-input'>
                        <div class="input-data">
                            <input class="input-box" type="text" name="username" autocomplete="off" placeholder="username" >
                            <label class="label-tag" for="username">Username: </label>
                        </div>
                    </div>
                    
                    <div class='form-input'>
                        <div class="input-data">
                            <input class="input-box" type="password" name="password" placeholder="password">
                            <label class="label-tag" for="password">Password: </label>
                        </div>
                    </div>   
               
                    <button type='submit' class="login-btn" >LOG IN</button>  
      
            </form>
        </div>
            
        <section class="section-1">
            <div class="info-container">
                <div class="welcome-container" title="Photo from: https://leaguefeed.net/best-zed-skins/">
                    <div class="welcome-text">
                        <h2 class="welcome">WELCOME TO THE DOJO.</h2> 
                        <h3 class="welcome-sub">Learn the ways of the Pro</h3> 
                       
                    </div>
                </div>
            </div>
        </section>
        
        <section class="section-2">
            <div class="info-container">
                <div class="course-container">
                    <div class="courses">
                        <div class="watch-course">
                            <h2 class="course-head">Watch Courses by Professionals</h2> 
                            <h3 class="course-sub">Learn from exclusive video courses by pros to up your game! </h3> 
                        </div>
                        <div class="course-img-container" >
                            <img  src="assets/gamer.jpeg" class="course-img" >
                        </div>    
                    </div>
                    
                </div>
            </div>
        </section>
            
         
        <section class="section-3">
            <div class="info-container">
                <div class="game-container">
                    <div class="games">
                        <h2 class="game-head">Get Coaching for your favorite Games</h2> 
                        <h3 class="game-sub">Select your favorite game from our library and get coached by top pros! </h3> 
                    </div>
                    
                    <div class="img-container" >
                        <div class="game-img">
                            <img  class="lol-img" src="assets/lol/league.jpg" title="Photos from: https://htxt.co.za/2019/10/riot-games-details-new-titles-that-build-on-league-of-legends/  and   https://www.igdb.com/games/league-of-legends/reviews/a-candy-for-casual-moba-pc-gamers">
                        </div>
                     
                        <div class="game-img single-img">
                           <img   class="tekken-img" src="assets/tekken7/tekken_7.jpg" title="Photos from: https://soundeffects.fandom.com/wiki/Tekken_7 and https://www.thegamer.com/tekken-7-seven-million-sales/">
                        </div>
                        
                        <div class="game-img single-img" >
                            <img  class="valorant-img" src="assets/valo/valorant.png" title="Photos from: https://cdn2.steamgriddb.com/file/sgdb-cdn/grid/9edb6b9b7fc3b263b86740c635839dc4.png and https://newsedgepoint.net/valorant-console-version-is-being-prototyped-says-riot-games/">
                        </div>
                        
                    </div>    
                    
                    <h3 class="more"> +more Coming Soon! </h3> 
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
