let element = document.getElementsByClassName('element');
let selected = "";
let content = document.getElementsByClassName('content')[0];

for (let i = 0; i < element.length; i++){
    element[i].addEventListener('click', function(){
        selected = element[i].getElementsByTagName("p")[0].innerHTML
    });
}