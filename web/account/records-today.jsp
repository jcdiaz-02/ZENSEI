<%-- 
    Document   : records-today
    Created on : 03 19, 22, 10:45:23 PM
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
        <link rel="stylesheet" href="../assets/css/modal-style.css">

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

        <script language="JavaScript" type="text/javascript" src="../assets/scripts/modal.js"></script>  
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
                    <a class="" href="../home.jsp"> 
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

        <section class="all-records-section">
            <div class="all-records-container">
                <div class="all-records-head">
                    <h2>Today's Records</h2>          
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

                        <% for (int x = 0; x < 20; x++) {%> 
                        <tr>
                            <td><%=Integer.toString(x)%></td>
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
                    <form  action="javascript:history.back()">
                        <input type="submit" value="GO BACK"  class="button"/>
                    </form>

                    <form  action="../login/login.jsp">
                        <input type="submit" value="UPDATE RECORD"  class="button"/>
                    </form>

                    <button id="modalBtn"  class="button"/>DELETE</button>

                    <button id="modalBtn1"  onclick="OpenModal1()" class="button"/>GENERATE PDF</button>


                    <form  action="../subpage/records.jsp">
                        <input type="submit" value="LOGOUT"  class="button"/>
                    </form>
                </div>                      
            </div>
        </section>



        <section id="modalSection" class="modal-section">
            <div class="modal-content">
                <h3 class="modal-header">ARE YOU SURE?</h3>
                <p class="modal-msg">Please confirm that you have selected the correct event/s. You cannot reverse this action after pressing the delete button.</p>
                <span class="modal-buttoncon">
                    <span onclick="Close()" class="close modal-button">Cancel</span>
                    <span class="modal-button">Delete</span> 
                </span>
            </div>
        </section>

        <section id="modalSection1" class="modal-section">
            <div class="modal-content">
                <h3 class="modal-header">SUCCESS!</h3>
                <p class="modal-msg">Your PDF has been generated.</p>   
                <span class="modal-buttoncon">
                    <!--                        <span onclick="Home()" class="close modal-button">Home</span>-->
                    <span onclick="Home()" class="modal-button">Download</span> 
                </span>
            </div>
        </section>    
    </body>
</html>
