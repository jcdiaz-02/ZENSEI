<%-- 
    Document   : all-records
    Created on : 03 19, 22, 3:57:41 AM
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
        <link rel="stylesheet" href="../assets/css/records-all-style.css">
  
          
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
        <!--TODO: CONNECT TO DATABASE AND ACCESS ALL RECORDS DATA -->
        <!--TODO: FUNCTIONALITY OF SORT BUTTONS-->
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
                    <a class="option" href="/">Contact</a>
                    <form  action="../login/login.jsp">
                        <input type="submit" value="Login"  class="button"/>
                    </form>
            
                </div>
            </div>
        </div>
        
        <section class="all-records-section">
            <div class="all-records-container">
                <div class="all-records-head">
                   <h2>All Records</h2>          
                </div>
                
                <h3><a class="record-select" href="">Select Record</a></h3>          
                <div class="table-container">
                    <table class="records-table">
                        <tr>
                          <th>No.</th>
                          <th>Student Num</th> 
                          <th>Email</th>
                          <th>Course</th>
                          <th>Username</th>
                          <th>Name</th> 
                          <th>Gender</th>
                          <th>Birthday</th>
                          <th>Age</th>
                          <th>Contact #</th> 
                          <th>Address</th>
                          <th>Favorite Game</th>
                          <th><span class="material-icons">verified_user</span></th>
                        </tr>
                        
                        <% for(int x= 0; x<20; x++) 
                        { %> 
                        <tr>
                          <td><%=Integer.toString(x) %></td>
                          <td>2019123456</td>
                          <td>test.test.cics@ust.edu.ph</td>
                          <td>Computer Science</td>
                          <td>TestGuy</td>
                          <td>Test Test T. Guy</td>
                          <td>test</td>
                          <td>00/00/0000</td>
                          <td>00</td>
                          <td>00000000000</td>
                          <td>545-T Test St. Test City</td>
                          <td>Among Us</td>
                          <td><span class="material-icons" style="color:green;">check_circle</span></td>
                        </tr>
                       <% }%>
                     
                    </table>
                </div>       
              
                <div class="all-records-buttons"> 
                    <form  action="../subpage/records.jsp">
                        <input type="submit" value="GO BACK"  class="button"/>
                    </form>
                    
                    <form  action="../login/login.jsp">
                        <input type="submit" value="UPDATE RECORD"  class="button"/>
                    </form>
                    
                    <form  action="../login/login.jsp">
                        <input type="submit" value="DELETE RECORD"  class="button"/>
                    </form>
                    
                    <form  action="../subpage/records.jsp">
                        <input type="submit" value="GENERATE PDF"  class="button"/>
                    </form>
                    
                    <form  action="../subpage/records.jsp">
                        <input type="submit" value="LOGOUT"  class="button"/>
                    </form>
                </div>                      
            </div>
        </section>
            
    </body>
</html>
