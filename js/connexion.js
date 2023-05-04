let visible = false;
let visible_signin = false;
let visible_signin_confirm = false;

document.getElementById("btn-password-login").onclick = function () {
    if (visible){
        document.getElementById("password-login").setAttribute('type', 'password');
        visible = false;
        document.getElementById("btn-password-login").innerHTML = `<ion-icon name="eye-off-outline"></ion-icon>`;
    } else {
        document.getElementById("password-login").setAttribute('type', 'text');
        visible = true;
        document.getElementById("btn-password-login").innerHTML = `<ion-icon name="eye-outline"></ion-icon>`;
    }
    document.getElementById("password-login").focus();
}

document.getElementById("btn-password-signin").onclick = function () {
    if (visible_signin){
        document.getElementById("password-signin").setAttribute('type', 'password');
        visible_signin = false;
        document.getElementById("btn-password-signin").innerHTML = `<ion-icon name="eye-off-outline"></ion-icon>`;
    } else {
        document.getElementById("password-signin").setAttribute('type', 'text');
        visible_signin = true;
        document.getElementById("btn-password-signin").innerHTML = `<ion-icon name="eye-outline"></ion-icon>`;
    }
    document.getElementById("password-signin").focus();
}

document.getElementById("btn-password-signin-confirm").onclick = function () {
    if (visible_signin_confirm){
        document.getElementById("password-signin-confirm").setAttribute('type', 'password');
        visible_signin_confirm = false;
        document.getElementById("btn-password-signin-confirm").innerHTML = `<ion-icon name="eye-off-outline"></ion-icon>`;
    } else {
        document.getElementById("password-signin-confirm").setAttribute('type', 'text');
        visible_signin_confirm = true;
        document.getElementById("btn-password-signin-confirm").innerHTML = `<ion-icon name="eye-outline"></ion-icon>`;
    }
    document.getElementById("password-signin-confirm").focus();
}