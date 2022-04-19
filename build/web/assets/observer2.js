/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


const bar= document.querySelector(".bar");
const sectionOne= document.querySelector(".section-1");
            
const secOneOpts= {
    rootMargin: "-1000px 0px 0px 0px"};
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