<%-- 
    Document   : register
    Created on : 05 22, 21, 9:32:49 PM
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
        <link rel="stylesheet" href="design/register-style.css">
        
        
        <link rel="preconnect" href="https://fonts.gstatic.com">
        <link href="https://fonts.googleapis.com/css2?family=Teko:wght@700&display=swap" rel="stylesheet">
        <link rel="preconnect" href="https://fonts.gstatic.com">
        <link href="https://fonts.googleapis.com/css2?family=Overpass:ital,wght@0,400;0,600;0,700;1,700&display=swap" rel="stylesheet">
        
        <script src="https://kit.fontawesome.com/db09b338f9.js" crossorigin="anonymous"></script>
        <script src="https://code.jquery.com/jquery-3.2.1.js"></script>
        <script src="assets/observer1.js" defer></script>
    </head>
    <body>
      
        <div id="regModal" class="modal">
              <div class="bar"> 
                  <h1 class="head"> 
                      <%  
                          String head= getServletContext().getInitParameter("header");
                          out.println(head);
                      %>
                  </h1> 
                  <a href="index.jsp" class="top-login">LOG IN</a>

              </div>
            <form class="modal-box" method="post" action="SignupServlet">
               
                <div class="container">
                    <h2>Creat Account</h2>
                    <span class="label-cont" onclick="openModal()"> Already have an account? <a href="index.jsp" >Log-in now!</a> </span>
                 
                    <div class='form-input'>
                        <div class="input-data">
                            <input id="input-name" class="input-box" type="text" name="username" autocomplete="off"  placeholder="username" required>
                            <label class="label-tag">Username: </label>
                        </div>
                    </div>
                    
                    <div class='form-input'>
                        <div class="input-data">
                            <input id="input-pass" class="input-box" type="password" name="password" pattern=".{4,16}" title="4 to 16 characters" placeholder="password" required>
                            <label class="label-tag">Password: </label>
                        </div>
                    </div>  
                    
                    <div class='form-input'>
                        <div class="input-data">
                            <input id="input-pass" class="input-box" type="password" name="cfPassword" placeholder="Confirm Password"  required>
                            <label class="label-tag">Confirm Password: </label>
                        </div>
                    </div>   
                    
                    <div class="form-input form-captcha">
                         <div class="captcha-img">
                             <img id="captcha_image" src="SADCaptcha"  />
                            <i onclick="reloadCaptcha()" class="fas fa-redo-alt"></i>
                         </div>
                       <input class= "input-box" name="answer" autocomplete="off" required/>
                       <h4>
                       <% 
                           if(session.getAttribute("msg") != null)
                           {
                               String msg= (String) session.getAttribute("msg");
                               out.println(msg); 
                               session.removeAttribute("msg");

                           }
                         
                       %> 
                       </h4>
                    </div>
                    <button type='submit' class="login-btn">SIGN UP</button>  
                </div>       
                    
      
            </form>
        </div>

        <script type="text/javascript">
            function reloadCaptcha(){
                var d = new Date();
                $("#captcha_image").attr("src", "SADCaptcha");
            }
        </script>
    </body>
</html>
