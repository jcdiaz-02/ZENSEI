<%-- 
    Document   : mainlol
    Created on : 05 15, 21, 5:33:19 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@page import="
    java.io.OutputStream,
    java.sql.Connection,
    java.sql.DriverManager,
    java.sql.PreparedStatement,
    java.sql.ResultSet,
    javax.servlet.http.HttpSession"%>
<% 
    Connection conn;
    PreparedStatement pstmt;
    ResultSet rs;
    String query;
    String dbUname="", dbAvatar="";
            // Load Driver
            String driver= "org.apache.derby.jdbc.ClientDriver";
            Class.forName(driver);
            
            // Register URL, username and password and Connect to Database
            String url= "jdbc:derby://localhost:1527/UserDB";
            conn= DriverManager.getConnection(url, "app", "app");
            
            // Execute Query
            query= "SELECT USERNAME, COACH_GAME, ROLE_2, AVATAR  FROM ZENSEI_USERS WHERE COACH_GAME=? and ROLE_2=? FETCH FIRST 6 ROWS ONLY";
            pstmt  = conn.prepareStatement(query);
            pstmt.setString(1, "valo");
            pstmt.setString(2, "coach");
          
            rs= pstmt.executeQuery();
            
            String avatar="";
            if(session.getAttribute("sAvatar") != null){
                avatar= (String)session.getAttribute("sAvatar");
            }
            else{
                avatar= "assets/flatflow/SVG Circles/supportmale.svg";
            } 

            session.setAttribute("game", "VALORANT");
            session.setAttribute("gameCheck", "VALORANT");
           
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>My Training</title>
        
         
        <link rel="icon" href="assets/zensei-logo.svg" sizes="any" type="image/svg+xml">
        
        <link rel="stylesheet" href="design/navbar-style.css">
        <link rel="stylesheet" href="design/main-style.css">
        <link rel="stylesheet" href="design/payment-modal-style.css">
        <link rel="stylesheet" href="design/cardmodal-style.css">
        
        <link rel="stylesheet" href="assets/font-awesome-4.7.0/css/font-awesome.css">
        
        <script src="https://kit.fontawesome.com/db09b338f9.js" crossorigin="anonymous"></script>
        <script src="https://code.jquery.com/jquery-3.6.0.js"
        integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk="
        crossorigin="anonymous"></script>
        
        <link rel="preconnect" href="https://fonts.gstatic.com">
        <link href="https://fonts.googleapis.com/css2?family=Teko:wght@700&display=swap" rel="stylesheet">
        
        <link rel="preconnect" href="https://fonts.gstatic.com">
        <link href="https://fonts.googleapis.com/css2?family=Overpass:ital,wght@0,400;0,600;0,700;1,700&display=swap" rel="stylesheet">
        
        <link rel="stylesheet" href="venobox/venobox.css" type="text/css" media="screen" />
        
        
        <script src="assets/menu.js" defer></script>
        <script src="assets/observer1.js" defer></script>
    </head>
    <body>
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
                            <p class="current-game"> VALORANT </p> 
                        </div>

                        <div class="select-arrow">
                            <i class="fa fa-chevron-down" aria-hidden="true"></i> 
                        </div>
                    </div>          
                </div>
            
                <div class="nav-option" >
                    <a class="option" href="main-valorant.jsp">HOME</a>
                    <a class="option" href="courses/valorant-courses.jsp">COURSES</a>
                    <a class="option" href="#section3">COACHING</a>
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
          
        <!-- 1st section/ welcome -->
        <section class="section-1">
            <div class="info-container">
                <div class="welcome-container" title="Photo from: https://www.bbc.com/worklife/article/20201215-how-online-gaming-has-become-a-social-lifeline">
                    <div class="welcome-text">
                        <h2 class="welcome">START YOUR TRAINING</h2> 
                        <h3 class="welcome-sub">Watch Video Courses and get in touch with a Coach </h3> 
                       
                    </div>
                </div>
            </div>
        </section>
        
        <!-- 2nd section/ courses -->
        <section class="section-2" id="section2">
            <div class="info-container">
                <div class="course-container">
                    
                    <div class="course-header">
                        <p class="watch-courses">Watch Courses</p>
                    </div>
                    
                    <a href="courses/valorant/thebasics.jsp">
                        <div class="preview-1"  >
                            <div class="course-img">
                                <img  src="https://coverfiles.alphacoders.com/150/150490.jpg" title="Photo from: https://covers.alphacoders.com/cover/view/150490">
                            </div>
                            <div class="course-info">
                                <p class="info-header">The Basics </p>
                                <p class="info-sub">5 video lessons | Free Course </p>
                            </div>
                        </div>
                    </a>
                    
                    <% 
                        String courseRef="", courseRef1="";    
                        
                        if(session.getAttribute("sRole") == session.getAttribute("guestCheck")){
                           courseRef= "subscribe.jsp"; 
                           courseRef1= "subscribe.jsp";
                        }
                        else
                        {
                           courseRef= "courses/valorant/theroles.jsp";
                           courseRef1= "courses/valorant/meta.jsp";
                        }
                     %>
                     
                    <a href="<% out.println(courseRef);%>">
                        <div class="preview-1"  >
                            <div class="course-img">
                                <img  src="https://coverfiles.alphacoders.com/166/166668.png" title="Photo from: https://covers.alphacoders.com/cover/view/166668">
                            </div>
                            <div class="course-info">
                                <p class="info-header">The Roles </p>
                                <p class="info-sub">5 video lessons </p>
                            </div>
                        </div>
                    </a>
                    
                    <a href="<% out.println(courseRef1);%>">
                        <div class="preview-1"  >
                            <div class="course-img">
                                <img  src="https://coverfiles.alphacoders.com/166/166994.png" title="Photo from: https://covers.alphacoders.com/cover/view/166994">
                            </div>
                            <div class="course-info">
                                <p class="info-header">The Meta </p>
                                <p class="info-sub">5 video lessons </p>
                            </div>
                        </div>
                    </a>
                </div>
            </div>
        </section>
        
        <!-- 3rd section/ coaches -->
          <section class="section-3" id="section3">
            <div class="info-container">
                <div class="coach-container">
                    <div class="coach-header">
                        <p class="coaches">Recommended Coaches </p>
                    </div>
                    
                    <div class="coach-gallery">
                        <%  // list records in table
                            String[] paymentModal={"paymentModal1","paymentModal2", "paymentModal3", "paymentModal4", "paymentModal5", "paymentModal6"}; 
                            String[] openPayment={"openPayment1()","openPayment2()", "openPayment3()", "openPayment4()", "openPayment5()", "openPayment6()"}; 
                              int x= 0;
                            while(rs.next()){
                             
                                  
                                dbUname= rs.getString("USERNAME");
                                if(rs.getString("AVATAR")!=null){
                                    dbAvatar= rs.getString("AVATAR");
                                }
                                else{
                                    dbAvatar="assets/flatflow/SVG Circles/supportmale.svg";
                                }
                                %>
                            <div class="coach-item" onclick="<%=openPayment[x]%>">
                                <div class="coach-pic">
                                    <img src="<%out.print(dbAvatar);%>" > 
                                </div>

                                <div class="coach-info">
                                    <p class="coach-name"><% out.print(dbUname);%></p>
                                    <p class="coach-game">League of Legends</p>
                                    <p class="coach-rate"> <i class="fa fa-star" aria-hidden="true"> </i> 5.0</p>
                                </div>
                            </div>
                    
                                    
                                    
                    <div id="<%=paymentModal[x]%>" class="modal">
                     <div class="payment-box"> 
                        <div class="coach-payment-header">
                            <span onclick="closePayment()" class="close" title="Close">&times;</span>
                            <h1>Coach Booking</h1>
                            <hr>
                        </div>
                         <% 
                               String service1="", service2="", service3="";
                               if( session.getAttribute("sRole") == session.getAttribute("memberCheck") || session.getAttribute("sRole") == session.getAttribute("adminCheck"))
                               {
                                   service1="₱ 675";
                                   service2="₱ 900";
                                   service3="₱ 1125";

                               }
                               else{
                                   service1="₱ 750";
                                   service2="₱ 1000";
                                   service3="₱ 1250";                        
                               }
                        %>
                        <div class="coach-payment-profile">
                            <div class="coach-avatar">
                                <img src="<%out.print(dbAvatar);%>"> 
                            </div>

                            <div class="coach-infoP">
                                <h2 class="coach-name"><% out.print(dbUname);%></h2>
                                <p class="curr-rank">Rank:  </p>
                                <p class="curr-rank">
                                    <img class="coach-rank" src="assets/valo-ranks/Emblem_Radiant.png">Radiant
                                </p>
                            </div>

                            <div class="coach-rating">
                                <p class="coach-rate"> <i class="fa fa-star" aria-hidden="true"> </i> 5.0 (999)</p>
                                <p class="members-coached">42 members coached  </p>
                            </div>
                        </div>

                        <div class="coach-payment-services">
                              <label class="services">
                                <input type="radio" checked="checked"  name="radio">
                                <span class="checkmark"></span>
                                <div class="services-info">
                                    <span class="service-head"> 
                                        <p class="service-title">Replay Analysis</p>
                                        <p class="service-desc"> Receive general coaching about the game (45 min) </p>
                                    </span> 
                                    <span class="service-price"><p><%=service1%></p></span>   
                                </div>  
                            </label>

                            <label class="services">
                                <input type="radio" name="radio">
                                <span class="checkmark"></span>
                                <div class="services-info">
                                    <span class="service-head"> 
                                        <p class="service-title">Play 1 Co-Piloted Game</p>
                                        <p class="service-desc"> Play while the Coach teaches you how to win (45 min)</p>
                                    </span> 
                                    <span class="service-price"><p><%=service2%></p></span>   
                                </div>   
                            </label>


                            <label class="services">
                                <input type="radio" name="radio">
                                <span class="checkmark"></span>
                                <div class="services-info">
                                    <span class="service-head"> 
                                        <p class="service-title">Play 1 Game with the Coach</p>
                                        <p class="service-desc"> Get instant feedback while playing together (60 min)</p>
                                    </span> 
                                    <span class="service-price"><p><%=service3%></p></span>   
                                </div>   
                            </label>

                            <a>   
                                <button  type="submit" class="purchase" onclick="openCard()">
                                    CHECKOUT
                                </button>  
                             </a>
                            </div>
                        </div>
                    </div>
                        <% 
                         
                                   
                           x++;
                            }%>
                       
                    </div>
                </div>
                
             </div>  
        </section>
                            
         <div id="cardModal" class="modal">
            <form class="modal-box" method="post" >
               
                <div class="container">
                    <span onclick="closeCard()" class="close" title="Close">&times;</span>
                    <h2>Card Information</h2>
                 
                    <div class='form-input'>
                        <div class="input-data">
                            <label class="label-tag">Name on Card </label>
                            <input id="input-name" class="input-box" type="text" name="card-name" autocomplete="off" required>
                            
                        </div>
                    </div>
                    
                    <div class='form-input'>
                        <div class="input-data">
                            
                             <div class="card-holders">
                                  <label class="label-tag">Card Number </label>
                                  <img src="assets/credit-cards/SVGs/credit-cards_visa.svg"> 
                                  <img src="assets/credit-cards/SVGs/credit-cards_mastercard.svg"> 
                                  <img src="assets/credit-cards/SVGs/credit-cards_amazon.svg"> 
                                  <img src="assets/credit-cards/SVGs/credit-cards_discover.svg"> 
                            </div>
                            <input id="input-pass" class="input-box" type="text" name="card-number" autocomplete="off"  placeholder="1234 1234 1234 1234" required>      
                           
                        </div>
                    </div>  
                    
                    <div class='form-input date-cvv-container'>
                        <div class="input-data">
                             <label class="label-tag">CVV </label>
                            <input id="input-pass" class="cvv-input-box cvv" type="text" name="card-cvv" placeholder="123" autocomplete="off" required>        
                        </div>
                        
                        <div class="input-data">
                             <label class="label-tag">Expiration Date </label>
                            <input id="input-pass" class="cvv-input-box exp-date" type="password" name="cfPassword" placeholder="MM/YY"  required>        
                        </div>
                        
                    </div>  
                    
                   <div class='form-input'>
                        
                        
                    </div>   
                    
                    <div class="form-input form-captcha">
                        <select>
                            <option value="Afghanistan">Afghanistan</option>
                            <option value="Albania">Albania</option>
                            <option value="Algeria">Algeria</option>
                            <option value="American Samoa">American Samoa</option>
                            <option value="Andorra">Andorra</option>
                            <option value="Angola">Angola</option>
                            <option value="Anguilla">Anguilla</option>
                            <option value="Antartica">Antarctica</option>
                            <option value="Antigua and Barbuda">Antigua and Barbuda</option>
                            <option value="Argentina">Argentina</option>
                            <option value="Armenia">Armenia</option>
                            <option value="Aruba">Aruba</option>
                            <option value="Australia">Australia</option>
                            <option value="Austria">Austria</option>
                            <option value="Azerbaijan">Azerbaijan</option>
                            <option value="Bahamas">Bahamas</option>
                            <option value="Bahrain">Bahrain</option>
                            <option value="Bangladesh">Bangladesh</option>
                            <option value="Barbados">Barbados</option>
                            <option value="Belarus">Belarus</option>
                            <option value="Belgium">Belgium</option>
                            <option value="Belize">Belize</option>
                            <option value="Benin">Benin</option>
                            <option value="Bermuda">Bermuda</option>
                            <option value="Bhutan">Bhutan</option>
                            <option value="Bolivia">Bolivia</option>
                            <option value="Bosnia and Herzegowina">Bosnia and Herzegowina</option>
                            <option value="Botswana">Botswana</option>
                            <option value="Bouvet Island">Bouvet Island</option>
                            <option value="Brazil">Brazil</option>
                            <option value="British Indian Ocean Territory">British Indian Ocean Territory</option>
                            <option value="Brunei Darussalam">Brunei Darussalam</option>
                            <option value="Bulgaria">Bulgaria</option>
                            <option value="Burkina Faso">Burkina Faso</option>
                            <option value="Burundi">Burundi</option>
                            <option value="Cambodia">Cambodia</option>
                            <option value="Cameroon">Cameroon</option>
                            <option value="Canada">Canada</option>
                            <option value="Cape Verde">Cape Verde</option>
                            <option value="Cayman Islands">Cayman Islands</option>
                            <option value="Central African Republic">Central African Republic</option>
                            <option value="Chad">Chad</option>
                            <option value="Chile">Chile</option>
                            <option value="China">China</option>
                            <option value="Christmas Island">Christmas Island</option>
                            <option value="Cocos Islands">Cocos (Keeling) Islands</option>
                            <option value="Colombia">Colombia</option>
                            <option value="Comoros">Comoros</option>
                            <option value="Congo">Congo</option>
                            <option value="Congo">Congo, the Democratic Republic of the</option>
                            <option value="Cook Islands">Cook Islands</option>
                            <option value="Costa Rica">Costa Rica</option>
                            <option value="Cota D'Ivoire">Cote d'Ivoire</option>
                            <option value="Croatia">Croatia (Hrvatska)</option>
                            <option value="Cuba">Cuba</option>
                            <option value="Cyprus">Cyprus</option>
                            <option value="Czech Republic">Czech Republic</option>
                            <option value="Denmark">Denmark</option>
                            <option value="Djibouti">Djibouti</option>
                            <option value="Dominica">Dominica</option>
                            <option value="Dominican Republic">Dominican Republic</option>
                            <option value="East Timor">East Timor</option>
                            <option value="Ecuador">Ecuador</option>
                            <option value="Egypt">Egypt</option>
                            <option value="El Salvador">El Salvador</option>
                            <option value="Equatorial Guinea">Equatorial Guinea</option>
                            <option value="Eritrea">Eritrea</option>
                            <option value="Estonia">Estonia</option>
                            <option value="Ethiopia">Ethiopia</option>
                            <option value="Falkland Islands">Falkland Islands (Malvinas)</option>
                            <option value="Faroe Islands">Faroe Islands</option>
                            <option value="Fiji">Fiji</option>
                            <option value="Finland">Finland</option>
                            <option value="France">France</option>
                            <option value="France Metropolitan">France, Metropolitan</option>
                            <option value="French Guiana">French Guiana</option>
                            <option value="French Polynesia">French Polynesia</option>
                            <option value="French Southern Territories">French Southern Territories</option>
                            <option value="Gabon">Gabon</option>
                            <option value="Gambia">Gambia</option>
                            <option value="Georgia">Georgia</option>
                            <option value="Germany">Germany</option>
                            <option value="Ghana">Ghana</option>
                            <option value="Gibraltar">Gibraltar</option>
                            <option value="Greece">Greece</option>
                            <option value="Greenland">Greenland</option>
                            <option value="Grenada">Grenada</option>
                            <option value="Guadeloupe">Guadeloupe</option>
                            <option value="Guam">Guam</option>
                            <option value="Guatemala">Guatemala</option>
                            <option value="Guinea">Guinea</option>
                            <option value="Guinea-Bissau">Guinea-Bissau</option>
                            <option value="Guyana">Guyana</option>
                            <option value="Haiti">Haiti</option>
                            <option value="Heard and McDonald Islands">Heard and Mc Donald Islands</option>
                            <option value="Holy See">Holy See (Vatican City State)</option>
                            <option value="Honduras">Honduras</option>
                            <option value="Hong Kong">Hong Kong</option>
                            <option value="Hungary">Hungary</option>
                            <option value="Iceland">Iceland</option>
                            <option value="India">India</option>
                            <option value="Indonesia">Indonesia</option>
                            <option value="Iran">Iran (Islamic Republic of)</option>
                            <option value="Iraq">Iraq</option>
                            <option value="Ireland">Ireland</option>
                            <option value="Israel">Israel</option>
                            <option value="Italy">Italy</option>
                            <option value="Jamaica">Jamaica</option>
                            <option value="Japan">Japan</option>
                            <option value="Jordan">Jordan</option>
                            <option value="Kazakhstan">Kazakhstan</option>
                            <option value="Kenya">Kenya</option>
                            <option value="Kiribati">Kiribati</option>
                            <option value="Democratic People's Republic of Korea">Korea, Democratic People's Republic of</option>
                            <option value="Korea">Korea, Republic of</option>
                            <option value="Kuwait">Kuwait</option>
                            <option value="Kyrgyzstan">Kyrgyzstan</option>
                            <option value="Lao">Lao People's Democratic Republic</option>
                            <option value="Latvia">Latvia</option>
                            <option value="Lebanon" >Lebanon</option>
                            <option value="Lesotho">Lesotho</option>
                            <option value="Liberia">Liberia</option>
                            <option value="Libyan Arab Jamahiriya">Libyan Arab Jamahiriya</option>
                            <option value="Liechtenstein">Liechtenstein</option>
                            <option value="Lithuania">Lithuania</option>
                            <option value="Luxembourg">Luxembourg</option>
                            <option value="Macau">Macau</option>
                            <option value="Macedonia">Macedonia, The Former Yugoslav Republic of</option>
                            <option value="Madagascar">Madagascar</option>
                            <option value="Malawi">Malawi</option>
                            <option value="Malaysia">Malaysia</option>
                            <option value="Maldives">Maldives</option>
                            <option value="Mali">Mali</option>
                            <option value="Malta">Malta</option>
                            <option value="Marshall Islands">Marshall Islands</option>
                            <option value="Martinique">Martinique</option>
                            <option value="Mauritania">Mauritania</option>
                            <option value="Mauritius">Mauritius</option>
                            <option value="Mayotte">Mayotte</option>
                            <option value="Mexico">Mexico</option>
                            <option value="Micronesia">Micronesia, Federated States of</option>
                            <option value="Moldova">Moldova, Republic of</option>
                            <option value="Monaco">Monaco</option>
                            <option value="Mongolia">Mongolia</option>
                            <option value="Montserrat">Montserrat</option>
                            <option value="Morocco">Morocco</option>
                            <option value="Mozambique">Mozambique</option>
                            <option value="Myanmar">Myanmar</option>
                            <option value="Namibia">Namibia</option>
                            <option value="Nauru">Nauru</option>
                            <option value="Nepal">Nepal</option>
                            <option value="Netherlands">Netherlands</option>
                            <option value="Netherlands Antilles">Netherlands Antilles</option>
                            <option value="New Caledonia">New Caledonia</option>
                            <option value="New Zealand">New Zealand</option>
                            <option value="Nicaragua">Nicaragua</option>
                            <option value="Niger">Niger</option>
                            <option value="Nigeria">Nigeria</option>
                            <option value="Niue">Niue</option>
                            <option value="Norfolk Island">Norfolk Island</option>
                            <option value="Northern Mariana Islands">Northern Mariana Islands</option>
                            <option value="Norway">Norway</option>
                            <option value="Oman">Oman</option>
                            <option value="Pakistan">Pakistan</option>
                            <option value="Palau">Palau</option>
                            <option value="Panama">Panama</option>
                            <option value="Papua New Guinea">Papua New Guinea</option>
                            <option value="Paraguay">Paraguay</option>
                            <option value="Peru">Peru</option>
                            <option value="Philippines" selected="selected">Philippines</option>
                            <option value="Pitcairn">Pitcairn</option>
                            <option value="Poland">Poland</option>
                            <option value="Portugal">Portugal</option>
                            <option value="Puerto Rico">Puerto Rico</option>
                            <option value="Qatar">Qatar</option>
                            <option value="Reunion">Reunion</option>
                            <option value="Romania">Romania</option>
                            <option value="Russia">Russian Federation</option>
                            <option value="Rwanda">Rwanda</option>
                            <option value="Saint Kitts and Nevis">Saint Kitts and Nevis</option> 
                            <option value="Saint LUCIA">Saint LUCIA</option>
                            <option value="Saint Vincent">Saint Vincent and the Grenadines</option>
                            <option value="Samoa">Samoa</option>
                            <option value="San Marino">San Marino</option>
                            <option value="Sao Tome and Principe">Sao Tome and Principe</option> 
                            <option value="Saudi Arabia">Saudi Arabia</option>
                            <option value="Senegal">Senegal</option>
                            <option value="Seychelles">Seychelles</option>
                            <option value="Sierra">Sierra Leone</option>
                            <option value="Singapore">Singapore</option>
                            <option value="Slovakia">Slovakia (Slovak Republic)</option>
                            <option value="Slovenia">Slovenia</option>
                            <option value="Solomon Islands">Solomon Islands</option>
                            <option value="Somalia">Somalia</option>
                            <option value="South Africa">South Africa</option>
                            <option value="South Georgia">South Georgia and the South Sandwich Islands</option>
                            <option value="Span">Spain</option>
                            <option value="SriLanka">Sri Lanka</option>
                            <option value="St. Helena">St. Helena</option>
                            <option value="St. Pierre and Miguelon">St. Pierre and Miquelon</option>
                            <option value="Sudan">Sudan</option>
                            <option value="Suriname">Suriname</option>
                            <option value="Svalbard">Svalbard and Jan Mayen Islands</option>
                            <option value="Swaziland">Swaziland</option>
                            <option value="Sweden">Sweden</option>
                            <option value="Switzerland">Switzerland</option>
                            <option value="Syria">Syrian Arab Republic</option>
                            <option value="Taiwan">Taiwan, Province of China</option>
                            <option value="Tajikistan">Tajikistan</option>
                            <option value="Tanzania">Tanzania, United Republic of</option>
                            <option value="Thailand">Thailand</option>
                            <option value="Togo">Togo</option>
                            <option value="Tokelau">Tokelau</option>
                            <option value="Tonga">Tonga</option>
                            <option value="Trinidad and Tobago">Trinidad and Tobago</option>
                            <option value="Tunisia">Tunisia</option>
                            <option value="Turkey">Turkey</option>
                            <option value="Turkmenistan">Turkmenistan</option>
                            <option value="Turks and Caicos">Turks and Caicos Islands</option>
                            <option value="Tuvalu">Tuvalu</option>
                            <option value="Uganda">Uganda</option>
                            <option value="Ukraine">Ukraine</option>
                            <option value="United Arab Emirates">United Arab Emirates</option>
                            <option value="United Kingdom">United Kingdom</option>
                            <option value="United States">United States</option>
                            <option value="United States Minor Outlying Islands">United States Minor Outlying Islands</option>
                            <option value="Uruguay">Uruguay</option>
                            <option value="Uzbekistan">Uzbekistan</option>
                            <option value="Vanuatu">Vanuatu</option>
                            <option value="Venezuela">Venezuela</option>
                            <option value="Vietnam">Viet Nam</option>
                            <option value="Virgin Islands (British)">Virgin Islands (British)</option>
                            <option value="Virgin Islands (U.S)">Virgin Islands (U.S.)</option>
                            <option value="Wallis and Futana Islands">Wallis and Futuna Islands</option>
                            <option value="Western Sahara">Western Sahara</option>
                            <option value="Yemen">Yemen</option>
                            <option value="Serbia">Serbia</option>
                            <option value="Zambia">Zambia</option>
                            <option value="Zimbabwe">Zimbabwe</option>
                        </select>
                    </div>
                    <button type='submit' class="login-btn" >Checkout</button>  
                </div>       
                    
      
            </form>
        </div>

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
