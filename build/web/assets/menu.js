/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
var script = document.createElement('script');
script.src = 'https://code.jquery.com/jquery-3.4.1.min.js';
script.type = 'text/javascript';
document.getElementsByTagName('head')[0].appendChild(script);
function openLibrary() {
    document.getElementById("myLibrary").classList.toggle("show-games");
}

function closeLibrary() {
    document.getElementById("myLibrary").classList.toggle("show-games");

}


function openProfileMenu() {
    document.getElementById("myProfileMenu").classList.toggle("show-menu");
     
}


function closeProfileMenu() {
    document.getElementById("myProfileMenu").classList.toggle("show-menu");
}

window.onclick = function(event) {
            if (!event.target.matches('.profile-head')) {
              
                var dropdowns = 
                document.getElementsByClassName("profile-list");
                  
                var i;
                for (i = 0; i < dropdowns.length; i++) {
                    var openDropdown = dropdowns[i];
                    if (openDropdown.classList.contains('show-menu')) {
                        openDropdown.classList.remove('show-menu');
                    }
                }
            }
        };
            