let visible = false;
let visible2 = false;

document.getElementById("btn-password").addEventListener("click", function () {
    if (visible){
        document.getElementById("password").setAttribute('type', 'password');
        visible = false;
        document.getElementById("btn-password").innerHTML = `<ion-icon name="eye-off-outline"></ion-icon>`;
    } else {
        document.getElementById("password").setAttribute('type', 'text');
        visible = true;
        document.getElementById("btn-password").innerHTML = `<ion-icon name="eye-outline"></ion-icon>`;
    }
});

document.getElementById("btn-password2").addEventListener("click", function () {
    if (visible2){
        document.getElementById("password2").setAttribute('type', 'password');
        visible2 = false;
        document.getElementById("btn-password2").innerHTML = `<ion-icon name="eye-off-outline"></ion-icon>`;
    } else {
        document.getElementById("password2").setAttribute('type', 'text');
        visible2 = true;
        document.getElementById("btn-password2").innerHTML = `<ion-icon name="eye-outline"></ion-icon>`;
    }
});