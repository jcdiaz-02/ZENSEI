<%-- 
    Document   : checkmark
    Created on : 03 25, 21, 6:19:10 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!-- Created By CodingNepal -->
<html lang="en" dir="ltr">
  <head>
    <meta charset="utf-8">
    <!-- Somehow I got an error, so I comment the title, just uncomment to show -->
    <title>Success!</title>
    <link rel="icon" href="assets/zensei-logo.svg" sizes="any" type="image/svg+xml">
    <link rel="stylesheet" href="design/signup-success-style.css">
     <meta name="viewport" content="width= device-width, initial-scale=1.0">
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
                    <div class="content"> 
                        <input type="checkbox" id="check">
                      <label class="check" for="check">
                        <div class="check-icon">
                        </div>
                      </label>     
                        <h2> SIGN-UP SUCCESS! </h2> 
                         <a href="index.jsp" class='go-home'>GO LOGIN!</a>
                    </div>
                </div>
            </div>
        </div>
    
   
 
  </body>
</html>
