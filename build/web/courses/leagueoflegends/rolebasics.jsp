<%-- 
    Document   : rolebasics
    Created on : 05 21, 21, 1:00:58 AM
    Author     : Admin
--%>

<%-- 
    Document   : leagueoflegends-courses
    Created on : 05 20, 21, 10:56:35 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%  String avatar="";
            if(session.getAttribute("sAvatar") != null){
                avatar= (String)session.getAttribute("sAvatar");
            }
            else{
                avatar= "../../assets/flatflow/SVG Circles/supportmale.svg";
            }
            session.setAttribute("game", "LEAGUE OF LEGENDS");
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>ZENSEI</title>
        
        <link rel="icon" href="../../assets/zensei-logo.svg" sizes="any" type="image/svg+xml">
        
        <link rel="stylesheet" href="../../design/navbar-style.css">
        <link rel="stylesheet" href="../../design/courses-video-style.css">
          
        <script src="https://kit.fontawesome.com/db09b338f9.js" crossorigin="anonymous"></script>
        <script src="https://code.jquery.com/jquery-3.6.0.js"
        integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk="
        crossorigin="anonymous"></script>
        
        <link rel="preconnect" href="https://fonts.gstatic.com">
        <link href="https://fonts.googleapis.com/css2?family=Teko:wght@700&display=swap" rel="stylesheet">
        
        <link rel="preconnect" href="https://fonts.gstatic.com">
        <link href="https://fonts.googleapis.com/css2?family=Overpass:ital,wght@0,400;0,600;0,700;1,700&display=swap" rel="stylesheet">
        
        <link rel="stylesheet" href="../../venobox/venobox.css" type="text/css" media="screen" />
        
        <script src="../../assets/menu.js" defer></script>
        <script src="../../assets/observer2.js" defer></script>
    </head>
    
    <body>
       <%
          // prevent storing in cache after logout
          response.setHeader("Cache-Control","no-cache, no-store, must-revalidate");
          response.setDateHeader("Expire" , 0);
           
          // check if session user is not login'd
          if( session.getAttribute("sUname") == null &&  session.getAttribute("sPassword")== null)
          {
              response.sendRedirect("../../index.jsp");
          }
           
           
          session.setAttribute("game", "LEAGUE OF LEGENDS");
        %>
         <!-- navbar -->
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
                            home= "../../main-lol.jsp";
                            courses= "../../courses/leagueoflegends-courses.jsp";
                            coaching= "../../main-lol.jsp#section3";
                        }
                        else if(session.getAttribute("game") == "TEKKEN 7"){
                            home= "../../main-tekken.jsp";
                            courses= "../../courses/tekken7-courses.jsp";
                            coaching= "../../main-tekken.jsp#section3";
                        }
                        else if(session.getAttribute("game") == "VALORANT"){
                            home= "../../main-valorant.jsp";
                            courses= "../../courses/valorant-courses.jsp";
                            coaching= "../../main-valorant.jsp#section3";
                        }%>
                    <a class="option" href="<%out.println(home);%>">HOME</a>
                    <a class="option" href="<%out.println(courses);%>">COURSES</a>
                    <a class="option" href="<%out.println(coaching);%>">COACHING</a>
                     <% 
                           
                           if( session.getAttribute("sRole") == session.getAttribute("guestCheck")  ){
                    %>
                       <button class="get-premium">  <a href="../../subscribe.jsp"> GET PREMIUM </a></button>
                    <%}%>
                </div>
                
              
                
            </div> 
                
               
            <a class="logo-container" href="" >
                <img class="bar-logo" src="../../assets/zensei-logo.svg" >
            </a>
                  <% %>
            <div class="profile-menu">
                <img class="profile-head" src="<%out.print(avatar);%>" onclick="openProfileMenu()">
            </div>
                
            <div class="profile-list" id="myProfileMenu">
                 <div class="profile-user"> 
                    
                     <img class="profile-head" src="<%out.print(avatar);%> "> 
                     
                     <%  
                        String username= (String)session.getAttribute("sUname"); 
                        if( session.getAttribute("sUname") != null )
                        {
                            out.print(username.toUpperCase());

                        }     
                     %>
                 </div>
                 
                 <div class="menu-list" >   
                    <i class="fa fa-user" aria-hidden="true">  <a href="../../account.jsp">View Account</a> </i> 
                    <i class="fa fa-history" aria-hidden="true"> <a href="./../transaction-history.jsp">Transaction History</a></i> 
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
                        <form method="post" action="../../LogoutServlet">
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
                            <a href="../../main-lol.jsp" class="games">
                                <img  src="../../assets/lol/league.jpg">
                                <p>LEAGUE OF LEGENDS</p> 
                            </a>
                        </div>
                     
                        <div class="game-img single-img">
                            <a href="../../main-tekken.jsp" class="games">
                                <img  src="../../assets/tekken7/tekken_7.jpg">
                                <p>TEKKEN 7</p> 
                            </a>
                        </div>
                        
                        <div class="game-img single-img" >
                            
                             <a href="../../main-valorant.jsp" class="games">
                                <img  src="../../assets/valo/valorant.png">
                                <p>VALORANT</p> 
                            </a>
                        </div>
                </div>    
        </div>
        
        <!-- 1st section/ welcome -->
        <section class="section-1">
                <div class="welcome-container" title="Photo from: https://www.bbc.com/worklife/article/20201215-how-online-gaming-has-become-a-social-lifeline">
                        <img src="../../assets/lol/Ryze_0.jpg">
                </div>
           
        </section>
        
        <section class="section-2" id="section2">
            <div class="info-container">
                <div class="course-container">
                    
                    <div class="course-header">
                          <h2 class="course-title">ROLE BASICS</h2>
                          <h3 class="course-info">Learn the basics on how to play each character roles to find which is best suited for your playstyle.</h3>
                          <p> 5 videos | 107 min </p>
                          
                    </div>
                    
                    <hr>
                    
                    <div class="venobox preview-1" data-autoplay="true" data-vbtype="video" href="https://www.youtube.com/watch?v=zGKL1KXNInI">
                        <div class="course-img">
                            <img  src="https://i.ytimg.com/vi/zGKL1KXNInI/maxresdefault.jpg" title="Photo from: https://www.youtube.com/watch?v=zGKL1KXNInI">
                        </div>
                        <div class="course-info">
                            <p class="info-header">How to Mid Lane </p>
                            <p class="info-sub">The complete guide to Mid Lane </p>
                        </div>
                    </div>
                    
                    <div class="venobox preview-1" data-autoplay="true" data-vbtype="video" href="https://www.youtube.com/watch?v=qfJC66wn9nY">
                        <div class="course-img">
                            <img  src="https://i.ytimg.com/vi/qfJC66wn9nY/maxresdefault.jpg" title="Photo from: https://www.youtube.com/watch?v=qfJC66wn9nY">
                        </div>
                        <div class="course-info">
                            <p class="info-header">Top Lane Guide</p>
                            <p class="info-sub">The complete Top Lane macro guide </p>
                        </div>
                    </div>      
                    
                    <div class="venobox preview-1" data-autoplay="true" data-vbtype="video" href="https://www.youtube.com/watch?v=0XvcdWW_tWM">
                        <div class="course-img">
                            <img  src="https://i.ytimg.com/vi/0XvcdWW_tWM/maxresdefault.jpg" title="Photo from: https://www.youtube.com/watch?v=0XvcdWW_tWM">
                        </div>
                        <div class="course-info">
                            <p class="info-header">How to Jungle</p>
                            <p class="info-sub">The Complete Jungle guide </p>
                        </div>
                    </div>
                    
                    <div class="venobox preview-1" data-autoplay="true" data-vbtype="video" href="https://www.youtube.com/watch?v=a5RL_LhxR3A">
                        <div class="course-img">
                            <img  src="https://i.ytimg.com/vi/a5RL_LhxR3A/maxresdefault.jpg" title="Photo from: https://www.youtube.com/watch?v=a5RL_LhxR3A">
                        </div>
                        <div class="course-info">
                            <p class="info-header">How to Support </p>
                            <p class="info-sub">Learn how to Support</p>
                        </div>
                    </div>
                    
                    <div class="venobox preview-1" data-autoplay="true" data-vbtype="video" href="https://www.youtube.com/watch?v=YAiXpm09jtw">
                        <div class="course-img">
                            <img  src="https://i.ytimg.com/vi/YAiXpm09jtw/maxresdefault.jpg" title="Photo from: https://www.youtube.com/watch?v=YAiXpm09jtw">
                        </div>
                        <div class="course-info">
                            <p class="info-header">The Complete ADC guide  </p>
                            <p class="info-sub">Learn how to play ADC </p>
                        </div>
                    </div>
                </div>
            </div>
          </section>
                    
        <script type="text/javascript" src="../../assets/jquery-3.6.0.min.js"></script>
        <script type="text/javascript" src="../../venobox/venobox.min.js"></script>
        <script>
            $(document).ready(function(){
                $('.venobox').venobox({
                    overlayColor: 'rgba(255,255,255,0.5)',
                    closeColor: '#000000',
                    framewidth: '90vw',
                    frameheight: '80vh'
                });
            });
        </script>
        
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
