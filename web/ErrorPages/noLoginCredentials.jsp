<%-- 
    Document   : error_nullvalue
    Created on : 03 2, 21, 8:53:46 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>Error</title>
        
         <link rel="preconnect" href="https://fonts.gstatic.com">
        <link href="https://fonts.googleapis.com/css2?family=Teko:wght@700&display=swap" rel="stylesheet">
        
         <link rel="icon" href="../../assets/zensei-logo.svg">
        <link rel="icon" href="../assets/zensei-logo.svg">
        <link rel="icon" href="assets/zensei-logo.svg">
        <link rel="stylesheet" href="../../design/error-style.css">
        <link rel="stylesheet" href="../design/error-style.css">
        <link rel="stylesheet" href="design/error-style.css">
        
        <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@500&display=swap" rel="stylesheet">
    </head>
     <body>
        <header>
            <nav>
                <div class="topL"></div>
          
                <label class="logo"><h1>   
                        <%  
                            String head= getServletContext().getInitParameter("header");
                            out.println(head); 
                        %>
                    </h1></label>
                
            </nav>
        </header>
        
             
        <div class="section-1">
            <div class="wlcm-box">
                <div class="container">
                    <h1>ERROR!</h1>
                    <div class="content">
                        <h2>
                            No username & password values
                        </h2>
                        <a onclick="window.history.go(-1); return false;" class='go-home'>GO BACK</a>
                    </div>
                </div>
                
                <footer>

                    <p>
                        <%  
                            String foot= getServletContext().getInitParameter("footer");
                            out.println(foot); 
                        %>
                    </p>

                </footer>
            </div>  
           
        </div>
        

    </body>
</html>
