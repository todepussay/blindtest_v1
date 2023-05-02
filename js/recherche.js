let search_btn = document.getElementById('search-user');
let search_btn_min = document.getElementById('search_btn');
let recherche_div = document.getElementById('recherche-box');
let search = document.getElementById('search');
let close = document.getElementById('close');

let users = [];

window.onload = function () {

    for (let i = 0; i < document.getElementById('user_max').value; i++) {
        
        let user_temp = {};

        user_temp.id = document.getElementById('id_' + i).value;
        user_temp.name = document.getElementById('username_' + i).value;
        user_temp.picture = document.getElementById('picture_' + i).value;

        users.push(user_temp);

    }

    document.getElementById('del').remove();

    console.log(users);

};

search_btn.addEventListener('click', function () {
    recherche_div.style.display = 'block';
    recherche_div.style.animation = "recherche-open 0.5s ease-in-out forwards";
    search.target();
});

search_btn_min.addEventListener('click', function () {
    recherche_div.style.display = 'block';
    recherche_div.style.animation = "recherche-open 0.5s ease-in-out forwards";
    search.target();
});

close.addEventListener('click', function () {
    recherche_div.style.animation = "recherche-close 0.5s ease-in-out forwards";
    setTimeout(() => {
        recherche_div.style.display = 'none';
    }, 500);
});

recherche_div.addEventListener('click', function () {
    recherche_div.style.animation = "recherche-close 0.5s ease-in-out forwards";
    setTimeout(() => {
        recherche_div.style.display = 'none';
    }, 500);
});

search.addEventListener('click', function (e) {
    e.stopPropagation();
});

search.addEventListener('keyup', function () {
    
    let search_value = search.value;

    document.getElementById('list-resultat').innerHTML = '';

    if (search_value.length > 0) {
        
        for (let i = 0; i < users.length; i++) {
            if (users[i].name.toLowerCase().includes(search_value.toLowerCase())) {
                let a = document.createElement('a');
                a.href = 'profils.php?id=' + users[i].id;
                a.className = 'resultat';

                let div_img = document.createElement('div');
                div_img.className = 'resultat-img';

                let img = document.createElement('img');
                img.src = 'asset/profils_picture/' + users[i].picture;

                div_img.appendChild(img);
                a.appendChild(div_img);

                let div_content = document.createElement('div');
                div_content.className = 'resultat-content';

                let h3 = document.createElement('h3');
                h3.innerHTML = users[i].name;

                div_content.appendChild(h3);
                a.appendChild(div_content);

                document.getElementById('list-resultat').appendChild(a);
            }
        }

    }
});