/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
var modal;
var modal1;
var btn;
var btn1;
// Get the modal
window.onload = function () {

    modal = document.getElementById("modalSection");
    modal1 = document.getElementById("modalSection1");

// Get the button that opens the modal
    btn = document.getElementById("modalBtn");
    btn1 = document.getElementById("modalBtn1");


// Get the <span> element that closes the modal
    var span = document.getElementsByClassName("close")[0];
    var span_home = document.getElementsByClassName("home-btn")[0];

// When the user clicks the button, open the modal 
    btn.onclick = function () {
        modal.style.display = "block";
    };

// When the user clicks on <span> (x), close the modal

// When the user clicks anywhere outside of the modal, close it
    window.onclick = function (event) {
        if (event.target === modal) {
            modal.style.display = "none";
        }
        
        if (event.target === modal1) {
            modal1.style.display = "none";
        }
    };
    

};

function Close() {
    modal.style.display = "none";
};

function Home(){
    window.location.href = "../home.jsp";
};


function Login(){
    window.location.href = "../login/login.jsp";
};

function OpenModal1(){
    modal1.style.display = "block";
};
