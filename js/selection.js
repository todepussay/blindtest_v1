let element = document.getElementsByClassName('element');
let selected = "";
let content = document.getElementsByClassName('content')[0];
let ranked = document.getElementsByClassName('ranked');

let categorie;

for (let i = 0; i < element.length; i++){
    element[i].addEventListener('click', function(){
        categorie = element[i].getElementsByTagName("p")[0].innerHTML;
        
        document.getElementsByClassName('type')[0].style.display = "block";
        
    });
}

for (let i = 0; i < ranked.length; i++){
    ranked[i].addEventListener('click', function(){
        ranked[i].style.animation = "ranked 0.5s forwards"
    });
}