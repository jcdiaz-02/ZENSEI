/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
var logModal = document.getElementById('loginModal');
var regModal = document.getElementById('regModal');
var paymentModal1 = document.getElementById('paymentModal1');
var paymentModal2 = document.getElementById('paymentModal2');
var paymentModal3 = document.getElementById('paymentModal3');
var paymentModal4 = document.getElementById('paymentModal4');
var paymentModal5 = document.getElementById('paymentModal5');
var paymentModal6 = document.getElementById('paymentModal6');

var cardModal= document.getElementById("cardModal");

// When the user clicks anywhere outside of the modal, close it
function closeModal() {
    logModal.style.display = "none";
    regModal.style.display = "none";
    document.getElementById('input-name').value= "";
    document.getElementById('input-pass').value= "";
}

function closePayment() {
    paymentModal1.style.display = "none";
    paymentModal2.style.display = "none";
    paymentModal3.style.display = "none";
    paymentModal4.style.display = "none";
    paymentModal5.style.display = "none";
    paymentModal6.style.display = "none";
    
}
function openModal(){
    logModal.style.display='flex';
    regModal.style.display='none';
}


function openRegModal(){
    regModal.style.display='flex';
}

function openPayment1(){
   paymentModal1.style.display='flex';
}
function openPayment2(){
   paymentModal2.style.display='flex';
}

function openPayment3(){
   paymentModal3.style.display='flex';
}

function openPayment4(){
   paymentModal4.style.display='flex';
}
function openPayment5(){
   paymentModal5.style.display='flex';
}

function openPayment6(){
   paymentModal6.style.display='flex';
}

function openCard(){
  cardModal.style.display='flex';  
}

function closeCard(){
  cardModal.style.display='none';  
}

function openCardmain(){
  cardModal.style.display='flex';  
}

function closeCardmain(){
  cardModal.style.display='none';  
}

const bar= document.querySelector(".bar");
const sectionOne= document.querySelector(".section-1");
            
const secOneOpts= {
    rootMargin: "-450px 0px 0px 0px"};
const sectionOneObserver= new IntersectionObserver(function(
        entries, 
        sectionOneObserver) {
        entries.forEach(entry =>{
        if(!entry.isIntersecting){
            bar.classList.add("bar-scrolled");
        }
        else{
            bar.classList.remove("bar-scrolled");
        }
    });
}
, secOneOpts);

sectionOneObserver.observe(sectionOne);
            
            
